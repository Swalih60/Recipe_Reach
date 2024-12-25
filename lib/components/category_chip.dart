import 'package:flutter/material.dart';

Widget buildCategoryChip(
    {required String category, required Color clr, required Color txtclr}) {
  return Container(
    height: 35,
    width: 110,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: clr,
      borderRadius: BorderRadius.circular(40.0),
    ),
    child: Text(
      category,
      style: TextStyle(color: txtclr),
    ),
  );
}
