import 'package:flutter/material.dart';
import 'package:flutter_anime_mobx/src/core/models/anime.dart';

class AnimeCard extends StatelessWidget {
  final Anime _anime;
  final Widget _leading;
  final bool _wrap;

  AnimeCard(this._anime, {wrap = false, leading})
      : this._leading = leading ?? const SizedBox.shrink(),
        this._wrap = wrap;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.zero,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(_anime.coverUrl),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              decoration: const BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.transparent, Colors.black],
                ),
              ),
              child: Row(
                children: <Widget>[
                  _leading,
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _builTitle(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _builTitle() {
    return _wrap
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(_anime.title),
          )
        : Text(
            _anime.title,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          );
  }
}
