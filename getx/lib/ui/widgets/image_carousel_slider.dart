import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageCarouselSlider extends StatelessWidget {
  /// images path
  final List<String> items;
  final Color? dotColor;
  final double? imageHeight;
  final double topRadius;

  const ImageCarouselSlider({
    super.key,
    required this.items,
    this.dotColor,
    this.imageHeight,  
    this.topRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageSliderView(
          imageHeight: imageHeight,
          dotColor: dotColor,
          imagesPath: items,
          topRadius: topRadius,
        ),
        // const SizedBox(height: 10),
      ],
    );
  }
}

class ImageSliderView extends StatefulWidget {
  final List<String> imagesPath;
  final Color? dotColor;
  final double? imageHeight;
  final double topRadius;

  const ImageSliderView({
    super.key,
    this.imageHeight,
    required this.imagesPath,
    this.dotColor,
    this.topRadius = 12,
  });

  @override
  State<ImageSliderView> createState() => _ImageSliderViewState();
}

class _ImageSliderViewState extends State<ImageSliderView> {
  int _current = 0;
  final PageController _pageController = PageController();
  double defaultImageHeight = 200;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _current = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final counterView = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < widget.imagesPath.length; i++)
          Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color:
                  _current == i ? widget.dotColor ?? Colors.blue : Colors.grey,
            ),
          ),
      ],
    );

    return SizedBox(
      height: widget.imageHeight ?? defaultImageHeight,
      child: Stack(
        children: [
          PageView.builder(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            controller: _pageController,
            itemCount: widget.imagesPath.length,
            itemBuilder:
                (context, index) => ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(widget.topRadius),
                    topRight: Radius.circular(widget.topRadius),
                  ),
                  child: CachedNetworkImage(
                          imageUrl:
                              widget.imagesPath[index],
                          placeholder: (context, url) =>
                              const CupertinoActivityIndicator(),
                          errorWidget: (context, url, error) =>
                              Image.asset("assets/images/no_image.jpg"),
                          fit: BoxFit.cover,
                        )
                  
                  // Image.network(
                  //   widget.imagesPath[index],
                  //   alignment: Alignment.topCenter,
                  //   fit: BoxFit.cover,
                  // ),
                ),
          ),
          Positioned(bottom: 8, left: 0, right: 0, child: counterView),
        ],
      ),
    );
  }
}
