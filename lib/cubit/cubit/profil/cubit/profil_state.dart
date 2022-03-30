part of 'profil_cubit.dart';

@immutable
abstract class ProfilState {}

class ProfilInitial extends ProfilState {}

class ProfilLoading extends ProfilState {}

class ProfilError extends ProfilState {
  final String message;
  ProfilError(this.message);
}

class ProfilSukses extends ProfilState {
  final RessProfil ressProfil;
  ProfilSukses(this.ressProfil);
}

class ProfilFailed extends ProfilState {
  final String message;
  ProfilFailed(this.message);
}
