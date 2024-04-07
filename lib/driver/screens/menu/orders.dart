import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suppertaxi/driver/screens/menu/orderTabbar/newOrder.dart';
import 'package:suppertaxi/driver/screens/menu/orderTabbar/plannedOrder.dart';

import '../drawer/drawerDriver.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

final GlobalKey<ScaffoldState> _ordersScaffoldKey =
GlobalKey<ScaffoldState>();

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _ordersScaffoldKey,
      drawer: const DrawerDriver(),
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        elevation: 0.1,
        title: Text("Orders", style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 18.sp, color: const Color(0xff222222)),),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: InkWell(
              onTap: (){
                _ordersScaffoldKey.currentState?.openDrawer();
              },
          child: const Icon(Icons.menu, size: 32, color: Color(0xff222222),)),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.notifications_active, size: 32, color: Color(0xff222222),),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(19.sp),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.r),
                child: DefaultTabController(
                    length: 2, // length of tabs
                    initialIndex: 0,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            height: 36.h,
                            padding: EdgeInsets.all(3.r),
                            decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xff222222)),
                                color: const Color(0xffFFFFFF),
                                borderRadius: BorderRadius.circular(6.0.r)
                            ),
                            child: TabBar(
                              indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r), // Creates border
                                  color: const Color(0xff222222)),
                              labelColor: const Color(0xffFFFFFF),
                              unselectedLabelColor: const Color(0xff222222),
                              labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: const Color(0xff222222)),
                              unselectedLabelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: const Color(0xff222222)),
                              tabs: const [
                                Tab(text: "New"),
                                Tab(text: "Planned"),
                              ],
                            ),
                          ),
                          15.r.verticalSpace,
                          SizedBox(
                              height: 600.h, //height of TabBarView
                              child: const TabBarView(children: <Widget>[
                                NewOrder(),
                                PlannedOrder(),
                              ]))
                        ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
