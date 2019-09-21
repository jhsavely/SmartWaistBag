import 'dart:async';
import 'package:http/http.dart' as http;

const settingsURL = "http://192.168.0.103:8080/SettingsServlet";

class API{
  static Future getSettings(){
    var url = settingsURL  + "/set";
    return http.get(url);
  }
}
