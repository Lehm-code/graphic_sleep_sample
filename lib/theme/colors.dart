import 'package:flutter/material.dart';

const Map<String, Color> ratingColors = {
  '日': Colors.red,
  '月': Colors.grey,
  '火': Colors.grey,
  '水': Colors.grey,
  '木': Colors.grey,
  '金': Colors.grey,
  '土': Colors.blue,
};

Color getColorForRating(String rating) {
  return ratingColors[rating] ?? Colors.black;
}
