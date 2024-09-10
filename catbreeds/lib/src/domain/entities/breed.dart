import 'package:equatable/equatable.dart';

class Breed extends Equatable {
  const Breed({
    required this.id,
    required this.name,
    required this.origin,
    required this.description,
    required this.webUrl,
    required this.image,
    required this.intelligence,
  });

  final String id;
  final String name;
  final String origin;
  final String description;
  final String? webUrl;
  final String image;
  final int intelligence;

  @override
  List<Object?> get props => [
    id,
    name,
    origin,
    description,
    webUrl,
    image,
    intelligence,
  ];
}
