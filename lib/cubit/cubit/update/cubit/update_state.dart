part of 'update_cubit.dart';

@immutable
abstract class UpdateState {}

class UpdateInitial extends UpdateState {}

class UpdateLoading extends UpdateState {}

class UpdateError extends UpdateState {
  final String message;
  UpdateError(this.message);
}

class UpdateSukses extends UpdateState {
  RessUpdate ressUpdate;
  UpdateSukses(this.ressUpdate);
}

class UpdateFailed extends UpdateState {
  final String message;
  UpdateFailed(this.message);
}
