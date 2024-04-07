import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suppertaxi/driver/screens/drawer/orderHistoryDriver.dart';
import 'package:suppertaxi/driver/screens/drawer/paymentMethodDriver.dart';
import 'package:suppertaxi/driver/screens/drawer/tariffs.dart';

import '../../../Autorization/phoneNumber.dart';

class DrawerDriver extends StatelessWidget {
  const DrawerDriver({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Drawer(
          child: ListView(
            // Remove padding
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Padding(
                  padding: const EdgeInsets.only(left: 25.0, top: 0),
                  child: Text(
                    "",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 24.sp,
                        color: const Color(0xff222222)),
                  ),
                ),
                accountEmail: Padding(
                  padding: EdgeInsets.only(top: 0.sp, bottom: 5.sp),
                  child: Text(
                    'Bilol Abdunazarov',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 24.sp,
                        color: const Color(0xff222222)),
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/myImage.jpeg',
                      fit: BoxFit.cover,
                      // height: 200.h,
                      // width: 200.w,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: const Color(0xffE4E4E4),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.r),
                        bottomRight: Radius.circular(8.sp))),
              ),
              15.r.verticalSpace,
              ListTile(
                tileColor: const Color(0xffE4E4E4),
                leading: const Icon(
                  Icons.account_balance_wallet,
                  color: Color(0xff222222),
                ),
                title: Row(
                  children: [
                    Text(
                      "Balance",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                          color: const Color(0xff222222)),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Text(
                        "50 000 sum",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: const Color(0xff222222)),
                      ),
                    ),
                  ],
                ),
                contentPadding: const EdgeInsets.only(left: 16.0),
                minLeadingWidth: 0,
                // minVerticalPadding: 0,
                onTap: () {
                  // Navigator.oxf(context).push(MaterialPageRoute(builder: (_) => const OrderHistory()));
                },
              ),
              15.r.verticalSpace,
              Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Image.asset("assets/images/moneyIcon.png"),
                  ),
                  title: Text(
                    "Payment Method",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        color: const Color(0xff222222)),
                  ),
                  minLeadingWidth: 0,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PaymentMethodDriver()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: ListTile(
                  leading: const Icon(Icons.save, color: Color(0xff222222), size: 33,),
                  title: Text(
                    "Tariff",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        color: const Color(0xff222222)),
                  ),
                  minLeadingWidth: 0,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Tariffs()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: ListTile(
                  leading: const Icon(Icons.history, size: 33.0, color: Color(0xff222222),),
                  title: Text(
                    "Order history",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        color: const Color(0xff222222)),
                  ),
                  minLeadingWidth: 0,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const OrderHistoryDriver()));
                  },
                ),
              ),
              255.r.verticalSpace,
              ListTile(
                tileColor: const Color(0xffE4E4E4),
                leading: const Icon(
                  Icons.output_rounded,
                  color: Color(0xffC94F59),
                ),
                title: Text(
                  "Sign out",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      color: const Color(0xffC94F59)),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) => const PhoneNumber(),
                  )).then((_) {
                    // Remove all routes from the stack except PhoneNumber
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  });
                },
              ),
            ],
          ),
        ),
        Positioned(
          top: 85,
          left: 113,
          child: Text(
            "Chevrolet Onix",
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 17.sp,
                color: const Color(0xff222222)),
          ),
        ),
        Positioned(
          top: 113,
          left: 110,
          child: Container(
            width: 127.w,
            height: 28.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.all(
                    Radius.circular(
                        8.r)),
                border: Border.all(
                    color: const Color(
                        0xff000000))),
            child: Padding(
              padding:
              const EdgeInsets.only(
                  left: 8),
              child: Row(
                children: [
                  Text(
                    "01 A123AB",
                    style: GoogleFonts
                        .poppins(
                        fontSize:
                        18.sp,
                        fontWeight:
                        FontWeight
                            .w500,
                        color: Colors
                            .black),
                  ),
                  SizedBox(
                    width: 11.w,
                  ),
                  Image.asset(
                      "assets/images/uzb.png"),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
