import 'package:flutter/material.dart';

enum Categories {
  segar,
  beku,
  camilan,
  minuman,
  rumah,
  pribadi,
  cepat,
  dapur,
  hewan,
  lainnya
}


class Category {
  const Category(this.title, this.color);

  final String title;
  final Color color;
}