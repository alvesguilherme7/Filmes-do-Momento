import 'package:get/get.dart';

class RestClient extends GetConnect {

  RestClient(){
    super.httpClient.baseUrl = 'https://api.themoviedb.org/3';
  }
}