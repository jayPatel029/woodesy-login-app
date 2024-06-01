
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:untitled/custom_widgets/widgets_and_utils.dart';
import 'package:untitled/screens/home_screen.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const TopContainer(),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigate back to the previous screen
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.keyboard_backspace,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 110),
                      const Text(
                        "Verification",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Center(
                    child: Text(
                      "Enter 4 digit verification code. We just sent you on \n+91 12365474690",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    obscureText: false,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      activeColor: Colors.green,
                      inactiveColor: Colors.green,
                    ),
                    backgroundColor: Colors.white,
                    enableActiveFill: true,
                    controller: otpController,
                    onCompleted: (v) {

                      print("Completed: $v");
                    },
                    onChanged: (value) {
                      print(value);
                      setState(() {});
                    },
                    beforeTextPaste: (text) {
                      return true;
                    },
                  ),
                ),
                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: CustomElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      },
                      label: "Verify"),
                ),

                // ElevatedButton(
                //   onPressed: () {
                //
                //   },
                //   child: const Text('Verify'),
                // ),
                const SizedBox(height: 10),
                const Text(
                  "This feature is under development. You can enter any 4 digits.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.orange,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
