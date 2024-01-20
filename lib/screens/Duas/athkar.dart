import 'package:flutter/material.dart';
import 'package:wathaker_application/constants.dart';
import 'package:wathaker_application/models/data.dart.dart';
import 'package:wathaker_application/models/datasets.dart';
import 'package:wathaker_application/screens/Duas/duas_screen_body.dart';

class Athkar extends StatelessWidget {
  Athkar({
    Key? key,
    this.id,
    required this.dua,
  }) : super(key: key);

  final int? id;
  final Duaa dua;
  int? textSize = 15;
  @override
  Widget build(BuildContext context) {
    // Filter the dua list based on the provided id
    final filteredDua = DataSet.dua
        .where((element) => element.id?.contains(id?.toString() ?? "") ?? false)
        .toList();

    Future openDialog() => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Center(
              child: Text("تغيير حجم الخط"),
            ),
            content: TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                // hintText: "التلقائي = 15",
                labelStyle: TextStyle(fontSize: 9),
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.add_circle,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("1"),
                      ),
                      Icon(
                        Icons.remove_circle,
                      ),
                    ],
                  ),
                  Text('حفظ'),
                ],
              ),
            ],
          ),
        );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [dark, light],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 26.0, left: 26, top: 5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/dua');
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    IconButton(
                      onPressed: () {
                        openDialog();
                      },
                      icon: Icon(
                        Icons.format_size_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "${dua.name}",
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
                  height: 15,
                ),
                SizedBox(
                  height: 561,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredDua.length,
                    itemBuilder: (context, index) {
                      return DuasScreenBody(
                        id: filteredDua[index],
                        inde: id,
                      );
                    },
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
