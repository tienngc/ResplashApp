import 'package:flutter/material.dart';
import 'package:resplash/configs/theme/app_theme.dart';
import 'package:resplash/navigation/app_router.dart';
import 'package:resplash/utils/ui_utils.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    UiUtils.updateSystemUi(context);
    return MaterialApp.router(
      title: 'Resplash',
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
