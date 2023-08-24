import 'dart:io';


import 'package:e_commerce_app/screens/admin/product_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';


import '../../db/entity/category.dart';
import '../../db/entity/product.dart';
import '../../db/services/localdb_services.dart';

import '../favorite/fav_page_app_bar.dart';
// Import your AppDatabase

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  int? selectedCategoryId;
  List<Category> categories =
      []; // Populate with actual categories from database

  TextEditingController newCategoryController = TextEditingController();

  @override
  void initState() {
    super.initState();

    fetchCategories();
  }

  Future<void> fetchCategories() async {
    final fetchedCategories =
        await (await LocalDbService.categoryDap).getAllCategories();
    setState(() {
      categories = fetchedCategories;
    });
  }

  File? _selectedImage;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
 
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xfffe6d29),
                Color(0xffff9305),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FavPageAppBar(title: "Add Products"),
                  const SizedBox(height: 30),
                  AddProductsTextFields(
                    controller: titleController,
                    formKey: _formKey,
                    hintText: "Product Title",
                    validationText: 'Title',
                    textinput: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  AddProductsTextFields(
                    controller: typeController,
                    formKey: _formKey,
                    hintText: "Product Type",
                    validationText: 'Type',
                    textinput: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  AddProductsTextFields(
                    controller: descController,
                    formKey: _formKey,
                    hintText: "Product Description",
                    validationText: 'Description',
                    textinput: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  AddProductsTextFields(
                    controller: sizeController,
                    formKey: _formKey,
                    hintText: "Product Size",
                    validationText: 'Size',
                    textinput: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  AddProductsTextFields(
                    controller: priceController,
                    formKey: _formKey,
                    hintText: "Product Price",
                    validationText: 'Price',
                    textinput: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  AddProductsTextFields(
                    controller: discountController,
                    formKey: _formKey,
                    hintText: "Discounton",
                    validationText: null,
                    textinput: TextInputType.number,
                  ),

                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _selectedImage == null
                          ? Container(
                              height: 130,
                              width: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/default.jpg"))),
                            )
                          : Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: FileImage(
                                    File(_selectedImage!.path),
                                  ))),
                            ),
                      const SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white)),
                          onPressed: () {
                            _pickImage();
                          },
                          child: const Text(
                            "Add Image",
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
                  ),
                  const SizedBox(height: 16),
                  // ... Existing fields ...
                  DropdownButtonFormField<int>(
                    value: selectedCategoryId,
                    onChanged: (value) {
                      setState(() {
                        selectedCategoryId = value!;
                      });
                    },
                    items: categories.map((category) {
                      return DropdownMenuItem<int>(
                        value: category.id,
                        child: Text(category.name),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      labelText: 'Category',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      final newProduct = Product(
                        id: null,
                        description: descController.text,
                        image:
                            _selectedImage != null ? _selectedImage!.path : '',
                        type: typeController.text,
                        title: titleController.text,
                        size: sizeController.text,
                        price: double.parse(priceController.text),
                        discount: double.parse(discountController.text),
                        categoryId: selectedCategoryId!,
                        isFavorite: false,
                        isInCart: false,
                        // userEmail: null,
                      );

                      await (await LocalDbService.productDao)
                          .insertProduct(newProduct);

                      descController.clear();
                      imageController.clear();
                      typeController.clear();
                      titleController.clear();
                      discountController.clear();
                      sizeController.clear();

                      priceController.clear();
                    },
                    child: const Text('Add Product'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
