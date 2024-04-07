import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../classes/cardData.dart';
import '../components/card_alert_dialog.dart';
import '../components/card_input_formatter.dart';
import '../components/card_mont_input_formatter.dart';
import '../components/master_card.dart';
import '../components/my_painter.dart';
import '../constants/colorConstants.dart';

class AddCardModalSheet extends StatefulWidget {
  const AddCardModalSheet({Key? key}) : super(key: key);

  @override
  State<AddCardModalSheet> createState() => _AddCardModalSheetState();
}

class _AddCardModalSheetState extends State<AddCardModalSheet> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardHolderNameController =
      TextEditingController();
  final TextEditingController cardExpiryDateController =
      TextEditingController();
  final TextEditingController cardNameController = TextEditingController();

  final FlipCardController flipCardController = FlipCardController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Builder(builder: (BuildContext context) {
        final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

        return Container(
          margin: EdgeInsets.only(bottom: keyboardHeight),
          height: 650.h,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                      width: 40.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: const Divider(
                          color: Color(0xffD9D9D9), thickness: 3)),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: buildCreditCard(
                              color: kDarkBlue,
                              cardExpiration:
                                  cardExpiryDateController.text.isEmpty
                                      ? "08/2022"
                                      : cardExpiryDateController.text,
                              cardHolder: cardHolderNameController.text.isEmpty
                                  ? "Card Holder"
                                  : cardHolderNameController.text.toUpperCase(),
                              cardNumber: cardNumberController.text.isEmpty
                                  ? "XXXX XXXX XXXX XXXX"
                                  : cardNumberController.text,
                              cardName: cardNameController.text.isEmpty
                                  ? "Card Name"
                                  : cardNameController.text.toUpperCase(),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            height: 55,
                            width: MediaQuery.of(context).size.width / 1.12,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextFormField(
                              controller: cardNameController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                hintText: 'Card Name',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                                prefixIcon: Icon(
                                  Icons.credit_card,
                                  color: Colors.grey,
                                ),
                              ),
                              // inputFormatters: [
                              //   FilteringTextInputFormatter.digitsOnly,
                              //   LengthLimitingTextInputFormatter(16),
                              //   CardInputFormatter(),
                              // ],
                              onChanged: (value) {
                                var text = value.replaceAll(
                                    RegExp(r'\s+\b|\b\s'), ' ');
                                setState(() {
                                  cardNameController.value =
                                      cardNameController.value.copyWith(
                                          text: text,
                                          selection: TextSelection.collapsed(
                                              offset: text.length),
                                          composing: TextRange.empty);
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            height: 55,
                            width: MediaQuery.of(context).size.width / 1.12,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextFormField(
                              controller: cardNumberController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                hintText: 'Card Number',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                                prefixIcon: Icon(
                                  Icons.credit_card,
                                  color: Colors.grey,
                                ),
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(16),
                                CardInputFormatter(),
                              ],
                              onChanged: (value) {
                                var text = value.replaceAll(
                                    RegExp(r'\s+\b|\b\s'), ' ');
                                setState(() {
                                  cardNumberController.value =
                                      cardNumberController.value.copyWith(
                                          text: text,
                                          selection: TextSelection.collapsed(
                                              offset: text.length),
                                          composing: TextRange.empty);
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            height: 55,
                            width: MediaQuery.of(context).size.width / 1.12,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextFormField(
                              controller: cardHolderNameController,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                hintText: 'Full Name',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  cardHolderNameController.value =
                                      cardHolderNameController.value.copyWith(
                                          text: value,
                                          selection: TextSelection.collapsed(
                                              offset: value.length),
                                          composing: TextRange.empty);
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 55,
                                width: MediaQuery.of(context).size.width / 2.4,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextFormField(
                                  controller: cardExpiryDateController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    hintText: 'MM/YY',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.calendar_today,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(4),
                                    CardDateInputFormatter(),
                                  ],
                                  onChanged: (value) {
                                    var text = value.replaceAll(
                                        RegExp(r'\s+\b|\b\s'), ' ');
                                    setState(() {
                                      cardExpiryDateController.value =
                                          cardExpiryDateController.value
                                              .copyWith(
                                                  text: text,
                                                  selection:
                                                      TextSelection.collapsed(
                                                          offset: text.length),
                                                  composing: TextRange.empty);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xff222222),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minimumSize: Size(
                        MediaQuery.of(context).size.width / 1.12,
                        55),
                  ),
                  onPressed: () {
                    // Future.delayed(const Duration(milliseconds: 300), () {
                    //   showDialog(
                    //       context: context,
                    //       builder: (context) => const CardAlertDialog());
                    //   cardCvvController.clear();
                    //   cardExpiryDateController.clear();
                    //   cardHolderNameController.clear();
                    //   cardNumberController.clear();
                    //   flipCardController.toggleCard();
                    // });

                    final cardData = CardData(
                      cardNumber: cardNumberController.text,
                      cardHolderName:
                      cardHolderNameController.text,
                      cardExpiryDate:
                      cardExpiryDateController.text,
                      cardName: cardNameController.text,
                    );

                    // Pass the cardData back to the previous page
                    Navigator.of(context).pop(cardData);
                  },
                  child: Text(
                    'Add Card'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
