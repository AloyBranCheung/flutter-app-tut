import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/my_app_state.dart';

class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appState = context.watch<MyAppState>();
    final favouritesList = appState.favorites;

    if (favouritesList.length < 1) {
      return Center(child: Text('No favourites yet.'));
    }
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.delete_outline, semanticLabel: 'Delete Button'),
              color: theme.colorScheme.error,
              onPressed: () {
                appState.removeFavourites(pair);
              },
            ),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}
