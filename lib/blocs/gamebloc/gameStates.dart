import 'package:equatable/equatable.dart';
import 'package:undercover/models/gameModel.dart';

class GameStates extends Equatable {
  @override
  List<Object> get props => null;
}

class GameLoaded extends GameStates {
  final List<LocalResults> gameLocalResults;

  @override
  List<Object> get props => [gameLocalResults];

  GameLoaded(this.gameLocalResults) : assert(gameLocalResults != null);
}

class GameLoading extends GameStates {}

class GameEmpty extends GameStates {}

class GameErrorLoading extends GameStates {}
