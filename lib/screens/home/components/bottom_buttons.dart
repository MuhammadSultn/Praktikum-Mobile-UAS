import 'package:flutter/material.dart';
import 'package:gaming_review/constants/constants.dart';

class BottomButtons extends StatelessWidget {
  final IconData ikon;
  final String name;

  const BottomButtons({super.key, required this.ikon, required this.name});
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: appPadding),
      child: Container(
        width: size.width * 0.4,
        height: 60,
        decoration: BoxDecoration(
          color: darkBlue,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [BoxShadow(
            color: darkBlue.withOpacity(0.6),
            offset: Offset(0,10),
            blurRadius: 10
          )]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon((ikon),color: white,),
            Text(' $name ',style: TextStyle(
              color: white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),)
          ],
        ),
      ),
    );
  }
}
