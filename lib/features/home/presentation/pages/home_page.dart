import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/core/di/injection_container.dart';
import 'package:plant_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:plant_app/features/home/presentation/widgets/home_banner_card.dart';
import 'package:plant_app/features/home/presentation/widgets/home_header.dart';
import 'package:plant_app/features/home/presentation/widgets/mini_home_card.dart';
import 'package:plant_app/features/home/presentation/widgets/premium_offer_card.dart';
import 'package:plant_app/features/home/presentation/widgets/shimmers/home_banner_shimmer.dart';
import 'package:plant_app/features/home/presentation/widgets/shimmers/mini_home_card_shimmer.dart';
import 'package:plant_app/shared/presentation/base_page.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()
        ..add(const LoadCategoriesEvent())
        ..add(const LoadQuestionsEvent()),
      child: BasePage(
        useSafeArea: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),
              SizedBox(height: 24.h),
              const Center(child: PremiumOfferCard()),
              SizedBox(height: 24.h),

              // Questions Banner Cards
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  switch (state.questionsStatus) {
                    case HomeDataStatus.initial:
                    case HomeDataStatus.loading:
                      return const HomeBannerShimmer();

                    case HomeDataStatus.error:
                      return SizedBox(
                        height: 164.h,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.error_outline, size: 32.sp, color: Colors.red),
                              SizedBox(height: 8.h),
                              Text(
                                'Error: ${state.questionsError}',
                                style: const TextStyle(color: Colors.red),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );

                    case HomeDataStatus.loaded:
                      if (state.questions.isEmpty) {
                        return SizedBox(
                          height: 164.h,
                          child: const Center(child: Text('No questions found')),
                        );
                      }

                      return SizedBox(
                        height: 164.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.only(left: 20.w),
                          itemCount: state.questions.length,
                          itemBuilder: (context, index) {
                            final question = state.questions[index];
                            return Padding(
                              padding: EdgeInsets.only(right: 16.w),
                              child: HomeBannerCard(title: question.title, imageUrl: question.image_uri),
                            );
                          },
                        ),
                      );
                  }
                },
              ),
              SizedBox(height: 24.h),

              // Mini Home Cards (Categories)
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  switch (state.categoriesStatus) {
                    case HomeDataStatus.initial:
                    case HomeDataStatus.loading:
                      return const MiniHomeCardShimmer();

                    case HomeDataStatus.error:
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.all(40.h),
                          child: Column(
                            children: [
                              Icon(Icons.error_outline, size: 48.sp, color: Colors.red),
                              SizedBox(height: 16.h),
                              Text(
                                'Error: ${state.categoriesError}',
                                style: const TextStyle(color: Colors.red),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );

                    case HomeDataStatus.loaded:
                      if (state.categories.isEmpty) {
                        return Center(
                          child: Padding(padding: EdgeInsets.all(40.h), child: const Text('No categories found')),
                        );
                      }

                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 16.w, mainAxisSpacing: 16.h, childAspectRatio: 1),
                          itemCount: state.categories.length,
                          itemBuilder: (context, index) {
                            final category = state.categories[index];
                            return MiniHomeCard(imageUrl: category.image.url, title: category.title);
                          },
                        ),
                      );
                  }
                },
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
