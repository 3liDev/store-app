import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';

class CategoriesService {
  Future<List<ProductModel>> getCategoriesServices(
      {required String categoryName}) async {
    List<ProductModel> data =
        // ignore: missing_required_param
        await Api().get(
            url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<ProductModel> categoriesList = [];
    for (int i = 0; i < data.length; i++) {
      categoriesList.add(ProductModel.fromjson(data[i]));
    }
    return categoriesList;
  }
}
