import 'package:get/get.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/update_product.dart';

class StoreController extends GetxController {
  String? title, description, image;
  String? price;
  ProductModel? productCard;
  bool isLoading = false;

  void updateHUD(bool state) {
    isLoading = state;
    update();
  }

  Future<void> updateProduct() async {
    // ignore: missing_required_param
    await UpdateProductService().updateProduct(
      id: productCard!.id.toString(),
      title: title == null ? productCard!.title : title!,
      price: price == null ? productCard!.price.toString() : price!,
      desc: description == null ? productCard!.description : description!,
      image: image == null ? productCard!.image : image!,
      category: productCard!.category,
      rating: RatingModel(
              rate: productCard!.rating.rate, count: productCard!.rating.count)
          .toString(),
    );

    update();
  }
}
