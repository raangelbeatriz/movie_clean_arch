import 'package:flutter/material.dart';
import 'package:movie_clean_arch/core/extensions/size_extension.dart';

import 'icon_text_widget.dart';

class PosterWidget extends StatelessWidget {
  const PosterWidget({
    super.key,
    required this.posterPath,
    required this.likes,
    required this.popularity,
    required this.movieTitle,
  });
  final String movieTitle;
  final String? posterPath;
  final String likes;
  final String popularity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.percentHeigth(0.62),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: posterPath != null
                  ? DecorationImage(
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/original$posterPath'),
                      fit: BoxFit.cover)
                  : null,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: context.percentWidth(0.7),
                        child: Text(
                          movieTitle,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Icon(Icons.favorite)
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      IconTextWidget(
                        title: '$likes likes',
                        icon: Icons.favorite,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      IconTextWidget(
                        title: '$popularity views',
                        icon: Icons.lens,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
