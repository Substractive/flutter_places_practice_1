import 'package:favorite_places/models/favorite_place.dart';
import 'package:favorite_places/providers/favorite_place_provider.dart';
import 'package:favorite_places/screens/add_favorite_place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritePlacesScreen extends ConsumerStatefulWidget {
  const FavoritePlacesScreen({super.key});

  @override
  ConsumerState<FavoritePlacesScreen> createState() {
    return _FavoritePlacesScreenState();
  }
}

class _FavoritePlacesScreenState extends ConsumerState<FavoritePlacesScreen> {
  void addNewPlace(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => AddFavoritePlaceScreen()),
    );
  }

  void selectItem(FavoritePlace place){
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ))
  }

  @override
  Widget build(BuildContext context) {
    final favoritePlaces = ref.watch(favoritePlacesProvider);

    Widget content = const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No places added yet.',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );

    if (favoritePlaces.isNotEmpty) {
      content = ListView.builder(
        itemCount: favoritePlaces.length,
        itemBuilder: (ctx, index) => InkWell(
          onTap: () {
            print("Item clicked");
          },
          child: ListTile(
            title: Text(favoritePlaces[index].title),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                print("Delete item");
              },
            ),
          ),
        ),
      );
    }

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
      body: content,
    );
  }
}
