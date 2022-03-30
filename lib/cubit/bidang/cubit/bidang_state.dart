part of 'bidang_cubit.dart';

@immutable
abstract class BidangState {}

class BidangInitial extends BidangState {}

class BidangLoading extends BidangState {}

class BidangError extends BidangState {
  final String? message;
  BidangError(this.message);
}

class BidangSukses extends BidangState {
  final RessDataBid ressDataBid;
  BidangSukses(this.ressDataBid);
}

class BidangFailed extends BidangState {
  final String message;
  BidangFailed(this.message);
}
