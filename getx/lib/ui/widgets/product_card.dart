import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:getx/ui/widgets/image_carousel_slider.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.image,
    required this.price,
    required this.productName,
    required this.discount,
  });
  final List<dynamic> image;
  final String price;
  final String productName;
  final double discount;

  @override
  Widget build(BuildContext context) {
    List<String> images = List<String>.from(image);
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.zero,
          // width: 170,
          // height: 110,
          decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // SizedBox(height: 12),
              ImageCarouselSlider(
                items: images,

                dotColor: Theme.of(context).primaryColor,
                imageHeight: MediaQuery.of(context).size.height * 0.2,
              ),

              // Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                  top: 6,
                  left: 12,
                  right: 12,
                  bottom: 0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 3),
                    Text(
                      "$price ${"valyuta".tr()}",
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child:
              discount > 0
                  ? Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      color: Colors.green,
                    ),
                    child: Text(
                      "-${discount.toInt()}%",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  )
                  : SizedBox(),
        ),
      ],
    );
  }
}
