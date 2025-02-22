import 'package:flutter/material.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({
    super.key,
    required this.onChange,
    required this.items,
  });

  final List<CustomBottomNavItem> items;
  final Function(int) onChange;

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).dividerColor,
            offset: const Offset(0, -0.5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: widget.items
              .map(
                (item) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = widget.items.indexOf(item);
                      });
                      widget.onChange(selectedIndex);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.fastOutSlowIn,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Opacity(
                          opacity: selectedIndex == widget.items.indexOf(item)
                              ? 1
                              : 0.6,
                          child: Column(
                            children: [
                              Image.asset(
                                item.assetImage,
                                width: 28,
                                height: 28,
                                color:
                                    selectedIndex == widget.items.indexOf(item)
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .color,
                              ),
                              // Text(
                              //   item.label,
                              //   maxLines: 1,
                              //   softWrap: false,
                              //   overflow: TextOverflow.ellipsis,
                              //   style: selectedIndex ==
                              //           widget.items.indexOf(item)
                              //       ? Theme.of(context)
                              //           .textTheme
                              //           .titleSmall!
                              //           .copyWith(
                              //               color:
                              //                   Theme.of(context).primaryColor,
                              //               fontWeight: FontWeight.bold)
                              //       : Theme.of(context).textTheme.titleSmall,
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class CustomBottomNavItem {
  Widget content;
  String assetImage = "assets/images/profile.png";
  

  CustomBottomNavItem(
    this.content,
    this.assetImage,
    
  );
}
