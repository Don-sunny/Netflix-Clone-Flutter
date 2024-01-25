import 'package:flutter/material.dart';

import 'package:netflix_project/presentation/downloads/widgets/section_1.dart';
import 'package:netflix_project/presentation/downloads/widgets/section_2.dart';
import 'package:netflix_project/presentation/downloads/widgets/section_3.dart';
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
