part of 'fakultas_cubit.dart';

@immutable
abstract class FakultasState {}

class FakultasInitial extends FakultasState {}

class FakultasLoading extends FakultasState {}

class FakultasError extends FakultasState {
  final String message;
  FakultasError(this.message);
}

class FakultasSukses extends FakultasState {
  final RessFakultas? ressFakultas;
  FakultasSukses(this.ressFakultas);
}

class FakultasFailed extends FakultasState {
  final String message;
  FakultasFailed(this.message);
}
