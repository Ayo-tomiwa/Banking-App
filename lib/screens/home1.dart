import 'package:bankingapp/components/appbar.dart';
import 'package:bankingapp/components/card.dart';
import 'package:bankingapp/components/recentTransactions.dart';
import 'package:flutter/material.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: const Column(
          children: [
            AppBar1(),
            CardsList(),
            RecentTransactions(),
          ],
        ),
      ),
    );
  }
}
