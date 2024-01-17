import 'package:flutter/material.dart';
import 'package:shoping_app/global_variable.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, Object> product;
  // final Map<String, Object> cartService;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String selecteditem = "";
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
                    //for tesing purpose
                    final productItem = product[index];
                    // print("product item here for debugging $productItem");
                    final sizes =
                        (widget.product["sizes"] as List<String>)[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selecteditem = sizes;
                            // print("For testing $selecteditem");
                          });
                        },
                        child: Chip(
                            backgroundColor: selecteditem == sizes
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
                label: const Text("Add to Cart"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () => {
                  //get the product in specified index

                  // then add the product to the cart list
                },
              ),
            )
          ]),
        )
      ]),
    );
  }
}
