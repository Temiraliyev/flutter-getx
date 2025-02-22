import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/category_controller.dart';
import 'package:getx/controller/products_controller.dart';
import 'package:getx/ui/widgets/categories_widget.dart';
import 'package:getx/ui/widgets/on_tap_scale.dart';
import 'package:getx/ui/widgets/product_card.dart';
import 'package:getx/ui/widgets/product_info.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    ProductsController productsController = Get.put(ProductsController());
    CategoryController categoriesController = Get.put(CategoryController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(""),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          if (productsController.isLoading.value ||
              categoriesController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 145,
                    child: ListView.builder(
                      itemCount: categoriesController.categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return OnTapScaleAndFade(
                          onTap: () {
                            // openPage(context, ProductsByCategoryname(categoryName: categoryData.name));
                          },
                          lowerBound: 0.95,
                          child: CategoriesWidget(
                            title: categoriesController.categories[index].name,
                            image: productsController.products[index].image,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.79,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                    itemCount: productsController.products.length,
                    itemBuilder: (context, index) {
                      return OnTapScaleAndFade(
                        onTap: () {
                          Get.to(
                            ProductInfo(
                              onPressed: () {},
                              product: productsController.products[index],
                            ),
                          );
                          // openPage(context, ProductInfo(product: productsController.products[index]));
                        },
                        lowerBound: 0.99,
                        child: ProductCard(
                          image: [
                            productsController.products[index].image,
                            productsController.products[index].image,
                            productsController.products[index].image,
                          ],
                          price:
                              productsController.products[index].price
                                  .toString(),
                          productName: productsController.products[index].title,
                          discount: 12,
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
