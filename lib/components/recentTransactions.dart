import 'package:bankingapp/utilities/themeStyles.dart';
import 'package:bankingapp/widgets/transaction_card.dart';
import 'package:flutter/material.dart';

class RecentTransactions extends StatefulWidget {
  const RecentTransactions({super.key});

  @override
  State<RecentTransactions> createState() => _RecentTransactionsState();
}

class _RecentTransactionsState extends State<RecentTransactions> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
              bottom: 16.0,
              top: 32.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recent Transactions', style: ThemeStyles.primaryTitle),
                Text(
                  'See All',
                  style: ThemeStyles.seeAll,
                ),
                Flexible(
                  flex: 1,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: const [
                      TransactionCard(
                        color: 'Colors.black',
                        letter: 'F',
                        title: 'Fintory GmbH',
                        subTitle: 'FInance Landing Page',
                        price: '- 5.720,30 £',
                      ),
                      TransactionCard(
                        color: 'Color(0xfffe695d)',
                        letter: 'D',
                        title: 'Dominik Schmidit',
                        subTitle: 'Mykonos Hotel Booking',
                        price: '- 620,30 £',
                      ),
                      TransactionCard(
                        color: 'Color(0xff103289)',
                        letter: 'E',
                        title: 'Evolt.io',
                        subTitle: 'Evolt UI Kit',
                        price: '- 59,99 £',
                      ),
                      TransactionCard(
                        color: 'Colors.greenAccent',
                        letter: 'F',
                        title: 'Fintory GmbH',
                        subTitle: 'FInance Landing Page',
                        price: '- 5.720,30 £',
                      ),
                      TransactionCard(
                        color: 'Colors.amberAccent',
                        letter: 'E',
                        title: 'Evolt.io',
                        subTitle: 'Evolt UI Kit',
                        price: '- 59,99 £',
                      ),
                      TransactionCard(
                        color: 'Color.grey',
                        letter: 'S',
                        title: 'Swindly Gilbert',
                        subTitle: 'Good Girl Novels',
                        price: '- 5.720,30 £',
                      ),
                      TransactionCard(
                        color: 'Colors.black',
                        letter: 'F',
                        title: 'Fintory GmbH',
                        subTitle: 'FInance Landing Page',
                        price: '- 5.720,30 £',
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
