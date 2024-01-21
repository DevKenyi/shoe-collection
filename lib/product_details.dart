import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/cart_list_provider.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, Object> product;

  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String selectedShoesize = "";

  void onTap() {
    //print("Add to cart added"),
    if (selectedShoesize != "") {
      Provider.of<CardListProvider>(context, listen: false).addToCart(
        {
          'id': widget.product["id"],
          'title': widget.product['title'],
          'price': widget.product['price'],
          'imageurl': widget.product['imageurl'],
          'company': widget.product['company'],
          'sizes': selectedShoesize,
        },
      );

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Your product was added to cart successfully")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please, choose a shoe size")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product detail",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Column(children: [
        Text(
          widget.product["title"] as String,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(widget.product["imageurl"] as String),
        ),
        const Spacer(
          flex: 2,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          width: 500,
          height: 250,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.circular(40)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              " \$ ${widget.product["price"].toString()}",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final sizes =
                        (widget.product["sizes"] as List<String>)[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedShoesize = sizes;
                            // print("For testing $selecteditem");
                          });
                        },
                        child: Chip(
                            backgroundColor: selectedShoesize == sizes
                                ? Theme.of(context).primaryColor
                                : null,
                            label: Text(
                              sizes.toString(),
                            )),
                      ),
                    );
                  },
                  itemCount: (widget.product["sizes"] as List<String>).length),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.shopping_cart),
                label: const Text("Add to Cart Button"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: onTap,
              ),
            )
          ]),
        )
      ]),
    );
  }
}
