import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wathaker_application/constants.dart';
import 'package:wathaker_application/models/data.dart.dart';
import 'package:wathaker_application/models/datasets.dart';
import 'package:wathaker_application/screens/Duas/duas_screen_body.dart';
import 'package:wathaker_application/widgets/text_size.dart';

class Athkar extends StatefulWidget {
  Athkar({
    Key? key,
    this.id,
    required this.dua,
  }) : super(key: key);

  final int? id;
  final Duaa dua;

  @override
  State<Athkar> createState() => _AthkarState();
}

class _AthkarState extends State<Athkar> {
  @override
  Widget build(BuildContext context) {
    // Filter the dua list based on the provided id
    final filteredDua = DataSet.dua
        .where((element) =>
            element.id?.contains(widget.id?.toString() ?? "") ?? false)
        .toList();

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
                        showDialog(
                            context: context,
                            builder: (context) {
                              return MyDialog();
                            });
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
                      "${widget.dua.name}",
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
                        inde: widget.id,
                        size: MyDialog.textSize,
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
