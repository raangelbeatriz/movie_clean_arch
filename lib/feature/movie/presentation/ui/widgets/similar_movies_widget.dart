import 'package:flutter/material.dart';
import 'package:movie_clean_arch/core/extensions/size_extension.dart';

class SimilarMoviesWidget extends StatelessWidget {
  const SimilarMoviesWidget({
    super.key,
    this.poster,
    required this.title,
    required this.subtitle,
  });

  final String? poster;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: context.percentHeigth(0.11),
                  width: context.percentWidth(0.15),
                  decoration: BoxDecoration(
                    image: poster != null
                        ? DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/original$poster'),
                            fit: BoxFit.cover)
                        : null,
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                Expanded(
                  flex: 5,
                  child: SizedBox(
                    height: context.percentHeigth(0.11),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          subtitle,
                          style: TextStyle(
                            color: Colors.grey[400]!,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.check_circle,
                  size: 15,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Divider(
            color: Colors.grey[800]!,
          )
        ],
      ),
    );
  }
}
