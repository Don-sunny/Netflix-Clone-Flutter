import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_project/core/colors.dart/colors.dart';
import 'package:netflix_project/core/constants.dart';
import 'package:netflix_project/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final _widgetList = [
    const Section1(),
    Section2(),
    const SizedBox(height: 10),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: 'Downloads',
          )),
      body: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemBuilder: (ctx, index) => _widgetList[index],
          separatorBuilder: (ctx, index) => const SizedBox(height: 20),
          itemCount: _widgetList.length),
    );
  }
}

class Section1 extends StatelessWidget {
  const Section1({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SmartDownload();
  }
}

class Section2 extends StatelessWidget {
  Section2({
    super.key,
  });

  final List imageList = [
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/xEAXVe0BzW4K9Ky6eTo4CJwzJ8P.jpg',
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/r2J02Z2OpNTctfOSN1Ydgii51I3.jpg',
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/gPbM0MK8CP8A174rmUwGsADNYKD.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Indroducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kWhite,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHight,
        const Text(
          "We Will download a personlized selection of movies and shows for you, so ther's\nalways something to watch on your \ndeveice",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 60),
        SizedBox(
          width: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.35,
                backgroundColor: Colors.grey.withOpacity(0.3),
              ),
              DownloadImageWidget(
                image: imageList[2],
                margin: const EdgeInsets.only(left: 130, bottom: 40),
                angle: 20,
                size: Size(size.width * 0.38, size.height * 0.21),
              ),
              DownloadImageWidget(
                image: imageList[0],
                margin: const EdgeInsets.only(right: 130, bottom: 40),
                angle: -20,
                size: Size(size.width * 0.38, size.height * 0.21),
              ),
              DownloadImageWidget(
                image: imageList[1],
                margin: const EdgeInsets.only(bottom: 7),
                size: Size(size.width * 0.40, size.height * 0.24),
                radius: 7,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kBttonColorBlue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set up',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        MaterialButton(
          color: kButtonColorWhite,
          onPressed: () {},
          child: const Text(
            'See what you can download ',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w900),
          ),
        )
      ],
    );
  }
}

class _SmartDownload extends StatelessWidget {
  const _SmartDownload();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.settings,
          color: kWhite,
        ),
        Text('Smart downloads'),
      ],
    );
  }
}

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget({
    super.key,
    required this.image,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius = 7,
  });

  final String image;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            // color: Colors.black,
            borderRadius: BorderRadius.circular(radius),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                image,
              ),
            )),
      ),
    );
  }
}
