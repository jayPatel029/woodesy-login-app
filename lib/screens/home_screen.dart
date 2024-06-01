
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/custom_widgets/widgets_and_utils.dart';
import 'package:untitled/screens/login_screen.dart';

import '../cubits/auth_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    checkUserLoggedIn();
  }

  Future<void> checkUserLoggedIn() async {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    await authCubit.checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              logout(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        centerTitle: true,
        title: const Text("My Booking"),
      ),
      backgroundColor: Colors.grey[300],
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: const [
          HomeCarCard(
              carImage: 'assets/merce.png',
              carType: 'Mercedes',
              carModel: 'CLS 450 Coupe 2020',
              location: 'Thornridge Cir. Synracus, Connecticut',
              tripStart: 'Sat 15 April, 4:00 pm',
              tripEnd: 'Wed 17 April, 12:30 am',
              price: 600),
          HomeCarCard(
              carImage: 'assets/ford.jpeg',
              carType: 'Mercedes',
              carModel: 'CLS 450 Coupe 2020',
              location: 'Thornridge Cir. Synracus, Connecticut',
              tripStart: 'Sat 15 April, 4:00 pm',
              tripEnd: 'Wed 17 April, 12:30 am',
              price: 600),
          HomeCarCard(
              carImage: 'assets/audi.jpeg',
              carType: 'Mercedes',
              carModel: 'CLS 450 Coupe 2020',
              location: 'Thornridge Cir. Synracus, Connecticut',
              tripStart: 'Sat 15 April, 4:00 pm',
              tripEnd: 'Wed 17 April, 12:30 am',
              price: 600),
          HomeCarCard(
              carImage: 'assets/merce.png',
              carType: 'Mercedes',
              carModel: 'CLS 450 Coupe 2020',
              location: 'Thornridge Cir. Synracus, Connecticut',
              tripStart: 'Sat 15 April, 4:00 pm',
              tripEnd: 'Wed 17 April, 12:30 am',
              price: 600),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'My Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.green,
        onTap: (index) {
          showCustomSnackbar(context, 'Feature yet to be added');
        },
      ),
    );
  }

  void logout(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    authCubit.logout();
  }
}
