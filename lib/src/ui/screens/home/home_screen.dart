import 'package:flutter/material.dart';
import 'package:flutter_anime_mobx/src/core/stores/anime_store.dart';
import 'package:flutter_anime_mobx/src/ui/screens/detail/detail_screen.dart';
import 'package:flutter_anime_mobx/src/ui/shared/widgets/anime_card.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AnimeStore _animeStore;

  @override
  void initState() {
    super.initState();
    _animeStore = AnimeStore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) {
            if (_animeStore.fetching) return _buildLoadingIndicator();

            if (_animeStore.animes.isNotEmpty) {
              return _buidAnimeGrid(context);
            } else {
              return _buildNoDataWidget();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _animeStore.fetchFromKitsu(),
        child: const Icon(Icons.arrow_downward),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Center(child: const CircularProgressIndicator());
  }

  Widget _buildNoDataWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.cloud_off, size: 72),
          const Text(
            'No data (Click to fetch)',
            style: const TextStyle(fontSize: 24),
          )
        ],
      ),
    );
  }

  Widget _buidAnimeGrid(context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: _animeStore.animes.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _calculateGridCrossAxisCount(context),
        childAspectRatio: 10 / 16,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return _buildClickableAnimeCard(index);
      },
    );
  }

  Widget _buildClickableAnimeCard(index) {
    return InkWell(
      onTap: () {
        _goToAnimeDetail(_animeStore.animes[index]);
      },
      child: Hero(
        tag: 'image${_animeStore.animes[index].id}',
        child: AnimeCard(_animeStore.animes[index]),
      ),
    );
  }

  void _goToAnimeDetail(anime) {
    Navigator.pushNamed(
      context,
      DetailScreen.routeName,
      arguments: DetailScreenArguments(anime),
    );
  }

  int _calculateGridCrossAxisCount(context) {
    return MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3;
  }
}
