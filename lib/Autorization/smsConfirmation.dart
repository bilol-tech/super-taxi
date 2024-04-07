import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:suppertaxi/driver/screens/menu/orders.dart';

import '../driver/screens/menu/mainScreenDriver.dart';
import '../user/screens/menu/mainForMen.dart';

// ignore: must_be_immutable
class SmsConfirmation extends StatefulWidget {
  String? phone;
    SmsConfirmation({Key? key, required this.phone}) : super (key: key);

  @override
  State<SmsConfirmation> createState() => _SmsConfirmationState();
}

class _SmsConfirmationState extends State<SmsConfirmation> {

  final TextEditingController _controller = TextEditingController();

  String _code = "";
  int _secoundCount = 59;
  int _minutCount = 2;
  bool _timeOf = false;
  Timer? _timer;


  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        _secoundCount -= 1;
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  String _message = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(19.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.r.verticalSpace,
              Center(child: Image.asset("assets/images/logoSmall.png")),
              15.r.verticalSpace,
              Center(
                child: Text(
                  "SMS Tasdiqlash",
                  style: GoogleFonts.inter(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w700,
                      fontSize: 32),
                ),
              ),
              13.r.verticalSpace,
              Text(
                "Sizga SMS xabar jo’natdik , dasturga kirish uchun SMS xabardagi kod bilan tasdiqlang ! ",
                style: GoogleFonts.inter(
                    color: const Color(0xff222222),
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp),
              ),
              25.r.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: PinFieldAutoFill(
                  controller: _controller,
                  decoration:  BoxLooseDecoration(
                    textStyle: TextStyle(fontSize: 20.sp, color: Colors.black),
                    strokeColorBuilder: const FixedColorBuilder(Color(0xffE4E4E4)),
                  ),
                  currentCode: _code, // prefill with a code
                  codeLength: 5, //code length, default 6
                  onCodeChanged: (code) {
                    setState(() {
                      _code = code!;
                      print(_code);
                    });
                  },
                ),
              ),
              30.r.verticalSpace,
              Center(
                child: Text(
                  _secoundCount > 9
                      ? "0" +
                      _minutCount.toString() +
                      ":" +
                      _secoundCount.toString()
                      : "0" +
                      _minutCount.toString() +
                      ":" +
                      "0" +
                      _secoundCount.toString(),
                  style: GoogleFonts.inter(color: const Color(0xff222222), fontWeight: FontWeight.w500, fontSize: 16.sp),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Center(
                child: GestureDetector(
                  onTap: () async {
                    if (_timeOf) {
                      _timeOf = false;
                      _minutCount = 2;
                      _secoundCount = 59;
                      _timer = Timer.periodic(
                        const Duration(seconds: 1),
                            (timer) {
                          _secoundCount -= 1;
                          setState(() {});
                        },
                      );
                    }
                  },
                  child: Text(
                    "Qayta jo’natish",
                    style: TextStyle(
                        color: !_timeOf
                            ? const Color(0xff222222)
                            : const Color(0xff222222)),
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: (){
                  final phoneNumber = widget.phone.toString().replaceAll(' ', '');
                  print("Phone Number: $phoneNumber"); // Add this line

                  if (phoneNumber == '+998994384391') {
                    if (_controller.text.toString() == '11111') {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => const MainPageMen(),
                      )).then((_) {
                        // Remove all routes from the stack except PhoneNumber
                        Navigator.of(context).popUntil((route) => route.isFirst);
                      });
                    } else {
                      if (_controller.text.isEmpty) {
                        // Show "Please enter the code" snackbar if the code is empty
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter the code'),
                          ),
                        );
                      } else if (_controller.text.length != 5) {
                        // Show "Invalid password" snackbar if the code length is not 5
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Invalid password'),
                          ),
                        );
                      } else {
                        // Show "Sms Code is incorrect" snackbar for other cases
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Sms Code is incorrect'),
                          ),
                        );
                      }
                    }
                  } else if (phoneNumber == '+998998073046') {
                    if (_controller.text.toString() == '22222') {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => const Orders(),
                      )).then((_) {
                        // Remove all routes from the stack except PhoneNumber
                        Navigator.of(context).popUntil((route) => route.isFirst);
                      });
                    } else {
                      if (_controller.text.isEmpty) {
                        // Show "Please enter the code" snackbar if the code is empty
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter the code'),
                          ),
                        );
                      } else if (_controller.text.length != 5) {
                        // Show "Invalid password" snackbar if the code length is not 5
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Invalid password'),
                          ),
                        );
                      } else {
                        // Show "Sms Code is incorrect" snackbar for other cases
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Sms Code is incorrect'),
                          ),
                        );
                      }
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Phone number is incorrect'),
                      ),
                    );
                  }

                  print(widget.phone);
                  print(widget.phone.toString().length);
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
