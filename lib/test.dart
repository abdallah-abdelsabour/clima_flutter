import 'package:http/http.dart' as http;

test() async {

  http.Response response = await http.get(
    
      'https://api.openweathermap.org/data/2.5/weather?q=cairo&appid=50f4c55512ae08e6339018cfd92901dd');
  print(response.body);
}

main() {
  test();
}
