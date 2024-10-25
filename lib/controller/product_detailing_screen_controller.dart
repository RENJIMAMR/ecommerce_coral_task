import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_application/model/home_screen/product_model.dart';

class ProductdetailScreenController extends GetxController {
  ProductsModel? productDetailObj;
  bool isLoading = false;
//get product details according to id
  Future<void> getProductDetails({required String id}) async {
    isLoading = true;
    update();
    try {
      final url = Uri.parse("https://fakestoreapi.com/products/$id");
      var res = await http.get(url);
      if (res.statusCode == 200) {
        productDetailObj = productsDetailsModelFromJson(res.body);
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    update();
  }
}
