import 'package:geolocator/geolocator.dart';

class UserLocation {

  var latitude;

  var longtude;

  Position position;

  Future<void> getlocation() async {

        print("getlocationStart");
        position = await Geolocator.getCurrentPosition(

        desiredAccuracy: LocationAccuracy.bestForNavigation);

    
      this.latitude =  position.latitude;
      this.longtude =  position.longitude;

      print("end get location");
    
  }
}
