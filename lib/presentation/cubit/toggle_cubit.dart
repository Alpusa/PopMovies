import 'package:bloc/bloc.dart';

/// {@template bool_cubit}
/// A [Cubit] that manages a [bool] as its state.
/// {@endtemplate}
class ToggleCubit extends Cubit<bool> {
  /// {@macro bool_cubit}
  // The initial state is set to false.
  ToggleCubit() : super(false);

  /// Changes the state to true.
  void setTrue() => emit(true);

  /// Changes the state to false.
  void setFalse() => emit(false);

  /// Toggles the state between true and false.
  void toggle() => emit(!state);
}
