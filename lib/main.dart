  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:untitled/cubits/auth_cubit.dart';
  import 'screens/screens.dart';

  void main() {
    print("Initializing AuthCubit...");

    runApp( MyApp());
  }
  //
  // class MyApp extends StatelessWidget {
  //   const MyApp({super.key});
  //
  //   // This widget is the root of your application.
  //   @override
  //   Widget build(BuildContext context) {
  //     return MaterialApp(
  //       // debugShowCheckedModeBanner: false,
  //       title: 'Flutter Demo',
  //       theme: ThemeData(
  //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //         useMaterial3: true,
  //       ),
  //       home: BlocProvider(
  //         create: (context) => AuthCubit(),
  //         child:
  //
  //         // LoginScreen(),
  //
  //         // VerifyScreen(),
  //          SplashScreen(),
  //         // HomeScreen()
  //       ),
  //     );
  //   }
  // }
  //



  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return BlocProvider<AuthCubit>(
        create: (context) => AuthCubit(),
        child: MaterialApp(
          title: 'Your App',
          home: SplashScreen(),
          // other configurations
        ),
      );
    }
  }



  //
  // class MyApp extends StatelessWidget {
  //   const MyApp({Key? key});
  //
  //   @override
  //   Widget build(BuildContext context) {
  //     return MaterialApp(
  //       title: 'Flutter Demo',
  //       theme: ThemeData(
  //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //         useMaterial3: true,
  //       ),
  //       home: SplashScreenWrapper(), // Use a wrapper widget to manage the splash screen logic
  //     );
  //   }
  // }
  //
  // class SplashScreenWrapper extends StatelessWidget {
  //   @override
  //   Widget build(BuildContext context) {
  //     return FutureBuilder(
  //       // Simulate a delay of 2 seconds for the splash screen
  //       future: Future.delayed(const Duration(seconds: 2)),
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           // While waiting, show the splash screen
  //           return const SplashScreen();
  //         } else {
  //           // After the delay, show the login screen
  //           return BlocProvider(
  //             create: (context) => AuthCubit(),
  //             child: LoginScreen(),
  //           );
  //         }
  //       },
  //     );
  //   }
  // }
