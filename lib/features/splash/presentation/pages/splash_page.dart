import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:plant_app/features/splash/presentation/bloc/splash_event.dart';
import 'package:plant_app/features/splash/presentation/bloc/splash_state.dart';
import 'package:plant_app/shared/presentation/base_page.dart';
import 'package:plant_app/shared/theme/app_colors.dart';
import 'package:plant_app/shared/utils/di/injection_container.dart';
import 'package:plant_app/shared/utils/router/app_router.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => getIt<SplashBloc>()..add(SplashInitialized()), child: const SplashView());
  }
}

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startAnimation();
  }

  void _setupAnimations() {
    _animationController = AnimationController(duration: const Duration(milliseconds: 1500), vsync: this);

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack));

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );
  }

  void _startAnimation() {
    _animationController.forward().then((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          context.read<SplashBloc>().add(SplashAnimationCompleted());
        }
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state.status == SplashStatus.navigatingToOnboarding) {
            context.router.replace(const OnboardingRoute());
          } else if (state.status == SplashStatus.navigatingToHome) {
            context.router.replace(const MainShellRoute());
          }
        },
        child: Center(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Opacity(
                opacity: _opacityAnimation.value,
                child: Transform.scale(scale: _scaleAnimation.value, child: child),
              );
            },
            child: Image.asset('assets/images/logo/logo.png', width: 200, height: 200),
          ),
        ),
      ),
    );
  }
}
