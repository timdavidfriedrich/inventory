import 'package:flutter/material.dart';
import 'package:inventory/config/theme/app_theme.dart';
import 'package:inventory/src/core/presentation/app_router.dart';
import 'package:inventory/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const InventoryApp());
}

class InventoryApp extends StatelessWidget {
  const InventoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: sl<AppRouter>().router,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
    );
  }
}
