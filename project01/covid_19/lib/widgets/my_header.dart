import "package:covid_19/costan.dart";
import "package:covid_19/info_screen.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class MyHeader extends StatelessWidget {
  final String image;
  final String texttop;
  final String textBottom;
  const MyHeader({
    super.key,
    required this.image,
    required this.texttop,
    required this.textBottom,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        //clipper: MyClipper(),
        child: Container(
          padding: const EdgeInsets.only(left: 40, top: 50, right: 20),
          height: 350,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff3383cd),
                Color(0xff11249f),
              ],
            ),
            image: DecorationImage(
              image: AssetImage("assets/images/virus.png"),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) {
                          return Infoscree();
                        },
                      ),
                    );
                  },
                  child: SvgPicture.asset("assets/icons/menu.svg")
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    SvgPicture.asset(
                      image,
                      width: 230,
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                    Positioned(
                      top: 20,
                      left: 150,
                      child: Text(
                        "$texttop \n$textBottom",
                        style: kheadingtextstyle.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(), // i dont know why it can't work without container
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

mixin MyClipper implements CustomClipper<Path> {
  @override
  Path getClip(Size size){
    var path = Path();
    path.lineTo(0, size.height-80);
    path.quadraticBezierTo(
      size.width/2, size.height, size.width, size.height-80);
    path.lineTo(size.width, 0);
    path.close();  
    return path;
  }
@override
bool shouidReclip(CustomClipper<Path>oldclipeer){
  return false;
}

}