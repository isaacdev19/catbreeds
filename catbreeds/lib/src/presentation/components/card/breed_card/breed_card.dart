import 'package:catbreeds/src/presentation/components/card/cb_card.dart';
import 'package:catbreeds/src/presentation/components/text/cb_text.dart';
import 'package:catbreeds/src/presentation/components/ui_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BreedCard extends CBCard {
  const BreedCard({
    super.key,
    required super.title,
    required this.image,
    required this.onTap,
    this.color,
    required this.origin,
    required this.intelligence,
  }) : super(
    subtitle: '',
  );

  final String image;
  final Function() onTap;
  final Color? color;
  final String origin;
  final int intelligence;

  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.all(10),
    shadowColor: Theme.of(context).colorScheme.primary,
    child: SafeArea(
      minimum: const EdgeInsets.all(10),
      child: Column(
        children: [
          CBText.titleMedium(title),
          vSpace3,
          ClipRRect(
            borderRadius: borderRadius,
            child: Image.network(
              image,
              fit: BoxFit.cover,
              width: 250,
              height: 250,
              errorBuilder: (context, _, __) => const Icon(Icons.image),
            ),
          ),
          vSpace3,
          Row(
            children: [
              Expanded(child: CBText.bodySmall(origin)),
              CBText.bodySmall('Intelligence: $intelligence')
            ],
          )
        ],
      ),
    ),
  );
}
