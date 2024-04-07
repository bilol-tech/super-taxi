import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Tariffs extends StatefulWidget {
  const Tariffs({super.key});

  @override
  State<Tariffs> createState() => _TariffsState();
}

bool isEconom = false; // Initialize the switch value to false (off)
bool isBusiness = false; // Initialize the switch value to false (off)
bool isComfort = false; // Initialize the switch value to false (off)


class _TariffsState extends State<Tariffs> {

  @override
  void initState() {
    super.initState();

    // Reset the switch states to off when the page is initialized
    isEconom = false;
    isBusiness = false;
    isComfort = false;
  }

  void _updateSwitchValues(String selectedSwitch) {
    setState(() {
      if (selectedSwitch == 'econom') {
        isEconom = true;
        isComfort = false;
        isBusiness = false;
      } else if (selectedSwitch == 'comfort') {
        isEconom = false;
        isComfort = true;
        isBusiness = false;
      } else if (selectedSwitch == 'business') {
        isEconom = false;
        isComfort = false;
        isBusiness = true;
      }
    });

    print('isEconom: $isEconom, isComfort: $isComfort, isBusiness: $isBusiness');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        elevation: 0.1,
        centerTitle: true,
        title: Text("Tariffs", style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 20.sp, color: const Color(0xff222222)),),
        leading: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: InkWell(onTap: (){
            Navigator.pop(context);
          },child: const Icon(Icons.arrow_back_ios, color: Color(0xff222222))),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(19.sp),
          child: Column(
            children: [
              20.r.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.r),
                child: Row(
                  children: [
                    const Text(
                      "Econom",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20.0,
                        color: Color(0xff222222),
                      ),
                    ),
                    const Spacer(),
                    Transform.scale(
                      scale: 0.8,
                      child: Switch.adaptive(
                        value: isEconom, // Change this value as needed
                        onChanged: (bool newValue) {
                          if (newValue) {
                            _updateSwitchValues('econom');
                          }
                        },
                        activeColor: const Color(0xff222222), // Active color when selected
                        activeTrackColor: const Color(0xffFFFFFF), //
                        inactiveThumbColor: isEconom ? const Color(0xff222222).withOpacity(0.35) : const Color(0xffCCCCCC), // Thumb color when unselected
                        inactiveTrackColor: isEconom ? const Color(0xffFFFFFF).withOpacity(0.35) : const Color(0xffCCCCCC), // Track color when unselected
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Set the tap target size
                      ),
                    ),
                  ],
                ),
              ),
              8.r.verticalSpace,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.0),
                child: Divider(color: Color(0xffE4E4E4), thickness: 1.5,),
              ),

              20.r.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.r),
                child: Row(
                  children: [
                    const Text(
                      "Comfort",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20.0,
                        color: Color(0xff222222),
                      ),
                    ),
                    const Spacer(),
                    Transform.scale(
                      scale: 0.8,
                      child: Switch.adaptive(
                        value: isComfort, // Change this value as needed
                        onChanged: (bool newValue) {
                          if (newValue) {
                            _updateSwitchValues('comfort');
                          }
                        },
                        activeColor: const Color(0xff222222), // Active color when selected
                        activeTrackColor: const Color(0xffFFFFFF), //
                        inactiveThumbColor: isComfort ? const Color(0xff222222).withOpacity(0.35) : const Color(0xffCCCCCC), // Thumb color when unselected
                        inactiveTrackColor: isComfort ? const Color(0xffFFFFFF).withOpacity(0.35) : const Color(0xffCCCCCC), // Track color when unselected
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Set the tap target size
                      ),
                    ),
                  ],
                ),
              ),
              8.r.verticalSpace,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.0),
                child: Divider(color: Color(0xffE4E4E4), thickness: 1.5,),
              ),

              20.r.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.r),
                child: Row(
                  children: [
                    const Text(
                      "Business",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20.0,
                        color: Color(0xff222222),
                      ),
                    ),
                    const Spacer(),
                    Transform.scale(
                      scale: 0.8,
                      child: Switch.adaptive(
                        value: isBusiness, // Change this value as needed
                        onChanged: (bool newValue) {
                          if (newValue) {
                            _updateSwitchValues('business');
                          }
                        },
                        activeColor: const Color(0xff222222), // Active color when selected
                        activeTrackColor: const Color(0xffFFFFFF), //
                        inactiveThumbColor: isBusiness ? const Color(0xff222222).withOpacity(0.35) : const Color(0xffCCCCCC), // Thumb color when unselected
                        inactiveTrackColor: isBusiness ? const Color(0xffFFFFFF).withOpacity(0.35) : const Color(0xffCCCCCC), // Track color when unselected
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Set the tap target size
                      ),
                    ),
                  ],
                ),
              ),
              8.r.verticalSpace,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.0),
                child: Divider(color: Color(0xffE4E4E4), thickness: 1.5,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
