import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import the google_fonts package

import 'screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NavScreen(),
      theme: ThemeData(
        // Set the default font family to Poppins for all text in the app
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context)
              .textTheme, // Apply Poppins to the existing text themes
        ),
      ),
    );
  }
}
