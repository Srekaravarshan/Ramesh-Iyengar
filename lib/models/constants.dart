import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'extensions.dart';

const white = Color(0xffffffff);
const primaryLight = Color(0xff00509D);
const primaryColor = Color(0xff003F88);
const primaryDark = Color(0xff00296B);
const accentLight = Color(0xffFFD500);
const accentColor = Color(0xffFDC500);
const black = Color(0xff212529);
const dark = Color(0xff023047);
const dark2 = Color(0xff06202D);

const double twentyFour = 20;
const double eighteen = 16;
const double sixty = 50;
const double forty = 32;
const double eighty = 60;
const double oneFifty = 120;
const double hundred = 75;

buttonCard(
    String imageUrl,
    String title,
    Color color,
    Function onTap,
    Function onHover,
    bool cardHover) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      onHover: onHover,
      child: Container(
        height: 290,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          image: DecorationImage(
              image: NetworkImage(imageUrl), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: color.withOpacity(0.8)),
          padding: EdgeInsets.all(290 * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,
                      style: GoogleFonts.lato(
                          fontSize: twentyFour,
                          color: Colors.white)),
                  SizedBox(height: 290 * 0.05),
                  AnimatedContainer(
                    width: 150,
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                        color: cardHover ? white : Colors.white.withOpacity(0),
                      border: Border.all(color: white),
                      borderRadius: BorderRadius.all(Radius.circular(4))
                    ),
                    child: Text('View more details',
                        style: GoogleFonts.lato(
                            fontSize: 14,
                            color: cardHover ? black : white)).center().padding(vertical: 8, horizontal: 5),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Row kTitleWidget(String title, {bool whiteColor = false}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        height: oneFifty / 3,
        width: 3,
        decoration: BoxDecoration(color: accentColor,borderRadius: BorderRadius.all(Radius.circular(3))),
      ),
      SizedBox(width: 15),
      Text(
        title,
        style: GoogleFonts.openSans(fontSize: forty, color: whiteColor? white : black, fontWeight: FontWeight.bold),
      )
    ],
  );
}

iconTextTile(String text, IconData icon) {
  return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: white),
          SizedBox(width: 5),
          Text(
            text,
            style: GoogleFonts.openSans(fontSize: twentyFour, color: white),
          )
        ],
      ));
}

Widget detailAppBar(double width){
  return Container(
    width: width,
    height: eighty,
    color: primaryColor,
    child: Center(
      child: Container(
        width: 1344,
        child: Text('Sourashtra prohitha sangam',
            style: GoogleFonts.openSans(
                fontSize: twentyFour, color: white)),
      ),
    ),
  );
}

Widget detailBody(BuildContext context, List<Widget> list){
  return  Padding(
    padding: const EdgeInsets.symmetric(vertical: hundred),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Center(
          child: Container(
            width: 1344,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    hoverColor: Colors.transparent,
                    onTap: (){Navigator.pop(context);},
                    child: Row(mainAxisSize: MainAxisSize.min,children: [
                      Icon(Icons.arrow_back_ios_rounded, color: primaryLight),
                      SizedBox(width: 10),
                      Text('Back', style: GoogleFonts.openSans(fontSize: twentyFour, color: primaryLight))
                    ],),
                  ),
                  SizedBox(height: oneFifty/3),
                  Wrap(
                    direction: Axis.horizontal,
                    children: list,
                    spacing: 60,
                    runSpacing: 10,
                  )],
              ),
            ),
          ),
        ),

      ] ,
    ),
  );
}

Widget homam(String imageUrl, String title, String content, {bool align = false}) {
  return Column(
    children: [
      Container(
        width: 290,
        height: 290,
        decoration: BoxDecoration(
          color: primaryLight.withOpacity(0.1),
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          image: DecorationImage(
              image: NetworkImage(imageUrl), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: primaryLight.withOpacity(0.3),
          ),
        ),
      ),
      Container(
          width: 290,
          padding: EdgeInsets.all(8),
          child: Text(title,
              style: GoogleFonts.openSans(
                  fontSize: twentyFour,
                  color: accentColor))),
      Container(
          width: 290,
          padding: EdgeInsets.only(bottom: 16, left: 16, right: 8),
          child: Text(content,
              style: GoogleFonts.lato(
                  fontSize: eighteen,
                  color: black))),
    ],
  );

}

serviceModel(String title, String imageUrl) => Column(
  children: [
    Container(
      width: 290,
      height: 290,
      decoration: BoxDecoration(
        color: primaryLight.withOpacity(0.1),
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
        image: DecorationImage(
            image: NetworkImage(imageUrl), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: primaryLight.withOpacity(0.3),
        ),
      ),
    ),
    Container(
        height: 50,
        width: 290,
        child: Center(
          child: Text(title,
              style: GoogleFonts.lato(
                  fontSize: twentyFour,
                  color: black)),
        ))
  ],
);

List<Widget> services = [
  serviceModel('House warming',
      'https://downloader.la/tmp/dc91acf56019c1642003719a93e2f55e.png'),
  serviceModel('Marriage',
      'https://downloader.la/tmp/f4f4374baf287914956075ef25adcc4d.png'),
  serviceModel('Upanayanam',
      'https://i1.wp.com/vasuraj.s3.amazonaws.com/web/wp-content/uploads/2019/04/29190719/11_Sanskar.jpg?fit=1920%2C1280&ssl=1'),
  serviceModel('Namakaranam',
      'https://i10.dainikbhaskar.com/thumbnails/730x548/web2images/www.dailybhaskar.com/2017/07/19/krishna-4_1500457000.jpg'),
  serviceModel('Sashti aptha poorthi',
      'https://downloader.la/tmp/d46a399e884dece306f114f68f515bbd.png'),
  serviceModel('Bhemaratha shanthi',
      'https://i.pinimg.com/564x/a6/97/96/a69796b376475a57668cb0ac789d38d8.jpg'),
  serviceModel('Sathabi segam',
      'https://downloader.la/tmp/d5eccca77894fac6c270f35109dff3c6.png'),
  serviceModel(
      'Vasthu poojai', 'https://kreatecube.com/usefull/Common/2/647.jpg'),
  serviceModel('Numerology',
      'https://media.allure.com/photos/5b4ce00ebfef050b4631c647/4:3/w_1832,h_1374,c_limit/Numerology%20occultism%20numbers%20resized%202000px.jpg'),
  serviceModel('Astrology',
      'https://resize.indiatvnews.com/en/resize/newbucket/715_-/2020/03/horoscope-1584727847.jpg'),
  serviceModel('Marriage matching',
      'https://www.nadiastrologytrivandrum.com/img/marriage-matching-compatibility.jpg'),
  serviceModel('Thithi shradham',
      'https://media.webdunia.com/_media/hi/img/article/2019-09/14/full/1568444158-7244.jpg')
];


List<Widget> homamsList = [
  homam(
      'https://2.bp.blogspot.com/-JBEBqBEPvnk/UZRIkJM27XI/AAAAAAAAIl8/Dym21UAYpjg/w1200-h630-p-k-no-nu/srirangam-ranganathaswamy-temple-vishnu.jpg',
      'Lakshmi narayana homam',
      'Lakshmi Narasimha Homam Get rid of Debt Troubles, For Prosperity and Wealth'),
  homam(
      'https://imgk.timesnownews.com/story/Meenakshi_Sundareshwara_Temple_Thirukalyanam.jpeg?tr=w-1200,h-900',
      'Meenakshi sundareshwarar homam',
      'Lakshmi Narasimha Homam Get rid of Debt Troubles, For Prosperity and Wealth'),
  homam(
      'https://kmkvaradhan.files.wordpress.com/2017/08/img-20170702-wa0001.jpg?w=584',
      'Sudharshana homam',
      'Lakshmi Narasimha Homam Get rid of Debt Troubles, For Prosperity and Wealth', align: true),
  homam(
      'https://i.pinimg.com/originals/0d/8a/8c/0d8a8c4e6feb45076d23c763d19cd29b.jpg',
      'Seetha ramar homam',
      'Lakshmi Narasimha Homam Get rid of Debt Troubles, For Prosperity and Wealth'),
  homam(
      'https://i.pinimg.com/originals/7a/de/c3/7adec3b0b677134283304e5f8057b86f.jpg',
      'Sri krishna homam',
      'Lakshmi Narasimha Homam Get rid of Debt Troubles, For Prosperity and Wealth'),
];


List<Widget> pariharamList = [
  homam(
      'https://2.bp.blogspot.com/-JBEBqBEPvnk/UZRIkJM27XI/AAAAAAAAIl8/Dym21UAYpjg/w1200-h630-p-k-no-nu/srirangam-ranganathaswamy-temple-vishnu.jpg',
      'Lakshmi narayana homam',
      'Lakshmi Narasimha Homam Get rid of Debt Troubles, For Prosperity and Wealth'),
  homam(
      'https://imgk.timesnownews.com/story/Meenakshi_Sundareshwara_Temple_Thirukalyanam.jpeg?tr=w-1200,h-900',
      'Meenakshi sundareshwarar homam',
      'Lakshmi Narasimha Homam Get rid of Debt Troubles, For Prosperity and Wealth'),
  homam(
      'https://kmkvaradhan.files.wordpress.com/2017/08/img-20170702-wa0001.jpg?w=584',
      'Sudharshana homam',
      'Lakshmi Narasimha Homam Get rid of Debt Troubles, For Prosperity and Wealth', align: true),
  homam(
      'https://i.pinimg.com/originals/0d/8a/8c/0d8a8c4e6feb45076d23c763d19cd29b.jpg',
      'Seetha ramar homam',
      'Lakshmi Narasimha Homam Get rid of Debt Troubles, For Prosperity and Wealth'),
  homam(
      'https://i.pinimg.com/originals/7a/de/c3/7adec3b0b677134283304e5f8057b86f.jpg',
      'Sri krishna homam',
      'Lakshmi Narasimha Homam Get rid of Debt Troubles, For Prosperity and Wealth'),
];

