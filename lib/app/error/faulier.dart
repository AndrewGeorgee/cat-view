import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Failure extends Equatable {
  int code; // 200, 201, 400, 303..500 and so on
  String message; // error , success

  Failure(this.code, this.message);

  @override
  List<Object?> get props => [code, message];
}
