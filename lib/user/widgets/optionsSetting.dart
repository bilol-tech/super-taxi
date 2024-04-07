import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../classes/cardData.dart';
import 'addCardModalSheet.dart';

class OptionsSetting extends StatefulWidget {
  const OptionsSetting({super.key});

  @override
  State<OptionsSetting> createState() => _OptionsSettingState();
}

class _OptionsSettingState extends State<OptionsSetting> {

  bool isPetSelected = false;
  bool isAirConditionerSelected = false;
  bool isWheelchairSelected = false;


  void _toggleSelected(String option) {
    setState(() {
      if (option == 'Pet') {
        isPetSelected = true;
        isAirConditionerSelected = false;
        isWheelchairSelected = false;
      } else if (option == 'AirConditioner') {
        isPetSelected = false;
        isAirConditionerSelected = true;
        isWheelchairSelected = false;
      } else if (option == 'Wheelchair') {
        isPetSelected = false;
        isAirConditionerSelected = false;
        isWheelchairSelected = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h, // Adjust the height as needed
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
          7.r.verticalSpace,
          const Text(
            'Options',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xff222222)),
          ),
          const SizedBox(height: 40), // Space between lines
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Pet', style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 16.sp, color: const Color(0xff222222)),),
              const Spacer(),
              InkWell(
                onTap: () => _toggleSelected('Pet'),
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff222222),
                  ),
                  child: isPetSelected ? const Icon(
                    Icons.check,
                    size: 20,
                    color: Colors.white,
                  ) : const SizedBox(),
                ),
              ),
            ],
          ),
          5.r.verticalSpace,
          const Padding(
            padding: EdgeInsets.only(left: 27.0, right: 57.0),
            child: Divider(color: Color(0xffE4E4E4), thickness: 1.5,),
          ),
          10.r.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Air Conditioner', style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 16.sp, color: const Color(0xff222222)),),
              const Spacer(),
              InkWell(
                onTap: () => _toggleSelected('AirConditioner'),
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff222222),
                  ),
                  child: isAirConditionerSelected ? const Icon(
                    Icons.check,
                    size: 20,
                    color: Colors.white,
                  ) : const SizedBox(),
                ),
              ),
            ],
          ),
          5.r.verticalSpace,
          const Padding(
            padding: EdgeInsets.only(left: 27.0, right: 57.0),
            child: Divider(color: Color(0xffE4E4E4), thickness: 1.5,),
          ),
          10.r.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Wheelchair', style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 16.sp, color: const Color(0xff222222)),),
              const Spacer(),
              InkWell(
                onTap: () => _toggleSelected('Wheelchair'),
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff222222),
                  ),
                  child: isWheelchairSelected ? const Icon(
                    Icons.check,
                    size: 20,
                    color: Colors.white,
                  ) : const SizedBox(),
                ),
              ),
            ],
          ),
          5.r.verticalSpace,
          const Padding(
            padding: EdgeInsets.only(left: 27.0, right: 57.0),
            child: Divider(color: Color(0xffE4E4E4), thickness: 1.5,),
          ),
          const Spacer(),
          InkWell(
            borderRadius: BorderRadius.circular(30),
            highlightColor: Colors.blue.withOpacity(0.4),
            splashColor: Colors.green.withOpacity(0.5),
            onTap: (){
              if (isPetSelected) {
                // Display card icon
                // You can replace this with your own Icon/Image widget
                print('Pet is selected');
              } else if (isAirConditionerSelected) {
                // Display cash asset
                // You can replace this with your own Image widget
                print('Air Conditioner is selected');
              } else if (isWheelchairSelected) {
                // Display cash asset
                // You can replace this with your own Image widget
                print('Wheelchair is selected');
              } else {
                // Handle the case when no payment method is selected
                print('No options method selected');
              }
              // _onDonePressed();
              Navigator.pop(context, isPetSelected ? 'Card' : 'Cash');
            },
            child: Container(
              height: 55.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                color: const Color(0xff222222),
              ),
              child: Center(
                child: Text(
                  "Done",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 17.sp,
                      color: const Color(0xffFFFFFF)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
