part of 'package:catbreeds/src/presentation/pages/detail_breed/detail_breed_page.dart';

class _Header extends StatelessWidget {
  const _Header({required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.network(
        image,
        width: 500,
        height: 400,
        fit: BoxFit.cover,
      ),
    );
  }
}
