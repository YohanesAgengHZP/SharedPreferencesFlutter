import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_cart/tambah_barang.dart';
import 'boxes.dart';
import 'keranjang.dart';

class ListItem extends StatefulWidget {
  final String title;
  const ListItem({Key? key, required this.title}) : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Hive.openBox<Item>(HiveBoxes.cart);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Item>(HiveBoxes.cart).listenable(),
        builder: (context, Box<Item> box, _) {
          if (box.values.isEmpty) {
            return Center(
              child: Text('Items is Empty'),
            );
          }
          return ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (context, index) {
              Item? res = box.getAt(index);
              return Dismissible(
                background: Container(
                  color: Colors.red,
                ),
                key: UniqueKey(),
                onDismissed: (direction) {
                  res!.delete();
                },
                child: ListTile(
                  title: Text(res!.title),
                  subtitle: Text(res.description),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Tambah Barang',
        child: Icon(Icons.add),
        onPressed: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Tambah()))
        },
      ),
    );
  }
}
