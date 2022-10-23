import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../../data/models/home_model.dart';
import '../screens/shared/product_details_screen.dart';

// Prouct card to view products at home view
class ProductCardItemBuilder extends StatelessWidget {
  const ProductCardItemBuilder({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  final ProductModel product;
  final int index;
  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Recomnded For You',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          ProductCard(
            product: product,
          ),
        ],
      );
    }
    return SizedBox(
      height: index == 1 ? null : 255.0,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment:
            index % 2 == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          ProductCard(
            product: product,
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => ProductDetails(product: product),
        ),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 140.0,
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Image.network(product.image, fit: BoxFit.cover),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: AppColors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: FittedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.company,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(height: 3.0),
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${product.price} EGP',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                      gradient: LinearGradient(
                        stops: [0.2, 1.0],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: AppColors.scaffoldGradientBackground,
                        tileMode: TileMode.clamp,
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
