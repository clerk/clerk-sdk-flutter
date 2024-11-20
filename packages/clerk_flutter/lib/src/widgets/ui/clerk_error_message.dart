import 'dart:async';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

class ClerkErrorMessage extends StatelessWidget {
  const ClerkErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<clerk.AuthError>(
      stream: ClerkAuth.errorStreamOf(context),
      builder: (context, snapshot) => _ErrorMessage(error: snapshot.data),
    );
  }
}

class _ErrorMessage extends StatefulWidget {
  const _ErrorMessage({required this.error});

  final clerk.AuthError? error;

  @override
  State<_ErrorMessage> createState() => _ErrorMessageState();
}

class _ErrorMessageState extends State<_ErrorMessage> {
  static const _errorDisplayDuration = Duration(seconds: 3);

  String _error = '';
  Timer? _timer;

  @override
  void didUpdateWidget(covariant _ErrorMessage oldWidget) {
    super.didUpdateWidget(oldWidget);
    final error = widget.error?.toString() ?? '';
    if (mounted && error != _error) {
      _error = error;
      _timer?.cancel();
      _timer =
          Timer(_errorDisplayDuration, () => setState(() => _timer = null));
    }
  }

  @override
  Widget build(BuildContext context) {
    final translator = ClerkAuth.translatorOf(context);
    return Closeable(
      open: _timer is Timer && _error.isNotEmpty,
      child: Padding(
        padding: horizontalPadding32 + bottomPadding8,
        child: Text(translator.translate(_error),
            maxLines: 2, style: ClerkTextStyle.error),
      ),
    );
  }
}
