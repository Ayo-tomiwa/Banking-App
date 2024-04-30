import 'package:bankingapp/screens/transacation_Page.dart';
import 'package:bankingapp/utilities/themeStyles.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatefulWidget {
  const TransactionCard(
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
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TransactionPage(
                  color: widget.color,
                  title: widget.title,
                  subTitle: widget.subTitle,
                  price: widget.price,
                  letter: widget.letter,
                ),
              ));
        },
        child: SizedBox(
          height: 62.0,
          width: 343.0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 44.0,
                        width: 44.0,
                        decoration: BoxDecoration(
                            color: Color(int.parse(widget.color)),
                            borderRadius: BorderRadius.circular(22.0)),
                        child: Center(
                          child: Text(
                            widget.letter,
                            style: const TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: ThemeStyles.otherDetailsPrimary,
                            ),
                            Text(
                              widget.subTitle,
                              style: ThemeStyles.otherDetailsSecondary,
                            ),
                          ])
                    ],
                  ),
                  Row(
                    children: [
                      Text(widget.price,
                          style: const TextStyle(color: Colors.red)),
                      const SizedBox(
                        width: 4.0,
                      ),
                      const Icon(Icons.keyboard_arrow_right),
                    ],
                  )
                ],
              ),
              Divider(
                color: Colors.grey.withOpacity(0.5),
                thickness: 0.5,
                endIndent: 16.0,
                indent: 16.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
