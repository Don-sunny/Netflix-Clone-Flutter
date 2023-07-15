import 'package:flutter/material.dart';
import 'package:netflix_project/core/colors.dart/colors.dart';
import 'package:netflix_project/core/constants.dart';
import 'package:netflix_project/presentation/new_and_hot/screen_new_and_%20hot.dart';
import 'package:netflix_project/presentation/widgets/custom_button_widget.dart';

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
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 180,
                    child: Image.network(
                      newAndHotTemImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: CircleAvatar(
                      radius: 17,
                      backgroundColor: Colors.black.withOpacity(0.3),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.volume_off,
                          color: kWhite,
                        ),
                        iconSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
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
                        icon: Icons.notifications,
                        title: 'Remind me',
                        textSize: 10,
                        iconSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                      kWidth,
                      CoustomButtonWidget(
                        icon: Icons.info,
                        title: 'Remind me',
                        textSize: 10,
                        iconSize: 15,
                        fontWeight: FontWeight.normal,
                      )
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
