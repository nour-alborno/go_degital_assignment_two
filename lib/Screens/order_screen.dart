import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_degital_assignment_two/Data/order_data.dart';
import 'package:go_degital_assignment_two/Data/order_model.dart';

import 'package:go_degital_assignment_two/Widgets/choices_lists_widgets.dart';
import 'package:go_degital_assignment_two/Widgets/title_widget.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  OrderDataModel? orderDataModel = OrderDataModel(orderData);

   int ordersNum = 1;

   double? orderPrice ;


  @override
  Widget build(BuildContext context) {

    updateScreen(){
      setState(() {});
    }

    return Scaffold(
      body: Stack(
        children: [
       Positioned(
         top: 0,
         right: 0,
         left: 0,
         bottom: 70.h,

         child: ListView(

           children: [
             Container(
               height: 200.h,
               clipBehavior: Clip.antiAliasWithSaveLayer,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.r)),
                   boxShadow: const [
                     BoxShadow(color: Colors.grey,blurRadius: 6,offset: Offset(0,0))
                   ]
               ),
               child: Image.network(orderDataModel?.image ?? "",width: double.infinity,fit: BoxFit.cover,),
             ),

             SizedBox(
               height: 10.h,
             ),

             Padding(
               padding: EdgeInsets.only(top: 10.h,left: 10.w,right: 10.w),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.end,
                 children: [
                   Text(orderDataModel?.title_one ?? "", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp),),
                   Text(orderDataModel?.title_two ?? "", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.sp,color: Colors.grey),),

                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Container(
                         decoration: BoxDecoration(
                             border: Border.all(color: Colors.grey.shade300,width: 2),
                             color: Colors.white
                         ) ,
                         child: SizedBox(
                           height: 40.h,
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [

                               IconButton(onPressed: () {
                                 ordersNum == 10 ? ordersNum : ordersNum++;

                                 setState(() {});
                               }, icon:const Icon( Icons.add,size: 15,color: Colors.blue,)),

                               Text(ordersNum.toString()),


                               IconButton(onPressed: () {
                                     ordersNum == 1 ? ordersNum : ordersNum --;
                                     setState(() {});
                               }, icon:Icon(Icons.remove,size: 20.h,color: Colors.blue,))
                             ],
                           ),
                         ),
                       ),
                       Text(" ${orderDataModel?.price ?? ""} د.أ",style: const TextStyle(fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),

                     ],
                   ),
                 ],
               ),
             ),

             SizedBox(
               height: 10.h,
             ),

             Divider(
               height: 20,
               thickness: 5,
               color: Colors.grey.shade200,
             ),

             SizedBox(
               height: 10.h,
             ),

             const TitleWidget('إختيارك من الحجم ', '(إختياري)'),

             Text("اختر من القائمة", style: TextStyle(color: Colors.grey,fontSize: 10.sp),textDirection: TextDirection.rtl),

             ListChoicesWidget(isSize: true,orderData: orderDataModel, functionUpdate: updateScreen),

             SizedBox(height: 5.h,),
             Divider(
               height: 20,
               thickness: 5,
               color: Colors.grey.shade200,
             ),

             SizedBox(
               height: 10.h,
             ),

             const TitleWidget('إختيارك من الإضافات ', '(إختياري)'),

             Text("اختر من القائمة", style: TextStyle(color: Colors.grey,fontSize: 10.sp),textDirection: TextDirection.rtl,),

             ListChoicesWidget(isSize: false, orderData: orderDataModel, functionUpdate: updateScreen),
           ],
         ),
       ),

          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 80.h,
              padding: EdgeInsets.all(20.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(left: Radius.circular(15.r), right: Radius.circular(15.r) ),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade300,blurRadius: 5,offset: const Offset(0, -2))
                ],
                color: Colors.white
              ),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyanAccent,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r), // Border radius
                    ),

                  ),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text("  ${(orderDataModel?.sizePrice ?? 0) * ordersNum.toDouble() + (orderDataModel?.finalPriceAdditions ?? 0)}  د.أ", textDirection: TextDirection.rtl,),
                    const Text("إضافة إلى السلة",)
                  ],))
            ),
          )
        ],
      )
    );
  }


}
