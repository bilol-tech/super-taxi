import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suppertaxi/Autorization/smsConfirmation.dart';

import '../driver/screens/menu/mainScreenDriver.dart';
import '../user/screens/menu/mainForMen.dart';
import 'foydalanuvchiShartnomasi.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({super.key});

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  final GlobalKey _key = GlobalKey();
  final TextEditingController _phoneController =
      TextEditingController(text: '+998');

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(19.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.r.verticalSpace,
              Center(child: Image.asset("assets/images/logoSmall.png")),
              10.r.verticalSpace,
              Center(
                child: Text(
                  "Kirish",
                  style: GoogleFonts.inter(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w700,
                      fontSize: 32),
                ),
              ),
              70.r.verticalSpace,
              Text(
                "Telefon raqami",
                style: GoogleFonts.inter(
                    color: const Color(0xff222222),
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              TextFormField(
                inputFormatters: [
                  TextInputMask(
                    mask: '\\+ 999 99 999 99 99',
                    placeholder: '_ ',
                    maxPlaceHolders: 13,
                  )
                ],
                key: _key,
                controller: _phoneController,
                onChanged: (e) {
                  print(_phoneController.text);
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: '998  _ _  _ _ _  _ _  _ _ ',
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              15.r.verticalSpace,
              GestureDetector(
                onTap: () {
                  // Add your Navigator.push logic here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        // Replace 'NextPage' with the actual page you want to navigate to
                        return const FoydalanuvchiShartnomasi();
                      },
                    ),
                  );
                },
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.grey,
                        height: 1.5),
                    children: <TextSpan>[
                      TextSpan(
                          text: '“Keyingi” tugmasini bosish bilan siz ',
                          style: TextStyle(color: Color(0xff222222))),
                      TextSpan(
                        text: 'foydalanuvchi shartnomasi',
                        style: TextStyle(
                          color:
                              Color(0xff3D5AC1), // Set the text color to blue
                        ),
                      ),
                      TextSpan(
                        text: ' shartlarini qabul qilgan bo’lasiz',
                        style: TextStyle(color: Color(0xff222222)),
                      )
                    ],
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  final enteredPhoneNumber = _phoneController.text;
                  final phoneNumber = enteredPhoneNumber.toString().replaceAll(' ', '');
                  print("Phone Number: $phoneNumber");
                  if (phoneNumber.isEmpty) {
                    // Show "Please enter Phone Number" Snackbar if the controller is empty
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter Phone Number'),
                      ),
                    );
                  } else if (phoneNumber != '+998994384391' &&
                      phoneNumber != '+998998073046') {
                    // Show "Phone number is incorrect" Snackbar if the entered phone number is not valid
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Phone number is incorrect'),
                      ),
                    );
                  } else {
                    // If the entered phone number is valid, navigate to SmsConfirmation
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) =>
                          SmsConfirmation(phone: phoneNumber),
                    ));
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.r)),
                    color: const Color(0xff222222),
                  ),
                  child: Center(
                    child: Text(
                      "Keyingi",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 17.sp,
                          color: const Color(0xffFFFFFF)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
