import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'text_styles.dart';

class AppTheme {
  static final ColorScheme lightColorScheme = ColorScheme.light(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    primaryContainer: AppColors.primary50,
    onPrimaryContainer: AppColors.primary600,
    inversePrimary: AppColors.white,
    surfaceTint: AppColors.primary500,
    primaryFixed: const Color(0xFFC8D0FC),
    secondaryFixed: AppColors.purple,
    onSecondaryFixed: AppColors.lightPurple,
    secondary: AppColors.background,
    onSecondary: AppColors.gradientStart,
    secondaryContainer: AppColors.primary50,
    onSecondaryContainer: AppColors.gradientEnd,
    tertiary: AppColors.green,
    onTertiary: AppColors.white,
    tertiaryContainer: AppColors.greenLite,
    onTertiaryContainer: AppColors.lightGreen,
    error: AppColors.red,
    onError: AppColors.white,
    errorContainer: AppColors.redLite,
    surface: AppColors.white,
    surfaceContainerLowest: const Color(0xFFF8FAFC),
    surfaceContainer: const Color(0xFFE5E7EA),
    surfaceContainerHigh: const Color(0xFFE5E7EA),
    surfaceContainerHighest: AppColors.border,
    surfaceBright: AppColors.lightAmber,
    surfaceDim: AppColors.amber,
    onSurface: AppColors.textPrimary,
    onSurfaceVariant: AppColors.textSecondary,
    onInverseSurface: AppColors.textTertiary,
    outline: AppColors.textLight,
    outlineVariant: AppColors.textMuted,
    onTertiaryFixedVariant: AppColors.textMuted,
    shadow: AppColors.black,
    scrim: AppColors.black,
  );

  static final ColorScheme darkColorScheme = ColorScheme.dark(
    brightness: Brightness.dark,
    primary: AppColors.primaryDark,
    onPrimary: AppColors.onPrimaryDark,
    primaryContainer: AppColors.primaryContainerDark,
    onPrimaryContainer: AppColors.onPrimaryContainerDark,
    inversePrimary: AppColors.inversePrimaryDark,
    surfaceTint: AppColors.surfaceTintDark,
    primaryFixed: AppColors.primaryFixedDark,
    secondaryFixed: AppColors.secondaryFixedDark,
    onSecondaryFixed: AppColors.onSecondaryFixedDark,
    secondary: AppColors.secondaryDark,
    onSecondary: AppColors.onSecondaryDark,
    secondaryContainer: AppColors.secondaryContainerDark,
    onSecondaryContainer: AppColors.onSecondaryContainerDark,
    tertiary: AppColors.tertiaryDark,
    onTertiary: AppColors.onTertiaryDark,
    tertiaryContainer: AppColors.tertiaryContainerDark,
    onTertiaryContainer: AppColors.onTertiaryContainerDark,
    error: AppColors.errorDark,
    onError: AppColors.onErrorDark,
    errorContainer: AppColors.errorContainerDark,
    surface: AppColors.surfaceDark,
    surfaceContainerLowest: AppColors.surfaceContainerLowestDark,
    surfaceContainer: AppColors.surfaceContainerDark,
    surfaceContainerHigh: AppColors.surfaceContainerHighDark,
    surfaceContainerHighest: AppColors.surfaceContainerHighestDark,
    surfaceBright: AppColors.surfaceBrightDark,
    surfaceDim: AppColors.surfaceDimDark,
    onSurface: AppColors.onSurfaceDark,
    onSurfaceVariant: AppColors.onSurfaceVariantDark,
    onInverseSurface: AppColors.onInverseSurfaceDark,
    outline: AppColors.outlineDark,
    outlineVariant: AppColors.outlineVariantDark,
    onTertiaryFixedVariant: AppColors.onTertiaryFixedVariantDark,
    shadow: AppColors.shadowDark,
    scrim: AppColors.scrimDark,
  );

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'LamaSans',
      brightness: Brightness.dark,

      primaryColor: darkColorScheme.primary,
      scaffoldBackgroundColor: darkColorScheme.secondary,

      textTheme: TextTheme(
        headlineLarge: AppTextStyles.bold20.copyWith(
          color: darkColorScheme.onSurface,
        ),
        headlineMedium: AppTextStyles.bold24.copyWith(
          color: darkColorScheme.onSurface,
        ),
        headlineSmall: AppTextStyles.bold16.copyWith(
          color: darkColorScheme.onSurface,
        ),

        titleLarge: AppTextStyles.bold14.copyWith(
          color: darkColorScheme.primary,
        ),

        bodyLarge: AppTextStyles.regular16.copyWith(
          color: darkColorScheme.onSurface,
        ),

        bodyMedium: AppTextStyles.regular14.copyWith(
          color: darkColorScheme.onSurfaceVariant,
        ),
        bodySmall: AppTextStyles.regular12.copyWith(
          color: darkColorScheme.onSurfaceVariant,
        ),

        labelLarge: AppTextStyles.medium14.copyWith(
          color: darkColorScheme.onPrimary,
        ),
        labelMedium: AppTextStyles.bold16.copyWith(
          color: darkColorScheme.onSurface,
        ),

        labelSmall: AppTextStyles.bold10.copyWith(
          color: darkColorScheme.outlineVariant,
        ),
      ),

      cardTheme: CardThemeData(
        color: darkColorScheme.surface,
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.zero,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: darkColorScheme.primary,
          foregroundColor: darkColorScheme.onPrimary,
          disabledBackgroundColor: darkColorScheme.surfaceContainer,
          disabledForegroundColor: darkColorScheme.onInverseSurface,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: darkColorScheme.secondary,
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: AppTextStyles.bold20.copyWith(
          color: darkColorScheme.onSurface,
        ),
        iconTheme: IconThemeData(color: darkColorScheme.onSurface),
        actionsIconTheme: IconThemeData(color: darkColorScheme.onSurface),
      ),

      colorScheme: darkColorScheme,
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'LamaSans',
      primaryColor: lightColorScheme.primary,
      scaffoldBackgroundColor: lightColorScheme.secondary,
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.bold20,
        headlineMedium: AppTextStyles.bold24,
        headlineSmall: AppTextStyles.bold16,
        titleLarge: AppTextStyles.bold14.copyWith(
          color: lightColorScheme.primary,
        ),
        bodyLarge: AppTextStyles.regular16,
        bodyMedium: AppTextStyles.regular14.copyWith(
          color: lightColorScheme.onSurfaceVariant,
        ),
        bodySmall: AppTextStyles.regular12.copyWith(
          color: lightColorScheme.onSurfaceVariant,
        ),
        labelLarge: AppTextStyles.medium14.copyWith(
          color: lightColorScheme.surface,
        ),
        labelMedium: AppTextStyles.bold16,
        labelSmall: AppTextStyles.bold10.copyWith(
          color: lightColorScheme.outlineVariant,
        ),
      ),
      cardTheme: CardThemeData(
        color: lightColorScheme.surface,
        elevation: 1,
        shadowColor: const Color(0x0D000000),
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.zero,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          disabledBackgroundColor: lightColorScheme.surface,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: lightColorScheme.secondary,
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: AppTextStyles.bold20.copyWith(
          color: lightColorScheme.onSurface,
        ),
        iconTheme: IconThemeData(color: lightColorScheme.onSurface),
        actionsIconTheme: IconThemeData(color: lightColorScheme.onSurface),
      ),
      colorScheme: lightColorScheme,
    );
  }
}
