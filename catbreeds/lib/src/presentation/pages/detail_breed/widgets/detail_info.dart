part of 'package:catbreeds/src/presentation/pages/detail_breed/detail_breed_page.dart';

class _DetailInfo extends StatelessWidget {
  const _DetailInfo({required this.breed});

  final Breed breed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: CBText.titleMedium(breed.origin)),
            CBText.bodySmall('Tap to learn more ->'),
            InkWell(
              onTap: () => ExternalUrl.launchExternalUrl(breed.webUrl ?? ''),
              child: Icon(
                Icons.web,
                color: Theme.of(context).colorScheme.primary,
                size: 30,
              ),
            ),
          ],
        ),
        vSpace3,
        CBText.labelLarge(breed.description, fontWeight: FontWeight.normal,),
        _BreedFacts(breed: breed),
        CBText.titleMedium('Temperament'),
        CBText.labelLarge(breed.temperament, fontWeight: FontWeight.normal,),
        CBText.titleMedium('Life Span'),
        CBText.labelLarge(breed.lifeSpan, fontWeight: FontWeight.normal,),
      ],
    );
  }
}

