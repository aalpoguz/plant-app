import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/features/home/presentation/widgets/home_banner_card.dart';
import 'package:plant_app/features/home/presentation/widgets/home_header.dart';
import 'package:plant_app/features/home/presentation/widgets/mini_home_card.dart';
import 'package:plant_app/features/home/presentation/widgets/premium_offer_card.dart';
import 'package:plant_app/shared/presentation/base_page.dart';
import 'package:plant_app/shared/theme/app_assets.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      useSafeArea: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeHeader(),
            SizedBox(height: 24.h),

            Center(child: const PremiumOfferCard()),
            SizedBox(height: 24.h),

            SizedBox(
              height: 164.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 20.w),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: HomeBannerCard(title: 'Plant Collection ${index + 1}', imageUrl: index.isEven ? 'https://images.unsplash.com/photo-1459156212016-c812468e2115?w=400' : 'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=400'),
                  );
                },
              ),
            ),
            SizedBox(height: 24.h),

            // Mini Home Cards - 2 column GridView
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 16.w, mainAxisSpacing: 16.h, childAspectRatio: 1),
                itemCount: 6,
                itemBuilder: (context, index) {
                  final categories = [
                    {'title': 'Tropical Plants', 'image': 'https://images.unsplash.com/photo-1459156212016-c812468e2115?w=400'},
                    {'title': 'Succulents', 'image': 'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=400'},
                    {'title': 'Indoor Plants', 'image': 'https://images.unsplash.com/photo-1463936575829-25148e1db1b8?w=400'},
                    {'title': 'Cactus', 'image': 'https://images.unsplash.com/photo-1509587584298-0f3b3a3a1797?w=400'},
                    {'title': 'Flowers', 'image': 'https://images.unsplash.com/photo-1490750967868-88aa4486c946?w=400'},
                    {'title': 'Herbs', 'image': 'https://images.unsplash.com/photo-1466692476868-aef1dfb1e735?w=400'},
                  ];

                  final category = categories[index % categories.length];

                  return MiniHomeCard(imageUrl: category['image']!, title: category['title']!);
                },
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
