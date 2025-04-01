import 'package:flutter/material.dart';
import 'package:resplash/configs/theme/app_theme.dart';
import 'package:resplash/screens/home/home_screen.dart';
import 'package:resplash/utils/ui_utils.dart';
import 'package:resplash/widgets/main_bottom_app_bar.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    UiUtils.updateSystemUi(context);
    return MaterialApp(
      title: 'Resplash',
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomeScreen(),
        bottomNavigationBar: MainBottomAppBar(),
        floatingActionButton: SizedBox(
          width: 48,
          height: 48,
          child: FloatingActionButton(onPressed: () {}, shape: const CircleBorder(), child: Icon(Icons.add)),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
