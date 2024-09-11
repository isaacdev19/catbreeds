import 'package:catbreeds/src/domain/entities/breed.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Breed breed;

  const id = 'abys';
  const name = 'Abyssinian';
  const origin = 'Egypt';
  const description = 'The Abyssinian is easy to care for, and a joy to have in your home.';
  const webUrl = 'https://en.wikipedia.org/wiki/Abyssinian_(cat)';
  const image = 'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg';
  const temperament = 'Active, Energetic, Independent, Intelligent, Gentle';
  const lifeSpan = '14 - 15';
  const intelligence = 5;
  const childFriendly = 3;
  const affectionLevel = 5;
  const adaptability = 5;

  setUp((){
    breed = const Breed(
      id: id,
      name: name,
      origin: origin,
      description: description,
      webUrl: webUrl,
      image: image,
      temperament: temperament,
      lifeSpan: lifeSpan,
      intelligence: intelligence,
      childFriendly: childFriendly,
      affectionLevel: affectionLevel,
      adaptability: adaptability,
    );
  });
  
  group('Breed Entity', () {
    test('id should return the correct value', (){
      expect(breed.id, id);
    });
    test('name should return the correct value', (){
      expect(breed.name, name);
    });
    test('origin should return the correct value', (){
      expect(breed.origin, origin);
    });
    test('description should return the correct value', (){
      expect(breed.description, description);
    });
    test('webUrl should return the correct value', (){
      expect(breed.webUrl, webUrl);
    });
    test('image should return the correct value', (){
      expect(breed.image, image);
    });
    test('lifeSpan should return the correct value', (){
      expect(breed.lifeSpan, lifeSpan);
    });
    test('intelligence should return the correct value', (){
      expect(breed.intelligence, intelligence);
    });
    test('childFriendly should return the correct value', (){
      expect(breed.childFriendly, childFriendly);
    });
    test('affectionLevel should return the correct value', (){
      expect(breed.affectionLevel, affectionLevel);
    });
    test('temperament should return the correct value', (){
      expect(breed.temperament, temperament);
    });
    test('adaptability should return the correct value', (){
      expect(breed.adaptability, adaptability);
    });
    test('props should return the correct value', (){
      expect(breed.props, [
        id,
        name,
        origin,
        description,
        webUrl,
        image,
        temperament,
        lifeSpan,
        intelligence,
        childFriendly,
        affectionLevel,
        adaptability,
      ]);
    });
  });
}