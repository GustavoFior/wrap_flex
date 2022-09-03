import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wrap/wrap_flex.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade400,
      width: 250,
      child: WrapFlex(
        //spacing: 10,
        runSpacing: 10,
        direction: Axis.horizontal,
        children: List.generate(
          5,
          (index) => Container(
            height: Random().nextInt(100).toDouble(),
            width: Random().nextInt(250).toDouble(),
            color: index % 2 == 0 ? Colors.red : Colors.blue,
          ),
        ),
      ),
    );
  }
}
