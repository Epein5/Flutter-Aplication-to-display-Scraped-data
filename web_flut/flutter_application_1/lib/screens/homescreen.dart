import 'package:flutter/material.dart';
import 'package:flutter_application_1/asets/widgits.dart';
import 'package:flutter_application_1/models/ongoingmodel.dart';
import 'package:flutter_application_1/screens/completed.dart';
import 'package:flutter_application_1/screens/splashscreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ongoing.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/chibi.jpg"),
            Text(
              "Select a Catagory",
              style: GoogleFonts.kalam(
                  fontSize: 20, color: const Color.fromARGB(255, 45, 45, 45)),
            ),
            Buttons(
              text: "Ongoing",
              onpressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Ongoingpage()));
              },
            ),
            Buttons(
              text: "Completed",
              onpressed: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Completedpage()));
              }),
            )
          ],
        ),
      ),
    );
  }
}
