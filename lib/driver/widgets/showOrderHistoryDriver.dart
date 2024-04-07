import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class ShowOrderHistoryDriver extends StatefulWidget {
  const ShowOrderHistoryDriver({super.key});

  @override
  State<ShowOrderHistoryDriver> createState() => _ShowOrderHistoryDriverState();
}

final List<MapObject> mapObjects = [];
List<Placemark> placemarks = [];
late YandexMapController controller;


String telegramUrl = 'https://t.me/Bilol0004';


class _ShowOrderHistoryDriverState extends State<ShowOrderHistoryDriver> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 730.h, // Adjust the height as needed
      padding: const EdgeInsets.only(left: 00, right: 00, bottom: 20),
      child: Column(
        children: [
          Center(
            child: Container(
                width: 40.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child:
                const Divider(color: Color(0xffD9D9D9), thickness: 3)),
          ),
          7.r.verticalSpace,
          SizedBox(
            height: 240.h,
            child: YandexMap(
              tiltGesturesEnabled: true,
              zoomGesturesEnabled: true,
              rotateGesturesEnabled: true,
              scrollGesturesEnabled: true,
              modelsEnabled: true,
              nightModeEnabled: false,
              indoorEnabled: false,
              liteModeEnabled: false,
              mapObjects: mapObjects,
              onMapCreated: (YandexMapController yandexMapController) async {
                controller = yandexMapController;
                final cameraPosition =
                await controller.getCameraPosition().then(
                      (value) async {
                    await controller.moveCamera(CameraUpdate.newCameraPosition(
                        const CameraPosition(
                            target: Point(
                                latitude: 41.3086101, longitude: 69.2365063),
                            zoom: 11.0)));
                  },
                );
              },
            ),
          ),
          10.r.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("08.06.2023", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 25.sp, color: const Color(0xff222222)),),
              Text("13:55", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 25.sp, color: const Color(0xff222222)),),
            ],
          ),
          5.r.verticalSpace,
          const Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: Divider(color: Color(0xffE4E4E4), thickness: 1.5,),
          ),
          10.r.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(left: 55.0),
            child: Row(
              children: [
                Container(
                  width: 16.w,
                  height: 16.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xffffffff),
                      border: Border.all(color: const Color(0xffC13D3D), width: 2.5)
                  ),
                ),
                SizedBox(width: 10.w,),
                Text("Askiya Street, 3", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 15.sp, color: const Color(0xff222222)),),
              ],
            ),
          ),
          10.r.verticalSpace,
          const Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: Divider(color: Color(0xffE4E4E4), thickness: 1.5,),
          ),
          10.r.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(left: 55.0),
            child: Row(
              children: [
                Container(
                  width: 16.w,
                  height: 16.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xffffffff),
                      border: Border.all(color: const Color(0xff222222), width: 2.5)
                  ),
                ),
                SizedBox(width: 10.w,),
                Text("Khushnavo street, 28", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 15.sp, color: const Color(0xff222222)),),
              ],
            ),
          ),
          20.r.verticalSpace,
          const Divider(color: Color(0xffE4E4E4), thickness: 17.0,),
          13.r.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Total", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 15.sp, color: const Color(0xff222222)),),
              Text("22,000 sum", style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 15.sp, color: const Color(0xff222222)),),
            ],
          ),
          6.r.verticalSpace,
          const Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: Divider(color: Color(0xffE4E4E4), thickness: 1.5,),
          ),

          6.r.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 67),
            child: Row(
              children: [
                Text("Cash", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 15.sp, color: const Color(0xff222222)),),
                const Spacer(),
                Image.asset("assets/images/moneyIcon.png")
              ],
            ),
          ),
          18.r.verticalSpace,
          const Divider(color: Color(0xffE4E4E4), thickness: 17.0,),

          13.r.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Driver", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 15.sp, color: const Color(0xff222222)),),
                Text("Shodibekov Asror", style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 15.sp, color: const Color(0xff222222)),),
              ],
            ),
          ),
          6.r.verticalSpace,
          const Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: Divider(color: Color(0xffE4E4E4), thickness: 1.5,),
          ),

          13.r.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Vehicle", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 15.sp, color: const Color(0xff222222)),),
              Text("white Chevrolet Spark 10T729WA", style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 15.sp, color: const Color(0xff222222)),),
            ],
          ),
          12.r.verticalSpace,
          const Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: Divider(color: Color(0xffE4E4E4), thickness: 1.5,),
          ),
          11.r.verticalSpace,
          InkWell(
              borderRadius: BorderRadius.circular(5),
              highlightColor: Colors.blue.withOpacity(0.4),
              splashColor: Colors.green.withOpacity(0.5),
              onTap: () async {
                try {
                  if (await canLaunch(telegramUrl)) {
                    await launch(telegramUrl);
                  } else {
                    throw 'Could not launch $telegramUrl';
                  }
                } catch (e) {
                  print('Error: $e');
                }
              },child: Text("Help Center with order", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 15.sp, color: const Color(0xff3166EE)),)),
        ],
      ),
    );
  }
}
