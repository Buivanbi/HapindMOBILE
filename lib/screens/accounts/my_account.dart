// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:hapind/screens/accounts/components/my_box.dart';
import 'package:hapind/screens/accounts/components/my_tile.dart';

class MyAccount extends StatefulWidget {
  static String routeName = "/account";

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("USA"), value: "USA"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItems;
  }

  String selectedValue = "USA";
  String gender = "man";
  String _avatarUrl =
      //"https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/e44w6saipufr4qhbtesw";
      "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/lpckjnidqulkymh6r1da";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Account"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // first 4 boxes in grid
            AspectRatio(
              aspectRatio: 1,
              child: SizedBox(
                width: double.infinity,
                child: GridView.builder(
                  itemCount: 8,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return MyBox();
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Upload Images"),
            ),

            // list of previous days
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: 4,
            //     itemBuilder: (context, index) {
            //       return const MyTile();
            //     },
            //   ),
            // ),
            TextFormField(
              decoration: InputDecoration(
                label: Text("casas")
              ),
            ),
          ],
        ),
      ),
    );
  }
}
