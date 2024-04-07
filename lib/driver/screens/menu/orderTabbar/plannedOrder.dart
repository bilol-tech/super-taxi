import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/newOrderModalSheet.dart';

class PlannedOrder extends StatefulWidget {
  const PlannedOrder({super.key});

  @override
  State<PlannedOrder> createState() => _PlannedOrderState();
}

void _showNewOrderDetails(BuildContext context) async {
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
      return const NewOrderDetails();
    },
  );
}

class _PlannedOrderState extends State<PlannedOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
              _showNewOrderDetails(context);
            },
            child: Column(
              children: [
                22.r.verticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 10.0),
                      child: Container(
                        width: 16.sp,
                        height: 16.sp,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xffC13D3D), width: 2),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("18 mavze, 25", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 20, color: const Color(0xff222222)),),
                        3.r.verticalSpace,
                        Text("Yunusabad", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 20, color: const Color(0xff222222).withOpacity(0.58)),),
                        8.r.verticalSpace,
                        Text("Comfort", style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 15, color: const Color(0xffF50000)),),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 1.0),
                          child: Container(
                            width: 55.w,
                            height: 49.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(4.sp)),
                                border: Border.all(color: const Color(0xff000000))
                            ),
                            child: Column(
                              children: [
                                2.r.verticalSpace,
                                Icon(Icons.access_time_outlined, color: const Color(0xff222222).withOpacity(0.58),),
                                2.r.verticalSpace,
                                Text("22:35", style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 12.sp, color: const Color(0xff000000)),)
                              ],
                            ),
                          ),
                        ),
                        10.r.verticalSpace,
                        Center(child: Text("25 000 so'm", style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 15.sp, color: const Color(0xff000000)),),),
                      ],
                    )
                  ],
                ),
                12.r.verticalSpace,
                const Divider(color: Color(0xffE4E4E4), thickness: 1.5,)
              ],
            ),
          );
        },
      ),
    );
  }
}
