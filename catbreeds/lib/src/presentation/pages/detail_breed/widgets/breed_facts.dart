part of 'package:catbreeds/src/presentation/pages/detail_breed/detail_breed_page.dart';

class _BreedFacts extends StatelessWidget {
  const _BreedFacts({required this.breed});
  
  final Breed breed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(30),
      child: Column(
        children: [
          LinearIndicatorValue(
            value: ((100 * breed.adaptability) / 5) / 100,
            title: 'Adaptability',
          ),
          vSpace2,
          LinearIndicatorValue(
            value: ((100 * breed.affectionLevel) / 5) / 100,
            title: 'Affection Level',
          ),
          vSpace2,
          LinearIndicatorValue(
            value: ((100 * breed.childFriendly) / 5) / 100,
            title: 'Child Friendly',
          ),
          vSpace2,
          LinearIndicatorValue(
            value: ((100 * breed.intelligence) / 5) / 100,
            title: 'Intelligence',
          ),
        ]
      ),
    );
  }
}
