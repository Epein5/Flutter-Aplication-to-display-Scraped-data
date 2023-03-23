import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/asets/widgits.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../models/ongoingmodel.dart';

class Completedpage extends StatefulWidget {
  const Completedpage({super.key});

  @override
  State<Completedpage> createState() => _CompletedpageState();
}

class _CompletedpageState extends State<Completedpage> {
  List<Ongoing> animelist = [];

  Future<List<Ongoing>> getPostApi() async {
    final response = await http
        .get(Uri.parse("http://10.0.2.2:5000/api/data/Condition/Completed"));

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      animelist.clear();
      for (Map i in data) {
        animelist.add(Ongoing.fromJson(i));
      }
      return animelist;
    }
    return animelist;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 9, 9, 9),
          title: Center(
              child: Text(
            "Top Ongoing anime",
            style: GoogleFonts.kalam(
                fontSize: 20, color: const Color.fromARGB(255, 244, 239, 239)),
          )),
        ),
        backgroundColor: const Color.fromARGB(255, 212, 210, 210),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getPostApi(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: Text(
                          "Please wait",
                          style: GoogleFonts.kalam(
                              fontSize: 20,
                              color: const Color.fromARGB(255, 45, 45, 45)),
                        ),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: animelist.length,
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                                onTap: () {
                                  final a = Uri.parse(
                                      animelist[index].link.toString());
                                  launchUrl(a);
                                },
                                child: Cardd(
                                  api_img_call:
                                      animelist[index].imageSrc.toString(),
                                  api_name_call:
                                      animelist[index].animeName.toString(),
                                  api_views_call:
                                      animelist[index].views.toString(),
                                  api_latesep_call:
                                      animelist[index].latestEpisode.toString(),
                                  api_summary_call:
                                      animelist[index].link.toString(),
                                ));
                          }));
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
