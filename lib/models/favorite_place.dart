import 'dart:io';

class FavoritePlace {
  const FavoritePlace({
    required this.id,
    required this.title,
    required this.image,
  });

  final String title;
  final String id;
  final File image;
}
