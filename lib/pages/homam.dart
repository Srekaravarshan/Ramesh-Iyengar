import 'package:flutter/material.dart';
import '../models/constants.dart';

class Homam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return LayoutBuilder(
        builder: (context, constraints) {
          if(constraints.minWidth>1344){
            return Scaffold(
              backgroundColor: white,
              body: SingleChildScrollView(
              child: Column(
                children: [
                  detailAppBar(width),
                  detailBody(context, homamsList)
                ],
              ),
                ),);
          }else{
            return Scaffold(
            );
          }
        },
    );
  }
}
