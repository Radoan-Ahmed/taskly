import 'package:flutter/material.dart';
import 'package:taskly/core/navigation/route_config.dart';

class App extends StatelessWidget {
  App({super.key});

  final routeConfig = RouteConfig();

  @override
  Widget build(BuildContext context) {
    return _buildMaterialApp();
  }

  Widget _buildMaterialApp(){
    return MaterialApp(
      title: "Taskly",
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routeConfig.routes,
    );
  }

}
