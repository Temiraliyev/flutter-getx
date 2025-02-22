import 'package:get/get.dart';
import 'package:getx/models/product_model.dart';
import 'package:getx/services/api_service.dart';

class ProductsController extends GetxController {
  ProductsController() {
    getProducts();
  }
  var isLoading = false.obs;
  var products = <ProductModel>[].obs;

  void getProducts() async {
    changeLoading();
    products.value = await ApiService().getProducts();
    changeLoading();
  }

  changeLoading() {
    isLoading.value = !isLoading.value;
  }
}
