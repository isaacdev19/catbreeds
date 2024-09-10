import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({this.message});

  const factory Failure.serverFailure({String? message}) = ServerFailure;

  final String? message;

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({super.message});
}
