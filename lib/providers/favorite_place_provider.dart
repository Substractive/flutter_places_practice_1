import 'dart:io';

import 'package:favorite_places/models/favorite_place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritePlaceNotifier extends StateNotifier<List<FavoritePlace>> {
  FavoritePlaceNotifier() : super(const []);

  void addPlace(
    String id,
    String title,
    File image,
    PlaceLocation location,
  ) {
    final newPlace = FavoritePlace(
      id: id,
      title: title,
      image: image,
      location: location,
    );
    print(state);
    state = [
      newPlace,
      ...state,
    ];
    print(state);
  }
}

final favoritePlacesProvider =
    StateNotifierProvider<FavoritePlaceNotifier, List<FavoritePlace>>(
  (ref) => FavoritePlaceNotifier(),
);
