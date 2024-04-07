import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suppertaxi/driver/widgets/showOrderHistoryDriver.dart';


class OrderHistoryDriver extends StatelessWidget {
  const OrderHistoryDriver({super.key});

  void _showOrderHistoryDriver(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return const ShowOrderHistoryDriver();
      },
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        elevation: 0.1,
        leading: Padding(
          padding: const EdgeInsets.only(left: 38.0),
          child: InkWell(onTap: (){
            Navigator.pop(context);
          },child: Icon(Icons.arrow_back_ios, size: 22.r, color: const Color(0xff222222),)),
        ),
        title: Text("Order History", style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 20.sp, color: const Color(0xff222222)),),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(19.sp),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                borderRadius: BorderRadius.circular(5),
                highlightColor: Colors.blue.withOpacity(0.4),
                splashColor: Colors.green.withOpacity(0.5),
                onTap: (){
                  _showOrderHistoryDriver(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("16,000 sum, cash", style: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w400, color: const Color(0xff222222)),),
                          const Spacer(),
                          Text("Today", style: GoogleFonts.inter(fontSize: 12.sp, fontWeight: FontWeight.w400, color: const Color(0xff222222)),),
                        ],
                      ),
                      5.r.verticalSpace,
                      Row(
                        children: [
                          Column(
                            children: [
                              Text("Hushnavo, 30, Yunusabad District, Tashkent", style: GoogleFonts.inter(fontSize: 10.sp, fontWeight: FontWeight.w400, color: const Color(0xff222222).withOpacity(0.58)),),
                              3.r.verticalSpace,
                              Text("Temur Maklik, 11A, Mirzo Ulugbek, Tashkent", style: GoogleFonts.inter(fontSize: 10.sp, fontWeight: FontWeight.w400, color: const Color(0xff222222).withOpacity(0.58)),),
                            ],
                          ),
                          const Spacer(),
                          Text("13:35", style: GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w400, color: const Color(0xff222222)),),
                        ],
                      ),
                      10.r.verticalSpace,
                      const Divider(color: Color(0xffE4E4E4), thickness: 1.5,)
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
