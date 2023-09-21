
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget(this.text_one,this.text_two, {super.key});

 final String? text_one;
 final String? text_two;

  @override
  Widget build(BuildContext context) {
    return   RichText(
      textDirection: TextDirection.rtl,
      text: TextSpan(
        text: text_one,
        style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
        children: <TextSpan>[
          TextSpan(text:text_two, style: TextStyle(color: Colors.grey,fontSize: 10.sp)),

        ],
      ),
    );
  }
}
