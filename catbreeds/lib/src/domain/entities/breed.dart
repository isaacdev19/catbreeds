import 'package:equatable/equatable.dart';

class Breed extends Equatable {
  const Breed({
    required this.id,
    required this.name,
    required this.origin,
    required this.description,
    required this.webUrl,
    required this.image,
    required this.temperament,
    required this.lifeSpan,
    required this.intelligence,
    required this.childFriendly,
    required this.affectionLevel,
    required this.adaptability,
  });

  final String id;
  final String name;
  final String origin;
  final String description;
  final String? webUrl;
  final String image;
  final String temperament;
  final String lifeSpan;
  final int intelligence;
  final int childFriendly;
  final int affectionLevel;
  final int adaptability;

  @override
  List<Object?> get props => [
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
  ];
}
