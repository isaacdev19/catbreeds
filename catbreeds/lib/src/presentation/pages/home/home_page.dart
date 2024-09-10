import 'package:catbreeds/src/config/di/injection_container.dart';
import 'package:catbreeds/src/presentation/components/app_bar/cb_app_bar.dart';
import 'package:catbreeds/src/presentation/pages/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) {
        final cubit = serviceLocator<HomeCubit>();
        Future.microtask(() => cubit.getCatBreeds());
        return cubit;
      },
      child: Scaffold(
        appBar: const CBAppBar.main(textTitle: 'Home'),
        body: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, _) => const Center(child: Text('data'),)),
      ),
    );
  }
}
