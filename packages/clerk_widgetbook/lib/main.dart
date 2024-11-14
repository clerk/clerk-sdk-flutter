import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:clerk_widgetbook/theme_scaffold.dart';

import 'main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        GridAddon(),
        InspectorAddon(),
        TimeDilationAddon(),
        ZoomAddon(),
        TextScaleAddon(
          min: 1.0,
          max: 2.0,
        ),
        LocalizationAddon(
          locales: [const Locale('en', 'US')],
          localizationsDelegates: [
            DefaultWidgetsLocalizations.delegate,
            DefaultMaterialLocalizations.delegate,
          ],
        ),
        DeviceFrameAddon(
          initialDevice: Devices.ios.iPhone13ProMax,
          devices: [
            ...Devices.all,
          ],
        ),
        ThemeAddon(
          themes: [
            // FIXME(drexel-ue): replace with actual theme.
            WidgetbookTheme(
              name: 'Light',
              data: Theme.of(context).copyWith(brightness: Brightness.light),
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: Theme.of(context).copyWith(brightness: Brightness.dark),
            ),
          ],
          themeBuilder: (BuildContext context, ThemeData theme, Widget child) {
            return ThemeScaffold(
              theme: theme,
              child: child,
            );
          },
        ),
      ],
    );
  }
}
