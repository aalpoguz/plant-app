import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/features/onboarding/data/onboarding_data.dart';
import 'package:plant_app/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:plant_app/features/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:plant_app/features/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:plant_app/features/onboarding/presentation/widgets/onboarding_content.dart';
import 'package:plant_app/features/onboarding/presentation/widgets/onboarding_footer.dart';
import 'package:plant_app/shared/presentation/base_page.dart';
import 'package:plant_app/shared/utils/di/injection_container.dart';
import 'package:plant_app/shared/utils/router/app_router.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => getIt<OnboardingBloc>(), child: const OnboardingView());
  }
}

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OnboardingBloc>();
    final pages = OnboardingData.onboardingPages;

    return BasePage(
      useSafeArea: true,
      body: BlocListener<OnboardingBloc, OnboardingState>(
        listener: (context, state) {
          if (state.status == OnboardingStatus.completed) {
            // Navigate to Paywall page
            context.router.push(const PaywallRoute());
          } else if (state.status == OnboardingStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage ?? 'An error occurred')));
          }
        },
        child: BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  flex: 6,
                  child: PageView.builder(
                    controller: bloc.pageController,
                    onPageChanged: (page) => bloc.add(OnboardingPageChanged(page)),
                    itemCount: pages.length,
                    itemBuilder: (context, index) => OnboardingContent(onboarding: pages[index], pageIndex: index),
                  ),
                ),
                Expanded(
                  child: OnboardingFooter(
                    isFirstPage: state.isFirstPage,
                    buttonText: state.isFirstPage ? 'Get Started' : 'Continue',
                    onButtonPressed: () => bloc.add(OnboardingNextPage()),
                    currentPageIndex: state.currentPage - 1,
                    totalPages: state.totalPages - 1,
                    onTermsTap: () => bloc.add(OnboardingTermsTapped()),
                    onPrivacyTap: () => bloc.add(OnboardingPrivacyTapped()),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
