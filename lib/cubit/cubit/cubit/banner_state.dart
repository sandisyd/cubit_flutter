part of 'banner_cubit.dart';

@immutable
abstract class BannerState {}

class BannerInitial extends BannerState {}

class BannerLoading extends BannerState {}

class BannerError extends BannerState {
  final String message;
  BannerError(this.message);
}

class BannerSuccess extends BannerState {
  final RessBanner ressBanner;
  BannerSuccess(this.ressBanner);
}

class BannerFailed extends BannerState {
  final String message;
  BannerFailed(this.message);
}
