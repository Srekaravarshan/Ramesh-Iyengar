import 'dart:ui';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rameshiyengar/widgets/about.dart';
import 'package:rameshiyengar/widgets/contact.dart';
import 'package:rameshiyengar/widgets/services.dart';
import 'package:rameshiyengar/models/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ramesh iyengar',
      theme: ThemeData(accentColor: accentColor, highlightColor: accentColor),
      home: HomePage(),
    );
  }
}

class MenuItems{
  final String title;
  final GlobalKey key;
  final double position;

  MenuItems(this.title, this.key, this.position);

}

int selectedIndex = 0;
int hoverIndex = 0;
bool isHover = false;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

ScrollController scrollController;

class _HomePageState extends State<HomePage> with AfterLayoutMixin<HomePage>{

  List<MenuItems> menuTitles = [];

  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final servicesKey = GlobalKey();
  final contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController(initialScrollOffset: 0);
    scrollController.addListener(_scrollListener);
  }

  _scrollListener(){
    double position = scrollController.position.pixels;
    if(position<600){
      setState(() {
        selectedIndex = 0;
        hoverIndex = selectedIndex;
      });
    }else if(position<1550){
      setState(() {
        selectedIndex = 1;
        hoverIndex = selectedIndex;
      });
    }else if(position<2500){
      setState(() {
        selectedIndex = 2;
        hoverIndex = selectedIndex;
      });
    }else{
      setState(() {
        selectedIndex= 3;
        hoverIndex = selectedIndex;
      });
    }
  }

  @override
  void afterFirstLayout(BuildContext context) {
    setState(() {
      menuTitles = [MenuItems('Home', homeKey,0), MenuItems('About',aboutKey,760), MenuItems('Services', servicesKey,1647.5), MenuItems('Contact', contactKey,3251.5)];
    });
  }


  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1344) {
          return Scaffold(
            body: Column(
              children: [
                // app bar
                Container(
                  width: width,
                  height: eighty,
                  color: primaryColor,
                  child: Center(
                    child: Container(
                      width: 1344,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Sourashtra prohitha sangam',
                              style: GoogleFonts.openSans(
                                  fontSize: twentyFour, color: white)),
                          ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: menuTitles.length == null ? 0: menuTitles.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onHover: (value) {
                                  setState(() {
                                    value
                                        ? hoverIndex = index
                                        : hoverIndex = selectedIndex;
                                  });
                                },
                                onTap: () {
                                  scrollController.animateTo(menuTitles[index].position, duration: Duration(milliseconds: 700), curve: Curves.easeOut);
                                },
                                child: Padding(
                                  padding:
                                  const EdgeInsets.only(left: oneFifty / 3),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        menuTitles[index].title,
                                        style: GoogleFonts.lato(
                                            fontSize: eighteen, color: white),
                                      ),
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        height: 3,
                                        width: selectedIndex == index ? forty :(hoverIndex == index && hoverIndex != selectedIndex ? 18: 0),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(3)),
                                            color: accentColor),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        header(width),
                        About(aboutKey),
                        // chose us
                        Container(
                          height: hundred * 2.5,
                          width: width,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage('images/about.png'), fit: BoxFit.cover, alignment: Alignment.bottomCenter)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text('5000+',
                                          style: GoogleFonts.lato(
                                              fontSize: sixty, color: white)),
                                      Text('Homam',
                                          style: GoogleFonts.lato(
                                              fontSize: twentyFour, color: white)),
                                    ],
                                  ),
                                  SizedBox(
                                    width: hundred,
                                  ),
                                  Column(
                                    children: [
                                      Text('100+',
                                          style: GoogleFonts.lato(
                                              fontSize: sixty, color: white)),
                                      Text('Kumbabishegam',
                                          style: GoogleFonts.lato(
                                              fontSize: twentyFour, color: white)),
                                    ],
                                  ),
                                  SizedBox(
                                    width: hundred,
                                  ),
                                  Column(
                                    children: [
                                      Text('5000+',
                                          style: GoogleFonts.lato(
                                              fontSize: sixty, color: white)),
                                      Text('Pariharam',
                                          style: GoogleFonts.lato(
                                              fontSize: twentyFour, color: white)),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: twentyFour),
                              Text('Since 1995',
                                  style: GoogleFonts.lato(
                                      fontSize: twentyFour, color: black))
                            ],
                          ),
                        ),
                        Service(servicesKey),
                        Contact(contactKey),
                        // copyright footer
                        Container(
                          width: width,
                          height: hundred,
                          color: dark2,
                          child: Center(
                              child: Text(
                                  '© Sourashtra prohitha sangam. All rights reserved',
                                  style: GoogleFonts.openSans(
                                      fontSize: twentyFour, color: white))),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
              body: Column(
                children: [
                  // app bar
                  Container(
                    width: width,
                    height: eighty,
                    color: primaryColor,
                    child: Center(
                      child: Container(
                        width: 1344,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Sourashtra prohitha sangam',
                                style: GoogleFonts.openSans(
                                    fontSize: twentyFour, color: white)),
                            ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: menuTitles.length == null ? 0: menuTitles.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onHover: (value) {
                                    setState(() {
                                      value
                                          ? hoverIndex = index
                                          : hoverIndex = selectedIndex;
                                    });
                                  },
                                  onTap: () {
                                    scrollController.animateTo(menuTitles[index].position, duration: Duration(milliseconds: 700), curve: Curves.easeOut);
                                  },
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(left: oneFifty / 3),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          menuTitles[index].title,
                                          style: GoogleFonts.lato(
                                              fontSize: eighteen, color: white),
                                        ),
                                        AnimatedContainer(
                                          duration: Duration(milliseconds: 300),
                                          height: 3,
                                          width: selectedIndex == index ? forty :(hoverIndex == index && hoverIndex != selectedIndex ? 18: 0),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3)),
                                              color: accentColor),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          header(width),
                          About(aboutKey),
                          // chose us
                          Container(
                            height: hundred * 2.5,
                            width: width,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage('images/about.png'), fit: BoxFit.cover, alignment: Alignment.bottomCenter)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text('5000+',
                                            style: GoogleFonts.lato(
                                                fontSize: sixty, color: white)),
                                        Text('Homam',
                                            style: GoogleFonts.lato(
                                                fontSize: twentyFour, color: white)),
                                      ],
                                    ),
                                    SizedBox(
                                      width: hundred,
                                    ),
                                    Column(
                                      children: [
                                        Text('100+',
                                            style: GoogleFonts.lato(
                                                fontSize: sixty, color: white)),
                                        Text('Kumbabishegam',
                                            style: GoogleFonts.lato(
                                                fontSize: twentyFour, color: white)),
                                      ],
                                    ),
                                    SizedBox(
                                      width: hundred,
                                    ),
                                    Column(
                                      children: [
                                        Text('5000+',
                                            style: GoogleFonts.lato(
                                                fontSize: sixty, color: white)),
                                        Text('Pariharam',
                                            style: GoogleFonts.lato(
                                                fontSize: twentyFour, color: white)),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: twentyFour),
                                Text('Since 1995',
                                    style: GoogleFonts.lato(
                                        fontSize: twentyFour, color: black))
                              ],
                            ),
                          ),
                          Service(servicesKey),
                          Contact(contactKey),
                          // copyright footer
                          Container(
                            width: width,
                            height: hundred,
                            color: dark2,
                            child: Center(
                                child: Text(
                                    '© Sourashtra prohitha sangam. All rights reserved',
                                    style: GoogleFonts.openSans(
                                        fontSize: twentyFour, color: white))),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
          );
        }
      },
    );
  }

  Widget header(double width){
    return Container(
      constraints: BoxConstraints(minHeight: 550, maxHeight: 700),
      width: width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/header_bg.png'),
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter)),
      child: Center(
        child: Container(
          // constraints: BoxConstraints(maxWidth: 1344),
          width: 1344,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: eighty),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sourashtra prohitha\nsangam',
                        style: GoogleFonts.lato(
                            fontSize: sixty,
                            color: white,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.clip,
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          scrollController.animateTo(menuTitles.last.position, duration: Duration(milliseconds: 700), curve: Curves.easeOut);
                          setState(() {
                            selectedIndex = menuTitles.length-1;
                          });
                        },
                        onHover: (value){
                          setState(() {
                            isHover = value;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: sixty,
                          width: oneFifty,
                          decoration: BoxDecoration(
                              border: Border.all(color: isHover? white: accentColor),
                              color: isHover? accentColor.withOpacity(0) :accentLight,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(4))),
                          child: Center(
                            child: Text(
                              'Contact',
                              style: GoogleFonts.openSans(
                                  fontSize: twentyFour,
                                  color: isHover? white:black),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              )
            ],
          ),
        ),
      ),
    );
  }

}