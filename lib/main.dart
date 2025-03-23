import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'configs/di/service_locator.dart';
import 'configs/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resplash',
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 8,
          shape: const CircularNotchedRectangle(),
          padding: EdgeInsets.only(left: 16, right: 15),
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.menu_outlined)),
                ],
              ),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.sort)),
                ],
              ),
            ],
          ),
        ),
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
