import 'package:app_filmes/modules/movies_detail/movie_detail_controller.dart';
import 'package:app_filmes/modules/movies_detail/widget/movie_detail_content.dart';
import 'package:app_filmes/modules/movies_detail/widget/movie_detail_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailPage extends GetView<MovieDetailController> {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhe'),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieDetailHeader(movie: controller.movie.value),
              MovieDetailContent(movie: controller.movie.value)
            ],
          );
        }),
      ),
    );
  }
}
