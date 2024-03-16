import 'package:favorite_places/models/favorite_place.dart';
import 'package:favorite_places/screens/place_details.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});
  final List<FavoritePlace> places;

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Text(
        'No places added yet.',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
    );

    if (places.isNotEmpty) {
      content = ListView.builder(
        itemCount: places.length,
        itemBuilder: (ctx, index) => ListTile(

        leading: CircleAvatar(
          radius: 26,
          backgroundImage: FileImage(places[index].image),
        ),
          title: Text(
            places[index].title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              print("Delete item");
            },
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => PlaceDetailsScreen(place: places[index]),
              ),
            );
          },
        ),
      );
    }

    return content;
  }
}
