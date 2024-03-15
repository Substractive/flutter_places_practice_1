import 'package:favorite_places/models/favorite_place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favorite_places/providers/favorite_place_provider.dart';
import 'package:flutter/material.dart';


class AddFavoritePlaceScreen extends ConsumerWidget {
  AddFavoritePlaceScreen({super.key});

  final _titleController = TextEditingController();

  void _savePlace(WidgetRef ref) {
    print("Save place");
    print(_titleController.text);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var favoritePlaces = ref.watch(favoritePlacesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: _titleController,
                    maxLength: 50,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      label: Text('Title'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  label: const Text("Add place"),
                  onPressed: () {
                    final favoritePlace = FavoritePlace(
                        DateTime.now().toString(), _titleController.text);
                    ref
                        .read(favoritePlacesProvider.notifier)
                        .addPlace(favoritePlace);
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
