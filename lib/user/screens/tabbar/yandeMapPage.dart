import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class YandexMapPage extends StatefulWidget {
  const YandexMapPage({super.key});

  @override
  State<YandexMapPage> createState() => _YandexMapPageState();
}

late YandexMapController controller;
final List<MapObject> mapObjects = [];
const MapObjectId placemarkId = MapObjectId('normal_icon_placemark');

class _YandexMapPageState extends State<YandexMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            left: 24,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4.r)),
                  border: Border.all(color: const Color(0xffE4E4E4)),
                  color: const Color(0xffFFFFFF),
                ),
                child: const Center(child: Icon(Icons.arrow_back, color: Color(0xff222222),),),
              ),
            ),
          )
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
