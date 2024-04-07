import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:map_launcher/map_launcher.dart';

class PaymentMethodAfterFinish extends StatefulWidget {
  const PaymentMethodAfterFinish({super.key});

  @override
  State<PaymentMethodAfterFinish> createState() =>
      _PaymentMethodAfterFinishState();
}

class _PaymentMethodAfterFinishState extends State<PaymentMethodAfterFinish> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230.h,
      padding: const EdgeInsets.only(left: 00, right: 00, bottom: 20),
      child: Column(
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                const Icon(
                  Icons.credit_card_outlined,
                  size: 44,
                  color: Color(0xff222222),
                ),
                15.r.horizontalSpace,
                Text(
                  "Paid by card",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: const Color(0xff222222)),
                )
              ],
            ),
          ),
          5.r.verticalSpace,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: Divider(
              color: Color(0xffE4E4E4),
              thickness: 1.5,
            ),
          ),
          8.r.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21.0),
            child: Row(
              children: [
                Container(
                    width: 42,
                    child: Image.asset(
                      "assets/images/moneyIcon.png",
                      fit: BoxFit.cover,
                    )),
                15.r.horizontalSpace,
                Text(
                  "Fare is 45 000 sums",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: const Color(0xff222222)),
                )
              ],
            ),
          ),
          const Spacer(),
          Container(
            height: 50.h,
            width: 360.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.r)),
              color: const Color(0xff222222),
            ),
            child: Center(child: Text("Next", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 16.sp, color: const Color(0xffFFFFFF)),),),
          )
        ],
      ),
    );
  }
}
