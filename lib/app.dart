import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:resplash/configs/theme/app_theme.dart';
import 'package:resplash/data/repositories/collection_repository.dart';
import 'package:resplash/data/repositories/photo_repository.dart';
import 'package:resplash/screens/home/home_screen.dart';
import 'package:resplash/utils/ui_utils.dart';
import 'package:resplash/widgets/main_bottom_app_bar.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    UiUtils.updateSystemUi(context);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<PhotoRepository>(
          create: (context) => GetIt.instance<PhotoRepository>(),
        ),
        RepositoryProvider<CollectionRepository>(
          create: (context) => GetIt.instance<CollectionRepository>(),
        ),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
