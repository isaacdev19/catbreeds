import 'dart:io';

import 'package:catbreeds/src/domain/entities/breed.dart';
import 'package:catbreeds/src/presentation/components/app_bar/cb_app_bar.dart';
import 'package:catbreeds/src/presentation/pages/detail_breed/detail_breed_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_widget.dart';

void main() {
  const breed = Breed(
    id: 'abys',
    name: 'Abyssinian',
    origin: 'Egypt',
    description: 'The Abyssinian is easy to care for, and a joy to have in your home.',
    webUrl: 'https://en.wikipedia.org/wiki/Abyssinian_(cat)',
    image: 'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg',
    temperament: 'Active, Energetic, Independent, Intelligent, Gentle',
    lifeSpan: '14 - 15',
    intelligence: 5,
    childFriendly: 3,
    affectionLevel: 5,
    adaptability: 5,
  );
  
  setUpAll(() => HttpOverrides.global = null);

  testWidgets('detail breed page', (tester) async {
    await tester.pumpWidget(const TestWidget(widget: DetailBreedPage(breed: breed)));
    await tester.pumpAndSettle();

    final titleFinder = find.text(breed.name);
    final logoFinder = find.image(const AssetImage('assets/images/logo.png'));
    final originFinder = find.text(breed.origin);
    final temperamentFinder = find.text(breed.temperament);
    final lifeSpanFinder = find.text(breed.lifeSpan);
    final intelligenceFinder = find.text('Intelligence');
    final adaptabilityFinder = find.text('Adaptability');
    final affectionLevelFinder = find.text('Affection Level');
    final childFriendlyFinder = find.text('Child Friendly');

    expect(titleFinder, findsOneWidget);
    expect(logoFinder, findsOneWidget);
    expect(originFinder, findsOneWidget);
    expect(temperamentFinder, findsOneWidget);
    expect(lifeSpanFinder, findsOneWidget);
    expect(intelligenceFinder, findsOneWidget);
    expect(adaptabilityFinder, findsOneWidget);
    expect(affectionLevelFinder, findsOneWidget);
    expect(childFriendlyFinder, findsOneWidget);
  });
}
