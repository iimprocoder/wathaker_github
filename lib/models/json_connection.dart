import 'dart:convert';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
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

    return list;
  }
}
