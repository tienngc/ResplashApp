import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme() {
    final colors = AppColors.lightThemeColors;
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: colors['primary']!,
        onPrimary: colors['onPrimary']!,
        secondary: colors['secondary']!,
        onSecondary: colors['onSecondary']!,
        error: colors['error']!,
        onError: colors['onPrimary']!,
        surface: colors['surface']!,
        onSurface: colors['onSurface']!,
      ),
      scaffoldBackgroundColor: colors['background']!,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: colors['surface']!,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: colors['surface']!,
        foregroundColor: colors['onSurface']!,
        elevation: 0,
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: colors['bottomAppBarColor']!,
        elevation: 0,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colors['secondary']!,
        foregroundColor: colors['onSecondary']!,
      ),
      tabBarTheme: TabBarTheme(
        labelColor: colors['primary']!,
        unselectedLabelColor: colors['onSurfaceSecondary']!,
        indicatorColor: colors['primary']!,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: colors['onSurface']!),
        bodyMedium: TextStyle(color: colors['onSurface']!),
        titleMedium: TextStyle(color: colors['onSurface']!),
      ),
    );
  }

  static ThemeData darkTheme() {
    final colors = AppColors.darkThemeColors;
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: colors['primary']!,
        onPrimary: colors['onPrimary']!,
        secondary: colors['secondary']!,
        onSecondary: colors['onSecondary']!,
        error: colors['error']!,
        onError: colors['onSurface']!,
        surface: colors['surface']!,
        onSurface: colors['onSurface']!,
      ),
      scaffoldBackgroundColor: colors['background']!,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: colors['surface']!,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        backgroundColor: colors['surface']!,
        foregroundColor: colors['onSurface']!,
        elevation: 0,
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: colors['bottomAppBarColor']!,
        elevation: 0,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colors['secondary']!,
        foregroundColor: colors['onSecondary']!,
      ),
      tabBarTheme: TabBarTheme(
        labelColor: colors['primary']!,
        unselectedLabelColor: colors['onSurfaceSecondary']!,
        indicatorColor: colors['primary']!,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: colors['onSurface']!),
        bodyMedium: TextStyle(color: colors['onSurface']!),
        titleMedium: TextStyle(color: colors['onSurface']!),
      ),
    );
  }

  // Additional themes for specific screens
  static ThemeData photoDetailTheme({required bool isDark}) {
    final baseTheme = isDark ? darkTheme() : lightTheme();
    return baseTheme.copyWith(
      appBarTheme: baseTheme.appBarTheme.copyWith(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.lightThemeColors['immersiveSysUi']!,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: AppColors.lightThemeColors['immersiveSysUi']!,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      ),
    );
  }

  static ThemeData photoZoomTheme({required bool isDark}) {
    return ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.lightThemeColors['immersiveSysUi']!,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: AppColors.lightThemeColors['immersiveSysUi']!,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      ),
    );
  }
} 