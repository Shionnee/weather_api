import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyText extends StatelessWidget {
  String? textData;
  double? size;

  MyText({
    Key? key,
    this.textData,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textData!,
      style: TextStyle(
          fontSize: size, color: Theme.of(context).colorScheme.onPrimary),
    );
  }
}
