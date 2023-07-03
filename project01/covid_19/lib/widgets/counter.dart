import 'package:covid_19/costan.dart';
import 'package:flutter/material.dart';

class counter extends StatefulWidget {
  final int number;
  final Color color;
  final String title;
  const counter({
    Key? key, 
    required this.number, 
    required this.color, 
    required this.title,
  }) :super(key: key);

  @override
  State<counter> createState() => _counterState();
}

class _counterState extends State<counter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(Colors.red as int),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: Color(Colors.red as int),
                width: 2,
              )
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "numer",
          style: TextStyle(
            fontSize: 40,
            
          ),
        ),
         const Text('title', style: ksubtextstyle),
      ],
    );
  }
}


