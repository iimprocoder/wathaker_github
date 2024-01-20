import 'package:flutter/material.dart';
import 'package:wathaker_application/constants.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  int counter = 0;
  List<String> items = ["أستغفرالله", "سبحان الله", "الحمدلله", "الله أكبر"];
  String? selectedItem = "أستغفرالله";

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
            left: 22.0,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/home');
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
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        counter = 0;
                      });
                    },
                    icon: Icon(
                      Icons.rotate_left_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
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
                    "عداد التسبيح",
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
                height: 175,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: DropdownButton<String>(
                      icon: Icon(
                        Icons.arrow_drop_down_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      alignment: Alignment.center,
                      dropdownColor: Colors.transparent,
                      elevation: 1,
                      value: selectedItem,
                      items: items
                          .map(
                            (item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (item) => setState(() {
                        selectedItem = item;
                      }),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              GestureDetector(
                onTap: () {
                  setState(() {
                    counter++;
                  });
                },
                child: Container(
                  width: 362,
                  height: 362,
                  child: Text(
                    "$counter",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 45, color: yellow),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
