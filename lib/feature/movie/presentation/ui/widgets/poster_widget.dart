import 'package:flutter/material.dart';
import 'package:movie_clean_arch/core/extensions/size_extension.dart';

import 'icon_text_widget.dart';

class PosterWidget extends StatefulWidget {
  const PosterWidget({
    super.key,
    required this.posterPath,
    required this.likes,
    required this.popularity,
    required this.movieTitle,
  });
  final String movieTitle;
  final String posterPath;
  final String likes;
  final String popularity;
  @override
  State<PosterWidget> createState() => _PosterWidgetState();
}

class _PosterWidgetState extends State<PosterWidget> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.percentHeigth(0.62),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/original${widget.posterPath}'),
                  fit: BoxFit.cover),
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
                          widget.movieTitle,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              isLiked = !isLiked;
                            });
                          },
                          child: Icon(isLiked
                              ? Icons.favorite
                              : Icons.favorite_outline))
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      IconTextWidget(
                        title: '${widget.likes} likes',
                        icon: Icons.favorite,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      IconTextWidget(
                        title: '${widget.popularity} views',
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
