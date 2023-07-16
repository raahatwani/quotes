import 'package:http/http.dart' as http;

import 'dart:convert';

late http.Response apiRespOne;
late http.Response apiRespTwo;
late http.Response apiRespThree;

var dataOne;
var dataTwo;
var dataThree;
String urlOne = 'https://zenquotes.io/api/today';
String urlTwo = 'https://zenquotes.io/api/random';
String urlThree = 'https://zenquotes.io/api/image';

getOne() async {
  apiRespOne = await http.get(Uri.parse(urlOne));
  dataOne = jsonDecode(apiRespOne.body);
}

getTwo() async {
  apiRespTwo = await http.get(Uri.parse(urlTwo));
  dataTwo = jsonDecode(apiRespTwo.body);
}

getThree() async {
  apiRespThree = await http.get(Uri.parse(urlThree));
  dataThree = jsonDecode(apiRespThree.body);
}
