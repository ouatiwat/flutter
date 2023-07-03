import 'package:covid_19/costan.dart';
import 'package:covid_19/info_screen.dart';
import 'package:covid_19/widgets/counter.dart';
import 'package:covid_19/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'covid19',
      theme: ThemeData(
        scaffoldBackgroundColor: kbackgroundcolor,
        fontFamily: "pop pins",
        textTheme: TextTheme(
          // body1: TextStyle(color: Kbodytextcolor),
        ),
      ),
      home: homescreen(),
    );
  }
}

class homescreen extends StatelessWidget {
  const homescreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const MyHeader(
              image: "assets/icons/Drcorona.svg",
              texttop: "All you need",
              textBottom: "is stay at home",
             
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: const Color(0xffe5e5e5),
                ),
              ),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                  const SizedBox(width: 20),
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      underline: const SizedBox(),
                      icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                      value: "indonesia",
                      items: ["indonesia", "bangladesh", "United States", "japan"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {},
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Case Update\n",
                              style: ktitletextstyle,
                            ),
                            TextSpan(
                              text: "Newest update march 28",
                              style: TextStyle(
                                color: ktextlightcolor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        "See details",
                        style: TextStyle(
                          color: kprimarycolor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 30,
                          color: kshadowcolor,
                        ),
                      ],
                    ),
                    // child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: <Widget>[
                    //      counter(
                    //       color: kinfectedcolor,
                    //       number: 1046,
                    //       title: "infected",
                    //     ),
                    //      counter(
                    //       color: kdeathcolor,
                    //       number: 87,
                    //       title: "kDeath",
                    //     ),
                    //      counter(
                    //       color: krecovercolor,
                    //       number: 46,
                    //       title: "krecover",
                    //     ),
                    //   ],
                    // ),
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "spread of virus",
                        style: ktitletextstyle,
                      ),
                      const Text(
                        "see details",
                        style: TextStyle(
                          color: kprimarycolor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(20),
                    height: 178,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 10),
                          blurRadius: 30,
                          color: kshadowcolor,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      "assets/images/map.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
                  child: SvgPicture.asset("assets/icons/menu.svg")),
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
