import 'package:flutter/material.dart';
import 'package:netflix_project/core/colors.dart/colors.dart';
import 'package:netflix_project/presentation/fast_laugh/widget/video_list_item.dart';
import 'package:netflix_project/presentation/widgets/custom_button_widget.dart';

class BackgoundCardWidget extends StatelessWidget {
  const BackgoundCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CoustomButtonWidget(icon: Icons.add, title: 'My List'),
                _playButton(),
                const CoustomButtonWidget(icon: Icons.info, title: 'Info')
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kWhite)),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        color: kBlack,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Play',
          style: TextStyle(
            fontSize: 20,
            color: kBlack,
          ),
        ),
      ),
    );
  }
}