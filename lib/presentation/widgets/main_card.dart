import 'package:flutter/material.dart';
import 'package:netflix_project/core/constants.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          borderRadius: kRadius20,
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(mianImage),
          )),
    );
  }
}
