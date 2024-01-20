import 'package:flutter/material.dart';
import 'package:wathaker_application/constants.dart';
import 'package:wathaker_application/models/data.dart.dart';

class DuasScreenBody extends StatefulWidget {
  const DuasScreenBody({
    Key? key,
    this.id,
    this.inde,
  }) : super(key: key);

  final DuaData? id;
  final inde;

  @override
  State<DuasScreenBody> createState() => _DuasScreenBodyState();
}

class _DuasScreenBodyState extends State<DuasScreenBody> {
  void counter() {
    if (widget.id!.iterations != 0) {
      setState(() {
        widget.id!.iterations = widget.id!.iterations! - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.id != null) {
      void counter() {
        if (widget.id!.iterations != 0) {
          setState(() {
            widget.id!.iterations = widget.id!.iterations! - 1;
          });
        }
      }

      Color selectColor() {
        if (widget.id!.iterations != 0) {
          return Colors.white;
        } else {
          return Colors.green;
        }
      }

      Icon iconWid() {
        return Icon(
          Icons.check,
          color: yellow,
          size: 15,
        );
      }

      return SingleChildScrollView(
          child: widget.id!.id! == widget.inde.toString()
              ? Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: counter,
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: yellow,
                                        )),
                                    child: Card(
                                      color: Colors.transparent,
                                      // elevation: 0.5,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 20.0,
                                            top: 20.0,
                                            left: 20,
                                            bottom: 25),
                                        child: Text(
                                          widget.id!.text!,
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            wordSpacing: 1,
                                            height: 1.75,
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily: 'IBM Plex Sans Arabic',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: yellow),
                                color: light,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: widget.id!.iterations! > 0
                                    ? text(selectColor)
                                    : iconWid(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                )
              : Text("There is no Duaa"));
    } else {
      return Text("Error");
    }
  }

  Text text(Color selectColor()) {
    return Text(
      "${widget.id!.iterations}",
      style: TextStyle(
        color: selectColor(),
        fontSize: 12,
        fontFamily: 'IBM Plex Sans Arabic',
      ),
    );
  }
}
