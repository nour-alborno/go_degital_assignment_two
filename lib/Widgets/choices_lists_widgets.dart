
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_degital_assignment_two/Data/order_model.dart';

class ListChoicesWidget extends StatefulWidget {
  const ListChoicesWidget({required this.where, this.sizes,this.additions});

  final String where;
  final Size? sizes;
  final Addition? additions;

  @override
  State<ListChoicesWidget> createState() => _ListChoicesWidgetState();
}

class _ListChoicesWidgetState extends State<ListChoicesWidget> {
   int selectedSize = 1;

  @override
  Widget build(BuildContext context) {
    return widget.where.compareTo("size") == 0?
    RadioListTile<int>(
      title: Padding(
        padding: const EdgeInsets.only(left: 220).w,
        child: Text(widget.sizes?.size ?? ""),
      ),
      subtitle: Text(widget.sizes!.sizePrice.toString()),
      value: 1,
      groupValue: selectedSize,
      onChanged: (value) {
        setState(() {
          selectedSize = value!;
        });
      },
    )
        :CheckboxListTile(
      title: Padding(
        padding: const EdgeInsets.only(left: 220).w,
        child: Text(widget.additions?.addition ?? ''),
      ),

      value: false,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (value) {
        //new value
      },
    );
  }
}
