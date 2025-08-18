import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Typedef for function that will verify input
typedef InputVerifier = Future<bool> Function(String);

/// A widget which takes a multiple-digit OTC code
///
class MultiDigitCodeInput extends StatefulWidget {
  /// Construct a [MultiDigitCodeInput]
  const MultiDigitCodeInput({
    super.key,
    required this.onSubmit,
    this.length = 6,
    this.isSmall = false,
    this.focusNode,
    this.code = '',
  });

  /// Function to call once all digits have been entered
  final InputVerifier onSubmit;

  /// The number of digits to be entered
  final int length;

  /// Whether the widget should display in a trimmer form
  final bool isSmall;

  /// Focus node
  final FocusNode? focusNode;

  /// Kicker to update the code from outside
  final String code;

  @override
  State<MultiDigitCodeInput> createState() => _MultiDigitCodeInputState();
}

class _MultiDigitCodeInputState extends State<MultiDigitCodeInput>
    with TextInputClient
    implements AutofillClient {
  late TextEditingValue _editingValue;
  late FocusNode _focusNode;
  TextInputConnection? _connection;
  AutofillGroupState? _currentAutofillScope;

  bool loading = false;

  bool get _hasInputConnection => _connection?.attached ?? false;

  @override
  TextEditingValue? get currentTextEditingValue => _editingValue;

  @override
  AutofillScope? get currentAutofillScope => _currentAutofillScope;

  @override
  String get autofillId => 'NumberInput-$hashCode';

  @override
  TextInputConfiguration get textInputConfiguration {
    return TextInputConfiguration(
      autofillConfiguration: AutofillConfiguration(
        uniqueIdentifier: autofillId,
        autofillHints: const [AutofillHints.oneTimeCode],
        currentEditingValue: _editingValue,
      ),
      inputType: TextInputType.number,
      inputAction: TextInputAction.go,
      autocorrect: false,
    );
  }

  @override
  void initState() {
    super.initState();
    _editingValue = const TextEditingValue(
      text: '',
      selection: TextSelection.collapsed(offset: 0),
      composing: TextRange(start: 0, end: 0),
    );
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) => requestKeyboard());
    HardwareKeyboard.instance.addHandler(_onHwKeyChanged);
  }

  bool _onHwKeyChanged(KeyEvent event) {
    if (event case KeyUpEvent event
        when event.logicalKey == LogicalKeyboardKey.backspace) {
      final text = _editingValue.text;
      if (text.isNotEmpty) {
        final newEditingValue = TextEditingValue(
          text: text.substring(0, text.length - 1),
          selection: TextSelection.collapsed(offset: text.length - 1),
        );
        _connection?.setEditingState(newEditingValue);
        setState(() => _editingValue = newEditingValue);
        return true;
      }
    }
    return false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final AutofillGroupState? newAutofillGroup = AutofillGroup.maybeOf(context);
    if (currentAutofillScope != newAutofillGroup) {
      _currentAutofillScope?.unregister(autofillId);
      _currentAutofillScope = newAutofillGroup;
      _currentAutofillScope?.register(this);
    }
  }

  @override
  void didUpdateWidget(covariant MultiDigitCodeInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    final code = widget.code;
    if (oldWidget.code != code && code != _editingValue.text) {
      _editingValue = TextEditingValue(
        text: code,
        selection: TextSelection.collapsed(offset: code.length - 1),
      );
    }
  }

  void _onFocusChanged() {
    if (_focusNode.hasFocus) {
      _openInputConnection();
    } else {
      _closeInputConnectionIfNeeded();
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    HardwareKeyboard.instance.removeHandler(_onHwKeyChanged);
    _currentAutofillScope?.unregister(autofillId);
    if (widget.focusNode == null) {
      // must be one we've created locally, so dispose of it now
      _focusNode.dispose();
    }
    _closeInputConnectionIfNeeded();
    super.dispose();
  }

  @override
  void autofill(TextEditingValue newEditingValue) {
    final value = int.tryParse(newEditingValue.text)?.toString();
    if (value != null) {
      setState(() {
        _editingValue = TextEditingValue(
          text: value,
          selection: TextSelection.collapsed(offset: value.length),
        );
      });
    }
  }

  bool _hasCursor(int i) {
    if (_focusNode.hasFocus == false) return false;

    final length = _editingValue.text.length;
    if (i == length) return true;
    if (length == widget.length && i == length - 1) return true;

    return false;
  }

  String? _labelFor(int i) {
    if (loading) {
      return null;
    }

    final text = _editingValue.text;
    return i < text.length ? text[i] : null;
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: requestKeyboard,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int i = 0; i < widget.length; ++i) //
              _CodeDigit(
                isSmall: widget.isSmall,
                hasCursor: _hasCursor(i),
                label: _labelFor(i),
              ),
          ],
        ),
      ),
    );
  }

  void requestKeyboard() {
    if (!_focusNode.hasFocus) {
      FocusScope.of(context).requestFocus(_focusNode);
    } else {
      _openInputConnection();
    }
  }

  void _openInputConnection() {
    if (!_hasInputConnection) {
      _connection = TextInput.attach(this, textInputConfiguration);
      _connection!.setEditingState(_editingValue);
    }
    _connection!.show();
  }

  void _closeInputConnectionIfNeeded() {
    if (_hasInputConnection) {
      _connection!.close();
      _connection = null;
    }
  }

  @override
  void performAction(TextInputAction action) {
    _focusNode.unfocus();
  }

  @override
  Future<void> updateEditingValue(TextEditingValue value) async {
    setState(() => _editingValue = value);
    if (value.text.length == widget.length) {
      setState(() => loading = true);
      final succeeded = await widget.onSubmit(value.text);
      if (context.mounted) {
        _focusNode.nextFocus();
        if (succeeded == false) {
          _editingValue = const TextEditingValue(
            text: '',
            selection: TextSelection.collapsed(offset: 0),
          );
          requestKeyboard();
        }
        setState(() => loading = false);
      }
    }
    if (context.mounted) {
      _openInputConnection();
      setState(() => _connection!.setEditingState(_editingValue));
    }
  }

  @override
  void updateFloatingCursor(RawFloatingCursorPoint point) {
    // Not required
  }

  @override
  void connectionClosed() {
    // Not required
  }

  @override
  void didChangeInputControl(
      TextInputControl? oldControl, TextInputControl? newControl) {
    // Not required
  }

  @override
  void insertContent(KeyboardInsertedContent content) {
    // Not required
  }

  @override
  void insertTextPlaceholder(Size size) {
    // Not required
  }

  @override
  void performPrivateCommand(String action, Map<String, dynamic> data) {
    // Not required
  }

  @override
  void performSelector(String selectorName) {
    // Not required
  }

  @override
  void removeTextPlaceholder() {
    // Not required
  }

  @override
  void showAutocorrectionPromptRect(int start, int end) {
    // Not required
  }

  @override
  void showToolbar() {
    // Not required
  }
}

class _PulsingCursor extends StatefulWidget {
  const _PulsingCursor({required this.height});

  final double height;

  @override
  State<_PulsingCursor> createState() => _PulsingCursorState();
}

class _PulsingCursorState extends State<_PulsingCursor>
    with SingleTickerProviderStateMixin {
  static const _cycleDuration = Duration(milliseconds: 1200);

  void _update() {
    if (mounted) {
      setState(() {});
    }
  }

  late final _controller =
      AnimationController(duration: _cycleDuration, vsync: this)
        ..repeat(period: _cycleDuration, reverse: true)
        ..addListener(_update);
  late final _curve =
      CurvedAnimation(parent: _controller, curve: Curves.decelerate);

  @override
  void dispose() {
    _controller.removeListener(_update);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: Padding(
        padding: allPadding4,
        child: SizedBox(
          width: double.infinity,
          height: widget.height,
          child: ColoredBox(
            color: Colors.black.withValues(alpha: _curve.value * 0.5),
          ),
        ),
      ),
    );
  }
}

class _CodeDigit extends StatelessWidget {
  const _CodeDigit({
    required this.isSmall,
    required this.hasCursor,
    this.label,
  });

  final bool isSmall;
  final bool hasCursor;
  final String? label;

  static const _decoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    border: Border.fromBorderSide(
      BorderSide(color: ClerkColors.dawnPink),
    ),
  );
  static const _textStyle = TextStyle(
    color: ClerkColors.midGrey,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    final children = [
      if (label case String label) //
        Align(child: Text(label, style: _textStyle)),
      if (hasCursor) //
        _PulsingCursor(height: isSmall ? 1.0 : 2.0),
    ];

    return DecoratedBox(
      decoration: _decoration,
      child: SizedBox.square(
        dimension: isSmall ? 18.0 : 38.0,
        child: switch (children.length) {
          2 => Stack(children: children),
          1 => children.first,
          _ => null,
        },
      ),
    );
  }
}
