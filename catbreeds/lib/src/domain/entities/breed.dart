import 'package:equatable/equatable.dart';

class Breed extends Equatable {
  const Breed({
    required this.id,
    required this.name,
    required this.origin,
    required this.description,
    required this.webUrl,
    required this.image,
  });

  final String id;
  final String name;
  final String origin;
  final String description;
  final String? webUrl;
  final String image;

  @override
  List<Object?> get props => [
    id,
    name,
    origin,
    description,
    webUrl,
    image,
  ];
}
