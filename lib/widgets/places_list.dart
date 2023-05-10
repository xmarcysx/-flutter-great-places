import 'package:flutter/material.dart';
import 'package:great_places/screens/place_detail.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/place.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
          child: Text(
        AppLocalizations.of(context)!.places_paragraph,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ));
    }

    return ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: FileImage(
                  places[index].image,
                ),
              ),
              title: Text(
                places[index].title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 20),
              ),
              subtitle: Text(
                places[index].location.address,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 16),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => PlaceDetailScreen(place: places[index]),
                  ),
                );
              },
            ));
  }
}
