import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slidable_button/slidable_button.dart';
import 'package:suppertaxi/driver/screens/menu/driveToUser.dart';

class NewOrderDetails extends StatefulWidget {
  const NewOrderDetails({super.key});

  @override
  State<NewOrderDetails> createState() => _NewOrderDetailsState();
}

bool isMovedRight = false;
String result = "Let's slide!";
SlidableButtonPosition currentPosition = SlidableButtonPosition.start;

class _NewOrderDetailsState extends State<NewOrderDetails> {

  @override
  Widget build(BuildContext context) {
    Color containerColor =
    currentPosition == SlidableButtonPosition.end
        ? const Color(0xff489D2C).withOpacity(0.50) // Change the color to green when at the end
        : const Color(0xff222222);
    return Container(
      height: 320.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
                width: 40.w,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                child: const Divider(color: Color(0xffD9D9D9), thickness: 3)),
          ),
          15.r.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("22:35", style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 25.sp, color: const Color(0xff222222)),),
                Text("Comfort", style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 15.sp, color: const Color(0xffF50000)),),
                Container(
                  width: 60.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4.sp)),
                    border: Border.all(color: const Color(0xff000000))
                  ),
                  child: Center(child: Text("3 km", style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 15.sp, color: const Color(0xff222222)),),),
                ),
              ],
            ),
          ),
          10.r.verticalSpace,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.0),
            child: Divider(color: Color(0xff4E4E4E),),
          ),
          8.r.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(left: 33.3),
            child: Text("18 mavze, 25, Yunusobod tumani", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 18.sp, color: const Color(0xff222222)),),
          ),
          30.r.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(left: 33.3),
            child: Text("With air conditioning", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 18.sp, color: const Color(0xff222222)),),
          ),
          20.r.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(left: 33.3),
            child: Row(
              children: [
                Image.asset("assets/images/moneyIcon.png"),
                8.r.horizontalSpace,
                Text("25 000 so’m", style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 25.sp, color: const Color(0xff222222)),)
              ],
            ),
          ),


          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.5),
            child: Center(
              child: HorizontalSlidableButton(
                width: 300.w,
                height: 50.h,
                buttonWidth: 50.0.w,
                color: containerColor,
                buttonColor: const Color(0xff489D2C),
                dismissible: true,
                label: currentPosition == SlidableButtonPosition.end
                    ? const Center(
                        child: Icon(Icons.check, color: Color(0xffFFFFFF)))
                    : const Center(
                        child:
                            Icon(Icons.arrow_forward, color: Color(0xffFFFFFF))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 120.0),
                        child: Text(
                          "Accept",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              color: Colors.white),
                        ),
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.check, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                onChanged: (position) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DriveToUser()));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}