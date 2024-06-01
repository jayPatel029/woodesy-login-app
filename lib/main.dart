  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:untitled/cubits/auth_cubit.dart';
  import 'screens/screens.dart';

  void main() {
    print("Initializing AuthCubit...");

    runApp( MyApp());
  }
  //
  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return BlocProvider<AuthCubit>(
        create: (context) => AuthCubit(),
        child: MaterialApp(
          title: 'Your App',
          home: SplashScreen(),
    
        ),
      );
    }
  }

