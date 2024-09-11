import 'dart:convert';

import 'package:catbreeds/src/data/models/breed_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  late BreedModel breedModel;

  const id = 'abys';
  const name = 'Abyssinian';
  const origin = 'Egypt';
  const description = 'The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.';
  const webUrl = 'https://en.wikipedia.org/wiki/Abyssinian_(cat)';
  const image = 'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg';
  const temperament = 'Active, Energetic, Independent, Intelligent, Gentle';
  const lifeSpan = '14 - 15';
  const intelligence = 5;
  const childFriendly = 3;
  const affectionLevel = 5;
  const adaptability = 5;

  setUp(() {
    breedModel = const BreedModel(
      id: id,
      name: name,
      origin: origin,
      description: description,
      webUrl: webUrl,
      image: image,
      intelligence: intelligence,
      childFriendly: childFriendly,
      affectionLevel: affectionLevel,
      adaptability: adaptability,
      temperament: temperament,
      lifeSpan: lifeSpan,
    );
  });

  group('breedModel', () {
    test('should return correct model when call method fromJson', () {
      final jsonResponse = json.decode(fixture('breed_model.json'));
      final response = BreedModel.fromJson(jsonResponse);

      expect(response, breedModel);
    });
  });
}
