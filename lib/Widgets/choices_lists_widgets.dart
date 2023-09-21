
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_degital_assignment_two/Data/order_model.dart';


class ListChoicesWidget extends StatefulWidget {
  const ListChoicesWidget({super.key, required this.isSize, required this.orderData,this.functionUpdate });

  final bool isSize;

  final OrderDataModel? orderData;
  final Function? functionUpdate;

  @override
  State<ListChoicesWidget> createState() => _ListChoicesWidgetState();
}

class _ListChoicesWidgetState extends State<ListChoicesWidget> {
   double? chooseSize ;
   double? additionsPrice=0;


  @override
  Widget build(BuildContext context) {
    return   ListView.builder(
      padding: EdgeInsets.all(10.h),
      itemCount: widget.isSize? widget.orderData?.sizes?.length ?? 0 : widget.orderData?.additions?.length ?? 0,
      shrinkWrap: true,
      physics:  const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(widget.isSize? widget.orderData?.sizes![index].size ?? "" : widget.orderData?.additions?[index].addition ?? ""),

              Row(
                textDirection: TextDirection.rtl,
                mainAxisSize: MainAxisSize.min,
                children: [
                   Text("${widget.isSize? (index !=0 ?widget.orderData?.sizes![index].sizePrice ?? "":"") : widget.orderData?.additions?[index].sizePrice ?? ""}"),
                  SizedBox(
                    width: 3.w,
                  ),
                 widget.isSize?
                     Radio(value:widget.orderData?.sizes?[index].sizePrice ?? 0 , groupValue:chooseSize ?? widget.orderData?.price, onChanged: (value) {
                       chooseSize = value!;

                       widget.orderData?.sizePrice = value;
                       widget.functionUpdate!();
                     //  print(widget.orderData?.sizePrice);

                     },)
                     : Checkbox(value:widget.orderData?.additions?[index].chosen ?? false , onChanged: (value) {


                           widget.orderData?.additions?[index].chosen = value!;

                           double x = widget.orderData?.additions?[index].sizePrice ?? 0;
                           //print("x is : ${x}");
                           if(value!){
                             additionsPrice = additionsPrice! + x;
                         //    print("true:${additionsPrice},,,, ${widget.orderData?.finalPriceAdditions}");
                           } else{
                             additionsPrice = additionsPrice! - x;

                           //  print("false:${additionsPrice},,,, ${widget.orderData?.finalPriceAdditions}");
                           }
                           widget.orderData?.finalPriceAdditions = additionsPrice;
                           widget.functionUpdate!();

                 },)
                ],
              )
            ],),
            Divider(
              height: 20,
              thickness: 3,
              indent: 20,
              endIndent: 0,
              color: Colors.grey.shade200,
            ),
          ],
        );
      },);
}
}
