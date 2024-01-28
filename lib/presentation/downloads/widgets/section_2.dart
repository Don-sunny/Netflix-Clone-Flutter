import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_project/application/downloads/downloads_bloc.dart';
import 'package:netflix_project/core/colors.dart/colors.dart';
import 'package:netflix_project/core/constants.dart';
import 'package:netflix_project/presentation/downloads/widgets/download_image_widget.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context).add(
        const DownloadsEvent.getDownloadImage(),
      );
    });
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
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              width: size.width,
              height: size.height * 0.35,
              child: state.isLoading || state.downloads.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: size.width * 0.35,
                          backgroundColor: Colors.grey.withOpacity(0.3),
                        ),
                        DownloadImageWidget(
                          image:
                              '$imageAppendUrl${state.downloads[0].posterPath}',
                          margin: const EdgeInsets.only(left: 130, bottom: 40),
                          angle: 20,
                          size: Size(size.width * 0.38, size.height * 0.21),
                        ),
                        DownloadImageWidget(
                          image:
                              '$imageAppendUrl${state.downloads[1].posterPath}',
                          margin: const EdgeInsets.only(right: 130, bottom: 40),
                          angle: -20,
                          size: Size(size.width * 0.38, size.height * 0.21),
                        ),
                        DownloadImageWidget(
                          image:
                              '$imageAppendUrl${state.downloads[2].posterPath}',
                          margin: const EdgeInsets.only(bottom: 7),
                          size: Size(size.width * 0.40, size.height * 0.24),
                          radius: 7,
                        )
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}
