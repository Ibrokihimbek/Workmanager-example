import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:workmanager/cubit/lat_long_cubit/lat_long_cubit.dart';
import 'package:workmanager/cubit/lat_long_cubit/lat_long_state.dart';
import 'package:workmanager/screens/lat_long/lat_long_page.dart';
import 'package:workmanager/utils/app_loties.dart';

import '../../utils/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LatLongCubit(),
      child: Scaffold(
        backgroundColor: AppColors.C_E1EEFB,
        body: BlocBuilder<LatLongCubit, LatLongState>(
          builder: (context, state) {
            WidgetsBinding.instance.addPostFrameCallback(
              (timeStamp) async {
                await Future.delayed(const Duration(seconds: 3));
                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LatLongPage(),
                  ),
                );
              },
            );
            return Center(
              child: Lottie.asset(AppLoties.splashLotie),
            );
          },
        ),
      ),
    );
  }
}
