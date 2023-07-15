import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix_project/core/colors.dart/colors.dart';
import 'package:netflix_project/core/constants.dart';
import 'package:netflix_project/presentation/widgets/custom_button_widget.dart';
import 'package:netflix_project/presentation/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Peaky Blinders',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHight20,
        const Text(
          'This hit sitcom follow the merry misadventures of six\n20 something pales as they navigate the pitfalls of work,life and love in 1990s Manhattan',
          style: TextStyle(
            color: kGerayColor,
          ),
        ),
        kHight30,
        const VideoWidget(image: newAndHotImage2),
        kHight30,
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CoustomButtonWidget(
              icon: FontAwesomeIcons.paperPlane,
              title: 'Share',
              textSize: 15,
              iconSize: 30,
              fontWeight: FontWeight.normal,
              textColor: kGerayColor,
            ),
            kWidth,
            CoustomButtonWidget(
              icon: FontAwesomeIcons.plus,
              title: 'My List',
              textSize: 15,
              iconSize: 30,
              fontWeight: FontWeight.normal,
              textColor: kGerayColor,
            ),
            kWidth,
            CoustomButtonWidget(
              icon: FontAwesomeIcons.play,
              title: 'Play',
              textSize: 15,
              iconSize: 30,
              fontWeight: FontWeight.normal,
              textColor: kGerayColor,
            ),
            kWidth
          ],
        ),
        Row(
          children: [
            Image.network(netflixLogo, height: 40),
            const Text(
              'SERIES',
              style: TextStyle(
                letterSpacing: 4,
                fontSize: 10,
                color: kGerayColor,
              ),
            )
          ],
        ),
      ],
    );
  }
}
