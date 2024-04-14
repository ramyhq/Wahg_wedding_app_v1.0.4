import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String failureMessage;
  const Failure(this.failureMessage);

  @override
  List<Object> get props => [failureMessage];
}

class ServerFailure extends Failure{
  const ServerFailure(super.failureMessage);
}

class CashFailure extends Failure{
  const CashFailure(super.failureMessage);
}

class ErrorMessage extends Equatable {
  final String msg;
  final bool isSuccess;

  const ErrorMessage({
    this.msg = 'something went wrong',
    this.isSuccess = false,
  });

  factory ErrorMessage.fromMap(Map<String, dynamic> map) {
    return ErrorMessage(
      msg: map['error_message'] as String,
      isSuccess: map['is_success'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'error_message': this.msg,
      'is_success': this.isSuccess,
    };
  }


  @override
  List<Object> get props => [
    msg,
    isSuccess,
  ];


}
