import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/features/paywall/presentation/widgets/paywall_card.dart';
import 'package:plant_app/features/paywall/presentation/widgets/paywall_checkbox.dart';
import 'package:plant_app/shared/presentation/base_page.dart';
import 'package:plant_app/shared/theme/app_assets.dart';
import 'package:plant_app/shared/theme/app_colors.dart';
import 'package:plant_app/shared/theme/app_text_style.dart';
import 'package:plant_app/shared/widgets/app_button.dart';

@RoutePage()
class PaywallPage extends StatefulWidget {
  const PaywallPage({super.key});

  @override
  State<PaywallPage> createState() => _PaywallPageState();
}

class _PaywallPageState extends State<PaywallPage> {
  int selectedPlan = 1;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      backgroundColor: AppColors.paywallGradient,
      useSafeArea: true,
      body: Stack(
        children: [
          Column(
            children: [
              Image.asset('assets/images/paywall/paywall_bg.png', fit: BoxFit.contain, width: double.infinity),
              Expanded(child: Container(color: AppColors.paywallGradient)),
            ],
          ),
          Positioned(
            top: 16.h,
            right: 16.w,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                width: 24.w,
                height: 24.h,
                decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                child: SvgPicture.asset(AppAssets.closeIcon, width: 12.w, height: 12.h, color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.r, right: 20.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(flex: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "PlantApp ",
                      style: AppTextStyles.heading2.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text("Premium", style: AppTextStyles.heading2.copyWith(color: Colors.white)),
                  ],
                ),
                SizedBox(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Access All Features",
                      style: AppTextStyles.labelSmall.copyWith(color: Colors.white.withOpacity(0.7), fontSize: 17.sp),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  height: 124.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    children: [
                      PaywallCard(
                        icon: SvgPicture.asset(AppAssets.scanIcon, width: 18.w, height: 18.h, color: Colors.white),
                        title: "Unlimited",
                        subtitle: "Plant Identify",
                      ),
                      SizedBox(width: 8.w),
                      PaywallCard(
                        icon: SvgPicture.asset(AppAssets.meterIcon, width: 18.w, height: 18.h, color: Colors.white),
                        title: "Faster",
                        subtitle: "Process",
                      ),
                      SizedBox(width: 8.w),
                      PaywallCard(
                        icon: SvgPicture.asset(AppAssets.scanIcon, width: 18.w, height: 18.h, color: Colors.white),
                        title: "Detailed",
                        subtitle: "Plant Care",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                PaywallCheckboxCard(title: "1 Month", price: "\$2.99/month, auto renewable", isSelected: selectedPlan == 0, onTap: () => setState(() => selectedPlan = 0)),
                SizedBox(height: 16.h),
                PaywallCheckboxCard(title: "1 Year", price: "First 3 days, free, then \$529.99/year,", isSelected: selectedPlan == 1, onTap: () => setState(() => selectedPlan = 1), badge: 'Save 50%'),
                SizedBox(height: 24.h),
                AppButton(text: 'Try free for 3 days', onPressed: () {}),
                SizedBox(height: 10.h),
                Text(
                  "After the 3-day free trial period you’ll be charged ₺274.99 per year unless you cancel before the trial expires. Yearly Subscription is Auto-Renewable",
                  style: AppTextStyles.labelSmall.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.h),
                Text(
                  "Terms • Privacy • Restore",
                  style: AppTextStyles.labelSmall.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
