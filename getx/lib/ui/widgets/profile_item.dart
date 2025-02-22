import 'package:flutter/material.dart';
import 'package:getx/ui/widgets/on_tap_scale.dart';
import 'package:heroicons/heroicons.dart';

class ProfileItem extends StatelessWidget {
  final HeroIcons icon;
  final String item;
  final bool isLast;
  final Function() onTap;

  const ProfileItem({
    super.key,
    required this.icon,
    required this.item,
    this.isLast = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OnTapScaleAndFade(
      lowerBound: 0.99,
      onTap: onTap,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  children: [
                    HeroIcon(
                      icon,
                      size: 18,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        item,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.copyWith(fontSize: 15),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              HeroIcon(
                HeroIcons.chevronRight,
                size: 18,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
          isLast ? SizedBox(height: 0) : SizedBox(height: 24),
        ],
      ),
    );
  }
}
