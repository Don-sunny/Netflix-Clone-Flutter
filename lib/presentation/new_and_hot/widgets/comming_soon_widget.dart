import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix_project/core/colors.dart/colors.dart';
import 'package:netflix_project/core/constants.dart';
import 'package:netflix_project/presentation/widgets/custom_button_widget.dart';
import 'package:netflix_project/presentation/widgets/video_widget.dart';

class CommingSoonWidget extends StatelessWidget {
  const CommingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        const SizedBox(
          width: 50,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'FEB',
                style: TextStyle(
                    fontSize: 16, color: kGerayColor, letterSpacing: 2),
              ),
              Text(
                '11',
                style: TextStyle(
                  letterSpacing: 5,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VideoWidget(image: newAndHotImage1),
              kHight,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tall Girl 2',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      CoustomButtonWidget(
                        icon: FontAwesomeIcons.bell,
                        title: 'Remind me',
                        textSize: 10,
                        iconSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                      kWidth,
                      CoustomButtonWidget(
                        icon: Icons.info_outline,
                        title: 'Info',
                        textSize: 10,
                        iconSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                      kWidth,
                    ],
                  ),
                ],
              ),
              kHight,
              const Text(
                'Comming On Frieday',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              kHight10,
              Row(
                children: [
                  Image.network(netflixLogo, height: 50),
                  const Text(
                    'FILM',
                    style: TextStyle(
                      letterSpacing: 4,
                      fontSize: 13,
                      color: kGerayColor,
                    ),
                  )
                ],
              ),
              const Text(
                'Tall Girl 2',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHight,
              const Text(
                'Landin the lead in the school musical a dream come ture fot jodi until the prusser sends her confidence - and her relationship - into a tailspain.',
                style: TextStyle(
                  color: kGerayColor,
                ),
              ),
              kHight30,
              const Row(
                children: [
                  Text(
                    'intimate',
                    style: kNewAndHot,
                  ),
                  kwidth6,
                  Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 5,
                  ),
                  kwidth6,
                  Text(
                    'Hearful',
                    style: kNewAndHot,
                  ),
                  kwidth6,
                  Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 5,
                  ),
                  kwidth6,
                  Text(
                    'Reality TV',
                    style: kNewAndHot,
                  ),
                  kwidth6,
                  Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 5,
                  ),
                  kwidth6,
                  Text(
                    'New zealand',
                    style: kNewAndHot,
                  ),
                  kwidth6,
                  Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 5,
                  ),
                  kwidth6,
                  Text(
                    'Feel-Good',
                    style: kNewAndHot,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
