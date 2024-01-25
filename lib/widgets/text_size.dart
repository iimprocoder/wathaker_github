import 'package:flutter/material.dart';
import 'package:wathaker_application/constants.dart';

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => _MyDialogState();
  static double textSize = 15.0;
}

class _MyDialogState extends State<MyDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentTextStyle: TextStyle(color: Colors.white),
      backgroundColor: light,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "حفظ",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        TextButton(
          onPressed: () {
            MyDialog.textSize = 15;
            Navigator.pop(context);
          },
          child: Text(
            "الغاء",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
      icon: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
            color: Colors.white,
          ),
          SizedBox(
            width: 35,
          ),
          Center(
            child: Text(
              "تغيير حجم الخط",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
      iconColor: Colors.white,
      content: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 180,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: yellow),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (MyDialog.textSize < 25 && MyDialog.textSize >= 15) {
                          MyDialog.textSize = MyDialog.textSize + 1;
                        }
                      });
                    },
                    icon: Icon(
                      Icons.add_circle_rounded,
                      color: yellow,
                      size: 35,
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    child: Center(
                      child: Text(
                        "معاينة",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MyDialog.textSize,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (MyDialog.textSize < 25 && MyDialog.textSize >= 15) {
                          MyDialog.textSize = MyDialog.textSize - 1;
                        }
                      });
                    },
                    icon: Icon(
                      Icons.remove_circle,
                      color: yellow,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Center(
                child: Text(
                  "* لا يمكن أن يزيد حجم الخط عن 24 ولا ينقص عن 15",
                  style: TextStyle(color: Colors.grey[350], fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
