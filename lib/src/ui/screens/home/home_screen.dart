import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_anime_mobx/src/core/stores/anime_store.dart';
import 'package:flutter_anime_mobx/src/ui/shared/widgets/anime_card.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _animeStore = AnimeStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) {
            if (_animeStore.fetching) {
              return Center(child: CircularProgressIndicator());
            }
            if (_animeStore.animes.isNotEmpty) {
              return GridView.builder(
                padding: EdgeInsets.all(8),
                itemCount: _animeStore.animes.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 10 / 16,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return AnimeCard(_animeStore.animes[index]);
                },
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.cloud_off, size: 72, color: Colors.grey),
                    Text(
                      'No data (Click to fetch)',
                      style: TextStyle(fontSize: 24, color: Colors.grey),
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _animeStore.fetchFromKitsu(),
        child: Icon(Icons.arrow_downward),
      ),
    );
  }
}
