import 'dart:io';

import 'package:favorite_places/models/favorite_place.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:favorite_places/widgets/location_input.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favorite_places/providers/favorite_place_provider.dart';
import 'package:flutter/material.dart';

class AddFavoritePlaceScreen extends ConsumerStatefulWidget {
  const AddFavoritePlaceScreen({super.key});

  @override
  ConsumerState<AddFavoritePlaceScreen> createState() {
    return _AddFavoritePlaceState();
  }
}

class _AddFavoritePlaceState extends ConsumerState<AddFavoritePlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage = null;
  PlaceLocation? _selectedLocation;

  void _savePlace() {
    print("Save place");
    print(_titleController.text);

    final placeText = _titleController.text;

    if (placeText.isEmpty ||
        _selectedImage == null ||
        _selectedLocation == null) {
      return;
    }

    // Create place object
    // final favoritePlace = FavoritePlace(
    //   id: DateTime.now().toString(),
    //   title: placeText,
    //   image:
    // );
    ref.read(favoritePlacesProvider.notifier).addPlace(
        DateTime.now().toString(),
        placeText,
        _selectedImage!,
        _selectedLocation!);

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var favoritePlaces = ref.watch(favoritePlacesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
              controller: _titleController,
              maxLength: 50,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 10,
            ),
            // Image input
            ImageInput(
              onSelectImage: (image) {
                _selectedImage = image;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            LocationInput(
              onSelectLocation: (location) {
                _selectedLocation = location;
              },
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton.icon(
              label: const Text("Add place"),
              onPressed: _savePlace,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
