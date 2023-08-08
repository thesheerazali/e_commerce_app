import 'package:e_commerce_app/Data/data.dart';
import 'package:e_commerce_app/provider/fav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/product_model.dart';
import '../../fav_screen.dart';

class SearchNotifBar extends StatefulWidget {
  const SearchNotifBar({
    super.key,
  });

  @override
  State<SearchNotifBar> createState() => _SearchNotifBarState();
}

class _SearchNotifBarState extends State<SearchNotifBar> {
  final TextEditingController _textEditingController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .075),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _textEditingController,
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  fillColor: const Color.fromARGB(255, 231, 228, 228),
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintText: "Search Country Name",
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Consumer<FavProvider>(
            builder: (context, value, child) => Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 231, 228, 228),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FavScreen(),
                          ));
                    },
                    icon: Icon(
                      Icons.favorite_sharp,
                      color: Colors.red,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}