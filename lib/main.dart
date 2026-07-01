import 'package:device_preview/device_preview.dart' show DevicePreview;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/api/token_manager.dart';
import 'core/storage/local_storage.dart';
import 'core/theme/theme.dart';
import 'core/theme/theme_mode_provider.dart';
import 'core/utils/app_routes.dart';
import 'generated/l10n.dart' show S;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final savedToken = await LocalStorage.getToken();
  if (savedToken != null) {
    TokenManager.setToken(savedToken);
  }

  runApp(
    ProviderScope(child: DevicePreview(builder: (context) => const MyApp())),
  );
  // runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale('ar'),
      title: 'Secretary App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: AppRouter.router,
    );
  }
}
