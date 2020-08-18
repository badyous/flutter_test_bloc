import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:undercover/blocs/gamebloc/gameBloc.dart';
import 'package:undercover/blocs/gamebloc/gameEvents.dart';
import 'package:undercover/blocs/gamebloc/gameStates.dart';
import 'package:undercover/data/apiClient.dart';
import 'package:undercover/data/gameRepository.dart';
import 'package:undercover/models/gameModel.dart';

class GameList extends StatefulWidget {
  @override
  _GameListState createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  GameRepository _gameRepository = GameRepository(ApiClient(http.Client()));
  GameBloc _gameBloc;

  @override
  void initState() {
    super.initState();
    _gameBloc = GameBloc(_gameRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BuildBodyWidget(gameBloc: _gameBloc),
    );
  }

  @override
  void dispose() {
    _gameBloc.close();
    super.dispose();
  }
}

class BuildBodyWidget extends StatelessWidget {
  const BuildBodyWidget({
    Key key,
    @required GameBloc gameBloc,
  })  : _gameBloc = gameBloc,
        super(key: key);

  final GameBloc _gameBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _gameBloc,
        builder: (_, GameStates state) {
          if (state is GameLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GameErrorLoading) {
            return Center(
              child: Text(
                  'Une erreur est survenue lors du chargement des données'),
            );
          }
          if (state is GameEmpty) {
            _gameBloc.add(FetchGameList());
          }
          if (state is GameLoaded) {
            return buildGameList(state.gameLocalResults);
          }
          return Text('');
        });
  }

  Widget buildGameList(List<LocalResults> gameLocalResults) {
    return Material(
      child: ListView.builder(
          itemCount: gameLocalResults.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(gameLocalResults[index].title),
            );
          }),
    );
  }
}
