import 'dart:io';

import 'package:flutter/material.dart';

import '../../../db/entity/product.dart';

// ignore: must_be_immutable
class SelectPicture extends StatefulWidget {
  List<Product> productData;
  final int index;
  SelectPicture({
    super.key,
    required this.productData,
    required this.index,
  });

  @override
  State<SelectPicture> createState() => _SelectPictureState();
}

class _SelectPictureState extends State<SelectPicture> {
  static int currentPictureSelected = 0;



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: size.width * .02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                currentPictureSelected = 0;
              });
            },
            child: widget.productData[widget.index].image.startsWith('assets/')
                ? Container(
                    width: size.width * .16,
                    height: size.height * .1,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              widget.productData[widget.index].image),
                          fit: BoxFit.fill),
                      border: currentPictureSelected == 0
                          ? Border.all(
                              color: const Color.fromARGB(255, 87, 83, 83),
                              width: 2)
                          : Border.all(color: Colors.white, width: 0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )
                : Container(
                    width: size.width * .16,
                    height: size.height * .1,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: FileImage(
                              File(widget.productData[widget.index].image)),
                          fit: BoxFit.fill),
                      border: currentPictureSelected == 0
                          ? Border.all(
                              color: const Color.fromARGB(255, 87, 83, 83),
                              width: 2)
                          : Border.all(color: Colors.white, width: 0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                currentPictureSelected = 1;
              });
            },
            child: widget.productData[widget.index].image.startsWith('assets/')
                ? Container(
                    width: size.width * .16,
                    height: size.height * .1,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              widget.productData[widget.index].image),
                          fit: BoxFit.fill),
                      border: currentPictureSelected == 1
                          ? Border.all(
                              color: const Color.fromARGB(255, 87, 83, 83),
                              width: 2)
                          : Border.all(color: Colors.white, width: 0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )
                : Container(
                    width: size.width * .16,
                    height: size.height * .1,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: FileImage(
                              File(widget.productData[widget.index].image)),
                          fit: BoxFit.fill),
                      border: currentPictureSelected == 1
                          ? Border.all(
                              color: const Color.fromARGB(255, 87, 83, 83),
                              width: 2)
                          : Border.all(color: Colors.white, width: 0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                currentPictureSelected = 2;
              });
            },
            child: widget.productData[widget.index].image.startsWith('assets/')
                ? Container(
                    width: size.width * .16,
                    height: size.height * .1,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              widget.productData[widget.index].image),
                          fit: BoxFit.fill),
                      border: currentPictureSelected == 2
                          ? Border.all(
                              color: const Color.fromARGB(255, 87, 83, 83),
                              width: 2)
                          : Border.all(color: Colors.white, width: 0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )
                : Container(
                    width: size.width * .16,
                    height: size.height * .1,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: FileImage(
                              File(widget.productData[widget.index].image)),
                          fit: BoxFit.fill),
                      border: currentPictureSelected == 2
                          ? Border.all(
                              color: const Color.fromARGB(255, 87, 83, 83),
                              width: 2)
                          : Border.all(color: Colors.white, width: 0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                currentPictureSelected = 3;
              });
            },
            child: widget.productData[widget.index].image.startsWith('assets/')
                ? Container(
                    width: size.width * .16,
                    height: size.height * .1,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              widget.productData[widget.index].image),
                          fit: BoxFit.fill),
                      border: currentPictureSelected == 3
                          ? Border.all(
                              color: const Color.fromARGB(255, 87, 83, 83),
                              width: 2)
                          : Border.all(color: Colors.white, width: 0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )
                : Container(
                    width: size.width * .16,
                    height: size.height * .1,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: FileImage(
                              File(widget.productData[widget.index].image)),
                          fit: BoxFit.fill),
                      border: currentPictureSelected == 3
                          ? Border.all(
                              color: const Color.fromARGB(255, 87, 83, 83),
                              width: 2)
                          : Border.all(color: Colors.white, width: 0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
