import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/home_cubit/home_cubit.dart';
import '../../../constants/assets_manager.dart';
import '../../../constants/strings_manager.dart';
import '../../../data/models/home_model.dart';
import '../../styles/colors.dart';
import '../../view/custom_text_field_builder.dart';
import '../../view/product_card_item_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    HomeCubit.get(context).getHomeData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeSucessState) {
          return _getContentWidget(state.products);
        } else if (state is HomeFailureState) {
          return _getErrorContent(state.message);
        }
        return const SizedBox();
      },
    );
  }

  Widget _getErrorContent(String message) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(message),
        ],
      ),
    );
  }

  Widget _getContentWidget(List<ProductModel> products) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const HomeHaederBuilder(),
          const SizedBox(height: 22.0),
          const CarouselSliderBuilder(),
          const SizedBox(height: 22.0),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              childAspectRatio: 3 / 4.3,
            ),
            itemBuilder: (ctx, i) {
              return ProductCardItemBuilder(
                product: products[i],
                index: i,
              );
            },
          ),
        ],
      ),
    );
  }
}

class CarouselSliderBuilder extends StatelessWidget {
  const CarouselSliderBuilder({
    Key? key,
  }) : super(key: key);

  final List<String> images = const [
    ImageAssets.acer,
    ImageAssets.carosel,
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: images
          .map(
            (e) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image(
                  height: 175.0,
                  fit: BoxFit.cover,
                  image: AssetImage(e),
                ),
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
        height: 190.0,
        viewportFraction: 1,
        autoPlay: true,
        enableInfiniteScroll: true,
      ),
    );
  }
}

class HomeHaederBuilder extends StatelessWidget {
  const HomeHaederBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 5,
          child: CustomTextFormFieldBuilder(
            readOnly: true,
            hintText: AppStrings.search,
            suffixIcon: Icon(Icons.search),
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: SizedBox(
            height: 60.0,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              margin: EdgeInsets.zero,
              child: const Center(
                child: Icon(
                  Icons.filter_alt,
                  color: AppColors.grey,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
