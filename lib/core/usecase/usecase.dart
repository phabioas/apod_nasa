import 'package:apod_nasa/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Output, Input> {
  Future<Either<Failure, Output>> call(Input param);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
