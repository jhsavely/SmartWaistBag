import 'dart:async';
import 'package:http/http.dart' as http;

const settingsURL = "http://192.168.0.103:8084/SttingsServlet";
const userURL = "https://jsonplaceholder.typicode.com";

class API{
  static Future getSettings(){
    var url = settingsURL  + "/set";
    return http.get(url);
  }
  static Future getUsers() {
    var url = userURL + "/users";
    return http.get(url);
  }
}
