import 'package:apod_nasa/core/errors/failures.dart';
import 'package:apod_nasa/features/domain/entities/space_media_entity.dart';
import 'package:apod_nasa/features/domain/repositories/space_media_repository.dart';
import 'package:apod_nasa/features/domain/usecases/get_space_media_fromdate_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSpaceMediaRepository extends Mock implements ISpaceMediaRepository {}

void main() {
  late GetSpaceMediaFromDateUsecase usecase;
  late ISpaceMediaRepository repository;

  setUp(() {
    repository = MockSpaceMediaRepository();
    usecase = GetSpaceMediaFromDateUsecase(repository);
  });

  final tSpaceMedia = SpaceMediaEntity(
    description: 'description',
    mediaType: 'mediaType',
    title: 'title',
    mediaUrl: 'mediaUrl',
  );

  // final tNoParams = NoParams();

  final tDate = DateTime(2021, 01, 30);
  test('should get space media for a given date from the repository', () async {
    when(() => repository.getSpaceMediaFromDate(tDate))
        .thenAnswer((_) async => Right(tSpaceMedia));

    final result = await usecase(tDate);
    expect(result, Right(tSpaceMedia));
    //verify(() => repository);
  });

  test('NullParamFailure', () async {
    final result = await usecase(null);
    expect(result, Left(NullParamFailure()));
    verifyNever(() => repository.getSpaceMediaFromDate(tDate));
  });
}
