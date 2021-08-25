import 'dart:convert';

import 'package:apod_nasa/features/data/models/space_media_model.dart';
import 'package:apod_nasa/features/domain/entities/space_media_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/space_media_mock.dart';

void main() {
  final tSpaceMediaModel = SpaceMediaModel(
    description: 'Meteors',
    mediaType: 'image',
    title: 'A Colorful Quadrantid Meteor',
    mediaUrl:
        'https://apod.nasa.gov/apod/image/2102/MeteorStreak_Kuszaj_1080.jpg',
  );

  test('verificar se o modelo herda SpaceMediaEntity', () {
    expect(tSpaceMediaModel, isA<SpaceMediaEntity>());
  });

  test('retornar um modelo válido', () {
    // Arrange
    final Map<String, dynamic> jsonMap = json.decode(spaceMediaMock);

    // Act
    final result = SpaceMediaModel.fromJson(jsonMap);

    // Assert
    expect(result, tSpaceMediaModel);
  });

  test('retornar um json do modelo', () {
    // Arrange
    final expectedMap = {
      "explanation": "Meteors",
      "media_type": "image",
      "title": "A Colorful Quadrantid Meteor",
      "url":
          "https://apod.nasa.gov/apod/image/2102/MeteorStreak Kuszaj 1080.jpg"
    };

    // Act
    final result = tSpaceMediaModel.toJson();

    //Assert
    expect(result, expectedMap);
  });
}
