import 'package:http/http.dart' as http;

class NetworkHelper {
  final url;

  NetworkHelper(this.url);

  Future getWeatherMyName(city) async {
    if (city != null) {
      http.Response response = await http.get(
          'https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=50f4c55512ae08e6339018cfd92901dd');

      if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }
  }

  Future getWeatherData() async {
    http.Response response = await http.get(this.url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }
}
