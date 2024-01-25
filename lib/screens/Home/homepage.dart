import 'package:flutter/material.dart';
import 'package:wathaker_application/constants.dart';
import 'package:wathaker_application/models/date_time/date_tims.dart';
import 'package:wathaker_application/glossary.dart';
import 'package:wathaker_application/models/json_connection.dart';
import 'package:wathaker_application/widgets/nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  JsonConnection jsonConnection = new JsonConnection(); // ../models/json
  DateTims? list;
  static DateTime time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    int index = 1;

    return Scaffold(
      body: backgroundGradient(),
      bottomNavigationBar: navBar(index, context),
    );
  }

  FutureBuilder backgroundGradient() {
    return FutureBuilder(
        future: jsonConnection.getPTLocation(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    dark,
                    light,
                  ],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 22.0,
                    left: 22.0,
                  ),
                  child: Column(
                    children: [
                      // ------------- Setting and Location and Riyadh
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          location(),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/setting');
                            },
                            icon: Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // ------------- Good morning
                      Row(
                        children: [
                          Text(
                            Gloosary
                                .morning_evening, // here to change the morning/evening
                            style: TextStyle(
                              fontFamily: 'IBM Plex Sans Arabic',
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // ------------- Dates
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: yellow,
                              size: 24,
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "${time.day}\n${Gloosary.getMonth(time)}",
                                textAlign: TextAlign.center, // Date number
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'FF Shamel Family Sans One',
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: yellow,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 2),
                          child: Text(
                            "${Gloosary.getDay(time)}", // The weekday
                            style: TextStyle(
                                color: yellow,
                                fontSize: 15,
                                fontFamily: 'FF Shamel Family Sans One'),
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: yellow,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 150,
                        decoration: BoxDecoration(
                            border: Border.all(color: yellow, width: 0.25),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 12,
                            ),
                            Center(
                              child: Text(
                                "مواقيت الصلاة",
                                style: TextStyle(
                                  color: yellow,
                                  fontFamily: 'FF Shamel Family Sans One',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                salah(data?.data!.timings!.fajr, "الفجر"),
                                salah(data?.data!.timings!.dhuhr, "الظهر"),
                                salah(data?.data!.timings!.asr, "العصر"),
                                salah(data?.data!.timings!.maghrib, "المغرب"),
                                salah(data?.data!.timings!.isha, "العشاء"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 125,
                        decoration: BoxDecoration(
                            border: Border.all(color: yellow, width: 0.25),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              beforeAndAfter(
                                  "الصلاة السابقة", "1:25:36", "المغرب"),
                              beforeAndAfter(
                                  "الصلاة القادمة", "5:45", "العشاء"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/counter');
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: yellow, width: 0.25),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(
                            "عداد التسبيح",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'IBM Plex Sans Arabic',
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    dark,
                    light,
                  ],
                ),
              ),
              child: Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            );
          }
        });
  }
// - - - - - - - - - - - - - - - - - - -    Methods

  Container location() {
    return Container(
      child: Row(
        children: [
          Icon(
            Icons.location_on,
            color: yellow,
            size: 24,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            "الرياض", // Here to auto locate
            style: TextStyle(color: yellow, fontSize: 18),
          ),
        ],
      ),
    );
  }

  Column beforeAndAfter(String name, String time, String salah) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$name",
          style: TextStyle(
            color: yellow,
            fontFamily: 'FF Shamel Family Sans One',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "$time",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'FF Shamel Family Sans One',
            fontSize: 15,
          ),
        ),
        Text(
          "$salah",
          style: TextStyle(
            color: pink,
            fontFamily: 'FF Shamel Family Sans One',
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Column salah(dynamic time, String name) {
    return Column(
      children: [
        Container(
          width: 42,
          height: 42,
          margin: EdgeInsets.only(right: 15, left: 10, top: 12, bottom: 5),
          child: Center(
              child: Text(
            "$time",
            style: TextStyle(color: Colors.white),
          )),
          decoration: BoxDecoration(
            color: Color.fromRGBO(56, 26, 54, 1),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "$name",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'FF Shamel Family Sans One',
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
