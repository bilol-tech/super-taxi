import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suppertaxi/user/screens/tabbar/favouriteTabbar.dart';
import 'package:suppertaxi/user/screens/tabbar/historyTabbar.dart';
import 'package:suppertaxi/user/screens/tabbar/yandeMapPage.dart';

import '../classes/cardData.dart';
import 'addCardModalSheet.dart';

class SearchModalSheet extends StatefulWidget {
  const SearchModalSheet({super.key});

  @override
  State<SearchModalSheet> createState() => _SearchModalSheetState();
}

class _SearchModalSheetState extends State<SearchModalSheet> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 750.h, // Adjust the height as needed
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
          5.r.verticalSpace,
          Container(
              height: 50.h,
              padding: EdgeInsets.all(10.0.sp),
              decoration: BoxDecoration(
                color: const Color(0xffE4E4E4),
                border: Border.all(
                    color: const Color(0xffE4E4E4)),
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
                    child: TextFormField(
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
                ],
              ),
            ),
          10.r.verticalSpace,
          Container(
              height: 50.h,
              padding: EdgeInsets.all(10.0.sp),
              decoration: BoxDecoration(
                color: const Color(0xffE4E4E4),
                border: Border.all(
                    color: const Color(0xffE4E4E4)),
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
                    child: TextFormField(
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
                  VerticalDivider(
                    color: const Color(0xff222222).withOpacity(0.58),
                    // Customize divider color
                    thickness: 1.0,
                    // Customize divider thickness
                    // endIndent: 20.0, // Customize space after the divider
                  ),
                  InkWell(onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const YandexMapPage()));
                  },child: const Text("Map"))
                ],
              ),
            ),
          22.r.verticalSpace,
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
                            border: Border.all(color: const Color(0xffE4E4E4)),
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(6.0.r)
                        ),
                        child: TabBar(
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r), // Creates border
                              color: const Color(0xffE4E4E4)),
                          labelColor: const Color(0xff222222),
                          unselectedLabelColor: const Color(0xff222222),
                          labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: const Color(0xff222222)),
                          unselectedLabelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: const Color(0xff222222)),
                          tabs: const [
                            Tab(text: "History"),
                            Tab(text: "Favourites"),
                          ],
                        ),
                      ),
                      15.r.verticalSpace,
                      SizedBox(
                          height: 500.h, //height of TabBarView
                          child: const TabBarView(children: <Widget>[
                            HistoryTabbar(),
                            FavouriteTabbar(),
                          ]))
                    ])),
          ),
        ],
      ),
    );
  }
}
