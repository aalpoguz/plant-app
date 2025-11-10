import 'package:auto_route/auto_route.dart';
import 'package:plant_app/shared/theme/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/shared/utils/di/injection_container.dart';
import 'package:plant_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:plant_app/features/home/presentation/widgets/home_banner_card.dart';
import 'package:plant_app/features/home/presentation/widgets/home_header.dart';
import 'package:plant_app/features/home/presentation/widgets/mini_home_card.dart';
import 'package:plant_app/features/home/presentation/widgets/premium_offer_card.dart';
import 'package:plant_app/features/home/presentation/widgets/shimmers/home_banner_shimmer.dart';
import 'package:plant_app/features/home/presentation/widgets/shimmers/home_header_shimmer.dart';
import 'package:plant_app/features/home/presentation/widgets/shimmers/mini_home_card_shimmer.dart';
import 'package:plant_app/features/home/presentation/widgets/shimmers/premium_offer_shimmer.dart';
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
        resizeToAvoidBottomInset: false,
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            final bothLoaded = state.categoriesStatus == HomeDataStatus.loaded && state.questionsStatus == HomeDataStatus.loaded;

            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.easeInOut,
              child: !bothLoaded
                  ? SingleChildScrollView(
                      key: const ValueKey('shimmer'),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const HomeHeaderShimmer(),
                          SizedBox(height: AppDimensions.space24),
                          const Center(child: PremiumOfferShimmer()),
                          SizedBox(height: AppDimensions.space24),
                          const HomeBannerShimmer(),
                          SizedBox(height: AppDimensions.space24),
                          const MiniHomeCardShimmer(),
                          SizedBox(height: AppDimensions.space24),
                        ],
                      ),
                    )
                  : SingleChildScrollView(
                      key: const ValueKey('content'),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const HomeHeader(),
                          SizedBox(height: AppDimensions.space24),
                          const Center(child: PremiumOfferCard()),
                          SizedBox(height: AppDimensions.space24),

                          // Questions Banner Cards
                          if (state.questions.isEmpty)
                            SizedBox(
                              height: AppDimensions.height164,
                              child: const Center(child: Text('No questions found')),
                            )
                          else
                            SizedBox(
                              height: AppDimensions.height164,
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
                            ),
                          SizedBox(height: AppDimensions.space24),

                          // Mini Home Cards (Categories)
                          if (state.categories.isEmpty)
                            Center(
                              child: Padding(padding: EdgeInsets.all(AppDimensions.padding40), child: const Text('No categories found')),
                            )
                          else
                            Padding(
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
                            ),
                          SizedBox(height: AppDimensions.space24),
                        ],
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}
