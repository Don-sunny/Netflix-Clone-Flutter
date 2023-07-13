import 'package:flutter/material.dart';
import 'package:netflix_project/core/constants.dart';
import 'package:netflix_project/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: 'Downloads',
          )),
      body: ListView(
        children: [
          const Row(
            children: [
              Icon(
                Icons.settings,
                color: kColor,
              ),
              Text('Smart downloads'),
            ],
          ),
          const Text('Indroducing Downloads for you'),
          const Text(
            'We Will download a personlized selection of movies and shows for you, so ther is always something to watch on your deveice',
          ),
          Container(
            width: size.width,
            height: size.height,
            color: Colors.white,
            child: Stack(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: size.width * 0.35,
                  ),
                )
              ],
            ),
          ),
          MaterialButton(
            color: kBttonColorBlue,
            onPressed: () {},
            child: const Text(
              'Set up',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          MaterialButton(
            color: kButtonColorWhite,
            onPressed: () {},
            child: const Text(
              'See what you can downloadul ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
