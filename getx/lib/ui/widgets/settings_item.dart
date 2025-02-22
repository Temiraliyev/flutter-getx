import 'package:flutter/material.dart';
import 'package:getx/ui/widgets/on_tap_scale.dart';
import 'package:heroicons/heroicons.dart';

class SettingItem extends StatefulWidget {
  const SettingItem({
    super.key,
    required this.icon,
    required this.title,
    this.divider = false,
    this.subtitle = false,
    required this.subtitleText,
    this.image = false,
    this.assetImage = '',
    this.isLogin = false,
    this.heroIcon = HeroIcons.arrowLeft,
    required this.onTap,
  });

  final IconData icon;
  final HeroIcons heroIcon;
  final bool divider;
  final String title;
  final bool subtitle;
  final String subtitleText;
  final bool image;
  final String assetImage;
  final bool isLogin;
  final Function() onTap;

  @override
  State<SettingItem> createState() => _SettingItemState();
}

class _SettingItemState extends State<SettingItem> {
  @override
  Widget build(BuildContext context) {
    return OnTapScaleAndFade(
      lowerBound: 0.98,
      onTap: widget.onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child: Row(
              children: [
                widget.image
                    ? Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          widget.assetImage,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    )
                    : Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19),
                        color:
                            !widget.isLogin
                                ? Theme.of(context).secondaryHeaderColor
                                : Colors.transparent,
                      ),
                      child:
                          !widget.isLogin
                              ? Icon(
                                widget.icon,
                                color:
                                    !widget.isLogin
                                        ? Theme.of(context).primaryColor
                                        : Colors.redAccent,
                                size: 18,
                              )
                              : HeroIcon(
                                widget.heroIcon,
                                color: Colors.redAccent,
                                size: 25,
                              ),
                    ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    widget.title,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(fontSize: 17),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color:
                      !widget.isLogin
                          ? Theme.of(context).primaryColor
                          : Colors.redAccent,
                  size: 18,
                ),
              ],
            ),
          ),
          widget.divider
              ? Divider(color: Theme.of(context).dividerColor)
              : const SizedBox(),
        ],
      ),
    );
  }
}
