import 'package:apod_nasa/core/errors/failures.dart';
import 'package:apod_nasa/core/usecase/usecase.dart';
import 'package:apod_nasa/features/domain/entities/space_media_entity.dart';
import 'package:apod_nasa/features/domain/repositories/space_media_repository.dart';
import 'package:dartz/dartz.dart';

class GetSpaceMediaFromDateUsecase
    implements UseCase<SpaceMediaEntity, DateTime> {
  final ISpaceMediaRepository repository;

  GetSpaceMediaFromDateUsecase(this.repository);

  @override
  Future<Either<Failure, SpaceMediaEntity>> call(DateTime? date) async {
    return date != null
        ? await repository.getSpaceMediaFromDate(date)
        : Left(NullParamFailure());
  }
}
