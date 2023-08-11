import 'package:flutter/material.dart';


class DetailPageAppBar extends StatefulWidget {
  const DetailPageAppBar({
    super.key,
  });

  @override
  State<DetailPageAppBar> createState() => _DetailPageAppBarState();
}

class _DetailPageAppBarState extends State<DetailPageAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 231, 228, 228),
              borderRadius: BorderRadius.circular(10)),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        const Text(
          "Product Detail",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 231, 228, 228),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: IconButton(
                  onPressed: () {
                    //  value.addFav(data[])
                  },
                  icon: const Icon(
                    Icons.favorite_sharp,
                  ))),
        ),
      ],
    );
  }
}
