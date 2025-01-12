import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lyfstyle/features/auth/bloc/auth_bloc.dart';
import 'package:lyfstyle/features/auth/pages/login.dart';
import 'package:lyfstyle/features/home/pages/home.dart';


// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomePage(),
    ),
  ],
  redirect: (context, state) {
    final authState = BlocProvider.of<AuthBloc>(context).state;
    // final loggingIn = state.matchedLocation == '/login';

    if (authState is Unauthenticated) {
      return '/login';
    }
    if (authState is Authenticated) {
      return '/home';
    }
    return '/login';
  },
);
