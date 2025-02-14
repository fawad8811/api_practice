import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hiring_task_fawad/constants/text_styles.dart';
import 'package:hiring_task_fawad/screens/favorites_screen.dart';
import 'package:hiring_task_fawad/screens/products_screen.dart';
import 'package:hiring_task_fawad/screens/profile_screen.dart';
import 'package:responsive_config/responsive_config.dart';
import 'package:get/get.dart';
import '../generated/assets.dart';
import 'categories_screen.dart';

class NavBarScreen extends StatefulWidget {
  final int selectedIndex;

  const NavBarScreen({super.key, this.selectedIndex = 0});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  static final List<Widget> _screens = [
    const ProductsScreen(),
    const CategoriesScreen(),
    FavouritesScreen(),
    const ProfileScreen(),
  ];

  static final List<NavigationItem> _navItems = [
    NavigationItem(label: "Products", icon: Assets.svgPicturesNavbarProductIcon),
    NavigationItem(label: "Categories", icon: Assets.svgPicturesNavbarCategoriesIcon),
    NavigationItem(label: "Favourites", icon: Assets.svgPicturesNavbarFavoritesIcon),
    NavigationItem(label: "Mitt konto", icon: Assets.svgPicturesNavbarProfileIcon),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Prevent default back navigation
      onPopInvoked: (didPop) async {
        if (didPop) return;

        if (_selectedIndex == 0) {
          // If on index 0 (Products), show exit confirmation
          bool? exitApp = await _showExitConfirmationDialog(context);
          if (exitApp == true) {
            Get.back(); // Exit the app
          }
        } else {
          // If on any other index, go back to index 0 (Products)
          setState(() {
            _selectedIndex = 0;
          });
        }
      },
      child: Scaffold(
        body: IndexedStack(index: _selectedIndex, children: _screens),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(color: Colors.black, borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5))),
          padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              _navItems.length,
              (index) => GestureDetector(
                onTap: () => _onItemTapped(index),
                child: IconBottomBar(
                  text: _navItems[index].label,
                  icon: _navItems[index].icon,
                  selected: _selectedIndex == index,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Confirmation Dialog for App Exit
  Future<bool?> _showExitConfirmationDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text("Exit App"),
        content: const Text("Are you sure you want to exit the app?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false), // Cancel
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () => exit(0), // Confirm Exit
            child: const Text("Exit"),
          ),
        ],
      ),
    );
  }
}

class NavigationItem {
  final String label;
  final String icon;

  const NavigationItem({required this.label, required this.icon});
}

class IconBottomBar extends StatelessWidget {
  final String text;
  final String icon;
  final bool selected;

  const IconBottomBar({
    super.key,
    required this.text,
    required this.icon,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(icon, height: getProportionateScreenHeight(24), colorFilter: ColorFilter.mode(Color(0XFFF2F2F2), BlendMode.srcIn)),
        SizedBox(height: getProportionateScreenHeight(5)),
        Text(text, style: MyTextStyle.f12W400(context, color: Color(0XFFF2F2F2))),
      ],
    );
  }
}
