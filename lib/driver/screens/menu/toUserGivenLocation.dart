import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:slidable_button/slidable_button.dart';
import 'package:suppertaxi/Autorization/phoneNumber.dart';
import 'package:suppertaxi/driver/widgets/paymentMethodAfterFinish.dart';
import 'package:suppertaxi/driver/widgets/toUserGivenLocation.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'dart:math';

import '../../widgets/driveToUserOrderDetails.dart';
import '../../widgets/newOrderModalSheet.dart';
import '../drawer/drawerDriver.dart';

class ToUserGivenLocation extends StatefulWidget {
  const ToUserGivenLocation({super.key});

  @override
  State<ToUserGivenLocation> createState() => _ToUserGivenLocationState();
}

final List<MapObject> mapObjects = [];
const MapObjectId placemarkId = MapObjectId('normal_icon_placemark');
final GlobalKey<ScaffoldState> _toUserGivenLocationScaffoldKey = GlobalKey<ScaffoldState>();
bool isMovedRight = false;
String result = "Let's slide!";
SlidableButtonPosition currentPosition = SlidableButtonPosition.start;

void _showToUserGivenLocation(BuildContext context) async {
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
      return const ToUserGivenLocationModalSheet();
    },
  );
}

class _ToUserGivenLocationState extends State<ToUserGivenLocation> {
  YandexMapController? controller;

  bool shouldChangeContent = false;

  @override
  void initState() {
    super.initState();

    // Start a timer to change the content after 20 seconds
    Timer(const Duration(seconds: 20), () {
      setState(() {
        shouldChangeContent = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Color containerColor = currentPosition == SlidableButtonPosition.end
        ? const Color(0xff489D2C)
        .withOpacity(0.50) // Change the color to green when at the end
        : const Color(0xff222222);
    return Scaffold(
      drawer: const DrawerDriver(),
      key: _toUserGivenLocationScaffoldKey,
      body: Stack(
        children: [
          YandexMap(
            tiltGesturesEnabled: true,
            zoomGesturesEnabled: true,
            rotateGesturesEnabled: true,
            scrollGesturesEnabled: true,
            modelsEnabled: true,
            nightModeEnabled: false,
            indoorEnabled: false,
            liteModeEnabled: false,
            mapObjects: mapObjects,
            onMapTap: (Point point) {
              marker(
                  latitude: point.latitude.toDouble(),
                  longitude: point.longitude.toDouble());
            },
            onMapCreated: (YandexMapController yandexMapController) async {
              controller = yandexMapController;
              final cameraPosition = await controller?.getCameraPosition().then(
                    (value) async {
                  await controller?.moveCamera(CameraUpdate.newCameraPosition(
                      const CameraPosition(
                          target: Point(
                              latitude: 41.2805975, longitude: 69.1844731),
                          zoom: 16.6)));
                },
              );
            },
          ),
          Positioned(
            top: 70,
            left: 15,
            child: InkWell(
              onTap: () => _toUserGivenLocationScaffoldKey.currentState?.openDrawer(),
              highlightColor: Colors.blue.withOpacity(0.4),
              splashColor: Colors.green.withOpacity(0.5),
              borderRadius: BorderRadius.circular(30),
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4.r)),
                  border: Border.all(color: const Color(0xffE4E4E4)),
                  color: const Color(0xffFFFFFF),
                ),
                child: const Center(
                  child: Icon(
                    Icons.menu,
                    color: Color(0xff222222),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 155,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.sp)),
                color: const Color(0xffFFFFFF),
                border: Border.all(color: const Color(0xffE4E4E4)),
              ),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 11.0, vertical: 8.0),
                child: Text(
                  "Orders",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      color: const Color(0xff222222)),
                ),
              ),
            ),
          ),
          Positioned(
            top: 70,
            right: 15,
            child: InkWell(
              onTap: () {
                // Handle notification button tap
              },
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4.r)),
                  border: Border.all(color: const Color(0xffE4E4E4)),
                  color: const Color(0xffFFFFFF),
                ),
                child: const Center(
                  child: Icon(
                    Icons.notifications_active,
                    color: Color(0xff222222),
                  ),
                ),
              ),
            ),
          ),
          shouldChangeContent
              ? Positioned(
            bottom: 25,
            left: 50,
            child: Center(
              child: HorizontalSlidableButton(
                width: 300.w,
                height: 50.h,
                buttonWidth: 50.0.w,
                color: containerColor,
                buttonColor: const Color(0xff489D2C),
                dismissible: false,
                label: currentPosition == SlidableButtonPosition.end
                    ? const Center(
                    child:
                    Icon(Icons.check, color: Color(0xffFFFFFF)))
                    : const Center(
                    child: Icon(Icons.arrow_forward,
                        color: Color(0xffFFFFFF))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 120.0),
                        child: Text(
                          "Finish",
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
                  if (position == SlidableButtonPosition.end) {
                    // Open a modal bottom sheet here
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
                        return const PaymentMethodAfterFinish();
                      },
                    );
                  }
                },
              ),
            ),
          )
              : Positioned(
            bottom: 25,
            left: 50,
            child: InkWell(
              onTap: () {
                _showToUserGivenLocation(context);
              },
              child: Container(
                height: 50.h,
                width: 300.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.r)),
                  color: const Color(0xff222222),
                ),
                child: Center(
                  child: Text(
                    "Navigate",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: const Color(0xffFFFFFF)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  marker({latitude, longitude}) {
    if (mapObjects.isEmpty) {
      if (mapObjects.any((element) => element.mapId == placemarkId)) {
        return;
      }

      final placemark = Placemark(
        mapId: placemarkId,
        point: Point(latitude: latitude, longitude: longitude),
        onTap: (Placemark self, Point point) {
          print('Tapped me at $point');
        },
        direction: 0,
        opacity: 1,
        isDraggable: true,
        onDragStart: (_) => print('Drag start'),
        onDrag: (_, Point point) => print('Drag at point $point'),
        onDragEnd: (_) => print('Drag end'),
        icon: PlacemarkIcon.single(PlacemarkIconStyle(
            scale: 2.4,
            image: BitmapDescriptor.fromAssetImage(
                'assets/images/placeholder.png'),
            rotationType: RotationType.noRotation)),
      );

      setState(() {
        mapObjects.add(placemark);
      });
    } else if (mapObjects.isNotEmpty) {
      if (!mapObjects.any((element) => element.mapId == placemarkId)) {
        return;
      }

      final placemarkUpdate =
      mapObjects.firstWhere((el) => el.mapId == placemarkId) as Placemark;
      setState(() {
        mapObjects[mapObjects.indexOf(placemarkUpdate)] =
            placemarkUpdate.copyWith(
              point: Point(latitude: latitude, longitude: longitude),
            );
      });
    }
  }
}
