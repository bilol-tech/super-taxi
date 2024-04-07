import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Autorization/phoneNumber.dart';
import 'orderHistory.dart';


class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text("Adham Radjabov", style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 24.sp, color: const Color(0xff222222)),),
            ),
            accountEmail: Padding(
              padding: EdgeInsets.only(top: 25.sp, bottom: 5.sp),
              child: Text('+998 99 807-30-46', style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 16.sp, color: const Color(0xff222222)),),
            ),
            // currentAccountPicture: CircleAvatar(
            //   child: ClipOval(
            //     child: Image.asset(
            //       'assets/images/profileImage.jpg',
            //       fit: BoxFit.fill,
            //       width: 120.w,
            //       height: 110.h,
            //     ),
            //   ),
            // ),
            decoration: BoxDecoration(
                color: const Color(0xffE4E4E4),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.r),
                    bottomRight: Radius.circular(8.sp))),
          ),
          ListTile(
            leading: const Icon(
              Icons.history,
              color: Color(0xff222222),
            ),
            title: Text(
              "History",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                  color: const Color(0xff222222)),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => const OrderHistory()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.favorite,
              color: Color(0xff222222),
            ),
            title: Text(
              "Favorites",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                  color: const Color(0xff222222)),
            ),
            onTap: () {
             return;
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.folder,
              color: Color(0xff222222),
            ),
            title: Text(
              "Payment methods",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                  color: const Color(0xff222222)),
            ),
            onTap: () {
              return;
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.notifications_active,
              color: Color(0xff222222),
            ),
            title: Text(
              "Notifications",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                  color: const Color(0xff222222)),
            ),
            onTap: () {
              return;
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.help,
              color: Color(0xff222222),
            ),
            title: Text(
              "Help Center",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                  color: const Color(0xff222222)),
            ),
            onTap: () {
              return;
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Color(0xff222222),
            ),
            title: Text(
              "Setting",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                  color: const Color(0xff222222)),
            ),
            onTap: () {
              return;
            },
          ),
          ListTile(
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
    );
  }
}
