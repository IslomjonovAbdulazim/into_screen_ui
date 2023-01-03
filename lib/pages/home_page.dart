import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:into_screen_ui/pages/ui_1.dart';

import '../models/item_model.dart';

List<ItemModel> items = [
  ItemModel(
    title: '1-UI',
    page:  UI1(),
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Home page",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 15,
          ),
          children:
              items.map<HomeItem>((item) => HomeItem(item: item)).toList(),
        ),
      ),
    );
  }
}

class HomeItem extends StatelessWidget {
  final ItemModel item;

  const HomeItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.blueAccent,
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>  UI1(),
            ),
          );
        },
        title: Text(
          item.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        trailing: const Icon(
          CupertinoIcons.chevron_right,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
