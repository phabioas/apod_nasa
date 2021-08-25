import 'package:apod_nasa/core/errors/failures.dart';
import 'package:apod_nasa/features/domain/entities/space_media_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ISpaceMediaRepository {
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(
      DateTime date);
}
