import 'dart:math';

import 'package:extended_wrap/extended_wrap.dart';
import 'package:flutter/material.dart';

class HomePageExtended extends StatefulWidget {
  const HomePageExtended({Key? key}) : super(key: key);

  @override
  State<HomePageExtended> createState() => _HomePageExtendedState();
}

class _HomePageExtendedState extends State<HomePageExtended> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.yellow,
        height: 500,
        width: double.infinity,
        child: Container(
          color: Colors.grey.shade400,
          height: 300,
          width: 300,
          child: ExtendedWrap(
            overflowWidget: Container(
              height: 50,
              width: 50,
              color: Colors.yellow,
            ),
            maxLines: 1,
            spacing: 10,
            runSpacing: 10,
            direction: Axis.horizontal,
            children: List.generate(
              10,
              (index) => Container(
                height: 100,
                width: Random().nextInt(250).toDouble(),
                color: index % 2 == 0 ? Colors.red : Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
