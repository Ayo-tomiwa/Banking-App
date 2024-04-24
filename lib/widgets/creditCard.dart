import 'package:bankingapp/utilities/themeColors.dart';
import 'package:bankingapp/utilities/themeStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({super.key});

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        height: 216,
        width: 380,
        decoration: BoxDecoration(
          color: ThemeColors.black,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '5.720,30 £',
                      style: ThemeStyles.cardMoney,
                    ),
                    SvgPicture.asset('assets/hide-icon.svg'),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    'Magent Black',
                    style: ThemeStyles.cardDetails,
                  ),
                  Row(
                    children: [
                      Text(
                          '4756',
                          style: ThemeStyles.cardDetails,
                          SvgPicture.asset(''))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
