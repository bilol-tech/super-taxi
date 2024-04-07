// import 'package:flutter/material.dart';
// import 'package:yandex_mapkit/yandex_mapkit.dart';
//
// class PolylinePage extends StatefulWidget {
//   @override
//   _PolylinePageState createState() => _PolylinePageState();
// }
//
// class _PolylinePageState extends State<PolylinePage> {
//   final List<Polyline> polylines = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Polyline Map Object Example'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Expanded(
//             child: YandexMap(
//               onMapCreated: (YandexMapController controller) {
//                 // Add polylines when the map is created, if needed.
//                 controller.addPlacemark(Placemark(
//                   point: Point(latitude: 56.34295, longitude: 74.62829),
//                   style: PlacemarkStyle(
//                     iconName: 'your_icon.png', // You can use a custom icon.
//                   ),
//                 ));
//
//                 for (final polyline in polylines) {
//                   controller.addPolyline(polyline);
//                 }
//               },
//             ),
//           ),
//           const SizedBox(height: 20),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: <Widget>[
//                       ElevatedButton(
//                         onPressed: () {
//                           // Create a polyline from point A to point B
//                           final polyline = Polyline(
//                             points: [
//                               Point(latitude: 56.34295, longitude: 74.62829),
//                               Point(latitude: 70.12669, longitude: 98.97399),
//                             ],
//                             strokeWidth: 3.0,
//                             strokeColor: Colors.blue,
//                           );
//
//                           setState(() {
//                             polylines.add(polyline);
//                           });
//                         },
//                         child: Text('Add Polyline'),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
