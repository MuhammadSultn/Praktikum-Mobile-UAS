import 'package:flutter/material.dart';
import 'package:gaming_review/screens/home/components/bottom_buttons.dart';
import 'package:gaming_review/screens/home/components/categories.dart';
import 'package:gaming_review/screens/home/components/custom_app_bar.dart';
import 'package:gaming_review/screens/home/components/games.dart';
import 'package:gaming_review/screens/screen.dart';

class HomeScreen extends StatelessWidget {

 static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment(0.0, 1.0),
        children: [
          Column(
            children: [
              CustomAppBar(),
              Categories(),
              Games(),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              BottomButtons(name: "Search", ikon: Icons.search),
              InkWell(
                child: BottomButtons(name: "Profile", ikon: Icons.person),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Profile_screen(),)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
