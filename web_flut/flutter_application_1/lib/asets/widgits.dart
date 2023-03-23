// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Buttons extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;

  const Buttons({
    super.key,
    required this.text,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
      child: GestureDetector(
        onTap: onpressed,
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 217, 217, 217),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey, width: 1.0)),
          child: Center(child: Text(text)),
        ),
      ),
    );
  }
}

class Cardd extends StatelessWidget {
  final String api_img_call;
  final String api_name_call;
  final String api_views_call;
  final String api_latesep_call;
  final String api_summary_call;

  const Cardd(
      {super.key,
      required this.api_img_call,
      required this.api_name_call,
      required this.api_views_call,
      required this.api_latesep_call,
      required this.api_summary_call});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          SizedBox(
            width: size.width * 0.25,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(api_img_call.toString()),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  api_name_call.toString(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.righteous(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 45, 45, 45)),
                ),
                const Divider(
                  color: Color.fromARGB(255, 83, 82, 82),
                  thickness: 0.5,
                ),
                Text(
                  api_summary_call.toString(),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Views : $api_views_call",
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Latest Episode : $api_latesep_call",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
