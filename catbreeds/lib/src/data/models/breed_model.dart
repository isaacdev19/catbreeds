import 'package:catbreeds/src/domain/entities/breed.dart';

class BreedModel extends Breed {
  const BreedModel({
    required super.id,
    required super.name,
    required super.origin,
    required super.description,
    required super.webUrl,
    required super.image,
  });

  factory BreedModel.fromJson(Map<String, dynamic> json) {
    return BreedModel(
      id: json['id'],
      name: json['name'],
      origin: json['origin'],
      description: json['description'],
      webUrl: json['wikipedia_url'],
      image: json['image']['url'],
    );
  }
}