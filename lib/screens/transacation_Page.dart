import 'package:bankingapp/utilities/themeColors.dart';
import 'package:bankingapp/utilities/themeStyles.dart';
import 'package:bankingapp/widgets/addNote.dart';
import 'package:bankingapp/widgets/cardin_page.dart';
import 'package:bankingapp/widgets/other_details_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.price,
      required this.letter,
      required this.color});
  final String title;
  final String subTitle;
  final String price;
  final String letter;
  final String color;

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sent'),
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        child: Stack(children: [
          ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, top: 32.0, bottom: 8.0),
                child: Row(
                  children: [
                    Text('Outgoing Transaction',
                        style: ThemeStyles.primaryTitle),
                  ],
                ),
              ),
              CardInPage(
                color: widget.color,
                title: widget.title,
                subTitle: widget.subTitle,
                price: widget.price,
                letter: widget.letter,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, top: 32.0, bottom: 8.0),
                child: Row(
                  children: [
                    Text(
                      'Details',
                      style: ThemeStyles.primaryTitle,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 5.0),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 12.0),
                      child: SvgPicture.asset('assets/bankTransfer-icon.svg'),
                    ),
                    Text(
                      'Bank Transfer',
                      style: ThemeStyles.otherDetailsPrimary,
                    ),
                  ],
                ),
              ),
              const OtherDetailsDivider(),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 5.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                      child: Container(
                        height: 32.0,
                        width: 74.0,
                        decoration: BoxDecoration(
                          color: ThemeColors.lightGrey,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text(
                            '#finance',
                            style: ThemeStyles.tagText,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                      child: Container(
                        height: 32.0,
                        width: 74.0,
                        decoration: BoxDecoration(
                          color: ThemeColors.lightGrey,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text(
                            '#fintory',
                            style: ThemeStyles.tagText,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                      child: Container(
                        height: 32.0,
                        width: 74.0,
                        decoration: BoxDecoration(
                          color: ThemeColors.lightGrey,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text(
                            '#design',
                            style: ThemeStyles.tagText,
                          ),
                        ),
                      ),
                    ),
                    SvgPicture.asset('assets/edit-icon.svg')
                  ],
                ),
              ),
              const OtherDetailsDivider(),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('IBAN', style: ThemeStyles.otherDetailsSecondary),
                    const SizedBox(height: 5.0),
                    Text(
                      'DE56 3902 0000 1203 2339 39',
                      style: ThemeStyles.otherDetailsPrimary,
                    ),
                  ],
                ),
              ),
              const OtherDetailsDivider(),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('BIC', style: ThemeStyles.otherDetailsSecondary),
                    const SizedBox(height: 5.0),
                    Text(
                      'DUISDE33XX',
                      style: ThemeStyles.otherDetailsPrimary,
                    ),
                  ],
                ),
              ),
              const OtherDetailsDivider(),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Posting Key',
                        style: ThemeStyles.otherDetailsSecondary),
                    const SizedBox(height: 5.0),
                    Text(
                      '153',
                      style: ThemeStyles.otherDetailsPrimary,
                    ),
                  ],
                ),
              ),
              const OtherDetailsDivider(),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Posting Text',
                        style: ThemeStyles.otherDetailsSecondary),
                    const SizedBox(height: 5.0),
                    Text(
                      'Landing Page',
                      style: ThemeStyles.otherDetailsPrimary,
                    ),
                  ],
                ),
              ),
              const OtherDetailsDivider(),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Purpose Code',
                        style: ThemeStyles.otherDetailsSecondary),
                    const SizedBox(height: 5.0),
                    Text(
                      'OLOA',
                      style: ThemeStyles.otherDetailsPrimary,
                    ),
                  ],
                ),
              ),
              const OtherDetailsDivider(),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('SEPA Reference',
                        style: ThemeStyles.otherDetailsSecondary),
                    const SizedBox(height: 5.0),
                    Text(
                      'DE56 3902 0000 1203 2339 39',
                      style: ThemeStyles.otherDetailsPrimary,
                    ),
                  ],
                ),
              ),
              const OtherDetailsDivider(),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('SEPA Reference',
                        style: ThemeStyles.otherDetailsSecondary),
                    const SizedBox(height: 5.0),
                    Text(
                      'DE56 3902 0000 1203 2339 39',
                      style: ThemeStyles.otherDetailsPrimary,
                    ),
                  ],
                ),
              ),
              const OtherDetailsDivider(),
            ],
          ),
          const AddNote(),
        ]),
      ),
    );
  }
}
