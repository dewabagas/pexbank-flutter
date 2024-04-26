import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pexbank/presentation/core/styles/app_theme.dart';
import 'package:pexbank/presentation/core/utils/lifecycle_container.dart';
import 'package:pexbank/presentation/routes/app_router.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return LifecycleContainer(
        child: ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp.router(
          // scaffoldMessengerKey: scaffoldMessengerKey,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          builder: EasyLoading.init(),

          // routerConfig: AppRouter().router,
          routerDelegate: _appRouter.router.routerDelegate,
          routeInformationProvider: _appRouter.router.routeInformationProvider,
          routeInformationParser: _appRouter.router.routeInformationParser,
        );
      },
    ));
  }
}
