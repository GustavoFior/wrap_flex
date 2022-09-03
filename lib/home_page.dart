import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wrap/chui_wrap.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<int> _quantidadeTesteAux = ValueNotifier(0);
  final ValueNotifier<int> _quantidadeTeste = ValueNotifier(
      0); // TODO: Existe uma forma de fazer isso sem precisar de dois ValueNotifier?

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) => {
          _quantidadeTeste.value = _quantidadeTesteAux.value,
        });
  }

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
          child: ChuiWrap(
            overflowWidget: Container(
              height: 50,
              width: 100,
              color: Colors.yellow,
              child: ValueListenableBuilder(
                valueListenable: _quantidadeTeste,
                builder: (context, value, child) {
                  return Center(
                    child: Text(
                      '${_quantidadeTeste.value}',
                      style: const TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  );
                },
              ),
            ),
            maxLines: 1,
            spacing: 10,
            runSpacing: 10,
            countOverflowedWidgets: (_) {
              _quantidadeTesteAux.value = _;
              print('countOverflowedWidgets: $_');
            },
            direction: Axis.horizontal,
            children: List.generate(
              15,
              (index) => Container(
                height: 100,
                width: Random().nextInt(100).toDouble(),
                color: index % 2 == 0 ? Colors.red : Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
