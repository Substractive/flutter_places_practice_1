import 'package:favorite_places/models/favorite_place.dart';
import 'package:favorite_places/providers/favorite_place_provider.dart';
import 'package:favorite_places/screens/add_favorite_place.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritePlacesScreen extends ConsumerWidget {
  const FavoritePlacesScreen({super.key});

void addNewPlace(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => const AddFavoritePlaceScreen()),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritePlaces = ref.watch(favoritePlacesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              addNewPlace(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: PlacesList(
        places: favoritePlaces,
      ),
    );
  }
}