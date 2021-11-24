import 'package:app_filmes/application/ui/theme_extensions.dart';
import 'package:app_filmes/models/movie_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class MovieDetailContentTitle extends StatelessWidget {
  final MovieDetailModel? movie;

  const MovieDetailContentTitle({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            movie?.title ?? '',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RatingStars(
            // na API o stars é de 0 a 10
            value: (movie?.stars ?? 1) / 2,
            valueLabelVisibility: false,
            starColor: context.themeOrange,
            starSize: 14,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            movie?.genres.map((e) => e.name).join(', ') ?? '',
            style: TextStyle(
              fontSize: 11,
              color: context.themeGrey,
            ),
          )
        ],
      ),
    );
  }
}
