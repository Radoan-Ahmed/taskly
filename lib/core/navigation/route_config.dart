import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskly/core/navigation/route_name.dart';
import 'package:taskly/features/home_page/presentation/cubit/home_page_cubit.dart';
import 'package:taskly/features/home_page/presentation/screen/home_screen.dart';
import 'package:taskly/home_page.dart';

class RouteConfig {
  Route routes(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.kHomeScreen:
        return _buildHomeScreen();
      default:
        return _buildNotFoundScreen();
    }
  }

  MaterialPageRoute _buildHomeScreen() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: RouteName.kHomeScreen),
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => HomePageCubit(),
            ),
          ],
          child: const HomeScreen(),
        );
      },
    );
  }

  MaterialPageRoute _buildNotFoundScreen() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: RouteName.kNotFoundScreen),
      builder: (context) {
        return const Scaffold(
          body: Center(
            child: Text(
              'Screen Not Found',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        );
      },
    );
  }
}
