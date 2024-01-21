import 'package:flutter/material.dart';
import 'package:shoping_app/global_variable.dart';
import 'package:shoping_app/product_card.dart';
import 'package:shoping_app/product_details.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final outLinInputBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(13, 13, 13, 0.6)),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(30)));

  final List<String> companyFilters = ["All", "Addidas", "Nike", "Balagiaga"];
  late String selectedFilter;

  @override
  Widget build(BuildContext context) {
    selectedFilter = companyFilters[0];
    // print("inite function called $selectedFilter");
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Shoe\nCollections",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: outLinInputBorder,
                        enabledBorder: outLinInputBorder,
                        //implement search functionality in second release
                        prefixIcon: const Icon(Icons.search),
                        hintText: "Search",
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: companyFilters.length,
                itemBuilder: (context, index) {
                  final textValue = companyFilters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: GestureDetector(
                          //Todo: 1. Filters are not working

                          onTap: () {
                            setState(() {
                              selectedFilter = textValue;
                            });
                          },
                          child: Chip(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            backgroundColor: selectedFilter == textValue
                                ? Theme.of(context).primaryColor
                                : const Color.fromRGBO(245, 247, 249, 1),
                            side: const BorderSide(
                                color: Color.fromRGBO(245, 247, 249, 1)),
                            label: Text(textValue),
                          )),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: product.length,
                itemBuilder: (context, index) {
                  var productList = product[index];

                  return GestureDetector(
                    onTap: () => {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ProductDetails(product: productList);
                      })),
                      // print("$productList} ")
                    },
                    child: ProductCards(
                      color: index.isEven
                          ? const Color.fromRGBO(216, 240, 253, 1)
                          : const Color.fromRGBO(245, 247, 249, 1),
                      title: productList["title"] as String,
                      price: productList["price"] as double,
                      image: productList["imageurl"] as String,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
