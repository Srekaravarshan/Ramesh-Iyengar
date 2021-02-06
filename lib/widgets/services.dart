import 'package:flutter/material.dart';
import 'package:rameshiyengar/models/constants.dart';
import 'package:rameshiyengar/pages/homam.dart';
import 'package:rameshiyengar/pages/pariharam.dart';

bool card1Hover = false;
bool card2Hover = false;
bool card3Hover = false;

class Service extends StatefulWidget {
  const Service(key) : super(key: key);

  @override
  _ServiceState createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: hundred),
        child: Center(
          child: Container(
            width: 1344,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kTitleWidget('Our services'),
                SizedBox(height: oneFifty / 3),
                Row(
                  children: [
                    buttonCard(
                        'https://i.pinimg.com/564x/9c/e6/92/9ce692adb8be0e358031c666f8e90fae.jpg',
                        'Kumbabishegam',
                        Colors.yellow[900],
                        () {}, (value) {
                      setState(() {
                        card1Hover = value;
                      });
                    }, card1Hover),
                    SizedBox(width: 20),
                    buttonCard(
                        'https://i.pinimg.com/564x/a6/97/96/a69796b376475a57668cb0ac789d38d8.jpg',
                        'Homams',
                        Colors.red, () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Homam()));
                    }, (value) {
                      setState(() {
                        card2Hover = value;
                      });
                    }, card2Hover),
                    SizedBox(width: 20),
                    buttonCard(
                        'https://downloader.la/tmp/a76c70033027960d7fb7d288af05bf58.png',
                        'Pariharam',
                        Colors.yellow[900],
                        () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Pariharam()));
                        }, (value) {
                      setState(() {
                        card3Hover = value;
                      });
                    }, card3Hover)
                  ],
                ),
                SizedBox(height: oneFifty / 3),
                Wrap(
                  direction: Axis.horizontal,
                  children: services,
                  spacing: 60,
                  runSpacing: 10,
                )
              ],
            ),
          ),
        ));
  }
}
