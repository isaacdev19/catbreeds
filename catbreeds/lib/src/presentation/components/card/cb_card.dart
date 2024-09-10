import 'package:flutter/material.dart';
import 'package:catbreeds/src/presentation/components/card/breed_card/breed_card.dart';

abstract class CBCard extends StatelessWidget {
  const CBCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  const factory CBCard.breed({
    Key? key,
    required String title,
    required String image,
    required Function() onTap,
    required String origin,
    required int intelligence,
    Color? color,
  }) = BreedCard;

  final String title;
  final String subtitle;
}
