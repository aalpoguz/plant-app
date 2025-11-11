import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/core/network/connectivity/connectivity_provider.dart';
import 'package:plant_app/shared/presentation/providers/theme_provider.dart';
import 'package:plant_app/shared/theme/app_theme.dart';
import 'package:plant_app/shared/utils/di/injection_container.dart';
import 'package:plant_app/shared/utils/router/app_router.dart';
import 'package:plant_app/shared/widgets/no_connection_banner.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependencies
  await initializeDependencies();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: getIt<ThemeProvider>()),
        ChangeNotifierProvider.value(value: getIt<ConnectivityProvider>()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            ensureScreenSize: true,
            builder: (context, child) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeProvider.themeMode,
                routerConfig: appRouter.config(),
                builder: (context, child) {
                  return Stack(
                    children: [
                      child ?? const SizedBox.shrink(),
                      Consumer<ConnectivityProvider>(
                        builder: (context, connectivity, _) {
                          if (!connectivity.isConnected) {
                            return const Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: NoConnectionBanner(),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
