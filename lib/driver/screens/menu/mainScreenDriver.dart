import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suppertaxi/driver/screens/drawer/drawerDriver.dart';
import 'package:suppertaxi/driver/widgets/newOrderModalSheet.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../user/screens/drawer/drawer.dart';

class MainScreenDriver extends StatefulWidget {
  const MainScreenDriver({super.key});

  @override
  State<MainScreenDriver> createState() => _MainScreenDriverState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

late YandexMapController controller;
final List<MapObject> mapObjects = [];
const MapObjectId placemarkId = MapObjectId('normal_icon_placemark');
bool isOnline = false;

class _MainScreenDriverState extends State<MainScreenDriver> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerDriver(),
      key: _scaffoldKey,
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
              final cameraPosition = await controller.getCameraPosition().then(
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
                  border: Border.all(color: Colors.grey)),
              child: Center(
                child: InkWell(
                  onTap: () => _scaffoldKey.currentState?.openDrawer(),
                  highlightColor: Colors.blue.withOpacity(0.4),
                  splashColor: Colors.green.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30),
                  child: Icon(
                    Icons.menu,
                    size: 30.sp,
                    color: const Color(0xff222222),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 70,
            right: 20,
            child: Column(
              children: <Widget>[
                Container(
                  width: 140.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: isOnline
                        ? const Color(0xff489D2C)
                        : const Color(0xffF50000),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (isOnline)
                        const Text('ONLINE ',
                            style: TextStyle(color: Colors.white)),
                      Switch.adaptive(
                        value: isOnline,
                        onChanged: (newValue) {
                          setState(() {
                            isOnline = newValue;
                          });
                          if (isOnline) {
                            Future.delayed(const Duration(seconds: 3), () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                builder: (context) {
                                  return const NewOrderDetails();
                                },
                              );
                            });
                          }
                        },
                        activeColor: const Color(0xff489D2C),
                        inactiveTrackColor: const Color(0xffF50000),
                      ),
                      if (!isOnline)
                        const Text(' OFFLINE',
                            style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ],
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
