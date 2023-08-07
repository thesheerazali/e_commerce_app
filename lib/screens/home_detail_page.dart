import 'package:flutter/material.dart';

import '../custom_widgets/deatail_page_appBar.dart';
import '../custom_widgets/detail_page_pictureVeiw.dart';
import '../model/product_model.dart';
import 'package:readmore/readmore.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.productdata});

  final ProductModel productdata;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: detailPageBottomNavigationBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const DetailPageAppBar(),
            const SizedBox(
              height: 20,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 15,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: widget.productdata.image.image,
                  fit: BoxFit.fill,
                  height: size.height * 0.40,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: size.width * .025),
                      child: Text(
                        widget.productdata.type,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * .025),
                      child: Text(
                        widget.productdata.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .013,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * .025),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 25,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Center(
                                child: Text(
                                  "Save ${widget.productdata.sale}%",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                              )),
                          const Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Color.fromARGB(255, 245, 234, 133),
                                size: 20,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "4.3",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("(356 Reveiws)"),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * .013,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * .025),
                      child: const Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .013,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * .025),
                      child: ReadMoreText(
                        widget.productdata.description,
                        trimLines: 3,
                        preDataTextStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 18),
                        colorClickableText: Colors.black,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: '...Show more',
                        trimExpandedText: ' show less',
                      ),
                    ),
                    SizedBox(
                      height: size.height * .013,
                    ),
                    SelectPicture(
                      productdata: widget.productdata,
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget detailPageBottomNavigationBar() {
    Size size = MediaQuery.of(context).size;
    return BottomAppBar(
      height: size.height * .08,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .075),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: size.width * .02),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  const Text(
                    "\$",
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                  Text(
                    widget.productdata.price.toString(),
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * .060,
              width: size.width * .35,
              child: ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                ),
                child: const Text(
                  "+ Add to Cart",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
