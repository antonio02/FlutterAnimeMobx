// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AnimeStore on AnimeBase, Store {
  final _$animesAtom = Atom(name: 'AnimeBase.animes');

  @override
  List<Anime> get animes {
    _$animesAtom.context.enforceReadPolicy(_$animesAtom);
    _$animesAtom.reportObserved();
    return super.animes;
  }

  @override
  set animes(List<Anime> value) {
    _$animesAtom.context.conditionallyRunInAction(() {
      super.animes = value;
      _$animesAtom.reportChanged();
    }, _$animesAtom, name: '${_$animesAtom.name}_set');
  }

  final _$fetchingAtom = Atom(name: 'AnimeBase.fetching');

  @override
  bool get fetching {
    _$fetchingAtom.context.enforceReadPolicy(_$fetchingAtom);
    _$fetchingAtom.reportObserved();
    return super.fetching;
  }

  @override
  set fetching(bool value) {
    _$fetchingAtom.context.conditionallyRunInAction(() {
      super.fetching = value;
      _$fetchingAtom.reportChanged();
    }, _$fetchingAtom, name: '${_$fetchingAtom.name}_set');
  }

  final _$fetchFromKitsuAsyncAction = AsyncAction('fetchFromKitsu');

  @override
  Future<void> fetchFromKitsu() {
    return _$fetchFromKitsuAsyncAction.run(() => super.fetchFromKitsu());
  }
}
