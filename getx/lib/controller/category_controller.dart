import 'package:get/get.dart';
import 'package:getx/models/categories_model.dart';
import 'package:getx/services/api_service.dart';

class CategoryController extends GetxController {
  CategoryController() {
    getCategoties();
  }
  var isLoading = false.obs;
  var categories = <CategoriesModel>[].obs;

  changeLoading() {
    isLoading.value = !isLoading.value;
  }

  getCategoties() async {
    changeLoading();
    categories.value = await ApiService().getCategories();
    changeLoading();
  }
}
