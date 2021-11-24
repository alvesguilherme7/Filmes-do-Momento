import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin LoaderMixin on GetxController {
  void loaderListener(RxBool loadedRx){
    ever<bool>(loadedRx, (loading){
      if(loading){
        Get.dialog(
          Center(child: CircularProgressIndicator(),),
          barrierDismissible: false
        );
      }else{
        Get.back();
      }
    });
  }
}