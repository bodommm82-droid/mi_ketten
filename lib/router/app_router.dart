import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/game_screen.dart';
import '../screens/results_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/join_room_screen.dart';
import '../screens/create_room_screen.dart';
import '../screens/waiting_room_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/signup_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/game':
        return MaterialPageRoute(builder: (_) => const GameScreen());
      case '/results':
        return MaterialPageRoute(builder: (_) => const ResultsScreen());
      case '/settings':
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case '/join-room':
        return MaterialPageRoute(builder: (_) => const JoinRoomScreen());
      case '/create-room':
        return MaterialPageRoute(builder: (_) => const CreateRoomScreen());
      case '/waiting-room':
        return MaterialPageRoute(builder: (_) => const WaitingRoomScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Ismeretlen útvonal: ${settings.name}')),
          ),
        );
    }
  }
}
