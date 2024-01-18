import "package:flutter/material.dart";
import "package:shoping_app/cart_list.dart";

import "package:shoping_app/product_list.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPageIndex = 0;
  final List<Widget> page = [ProductList(), const CartList()];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPageIndex,
        children: page,
      ),
      bottomNavigationBar: BottomNavigationBar(
       
        currentIndex: currentPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "", ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              size: 30,
            ),
            label: "",
          )
        ],
        onTap: (value) {
          setState(() {
            currentPageIndex = value;
            print("for debugging $value");
          });
        },
      ),
    );
  }
}
