import 'package:flutter/material.dart';
class InformationDialog extends StatelessWidget {
  final String text;
  const InformationDialog({Key? key, this.text = "Info"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        color: Color(0xfff2f6f9),
      ),
      child: Text(text,
        style: TextStyle(
          color: Color(0xff435870)
        ),),
    );
  }
}
