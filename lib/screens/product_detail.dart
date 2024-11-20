import 'package:flutter/material.dart';
import 'package:sportify_mobile/models/product_entry.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductEntry product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: Text(
          widget.product.fields.name,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Warna latar belakang AppBar diambil dari skema warna tema aplikasi.
        backgroundColor: Color(0x17FFFFFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100)
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(widget.product.fields.name, style: TextStyle(color: Colors.white)),
            Text(widget.product.fields.price.toString(), style: TextStyle(color: Colors.white),),
            Text(widget.product.fields.description, style: TextStyle(color: Colors.white),),
            Text(widget.product.fields.stock.toString(), style: TextStyle(color: Colors.white),),
          ],
        ),
      )
    );
  }
}