import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
<<<<<<< Updated upstream
import 'package:wathaker_application/models/prayer_data.dart';

class JsonConnection {
  Data? list;

  Future getPTLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);
    double pLat = position.latitude;
    double pLong = position.longitude;
    final formattedDate = DateFormat("dd-MM-yyyy").format(DateTime.now());
    int method = 4;

    final url =
        "https://api.aladhan.com/v1/timings/$formattedDate?latitude=$pLat&longitude=$pLong&method=$method";

    http.Response res = await http.get(Uri.parse(url), headers: {
      "Accept":
          "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
    });

    final data = json.decode(res.body);

    list = new Data.fromJson(data);
=======
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:wathaker_application/models/date_time/date_tims.dart';

class JsonConnection {
  DateTims? list;
  Future<Position> getCurrentUserLocation() async {
    // we can compress it
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    final res = await Geolocator.getCurrentPosition();
    return res;
  }

  getPTLocation() async {
    try {
      final position = await getCurrentUserLocation();
      double pLat = position.latitude;
      double pLong = position.longitude;
      // print(pLat);
      // print(pLong);
      final formattedDate = DateFormat("dd-MM-yyyy").format(DateTime.now());
      int method = 4;

      final String url =
          "https://api.aladhan.com/v1/timings/$formattedDate?latitude=$pLat&longitude=$pLong&method=$method";
      Dio dio = Dio();
      dio.interceptors.add(PrettyDioLogger());
      final res = await dio.get(url);

      list = DateTims.fromJson(res.data);
>>>>>>> Stashed changes

    return list;
  }
}
