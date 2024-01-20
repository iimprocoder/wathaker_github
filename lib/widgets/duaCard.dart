import 'package:flutter/material.dart';
import 'package:wathaker_application/constants.dart';
import 'package:wathaker_application/models/data.dart.dart';
import 'package:wathaker_application/screens/Duas/athkar.dart';

class DuaCard extends StatelessWidget {
  const DuaCard({Key? key, required this.indexItem, required this.dua})
      : super(key: key);

  final int indexItem;
  final Duaa dua;

  void selectItem(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(
      builder: (context) => Athkar(
        id: indexItem,
        dua: dua,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: () => selectItem(context),
        splashColor: dark,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(
              color: yellow,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${dua.name}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'IBM Plex Sans Arabic',
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
