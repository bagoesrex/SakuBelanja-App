import 'package:sakubelanja_app/data/categories.dart';
import 'package:sakubelanja_app/models/category.dart';
import 'package:sakubelanja_app/models/grocery_item.dart';

final groceryItems = [
  GroceryItem(
    id: 'a',
    name: 'Susu',
    quantity: 1,
    category: categories[Categories.rumah]!,
  ),
  GroceryItem(
    id: 'b',
    name: 'Pisang',
    quantity: 5,
    category: categories[Categories.segar]!,
  ),
  GroceryItem(
    id: 'c',
    name: 'Daging Sapi',
    quantity: 1,
    category: categories[Categories.dapur]!,
  ),
  GroceryItem(
    id: 'd',
    name: 'Mie Instan',
    quantity: 2,
    category: categories[Categories.cepat]!,
  ),
  GroceryItem(
    id: 'e',
    name: 'Sabun Mandi',
    quantity: 3,
    category: categories[Categories.pribadi]!,
  ),
];
