import 'package:flutter/material.dart';
import 'package:untitled/cubits/auth_cubit.dart';
import 'package:untitled/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../custom_widgets/constants.dart';
import '../custom_widgets/widgets_and_utils.dart';

/*
* test login
*   "username": "8013024957",
  "password": "123456",
  "token": "string"
* */

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => VerifyScreen()));
          } else if (state is AuthError) {
            showCustomSnackbar(context, "Error Loging in: ${state.message}");
          }
          // TODO: implement listener
        },
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TopContainer(),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Login",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.email,
                      color: darkGreen,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              PasswordTextField(controller: passwordController),
              // const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        checkColor: darkGreen,
                        title: const Text(
                          "Remember me",
                          style: TextStyle(color: darkGreen),
                        ),
                        value: _rememberMe,
                        onChanged: (newValue) {
                          setState(() {
                            _rememberMe = newValue!;
                          });
                          showCustomSnackbar(
                              context, "Feature yet to be added");
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showCustomSnackbar(context, "Feature yet to be added");
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: CustomElevatedButton(
                  onPressed: () {
                    _login(context);
                  },
                  label: "Login",
                ),
                // SizedBox(
                //   width: double.infinity, // Set the desired width
                //   height: 50, // Set the desired height
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       foregroundColor: Colors.white,
                //       backgroundColor: darkGreen, // Set the button color
                //       shape: RoundedRectangleBorder(
                //         borderRadius:
                //             BorderRadius.circular(8), // Set the border radius
                //       ),
                //     ),
                //     onPressed: () {
                //       _login(context);
                //     },
                //     child: const Text('Login'),
                //   ),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    authCubit.login(
      usernameController.text,
      passwordController.text,
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordTextField({Key? key, required this.controller})
      : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: 'Password',
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(
            Icons.lock,
            color: darkGreen,
          ),
          suffixIcon: IconButton(
            icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
            onPressed: _toggleVisibility,
          ),
        ),
        obscureText: _obscureText,
      ),
    );
  }
}
