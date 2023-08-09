import 'package:e_commerce_app/db/entity/fav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/fav_provider.dart';
import '../provider/local_db_fav_provider.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {

   @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   Provider.of<LocalDBFavProvider>(context, listen: false)
    //       .fetchAllContacts(( Provider.of<LocalDBFavProvider>(context,listen: false).getfavItems));
    // });
  }

  @override
  Widget build(BuildContext context) {
    final favprovider = Provider.of<LocalDBFavProvider>(context);

 


  

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favriotes"),
      ),
      body: ListView.builder(
        itemCount: favprovider.getfavItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListTile(
                shape: RoundedRectangleBorder(
                  //<-- SEE HERE
                  side: const BorderSide(width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                leading: CircleAvatar(
                  backgroundColor: const Color(0xff6ae792),
                  backgroundImage: AssetImage(favprovider.getfavItems[index].image),
                ),
                title: Text(favprovider.getfavItems[index].title),
                subtitle: const Text('Item description'),
                trailing: IconButton(
                  onPressed: () async {
                    

                    if (favprovider.getfavItems.isNotEmpty) {
                      favprovider.isFav = true;
                    } else {
                      favprovider.isFav = false;
                    }

                  
                  },
                  icon: Icon(Icons.remove_circle),
                  color: Colors.red,
                )),
          );
        },
      ),
    );
  }
}
