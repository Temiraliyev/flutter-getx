// ignore_for_file: unnecessary_null_comparison, unrelated_type_equality_checks, avoid_print, avoid_function_literals_in_foreach_calls, dead_code

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:getx/models/product_model.dart';
import 'package:getx/ui/widgets/image_carousel_slider.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({
    super.key,

    required this.onPressed,
    required this.product,
  });

  final Function() onPressed;
  final ProductModel product;
  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  Widget build(BuildContext context) {
    // List<double>? rat;
    // rat = widget.comment[0][rat];

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, toolbarHeight: 0),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CupertinoButton(
          color: Theme.of(context).primaryColor,
          child: Text(
            "add_to_cart".tr(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          onPressed: () {
            // if (isLogin) {
            //   final cart = Provider.of<CartProvider>(context, listen: false);
            //   cart.addToCart(widget.product);
            //   showSuccesToast(
            //     context,
            //     "add_to_cart_succes".tr(),
            //     "add_cart_desc_success_desc".tr(),
            //   );
            // } else {
            //   showAuth(context);
            //   showErrorToast(context, "sorry".tr(), "please_login".tr());
            // }
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  // height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                  child: ImageCarouselSlider(
                    items: [widget.product.image],
                    imageHeight: MediaQuery.of(context).size.height * 0.45,
                    dotColor: Theme.of(context).primaryColor,
                    topRadius: 0,
                  ),
                ),
                Positioned(
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 23,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      // closePage(context);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  widget.product.ratingModel.rate != 0
                      ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.product.ratingModel.rate.toString(),
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 27,
                                ),
                              ),
                              SizedBox(width: 6),
                              Text(
                                "valyuta".tr(),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              SizedBox(width: 12),
                              Container(
                                padding: EdgeInsets.only(
                                  top: 3,
                                  bottom: 3,
                                  right: 6,
                                  left: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  "${widget.product.ratingModel.rate.toStringAsFixed(0)}%",
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 3),
                          Text(
                            "${widget.product.price} ${"so'm".tr()}",
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.red,
                            ),
                          ),
                        ],
                      )
                      : Row(
                        children: [
                          Text(
                            widget.product.price.toString(),
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 27,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            "valyuta".tr(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),

                  SizedBox(height: 12),

                  SizedBox(height: 12),
                  Text(
                    widget.product.description,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(fontSize: 13),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:
                        true
                            ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      widget.product.ratingModel.rate
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(fontSize: 28),
                                      textAlign: TextAlign.justify,
                                    ),
                                    RatingBar.builder(
                                      itemSize: 25,
                                      initialRating: 2,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: EdgeInsets.symmetric(
                                        horizontal: 4.0,
                                      ),
                                      itemBuilder:
                                          (context, _) => Icon(
                                            Icons.star,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                      onRatingUpdate: (rating) {},
                                    ),
                                  ],
                                ),
                                // Text(
                                //   "${widget.comment.length}-ta sharh | 321-ta buyurtma",
                                //   style: Theme.of(context)
                                //       .textTheme
                                //       .labelLarge!
                                //       .copyWith(color: Colors.white54),
                                // ),
                              ],
                            )
                            : Center(
                              child: Text(
                                "no_comments".tr(),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                  ),

                  SizedBox(height: 24),

                  SizedBox(height: 12),
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   scrollDirection: Axis.vertical,
                  //   physics: NeverScrollableScrollPhysics(),
                  //   itemCount: comments.length,
                  //   itemBuilder: (context, index) {
                  //     return Stack(
                  //       children: [
                  //         Container(
                  //           margin: EdgeInsets.symmetric(vertical: 6),
                  //           width: double.infinity,
                  //           padding: EdgeInsets.all(12),
                  //           decoration: BoxDecoration(
                  //             color: Theme.of(context).secondaryHeaderColor,
                  //             borderRadius: BorderRadius.circular(12),
                  //           ),
                  //           child: Column(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Row(
                  //                 children: [
                  //                   CircleAvatar(
                  //                     radius: 25,
                  //                     child: ClipOval(
                  //                       child: CachedNetworkImage(
                  //                         imageUrl:
                  //                             comments[index]['photoUrl'],
                  //                         placeholder:
                  //                             (context, url) =>
                  //                                 const CupertinoActivityIndicator(),
                  //                         errorWidget:
                  //                             (
                  //                               context,
                  //                               url,
                  //                               error,
                  //                             ) => CircleAvatar(
                  //                               radius: 26,
                  //                               backgroundColor:
                  //                                   Theme.of(
                  //                                     context,
                  //                                   ).primaryColor,
                  //                               child: Center(
                  //                                 child: Text(
                  //                                   comments[index]['fullname'] !=
                  //                                               null &&
                  //                                           comments[index]['fullname']!
                  //                                               .isNotEmpty
                  //                                       ? comments[index]['fullname']![0]
                  //                                           .toUpperCase()
                  //                                       : '',
                  //                                   style:
                  //                                       Theme.of(
                  //                                         context,
                  //                                       ).textTheme.bodyLarge,
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                         fit: BoxFit.cover,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   SizedBox(width: 12),
                  //                   Column(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       Text(
                  //                         comments[index]['fullname'],
                  //                         style:
                  //                             Theme.of(
                  //                               context,
                  //                             ).textTheme.bodyMedium,
                  //                       ),

                  //                       RatingBar.builder(
                  //                         itemSize: 20,
                  //                         initialRating:
                  //                             comments[index]['rating']?[0] ??
                  //                             0,
                  //                         minRating: 1,
                  //                         direction: Axis.horizontal,
                  //                         allowHalfRating: true,
                  //                         itemCount: 5,
                  //                         itemPadding: EdgeInsets.symmetric(
                  //                           horizontal: 0.0,
                  //                         ),

                  //                         itemBuilder:
                  //                             (context, _) => Icon(
                  //                               Icons.star,
                  //                               color:
                  //                                   Theme.of(
                  //                                     context,
                  //                                   ).primaryColor,
                  //                             ),
                  //                         onRatingUpdate: (rating) {},
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ],
                  //               ),
                  //               SizedBox(height: 12),
                  //               Text(
                  //                 comments[index]['content'] ?? "Undefined",
                  //                 textAlign: TextAlign.left,
                  //                 style:
                  //                     Theme.of(context).textTheme.labelLarge,
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         Positioned(
                  //           bottom: 10,
                  //           right: 10,
                  //           child: Text(
                  //             DateFormat('dd-MMMM', 'ru_RU').format(
                  //               DateTime.parse(comments[index]['createdAt']),
                  //             ),
                  //             style: Theme.of(context).textTheme.bodyMedium!
                  //                 .copyWith(color: Colors.grey, fontSize: 14),
                  //           ),
                  //         ),
                  //       ],
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
