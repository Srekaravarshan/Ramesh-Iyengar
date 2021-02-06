import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rameshiyengar/models/constants.dart';
import 'package:rameshiyengar/models/extensions.dart';

class Contact extends StatefulWidget {
  const Contact(key): super(key: key);
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {

  bool isHover = false;

  @override
  Widget build(BuildContext context) {

    return Container(
        color: dark,
        padding: EdgeInsets.symmetric(vertical: hundred),
        child: Center(
          child: Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kTitleWidget('Contact', whiteColor: true),
                  SizedBox(height: twentyFour),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          InkWell(
                            onHover: (value){
                              setState(() {
                                isHover = value;
                              });
                            },
                            onTap: () async { await modelLaunchUrl('https://www.google.com/maps/place/Ramesh+iyengar/@9.9016089,78.1197054,17z/data=!3m1!4b1!4m5!3m4!1s0x3b00c5997f51e5f3:0xd6f679ea5df3967a!8m2!3d9.9016089!4d78.1218941');},
                            child: AnimatedContainer(
                              duration:Duration(milliseconds: 300),
                              height: 290,
                              width: 290,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'images/map.png'),
                                    fit: BoxFit.cover,),
                                  borderRadius:
                                  BorderRadius.circular(4)),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: AnimatedContainer(
                              duration:Duration(milliseconds: 300),
                              padding: EdgeInsets.all(10),
                              height: 50,
                              width: 290,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(4),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.white
                                            .withOpacity(0),
                                        isHover? Colors.blue[100] :white
                                      ])),
                              child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text('View map',
                                      style: GoogleFonts.lato(
                                          fontSize: twentyFour,
                                          color: black))),
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: oneFifty / 3),
                      Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            iconTextTile('Ramesh iyengar',
                                Icons.person_outline_rounded),
                            iconTextTile(
                                '+91 98421 53239', Icons.phone),
                            iconTextTile(
                                'www.sourashtraprohithasangam.com',
                                Icons.public),
                            iconTextTile(
                                "Plot no. 'P', Kuberan street,\nSri mahalakshmi nagar,\nKathirvel theater complex,\nVillapuram,\nMadurai, Tamil Nadu, India.\nPin code - 625012",
                                Icons.location_on),
                          ])
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
