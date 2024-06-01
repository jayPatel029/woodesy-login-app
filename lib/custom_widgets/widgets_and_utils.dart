import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 77, 64),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      width: double.infinity,
      height: 300,
      child: Center(
        child: Image.asset(
          'assets/logo.png',
        ),
      ),
    );
  }
}

void showCustomSnackbar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: darkGreen,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final double width;
  final double height;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.width = double.infinity,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: darkGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(),
        ),
      ),
    );
  }
}

class HomeCarCard extends StatelessWidget {
  final String carImage;
  final String carType;
  final String carModel;
  final String location;
  final String tripStart;
  final String tripEnd;
  final double price;

  const HomeCarCard(
      {super.key,
      required this.carImage,
      required this.carType,
      required this.carModel,
      required this.location,
      required this.tripStart,
      required this.tripEnd,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      carType,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(carModel),
                  ],
                ),
                Image.asset(
                  carImage,
                  width: 100,
                  height: 100,
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  CupertinoIcons.location_solid,
                  size: 16,
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(child: Text(location)),
              ],
            ),
            const SizedBox(
              height: 8,
            ),

            //! trip info

            const Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Trip Start",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
                Text(
                  "Trip End",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(tripStart),
                const SizedBox(
                  width: 27,
                ),
                Text(tripEnd)
              ],
            ),

            const SizedBox(
              height: 8,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      'Paid via CC',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "\$$price",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomElevatedButton(
                    onPressed: () {
                      showCustomSnackbar(context, "Feature yet to be added!");
                    },
                    label: 'View',
                    height: 30,
                    width: 90,
                  ),

                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(),
                  //   onPressed: () {},
                  //   child: Text("View"),
                  // ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
