import 'package:flutter/material.dart';

import 'package:flutter_anime_mobx/src/models/anime.dart';

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
    final DetailScreenArguments args =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200,
              automaticallyImplyLeading: false,
              floating: false,
              pinned: true,
              flexibleSpace: Stack(
                children: <Widget>[
                  Hero(
                    tag: 'image${args.anime.id}',
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(args.anime.coverUrl),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[Colors.transparent, Colors.black],
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            padding: EdgeInsets.only(right: 8),
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              args.anime.title,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
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
