import 'package:flutter/material.dart';
import 'package:gaming_review/model/game.dart';
import 'package:gaming_review/screens/details/components/bottom_buttons.dart';
import 'package:gaming_review/screens/details/components/carousel_images.dart';
import 'package:gaming_review/screens/details/components/custom_app_bar.dart';
import 'package:gaming_review/screens/details/components/game_details.dart';

class DetailsScreen extends StatefulWidget {

  final Game game;

  const DetailsScreen({Key? key, required this.game}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  CarouselImages(widget.game.moreImagesUrl),
                  CustomAppBar(),
                ],
              ),
              GameDetails(widget.game),
            ],
          ),
          BottomButtons(),
        ],
      ),
    );
  }
}
