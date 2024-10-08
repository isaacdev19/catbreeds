import 'package:catbreeds/src/config/di/injection_container.dart';
import 'package:catbreeds/src/presentation/components/app_bar/cb_app_bar.dart';
import 'package:catbreeds/src/presentation/components/card/cb_card.dart';
import 'package:catbreeds/src/presentation/pages/detail_breed/detail_breed_page.dart';
import 'package:catbreeds/src/presentation/pages/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) => previous.breeds !=  current.breeds || current.status == HomeStatus.loading,
        builder: (context, state) {
          return Scaffold(
            appBar: CBAppBar.main(
              textTitle: 'Home',
              onSearchChange: (value) => context.read<HomeCubit>().searchBreed(value),
            ),
            body: SafeArea(
              minimum: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemCount: state.breeds.length,
                itemBuilder: (BuildContext context, int index) => CBCard.breed(
                  title: state.breeds[index].name,
                  image: state.breeds[index].image,
                  origin: state.breeds[index].origin,
                  intelligence: state.breeds[index].intelligence,
                  onTap: () {
                    context.pushNamed(DetailBreedPage.routeName, extra: state.breeds[index]);
                  },
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
