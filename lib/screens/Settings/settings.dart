import 'package:flutter/material.dart';
import 'package:wathaker_application/constants.dart';
import 'package:wathaker_application/widgets/nav_bar.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    int index = 2; // nav bar index

    return Scaffold(
      bottomNavigationBar: navBar(index, context),
      body: body(),
    );
  }

  Container body() {
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
            left: 12,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.transparent,
                          size: 24,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.rotate_left_rounded,
                    color: Colors.transparent,
                    size: 24,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "الاعدادات",
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: yellow,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 8.0, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "عام",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              settingsLayers(Icons.notifications, "تفعيل التنبيهات"),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 8.0, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "أخرى",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              settingsLayers(Icons.account_circle, "عن المطور"),
              SizedBox(
                height: 10,
              ),
              settingsLayers(Icons.info, "عن التطبيق"),
              SizedBox(
                height: 10,
              ),
              settingsLayers(Icons.share_rounded, "انشر التطبيق"),
              SizedBox(
                height: 10,
              ),
              settingsLayers(Icons.star_outlined, "قيم التطبيق"),
              SizedBox(
                height: 10,
              ),
              settingsLayers(Icons.help, "مساعدة"),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container settingsLayers(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 45,
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            "$text",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'IBM Plex Sans Arabic',
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: yellow,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
