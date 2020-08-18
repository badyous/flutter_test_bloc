import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:undercover/blocs/gamebloc/gameEvents.dart';
import 'package:undercover/blocs/gamebloc/gameStates.dart';
import 'package:undercover/data/gameRepository.dart';

class GameBloc extends Bloc<GameEvents, GameStates> {
  final GameRepository gameRepository;

  GameBloc(this.gameRepository) : assert(gameRepository != null);

  @override
  GameStates get initialState => GameEmpty();

  @override
  Stream<GameStates> mapEventToState(GameEvents event) async* {
    if (event is FetchGameList) {
      yield GameLoading();
      try {
        var game = await gameRepository.getGame();
        yield GameLoaded(game.localResults);
      } catch (_) {
        yield GameErrorLoading();
      }
    }
  }
}
