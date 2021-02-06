import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

extension modelExtensions on Widget{
  Center center(){
    return Center(
      child: this,
    );
  }
  Padding padding({double vertical = 0.0 , double horizontal = 0.0}){
        return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }
}

modelLaunchUrl(String url) async {
  if(await canLaunch(url)){
    return launch(url);
  }else{
    print('Can\'t launch $url');
  }
}