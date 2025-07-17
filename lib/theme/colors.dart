import 'package:flutter/material.dart';

const Map<String, Color> ratingColors = {
  'S': Colors.red,
  'A': Colors.orange,
  'B': Colors.yellow,
  'C': Colors.lightGreen,
  'D': Colors.green,
  'E': Colors.grey,
};

Color getColorForRating(String rating) {
  return ratingColors[rating] ?? Colors.black;
}
