import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../db/entity/fav.dart';
import '../../provider/local_db_fav_provider.dart';
import 'fav_page_app_bar.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * .06,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const FavPageAppBar(),
                const SizedBox(
                  height: 20,
                ),
                Consumer<LocalDBFavProvider>(
                  builder: (context, value, child) => Expanded(
                    child: ListView.builder(
                      itemCount: value.getfavItems.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: size.width * .02),
                          child: ListTile(
                              shape: RoundedRectangleBorder(
                                //<-- SEE HERE
                                side: const BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(255, 231, 228, 228),
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              leading: CircleAvatar(
                                backgroundColor: const Color(0xff6ae792),
                                backgroundImage:
                                    AssetImage(value.getfavItems[index].image),
                              ),
                              title: Text(value.getfavItems[index].title),
                              subtitle: Text(value.getfavItems[index].title),
                              trailing: IconButton(
                                onPressed: () {
                                  Fav fav = Fav(
                                    uid: "NOT_SIGN_IN",
                                      productId: value.getfavItems[index].productId,
                                      title: value.getfavItems[index].title,
                                      type: value.getfavItems[index].type,
                                      image: value.getfavItems[index].image,
                                      price: value.getfavItems[index].price,
                                      quaintity:
                                          value.getfavItems[index].quaintity);
                                  value.deleteItem(fav);

                                  value.fetchAllContacts();
                                },
                                icon: Icon(Icons.remove_circle),
                                color: Colors.red,
                              )),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
