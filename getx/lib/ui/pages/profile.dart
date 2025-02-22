// ignore_for_file: dead_code

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx/ui/widgets/cross_button.dart';
import 'package:getx/ui/widgets/profile_card.dart';
import 'package:getx/ui/widgets/profile_item.dart';
import 'package:getx/ui/widgets/settings_item.dart';
import 'package:heroicons/heroicons.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLogin = true;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "profile".tr(),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: false,

        actions: [
          CrossButton(
            onPressed: () {
              // _themeProvider?.toggleTheme();
              // setState(() {
              //   theme = !theme;
              // }
              // );
            },
            child:
                true
                    ? Icon(
                      CupertinoIcons.moon,
                      color: Theme.of(context).primaryColor,
                    )
                    : Icon(
                      CupertinoIcons.sun_max,
                      color: Theme.of(context).primaryColor,
                    ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
            child: Column(
              children: [
                //profile
                isLogin
                    ? Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor:
                              Theme.of(context).secondaryHeaderColor,
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://avatars.githubusercontent.com/u/156788797?s=48&v=4",
                              placeholder:
                                  (context, url) =>
                                      const CupertinoActivityIndicator(),
                              errorWidget:
                                  (context, url, error) => CircleAvatar(
                                    radius: 26,
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    child: Center(
                                      child: Text(
                                        "M",
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.bodyLarge,
                                      ),
                                    ),
                                  ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Mujibali Temiraliyev",
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyLarge!.copyWith(fontSize: 16),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "temiraliyevmujibali@gmail.com",
                                style: Theme.of(context).textTheme.bodySmall,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                    : Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: CupertinoButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                "login_to_account".tr(),
                                style: Theme.of(context).textTheme.bodyLarge,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 6),
                            Icon(
                              CupertinoIcons.arrow_right_circle,
                              size: 30,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ],
                        ),
                        onPressed: () async {
                          // await showAuth(context);
                        },
                      ),
                    ),

                SizedBox(height: 30),
                isLogin
                    ? ProfileCard(
                      title: "profile".tr(),
                      child: Column(
                        children: [
                          ProfileItem(
                            icon: HeroIcons.user,
                            item: "update_profile".tr(),
                            onTap: () async {
                              // bool? isUpdated = await Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => UpdateProfile(),
                              //   ),
                              // );
                              // if (isUpdated == true) {
                              //   // Refresh the profile if updated
                              //   // await refresh(true);
                              // }
                            },
                          ),
                          ProfileItem(
                            icon: HeroIcons.trash,
                            item: "delete_account".tr(),
                            onTap: () {
                              // showConfirmDialog(
                              //   context,
                              //   "title",
                              //   "delete_your_account".tr(),
                              //   "cancel".tr(),
                              //   "delete".tr(),
                              //   () {
                              //     // Database().deleteAccount(context);
                              //   },
                              // );
                            },
                            isLast: true,
                          ),
                        ],
                      ),
                    )
                    : SizedBox(),
                SizedBox(height: 24),
                ProfileCard(
                  title: "settings".tr(),
                  child: Column(
                    children: [
                      ProfileItem(
                        icon: HeroIcons.language,
                        item: "select_language".tr(),
                        onTap: () {
                          // openPage(context, LangSelectPage());
                        },
                      ),
                      ProfileItem(
                        icon: HeroIcons.questionMarkCircle,
                        item: "help_support".tr(),
                        onTap: () async {
                          // await EasyLauncher.url(
                          //   url: "https://t.me/+hmL--RZHm1w5NjYy",
                          //   mode: Mode.platformDefault,
                          // );
                        },
                      ),
                      // ProfileItem(
                      //   icon: HeroIcons.share,
                      //   item: "invite_friends".tr(),
                      //   onTap: () {
                      //     Share.share(
                      //       'https://www.atestatsiya.uz',
                      //       subject:
                      //           'AttestatsiyaUZ - Kasbiy yuksalishni istovchilar uchun!',
                      //     );
                      //   },
                      // ),
                      ProfileItem(
                        icon: HeroIcons.shieldCheck,
                        item: "privacy_policy".tr(),
                        onTap: () async {
                          // await EasyLauncher.url(
                          //   url: "https://uniquemobile-privacy.netlify.app/",
                          //   mode: Mode.platformDefault,
                          // );
                        },
                      ),
                      ProfileItem(
                        icon: HeroIcons.informationCircle,
                        item: "about_app".tr(),
                        onTap: () {
                          // openPage(context, AboutApp());
                        },
                        isLast: true,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24),
                isLogin
                    ? ProfileCard(
                      title: "title",
                      isTitle: false,

                      child: SettingItem(
                        icon: CupertinoIcons.arrow_left_square,
                        title: "log_out".tr(),
                        subtitleText: "subtitleText",
                        isLogin: true,
                        heroIcon: HeroIcons.arrowLeftStartOnRectangle,
                        onTap: () {
                          // Auth().signOut(context);
                        },
                      ),
                    )
                    : SizedBox(),

                // SizedBox(height: 36),
                // ProfileCard(
                //   title: "admin".tr(),
                //   child: Column(
                //     children: [
                //       ProfileItem(
                //         icon: HeroIcons.plus,
                //         item: "create".tr(),
                //         onTap: () {
                //           openPage(context, CreatePage());
                //         },
                //       ),
                //       ProfileItem(
                //         icon: HeroIcons.pencil,
                //         item: "update".tr(),
                //         onTap: () {
                //           openPage(context, Update());
                //         },
                //       ),

                //       ProfileItem(
                //         icon: HeroIcons.trash,
                //         item: "delete".tr(),
                //         onTap: () {
                //           openPage(context, Delete());
                //         },
                //       ),
                //       ProfileItem(
                //         icon: HeroIcons.shoppingBag,
                //         item: "orders_admin".tr(),
                //         isLast: true,

                //         onTap: () {
                //           openPage(context, OrdersAdmin());
                //         },
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(height: 24),
                Text(
                  "MOBICRAFT",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontSize: 12),
                ),
                Text(
                  "© Copyrights 2025",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
