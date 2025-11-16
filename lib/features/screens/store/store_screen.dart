import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/common/widgets/appbar/tabbar.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/qaf_search_container.dart';
import 'package:qaf_store/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/product_cubit.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/product_state.dart';
import 'package:qaf_store/features/screens/store/widgets/category_tab.dart';
import 'package:qaf_store/features/screens/store/widgets/store_bloc_builder.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final cubit = context.read<ProductCubit>();
        final tabLength = cubit.categoriesList.isNotEmpty
            ? cubit.categoriesList.length
            : cubit.tabsTitle.length;

        final tabs = cubit.categoriesList.isNotEmpty
            ? cubit.categoriesList
                .map((category) => Tab(child: Text(category.name)))
                .toList()
            : cubit.tabsTitle.map((title) => Tab(child: Text(title))).toList();

        return DefaultTabController(
          length: tabLength,
          key: ValueKey(tabLength), 
          child: Scaffold(
            appBar: QafAppBar(
              title: Text(QafStrings.store,
                  style: Theme.of(context).textTheme.headlineMedium),
              actions: [
                CartCounterIcon(
                    iconColor: dark ? QafColors.white : QafColors.dark),
              ],
            ),
            body: NestedScrollView(
              headerSliverBuilder: (_, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: dark ? QafColors.black : QafColors.white,
                    expandedHeight: 440.h,
                    flexibleSpace: Padding(
                      padding: EdgeInsetsDirectional.all(QafSizes.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          QafSearchContainer(
                            text: QafStrings.searchInStore,
                            padding: EdgeInsetsDirectional.zero,
                          ),
                          SizedBox(height: QafSizes.spaceBtwSections),
                          StoreBlocBuilder(),
                        ],
                      ),
                    ),
                    bottom: QafTabBar(tabs: tabs),
                  ),
                ];
              },
              body: TabBarView(
                  children: cubit.categoriesList.isNotEmpty
                      ? cubit.categoriesList
                          .map((category) =>
                              CategoryTab(categoryModel: category))
                          .toList()
                      : List.generate(
                          cubit.tabsTitle.length,
                          (index) => const SizedBox.shrink(),
                        )),
            ),
          ),
        );
      },
    );
  }
}
