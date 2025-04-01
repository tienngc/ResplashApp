import 'package:flutter/material.dart';
import 'package:resplash/configs/theme/app_theme.dart';
import 'package:resplash/widgets/main_bottom_app_bar.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resplash',
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(),
        bottomNavigationBar: MainBottomAppBar(),
        floatingActionButton: SizedBox(
          width: 48,
          height: 48,
          child: FloatingActionButton(
            onPressed: () {},
            shape: const CircleBorder(),
            child: Icon(Icons.add),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}