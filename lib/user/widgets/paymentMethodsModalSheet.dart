import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../classes/cardData.dart';
import 'addCardModalSheet.dart';

class PaymentMethodsBottomSheet extends StatefulWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  State<PaymentMethodsBottomSheet> createState() => _PaymentMethodsBottomSheetState();
}

class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {

  bool isCardSelected = false;
  bool isCashSelected = false;
  String selectedPaymentMethod = '';
  List<CardData> cardList = [];
  String selectedCardType = "";


  void _toggleSelected(String option) {
    setState(() {
      if (option == 'Card') {
        isCardSelected = true;
        isCashSelected = false;
      } else if (option == 'Cash') {
        isCardSelected = false;
        isCashSelected = true;
      }
    });
  }

  void _showAddCardModalSheet(BuildContext context) async {
    final cardData = await showModalBottomSheet<CardData>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return const AddCardModalSheet();
      },
    );

    // Check if cardData is not null and process it as needed
    if (cardData != null) {
      // Add the card data to the list
      setState(() {
        cardList.add(cardData);
      });
    }
  }

  // void _showModalBottomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(
  //         top: Radius.circular(20),
  //       ),
  //     ),
  //     clipBehavior: Clip.antiAliasWithSaveLayer,
  //     builder: (BuildContext context) {
  //       // Return the widget that defines the content of your modal bottom sheet
  //       return const AddCardModalSheet();
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520.h, // Adjust the height as needed
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
            'Payment methods',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xff222222)),
          ),
          const SizedBox(height: 12), // Space between lines
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              5.r.verticalSpace,
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Icon(Icons.credit_card, size: 45.r,),
              ),
              const SizedBox(width: 20),
              Text('uzCard **** 3435', style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 16.sp, color: const Color(0xff222222)),),
              const Spacer(),
              InkWell(
                onTap: () => _toggleSelected('Card'),
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff222222),
                  ),
                  child: isCardSelected ? const Icon(
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
          5.r.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              5.r.verticalSpace,
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Image.asset("assets/images/moneyIcon.png", fit: BoxFit.contain, width: 40, height: 30,),
              ),
              const SizedBox(width: 20),
              Text('Cash', style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 16.sp, color: const Color(0xff222222)),),
              const Spacer(),
              InkWell(
                onTap: () => _toggleSelected('Cash'),
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff222222),
                  ),
                  child: isCashSelected ? const Icon(
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
          SizedBox(
            height: 205.h,
            child: ListView(
              children: [
                Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cardList.length,
                      itemBuilder: (context, index) {
                        final card = cardList[index];
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.credit_card_rounded, size: 44),
                                const SizedBox(width: 20),
                                Text('${card.cardName.toUpperCase()} **** ${card.cardNumber.substring(card.cardNumber.length-4)}', style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 15.sp, color: const Color(0xff222222)),),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    // _toggleSelected('Card');
                                    setState(() {
                                      selectedCardType = card.cardName;
                                    });
                                  },
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff222222),
                                    ),
                                    child: selectedCardType == card.cardName ? const Icon(
                                      Icons.check,
                                      size: 20,
                                      color: Colors.white,
                                    ) : const SizedBox(),
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 27.0, right: 57.0),
                              child: Divider(color: Color(0xffE4E4E4), thickness: 1.5,),
                            ),
                            // ListTile(
                            //   leading: const Icon(Icons.credit_card_outlined, size: 44, color: Color(0xff222222),),
                            //   title: Text(card.cardNumber),
                            //   subtitle: Text(
                            //     '${card.cardHolderName}, Expiry: ${card.cardExpiryDate}',
                            //   ),
                            // ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          20.r.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 6.r),
                child: Container(
                  width: 35.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff222222)),
                    borderRadius: BorderRadius.all(Radius.circular(3.r)),
                  ),
                  child: const Center(child: Icon(Icons.add),),
                ),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                  onTap: (){
                    _showAddCardModalSheet(context);
                  },child: Text('Add Card', style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 16.sp, color: const Color(0xff222222)),)),
            ],
          ),
          const Spacer(),
          InkWell(
            borderRadius: BorderRadius.circular(30),
            highlightColor: Colors.blue.withOpacity(0.4),
            splashColor: Colors.green.withOpacity(0.5),
            onTap: (){
              if (isCardSelected) {
                // Display card icon
                // You can replace this with your own Icon/Image widget
                print('Show card icon');
              } else if (isCashSelected) {
                // Display cash asset
                // You can replace this with your own Image widget
                print('Show cash asset');
              } else {
                // Handle the case when no payment method is selected
                print('No payment method selected');
              }
              // _onDonePressed();
              Navigator.pop(context, isCardSelected ? 'Card' : 'Cash');
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
