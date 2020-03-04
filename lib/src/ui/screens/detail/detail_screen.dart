import 'package:flutter/material.dart';
import 'package:flutter_anime_mobx/src/core/models/anime.dart';
import 'package:flutter_anime_mobx/src/ui/shared/widgets/anime_card.dart';

class DetailScreenArguments {
  final Anime anime;

  DetailScreenArguments(this.anime);
}

class DetailScreen extends StatefulWidget {
  static const String routeName = '/detail';

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    DetailScreenArguments _args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: 200,
              automaticallyImplyLeading: false,
              floating: false,
              pinned: true,
              flexibleSpace: Hero(
                tag: 'image${_args.anime.id}',
                child: AnimeCard(
                  _args.anime,
                  wrap: true,
                  leading: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Center(
          child: Text('Sample Text'),
        ),
      ),
    );
  }
}
