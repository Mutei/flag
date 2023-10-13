import 'package:flutter/material.dart';
import 'dart:ui';
import 'country_flag.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            // Background Image
            Image.asset(
              'images/aksa.jpeg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            // Blur Filter
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CountryFlag(),
                  const SizedBox(
                    height: 150,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 16,
                      bottom: 15,
                    ),
                    child: const Text(
                      "This land will be returned to its rightful owners. This land will be returned to its owners after a year or 100 years. We will never forget the injustice that occurred, or the martyrs whose souls were sacrificed for the sake of this land.",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
