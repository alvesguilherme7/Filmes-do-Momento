import 'package:app_filmes/application/ui/theme_extensions.dart';
import 'package:app_filmes/models/cast_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetailCast extends StatelessWidget {
  final CastModel? cast;

  const MovieDetailCast({Key? key, this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              cast?.image ?? '',
              width: 85,
              height: 85,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8,),
          Text(
            cast?.name ?? '',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4,),
          Text(
            cast?.name ?? '',
            style: TextStyle(
              fontSize: 14,
              color: context.themeGrey,
            ),
          )
        ],
      ),
    );
  }
}
