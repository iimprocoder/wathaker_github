import 'package:flutter/material.dart';
import 'package:wathaker_application/constants.dart';
import 'package:wathaker_application/models/datasets.dart';
import 'package:wathaker_application/widgets/duaCard.dart';
import 'package:wathaker_application/widgets/nav_bar.dart';
import 'package:wathaker_application/widgets/text_size.dart';

class DuasScreen extends StatefulWidget {
  const DuasScreen({super.key});

  @override
  State<DuasScreen> createState() => _DuasScreenState();
}

class _DuasScreenState extends State<DuasScreen> {
  @override
  Widget build(BuildContext context) {
    int indx = 0;
    return Scaffold(
      bottomNavigationBar: navBar(indx, context),
      body: Container(
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
            padding: const EdgeInsets.only(right: 26.0, left: 26, top: 5),
            child: Column(
              children: [
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "الأذكار", // here to change the test
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: yellow,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      ListView.builder(
                        itemCount: DataSet.list_duas_name.length,
                        itemBuilder: (context, index) => DuaCard(
                          indexItem: DataSet.list_duas_name[index].id!,
                          dua: DataSet.list_duas_name[index],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
