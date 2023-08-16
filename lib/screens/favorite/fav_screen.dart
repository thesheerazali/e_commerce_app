
import 'package:e_commerce_app/db/services/localdb_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../db/entity/fav.dart';
import '../../provider/local_db_fav_provider.dart';
import 'fav_page_app_bar.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({
    super.key,
  });

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  Future<List<Fav>> datafectFromEmail() async {
    // var emails = await (await LocalDbService.usersDao)
    //     .getEmailByEmail(emailController.text);
    var value = Provider.of<LocalDBFavProvider>(context);

    var email = await (await LocalDbService.favDao)
        .getFavoritesForUser(value.emailController.text);

    value.fetchAllContacts();

    return email;
  }

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
                FutureBuilder<List<Fav?>>(
                  future: datafectFromEmail(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data == null) {
                      return const Text('User not found.');
                    } else {
                      final email = snapshot.data!;
                      return Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.width * .02),
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
                                        AssetImage(email[index]!.image!),
                                  ),
                                  title: Text(email[index]!.title!),
                                  subtitle: Text(email[index]!.title!),
                                  trailing: IconButton(
                                    onPressed: () {
                                      var value =
                                          Provider.of<LocalDBFavProvider>(
                                              context,
                                              listen: false);

                                      Fav fav = Fav(
                                          uid: email[index]!.uid,
                                          productId: email[index]!.productId,
                                          title: email[index]!.title,
                                          type: email[index]!.type,
                                          image: email[index]!.image,
                                          price: email[index]!.price,
                                          quaintity: email[index]!.quaintity);
                                      value.deleteItem(fav);

                                      value.fetchAllContacts();
                                    },
                                    icon: const Icon(Icons.remove_circle),
                                    color: Colors.red,
                                  )),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          )),
    );
  }
}
