import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBar1 extends StatefulWidget {
  const AppBar1({super.key});

  @override
  State<AppBar1> createState() => _AppBar1State();
}

class _AppBar1State extends State<AppBar1> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20.0, left: 15.0, right: 8.0),
      child: Row(
        children: [
          Text(
            'Home',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w800,
            ),
          ),
          // Row(
          //   children: [
          //     IconButton(
          //       icon: SvgPicture.asset(),
          // onPressed:null,
          //     ),
          //  IconButton(
          //       icon: SvgPicture.asset(),
          // onPressed:null,
          //     ),
          //  IconButton(
          //       icon: SvgPicture.asset(),
          // onPressed:null,
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
