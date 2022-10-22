import 'package:flutter/material.dart';

import '../../../data/models/home_model.dart';
import '../../styles/colors.dart';
import '../../view/custom_button_builder.dart';
import '../../view/scaffold_background_builder.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ScaffoldBackGroundBuilder(),
        Scaffold(
          appBar: AppBar(
            leading: SizedBox(
              height: 70.0,
              width: 70.0,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Center(
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 6.0),
                Text(
                  'Type: ${product.type}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  height: 300,
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Image(
                        image: NetworkImage(product.image),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(height: 7.0),
                          Text(
                            '${product.price} EGP',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: CustomButtonBuilder(
                        borderRadius: 10.0,
                        onTap: () {},
                        title: 'Add to cart',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height:16.0)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
