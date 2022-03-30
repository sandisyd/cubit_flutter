part of 'insert_cubit.dart';

@immutable
abstract class InsertState {}

class InsertInitial extends InsertState {}

class InsertLoading extends InsertState {}

class InsertError extends InsertState {
  final String message;
  InsertError(this.message);
}

class InsertSuccess extends InsertState {
  final RessInsert ressInsert;
  InsertSuccess(this.ressInsert);
}

class InsertFailed extends InsertState {
  final String message;
  InsertFailed(this.message);
}
