import 'dart:convert';

import 'package:apod_nasa/core/errors/exceptions.dart';
import 'package:apod_nasa/core/http_client/http_client.dart';
import 'package:apod_nasa/features/data/datasources/space_media_datasource.dart';
import 'package:apod_nasa/features/data/datasources/nasa_datasource_implementation.dart';
import 'package:apod_nasa/features/data/models/space_media_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/space_media_mock.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late ISpaceMediaDatasource datasource;
  late HttpClient client;

  setUp(() {
    client = HttpClientMock();
    datasource = NasaDatasourceImplementation(client);
  });
  final tDateTime = DateTime(2021, 02, 02);
  final urlExpect =
      "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&date=2021-02-02";

  void successMock() {
    when(() => client.get(any())).thenAnswer(
        (_) async => HttpResponse(data: spaceMediaMock, statusCode: 200));
  }

  test('chamar o método com a url correta', () async {
    // Arrange
    successMock();

    // Act
    await datasource.getSpaceMediaFromDate(tDateTime);

    //Assert
    verify(() => client.get(urlExpect)).called(1);
  });

  test('Verificar o retorno do modelo', () async {
    successMock();
    final tSpecialMockExpected =
        SpaceMediaModel.fromJson(json.decode(spaceMediaMock));

    final result = await datasource.getSpaceMediaFromDate(tDateTime);

    expect(result, tSpecialMockExpected);
  });

  test('Chamando uma excecao', () async {
    // Arrange
    when(() => client.get(any()))
        .thenAnswer((_) async => HttpResponse(data: "", statusCode: 400));

    // Act
    final result = datasource.getSpaceMediaFromDate(tDateTime);

    // Assert
    expect(() => result, throwsA(ServerException("error")));
  });
}
