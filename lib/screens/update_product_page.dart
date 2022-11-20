import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/controller/store_controller.dart';
import 'package:store/widgets/custom_bottom.dart';
import 'package:store/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class UpdateProductPage extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  UpdateProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreController>(
        init: StoreController(),
        builder: (controller) {
          return ModalProgressHUD(
            inAsyncCall: controller.isLoading,
            child: Scaffold(
                appBar: AppBar(
                  title: const Text(
                    'Update Product',
                    style: TextStyle(color: Colors.black),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  centerTitle: true,
                ),
                body: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          CustomTextField(
                            onChanged: (data) {
                              controller.title = data;
                            },
                            hintName: "Product Name",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            onChanged: (data) {
                              controller.description = data;
                            },
                            hintName: "description",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            inputTybe: TextInputType.number,
                            onChanged: (data) {
                              controller.price = data;
                            },
                            hintName: "price",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            onChanged: (data) {
                              controller.image = data;
                            },
                            hintName: "image",
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomButton(
                            onPressed: () async {
                              print(controller.updateProduct());
                              controller.updateHUD(true);
                              // await controller.updateProduct();
                              // try {
                              //    await controller.updateProduct();
                              // } catch (e) {
                              //   // ignore: avoid_print
                              //   print(e.toString());
                              // }
                              controller.updateHUD(false);
                            },
                            textName: 'Update',
                          ),
                        ],
                      ),
                    ))),
          );
        });
  }

  // Future<void> updateProduct() async {
  //   // ignore: missing_required_param
  //   await UpdateProductService().updateProduct(
  //       id: controller.productCard!.id,
  //       title: controller.productName == null
  //           ? controller.productCard!.title
  //           : controller.productName!,
  //       price: controller.price == null
  //           ? controller.productCard!.price.toString()
  //           : controller.price!,
  //       desc: controller.description == null
  //           ? controller.productCard!.description
  //           : controller.description!,
  //       image: controller.image == null
  //           ? controller.productCard!.image
  //           : controller.image!,
  //       category: controller.productCard!.category);
  // }
}
