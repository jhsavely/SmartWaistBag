import 'dart:async';
import 'package:http/http.dart' as http;

const baseURL = "https://jsonplaceholder.typicode.com";

class API{
  static Future getUsers(){
    var url = baseURL + "/users";
    return http.get(url);
  }
}
