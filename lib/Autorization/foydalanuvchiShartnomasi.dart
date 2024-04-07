import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FoydalanuvchiShartnomasi extends StatelessWidget {
  const FoydalanuvchiShartnomasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        leading: GestureDetector(onTap: (){
          Navigator.pop(context);
        },child: const Icon(Icons.close_rounded, color: Colors.black,)),
        title: Text("Foydalanuvchi shartnomasi", style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 18.sp, color: const Color(0xff222222)),),
        backgroundColor: const Color(0xffFFFFFF),
        elevation: 0.1,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(19.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
