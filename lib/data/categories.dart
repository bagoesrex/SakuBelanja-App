import 'package:flutter/material.dart';
import 'package:sakubelanja_app/models/category.dart';

const categories = {
  Categories.segar: Category(
    'Segar',
    Color.fromARGB(255, 76, 175, 80),
  ),
  Categories.beku: Category(
    'Beku',
    Color.fromARGB(255, 0, 150, 136),
  ),
  Categories.camilan: Category(
    'Camilan',
    Color.fromARGB(255, 255, 87, 34),
  ),
  Categories.minuman: Category(
    'Minuman',
    Color.fromARGB(255, 33, 150, 243),
  ),
  Categories.rumah: Category(
    'Kebutuhan Rumah',
    Color.fromARGB(255, 103, 58, 183),
  ),
  Categories.pribadi: Category(
    'Kebutuhan Pribadi',
    Color.fromARGB(255, 255, 64, 129),
  ),
  Categories.cepat: Category(
    'Makanan Cepat Saji',
    Color.fromARGB(255, 255, 193, 7),
  ),
  Categories.dapur: Category(
    'Bahan Dapur',
    Color.fromARGB(255, 255, 87, 34),
  ),
  Categories.hewan: Category(
    'Hewan Peliharaan',
    Color.fromARGB(255, 255, 152, 0),
  ),
  Categories.lainnya: Category(
    'Lainnya',
    Color.fromARGB(255, 0, 188, 212),
  ),
};
