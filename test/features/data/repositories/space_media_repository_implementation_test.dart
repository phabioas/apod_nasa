import 'package:apod_nasa/core/errors/exceptions.dart';
import 'package:apod_nasa/core/errors/failures.dart';
import 'package:apod_nasa/features/data/datasources/space_media_datasource.dart';
import 'package:apod_nasa/features/data/models/space_media_model.dart';
import 'package:apod_nasa/features/data/repositories/space_media_repository_implementation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSpaceMediaDatasource extends Mock implements ISpaceMediaDatasource {}

void main() {
  late SpaceMediaRepositoryImplementation repository;
  late ISpaceMediaDatasource datasource;

  setUp(() {
    datasource = MockSpaceMediaDatasource();
    repository = SpaceMediaRepositoryImplementation(datasource);
  });

  final tSpaceMediaModel = SpaceMediaModel(
    description: "descricao",
    mediaType: "mediatype",
    mediaUrl: "mediaurl",
    title: "title",
  );

  final tDate = DateTime(2021, 01, 31);

  test('should return space media model when call the datasource', () async {
    // Arrange
    when(() => datasource.getSpaceMediaFromDate(tDate))
        .thenAnswer((_) async => tSpaceMediaModel);

    // Act
    final result = await repository.getSpaceMediaFromDate(tDate);

    // Assert
    expect(result, Right(tSpaceMediaModel));

    //verify(() => datasource);
  });

  test('error', () async {
    when(() => datasource.getSpaceMediaFromDate(tDate))
        .thenThrow(ServerException('error'));

    final atual = await repository.getSpaceMediaFromDate(tDate);
    final matcher = Left(ServerFailure());

    expect(atual, matcher);
  });
}
