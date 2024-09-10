import 'package:catbreeds/src/config/external_url.dart';
import 'package:catbreeds/src/domain/entities/breed.dart';
import 'package:catbreeds/src/presentation/components/app_bar/cb_app_bar.dart';
import 'package:catbreeds/src/presentation/components/core/progress_indicator.dart';
import 'package:catbreeds/src/presentation/components/text/cb_text.dart';
import 'package:catbreeds/src/presentation/components/ui_constants.dart';
import 'package:flutter/material.dart';

part 'package:catbreeds/src/presentation/pages/detail_breed/widgets/header.dart';
part 'package:catbreeds/src/presentation/pages/detail_breed/widgets/detail_info.dart';
part 'package:catbreeds/src/presentation/pages/detail_breed/widgets/breed_facts.dart';

class DetailBreedPage extends StatelessWidget {
  const DetailBreedPage({
    super.key,
    required this.breed,
  });

  static String routeName = 'detail';
  final Breed breed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CBAppBar.secondary(textTitle: breed.name),
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Column(
          children: [
            _Header(image: breed.image,),
            vSpace5,
            Expanded(
              child: ListView(
                children: [
                  _DetailInfo(breed: breed),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
