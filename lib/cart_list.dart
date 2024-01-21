import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/cart_list_provider.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CardListProvider>(context).cart;
    return Scaffold(
        body: ListView.builder(
      itemCount: cart.length,
      itemBuilder: ((context, index) {
        final cartItem = cart[index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
              cartItem["title"].toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(cartItem["sizes"].toString()),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(cartItem["imageurl"].toString()),
            ),
            trailing: GestureDetector(
              child: const Icon(Icons.delete),
              onTap: () {
                print("delete called");
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Remove from cart"),
                        content: const Text(
                            "Are you sure you want to remove from cart ?"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Provider.of<CardListProvider>(context,
                                        listen: false)
                                    .deleteFromCart(cartItem);
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "Yes",
                                style: TextStyle(color: Colors.blue),
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "No",
                                style: TextStyle(color: Colors.red),
                              ))
                        ],
                      );
                    });
              },
            ),
            iconColor: Colors.red,
          ),
        );
      }),
    ));
  }
}
