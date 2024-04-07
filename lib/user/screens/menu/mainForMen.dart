import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:suppertaxi/user/widgets/searchModalSheet.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../widgets/optionsSetting.dart';
import '../../widgets/paymentMethodsModalSheet.dart';
import '../drawer/drawer.dart';
// import 'package:js/js.dart';

class MainPageMen extends StatefulWidget {
  const MainPageMen({Key? key}) : super(key: key);

  @override
  _MainPageMenState createState() => _MainPageMenState();
}

class _MainPageMenState extends State<MainPageMen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late YandexMapController controller;
  final List<MapObject> mapObjects = [];
  final MapObjectId placemarkId = const MapObjectId('normal_icon_placemark');

  AssetImage _currentImage = const AssetImage('assets/images/womenMode.png');
  bool _isPinkBackground = false;
  bool _isPinkImage = false;
  bool _isBorderChange = false;
  final Color _borderColor = const Color(0xffFFFFFF);
  final Color _pinkBackground = const Color(0xffEC5EF1);
  IconData? selectedIcon;
  bool isReadOnly = true;
  
  TextEditingController whereToController = TextEditingController();
  TextEditingController fromWhereController = TextEditingController();


  void _toggleImageAndColor() {
    setState(() {
      if (_currentImage == const AssetImage('assets/images/womenMode.png')) {
        _currentImage = const AssetImage('assets/images/menMode.png');
        _isPinkBackground = !_isPinkBackground;
        _isPinkImage = !_isPinkImage;
        _isBorderChange = !_isBorderChange;
      } else {
        _currentImage = const AssetImage('assets/images/womenMode.png');
        _isPinkBackground = !_isPinkBackground;
        _isPinkImage = !_isPinkImage;
        _isBorderChange = !_isBorderChange;
      }
    });
  }

  void _showPaymentMethods(BuildContext context) async {
    final selectedMethod = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return const PaymentMethodsBottomSheet();
      },
    );

    // Debugging: Print the selected method
    print("Selected method: $selectedMethod");

    // Update the icon based on the selected payment method
    setState(() {
      if (selectedMethod == 'Card') {
        selectedIcon =
            Icons.credit_card; // Set the selectedIcon to the card icon
      } else if (selectedMethod == 'Cash') {
        selectedIcon = Icons.attach_money;
      }
    });
  }

  void __showOptionsSetting(BuildContext context) async {
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
        return const OptionsSetting();
      },
    );
  }

  void _showSearchSheet(BuildContext context) async {
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
        return const SearchModalSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const SideDrawer(),
      key: _scaffoldKey,
      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 20,
        snapSpec: const SnapSpec(
          // Enable snapping. This is true by default.
          snap: true,
          // Set custom snapping points.
          snappings: [0.38, 0.7, 1.0],
          // Define to what the snappings relate to. In this case,
          // the total available space that the sheet can expand to.
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        color: _isPinkBackground ? const Color(0xffF3ADF8) : Colors.white,
        // The body widget will be displayed under the SlidingSheet
        // and a parallax effect can be applied to it.
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
                final cameraPosition =
                    await controller.getCameraPosition().then(
                  (value) async {
                    await controller.moveCamera(CameraUpdate.newCameraPosition(
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
              left: 20,
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.r)),
                    color: const Color(0xffFFFFFF),
                    border: Border.all(
                        color:
                            _isPinkBackground ? _pinkBackground : Colors.grey)),
                child: Center(
                  child: InkWell(
                    onTap: () => _scaffoldKey.currentState?.openDrawer(),
                    highlightColor: Colors.blue.withOpacity(0.4),
                    splashColor: Colors.green.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(30),
                    child: Icon(
                      Icons.menu,
                      size: 30.sp,
                      color: _isPinkBackground
                          ? _pinkBackground
                          : const Color(0xff222222),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                right: 20,
                top: 70,
                child: SizedBox(
                    width: 45.w,
                    height: 46.h,
                    child: InkWell(
                        highlightColor: Colors.blue.withOpacity(0.4),
                        splashColor: Colors.green.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {
                          // Call a function to toggle the image and background color
                          _toggleImageAndColor();
                        },
                        child: Image(
                          image: _currentImage,
                        )))),
            Positioned(
              bottom: 323,
              right: 10,
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.r)),
                    color: const Color(0xffFFFFFF),
                    border: Border.all(
                        color: _isPinkBackground
                            ? _pinkBackground
                            : const Color(0xffE4E4E4))),
                child: Center(
                    child: _isPinkImage
                        ? Image.asset("assets/images/naviPink.png")
                        : Image.asset("assets/images/naviIcon.png")),
              ),
            ),
          ],
        ),
        // backdropColor: _isPinkBackground ? const Color(0xffEC5EF1) : const Color(0xffFFFFFF),
        builder: (context, state) {
          // This is the content of the sheet that will get
          // scrolled, if the content is bigger than the available
          // height of the sheet.
          return Container(
            margin: const EdgeInsets.only(left: 25, top: 0, right: 25),
            height: 310,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                      width: 40.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: const Divider(
                          color: Color(0xffD9D9D9), thickness: 3)),
                ),
                5.r.verticalSpace,
                InkWell(
                  onTap: (){
                    _showSearchSheet(context);
                  },
                  child: Container(
                    height: 50.h,
                    padding: EdgeInsets.all(10.0.sp),
                    decoration: BoxDecoration(
                      color: _isPinkBackground
                          ? _pinkBackground
                          : const Color(0xffE4E4E4),
                      border: Border.all(
                          color: _isBorderChange
                              ? _borderColor
                              : const Color(0xffE4E4E4)),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: <Widget>[
                        const Icon(Icons.location_on_rounded),
                        // Replace with your desired icon
                        VerticalDivider(
                          color: const Color(0xff222222).withOpacity(0.58),
                          // Customize divider color
                          thickness: 1.0,
                          // Customize divider thickness
                          width: 20.0, // Customize divider width
                          // endIndent: 20.0, // Customize space after the divider
                        ),
                        Expanded(
                          child: AbsorbPointer(
                            absorbing: isReadOnly,
                            child: TextFormField(
                              readOnly: true,
                              controller: fromWhereController,
                              decoration: InputDecoration(
                                hintText: 'From where?', // Customize hint text
                                hintStyle: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                    color:
                                        const Color(0xff222222).withOpacity(0.58)),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                10.r.verticalSpace,
                InkWell(
                  onTap: (){
                    _showSearchSheet(context);
                  },
                  child: Container(
                    height: 50.h,
                    padding: EdgeInsets.all(10.0.sp),
                    decoration: BoxDecoration(
                      color: _isPinkBackground
                          ? _pinkBackground
                          : const Color(0xffE4E4E4),
                      border: Border.all(
                          color: _isBorderChange
                              ? _borderColor
                              : const Color(0xffE4E4E4)),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: <Widget>[
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xff222222),
                        ),
                        // Replace with your desired icon
                        VerticalDivider(
                          color: const Color(0xff222222).withOpacity(0.58),
                          // Customize divider color
                          thickness: 1.0,
                          // Customize divider thickness
                          width: 20.0, // Customize divider width
                          // endIndent: 20.0, // Customize space after the divider
                        ),
                        Expanded(
                          child: AbsorbPointer(
                            absorbing: isReadOnly,
                            child: TextFormField(
                              controller: whereToController,
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: 'Where to?', // Customize hint text
                                hintStyle: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                    color:
                                        const Color(0xff222222).withOpacity(0.58)),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                12.r.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      highlightColor: Colors.blue.withOpacity(0.4),
                      splashColor: Colors.green.withOpacity(0.5),
                      onTap: () {
                        return;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          color: _isPinkBackground
                              ? _pinkBackground
                              : const Color(0xffE4E4E4),
                          border: Border.all(
                              color: _isBorderChange
                                  ? _borderColor
                                  : const Color(0xffE4E4E4)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 18.0, bottom: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/images/caricon.png"),
                              Text(
                                "Econom",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10.sp,
                                    color: const Color(0xff222222)),
                              ),
                              2.r.verticalSpace,
                              Text(
                                "From 6,000 sum",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10.sp,
                                    color: const Color(0xff222222)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      highlightColor: Colors.blue.withOpacity(0.4),
                      splashColor: Colors.green.withOpacity(0.5),
                      onTap: () {
                        return;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          color: Colors.transparent,
                          border: Border.all(
                              color: _isPinkBackground
                                  ? _pinkBackground
                                  : const Color(0xffE4E4E4)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 18.0, bottom: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/images/caricon.png"),
                              Text(
                                "Comfort",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10.sp,
                                    color: const Color(0xff222222)),
                              ),
                              2.r.verticalSpace,
                              Text(
                                "From 9,000 sum",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10.sp,
                                    color: const Color(0xff222222)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      highlightColor: Colors.blue.withOpacity(0.4),
                      splashColor: Colors.green.withOpacity(0.5),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          color: Colors.transparent,
                          border: Border.all(
                              color: _isPinkBackground
                                  ? _pinkBackground
                                  : const Color(0xffE4E4E4)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 18.0, bottom: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/images/caricon.png"),
                              Text(
                                "Business",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10.sp,
                                    color: const Color(0xff222222)),
                              ),
                              2.r.verticalSpace,
                              Text(
                                "From 15,000 sum",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10.sp,
                                    color: const Color(0xff222222)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                15.r.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        _showPaymentMethods(context);
                      },
                      child: Container(
                          width: 45.w,
                          height: 55.h,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.r)),
                              border: Border.all(
                                  color: _isPinkBackground
                                      ? _pinkBackground
                                      : const Color(0xffE4E4E4))),
                          // child: _isPinkImage ? Image.asset("assets/images/moneyPink.png") : Image.asset("assets/images/moneyIcon.png"),
                          child: selectedIcon == null
                              ? _isPinkImage
                                  ? Image.asset("assets/images/moneyPink.png")
                                  : Image.asset("assets/images/moneyIcon.png")
                              : Center(
                                  child: Icon(
                                    selectedIcon,
                                    size: 35,
                                    color: _isPinkBackground
                                        ? _pinkBackground
                                        : const Color(0xff222222),
                                  ),
                                )),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      highlightColor: Colors.blue.withOpacity(0.4),
                      splashColor: Colors.green.withOpacity(0.5),
                      child: Container(
                        height: 55.h,
                        width: 230.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.r)),
                          color: _isPinkBackground
                              ? _pinkBackground
                              : const Color(0xff222222),
                        ),
                        child: Center(
                          child: Text(
                            "Request",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 17.sp,
                                color: const Color(0xffFFFFFF)),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        __showOptionsSetting(context);
;                      },
                      child: Container(
                        width: 45.w,
                        height: 55.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.r)),
                            border: Border.all(
                                color: _isPinkBackground
                                    ? _pinkBackground
                                    : const Color(0xffE4E4E4))),
                        child: _isPinkImage
                            ? Image.asset("assets/images/settingPink.png")
                            : Image.asset("assets/images/settingIcon.png"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.location_on),
      //   backgroundColor: Colors.amber,
      //   onPressed: () async {
      //     await controller.moveCamera(CameraUpdate.newCameraPosition(
      //         CameraPosition(
      //             target: Point(
      //                 latitude: currentPosition!.latitude!.toDouble(),
      //                 longitude: currentPosition!.longitude!.toDouble()),
      //             zoom: 16.0)));
      //
      //     marker(
      //         latitude: currentPosition!.latitude!.toDouble(),
      //         longitude: currentPosition!.longitude!.toDouble());
      //     print("latitude: ${currentPosition!.latitude!.toDouble()} ");
      //     print("longitude: ${currentPosition!.longitude!.toDouble()} ");
      //   },
      // ),
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

// 41.311158, 69.279737
