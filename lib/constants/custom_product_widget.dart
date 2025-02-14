import 'package:flutter/material.dart';
import 'package:hiring_task_fawad/constants/text_styles.dart';
import 'package:responsive_config/responsive_config.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final double rating;
  final String category;
  final String brand;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.rating,
    required this.category,
    required this.brand,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
        elevation: 1,
        margin: EdgeInsets.only(bottom: getProportionateScreenHeight(20)),
        child: Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(15), right: getProportionateScreenWidth(15), bottom: getProportionateScreenHeight(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: getProportionateScreenHeight(15)),
                  width: ResponsiveConfig.screenWidth,
                  height: getProportionateScreenHeight(172),
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)), child: Image.network(imagePath, fit: BoxFit.cover))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(rating.toString(), style: const TextStyle(fontSize: 14)),
                  SizedBox(width: 5),
                  Row(
                    children: List.generate(5, (index) => const Icon(Icons.star, size: 14, color: Colors.amber)),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(5)),
              Text(brand, style: MyTextStyle.f11W400(context, color: Colors.black.withValues(alpha: 0.5), fontFamily: 'poppins')),
              SizedBox(height: getProportionateScreenHeight(5)),
              Text(category, style: MyTextStyle.f12W400(context, fontFamily: 'poppins')),
            ],
          ),
        ),
      ),
    );
  }
}
