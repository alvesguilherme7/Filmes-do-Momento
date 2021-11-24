import 'package:get/get.dart';

import 'favorites_controller.dart';

class FavoritesBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      FavoritesController(
        moviesService: Get.find(),
        authService: Get.find(),
      ),
    );
  }
}
