import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rameshiyengar/models/constants.dart';

class About extends StatefulWidget {
  const About(key): super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      color: white,
      constraints: BoxConstraints(
        maxHeight: 700,
        minHeight: 550,
      ),
      child: Center(
        child: Container(
          width: 1344,
          margin: EdgeInsets.symmetric(vertical: hundred),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                      color: accentLight.withOpacity(0.2))),
              SizedBox(width: forty),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    kTitleWidget('About us'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit ametdolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren',
                      style: GoogleFonts.lato(
                          fontSize: eighteen, color: black),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
