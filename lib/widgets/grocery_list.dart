import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:sakubelanja_app/data/categories.dart';
import 'package:sakubelanja_app/models/grocery_item.dart';
import 'package:sakubelanja_app/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];
  late Future<List<GroceryItem>> _loadedItems;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadedItems = _loadItems();
  }

  Future<List<GroceryItem>> _loadItems() async {
    final url = Uri.https(
      'sakubelanja-app-default-rtdb.firebaseio.com',
      'sakubelanja.json',
    );

    final response = await http.get(url);

    print(response.statusCode);
    if (response.statusCode >= 400) {
      throw Exception('Gagal memuat data. Silahkan coba lagi.');
    }

    print(response.body);
    if (response.body == 'null') {
      return [];
    }

    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> loadedItems = [];
    for (final item in listData.entries) {
      final category =
          categories.entries
              .firstWhere(
                (categoryItem) =>
                    categoryItem.value.title == item.value['category'],
              )
              .value;
      loadedItems.add(
        GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category,
        ),
      );
    }
    return loadedItems;
  }

  void _addItem() async {
    final newItem = await Navigator.of(
      context,
    ).push<GroceryItem>(MaterialPageRoute(builder: (ctx) => NewItem()));

    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) async {
    final index = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });

    final url = Uri.https(
      'sakubelanja-app-default-rtdb.firebaseio.com',
      'sakubelanja/${item.id}.json',
    );

    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      setState(() {
        _groceryItems.insert(index, item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Belanjaan'),
        actions: [IconButton(onPressed: _addItem, icon: const Icon(Icons.add))],
      ),
      body: FutureBuilder(
        future: _loadedItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada item.'));
          }

          print(snapshot.data);
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder:
                (ctx, index) => Dismissible(
                  onDismissed: (direction) {
                    _removeItem(snapshot.data![index]);
                  },
                  key: ValueKey(snapshot.data![index].id),
                  child: ListTile(
                    title: Text(snapshot.data![index].name),
                    leading: Container(
                      width: 24,
                      height: 24,
                      color: snapshot.data![index].category.color,
                    ),
                    trailing: Text(snapshot.data![index].quantity.toString()),
                  ),
                ),
          );
        },
      ),
    );
  }
}
