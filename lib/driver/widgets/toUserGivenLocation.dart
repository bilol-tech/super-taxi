import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:map_launcher/map_launcher.dart';

class ToUserGivenLocationModalSheet extends StatefulWidget {
  const ToUserGivenLocationModalSheet({super.key});

  @override
  State<ToUserGivenLocationModalSheet> createState() => _ToUserGivenLocationModalSheetState();
}

class _ToUserGivenLocationModalSheetState extends State<ToUserGivenLocationModalSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
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
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
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
                    Text("24 mavze, 41", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 16, color: const Color(0xff222222)),),
                    3.r.verticalSpace,
                    Text("Chilonzor, Tashkent", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 12, color: const Color(0xff222222).withOpacity(0.58)),),
                  ],
                ),
              ],
            ),
          ),

          15.r.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 10.0),
                  child: Container(
                    width: 16.sp,
                    height: 16.sp,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xff222222), width: 2),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("MDIST", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 16, color: const Color(0xff222222)),),
                    3.r.verticalSpace,
                    Text("Bunyodkor Avenue 29", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 12, color: const Color(0xff222222).withOpacity(0.58)),),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text("Business", style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 15.sp, color: const Color(0xffF50000)),),
                    3.r.verticalSpace,
                    Text("55 000 so’m", style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 15.sp, color: const Color(0xff222222)),)
                  ],
                ),
              ],
            ),
          ),

          const Spacer(),
          InkWell(
            onTap: () => openMapsSheet(context),
            child: Container(
              height: 50.h,
              width: 300.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.r)),
                  color: const Color(0xff222222)
              ),
              child: Center(child: Text("Navigate", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 16.sp, color: const Color(0xffFFFFFF)),),),
            ),
          ),
        ],
      ),
    );
  }

  openMapsSheet(context) async {
    try {
      final startCoords = Coords(41.2868463, 69.1738413); // Start location coordinates
      final endCoords =
      Coords(41.2694159,69.2006197);
      const endLocationTitle = "To'xtash joyi";
      const startLocationTitle = "Boshlash joyi";
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15, top: 10),
                    child: Text(
                      "Open with:",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff222222),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Wrap(
                    children: <Widget>[
                      for (var map in availableMaps)
                        ListTile(
                          onTap: () => map.showDirections(
                              destination: endCoords,
                              destinationTitle: endLocationTitle,
                              origin: startCoords,
                              originTitle: startLocationTitle),
                          title: Text(map.mapName),
                          leading: SvgPicture.asset(
                            map.icon,
                            height: 30.0,
                            width: 30.0,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

}
