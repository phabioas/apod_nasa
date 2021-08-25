import 'package:apod_nasa/core/errors/failures.dart';
import 'package:apod_nasa/features/domain/usecases/get_space_media_fromdate_usecase.dart';
import 'package:apod_nasa/features/presenter/controllers/home_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/sapce_media_entity_model.dart';

class MockGetSpaceMediaFromDateUsecase extends Mock
    implements GetSpaceMediaFromDateUsecase {}

void main() {
  late HomeStore store;
  late GetSpaceMediaFromDateUsecase mockUsecase;

  setUp(() {
    mockUsecase = MockGetSpaceMediaFromDateUsecase();
    store = HomeStore(mockUsecase);
    registerFallbackValue<DateTime>(DateTime(0, 0, 0));
  });

  test('Teste de Sucesso', () async {
    // Arrange
    when(() => mockUsecase(any()))
        .thenAnswer((_) async => Right(tSpaceMediaEntityMock));
    final tDate = DateTime(2021, 02, 02);

    // Acts
    await store.getSpaceMediaFromDate(tDate);

    // Expects
    store.observer(onState: (state) {
      expect(state, tSpaceMediaEntityMock);
      verify(() => mockUsecase(tDate)).called(1);
    });
  });

  final tFailure = ServerFailure();
  test('Teste de Erro', () async {
    // Arrange
    when(() => mockUsecase(any())).thenAnswer((_) async => Left(tFailure));
    final tDate = DateTime(2021, 02, 02);

    // Acts
    await store.getSpaceMediaFromDate(tDate);

    // Expects
    store.observer(onError: (error) {
      expect(error, tFailure);
      verify(() => mockUsecase(tDate)).called(1);
    });
  });
}
