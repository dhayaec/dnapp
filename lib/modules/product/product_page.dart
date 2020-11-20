import 'package:flutter/material.dart';
import "package:velocity_x/velocity_x.dart";

class ProductPage extends StatelessWidget {
  final int productId;

  const ProductPage({@required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: productId.text.make(),
      ),
      body: productId.text.xl.makeCentered(),
    );
  }
}
