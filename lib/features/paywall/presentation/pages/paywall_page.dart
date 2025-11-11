import 'package:auto_route/auto_route.dart';
import 'package:plant_app/features/paywall/domain/usecases/show_paywall_usecase.dart';
import 'package:plant_app/shared/theme/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/core/usecases/usecase.dart';
import 'package:plant_app/features/paywall/presentation/widgets/paywall_card.dart';
import 'package:plant_app/features/paywall/presentation/widgets/paywall_checkbox.dart';
import 'package:plant_app/shared/theme/app_assets.dart';
import 'package:plant_app/shared/theme/app_colors.dart';
import 'package:plant_app/shared/theme/app_text_style.dart';
import 'package:plant_app/shared/utils/di/injection_container.dart';
import 'package:plant_app/shared/utils/router/app_router.dart';
import 'package:plant_app/shared/widgets/app_button.dart';

@RoutePage()
class PaywallPage extends StatefulWidget {
  const PaywallPage({super.key});

  @override
  State<PaywallPage> createState() => _PaywallPageState();
}

class _PaywallPageState extends State<PaywallPage> {
  int selectedPlan = 1;

  Future<void> _handleClose() async {
    // Mark paywall as shown
    final setPaywallShownUseCase = getIt<SetPaywallShownUseCase>();
    await setPaywallShownUseCase(NoParams());

    if (!mounted) return;

    // Navigate to home
    context.router.replaceAll([const MainShellRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          await _handleClose();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          top: false,

          child: Container(
            decoration: BoxDecoration(color: AppColors.paywallGradient),
            child: Stack(
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/paywall/paywall_bg.png',
                      fit: BoxFit.contain,
                      width: double.infinity,
                    ),
                    Expanded(child: Container(color: AppColors.paywallGradient)),
                  ],
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top + 16.h,
                  right: AppDimensions.padding16,
                  child: GestureDetector(
                    onTap: _handleClose,
                    child: Container(
                      width: AppDimensions.icon24,
                      height: AppDimensions.icon24,
                      decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                      child: Center(
                        child: SvgPicture.asset(
                          AppAssets.closeIcon,
                          width: AppDimensions.width24,
                          height: AppDimensions.height24,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.r, right: 20.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(flex: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "PlantApp ",
                            style: AppTextStyles.heading2.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Premium",
                            style: AppTextStyles.heading2.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Access All Features",
                            style: AppTextStyles.labelSmall.copyWith(
                              color: Colors.white.withValues(alpha: 0.7),
                              fontSize: 17.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: AppDimensions.space24),
                      SizedBox(
                        height: AppDimensions.height124,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          children: [
                            PaywallCard(
                              icon: SvgPicture.asset(
                                AppAssets.scanIcon,
                                width: AppDimensions.icon18,
                                height: AppDimensions.icon18,
                                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                              ),
                              title: "Unlimited",
                              subtitle: "Plant Identify",
                            ),
                            SizedBox(width: AppDimensions.width8),
                            PaywallCard(
                              icon: SvgPicture.asset(
                                AppAssets.meterIcon,
                                width: AppDimensions.icon18,
                                height: AppDimensions.icon18,
                                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                              ),
                              title: "Faster",
                              subtitle: "Process",
                            ),
                            SizedBox(width: AppDimensions.width8),
                            PaywallCard(
                              icon: SvgPicture.asset(
                                AppAssets.scanIcon,
                                width: AppDimensions.icon18,
                                height: AppDimensions.icon18,
                                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                              ),
                              title: "Detailed",
                              subtitle: "Plant Care",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppDimensions.space24),
                      PaywallCheckboxCard(
                        title: "1 Month",
                        price: "\$2.99/month, auto renewable",
                        isSelected: selectedPlan == 0,
                        onTap: () => setState(() => selectedPlan = 0),
                      ),
                      SizedBox(height: AppDimensions.space16),
                      PaywallCheckboxCard(
                        title: "1 Year",
                        price: "First 3 days, free, then \$529.99/year,",
                        isSelected: selectedPlan == 1,
                        onTap: () => setState(() => selectedPlan = 1),
                        badge: 'Save 50%',
                      ),
                      SizedBox(height: AppDimensions.space24),
                      AppButton(text: 'Try free for 3 days', onPressed: _handleClose),
                      SizedBox(height: AppDimensions.space10),
                      Text(
                        "After the 3-day free trial period you’ll be charged ₺274.99 per year unless you cancel before the trial expires. Yearly Subscription is Auto-Renewable",
                        style: AppTextStyles.labelSmall.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: AppDimensions.space10),
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
          ),
        ),
      ),
    );
  }
}
