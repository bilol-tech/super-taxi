import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryTabbar extends StatelessWidget {
  const HistoryTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              10.r.verticalSpace,
              Row(
                children: [
                  Icon(Icons.access_time_rounded, size: 37, color: const Color(0xff222222).withOpacity(0.58),),
                  SizedBox(width: 13.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("18 mavze, 25", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 16.sp, color: const Color(0xff222222)),),
                      1.r.verticalSpace,
                      Text("Yunusabad District, Tashkent", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 10.sp, color: const Color(0xff222222).withOpacity(0.58)),)
                    ],
                  )
                ],
              ),
              10.r.verticalSpace,
              const Padding(
                padding: EdgeInsets.only(left: 50.0),
                child: Divider(color: Color(0xffE4E4E4), thickness: 1.5,),
              ),
            ],
          );
        },
      ),
    );
  }
}
