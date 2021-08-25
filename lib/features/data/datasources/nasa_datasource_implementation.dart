import 'dart:convert';

import 'package:apod_nasa/core/errors/exceptions.dart';
import 'package:apod_nasa/core/http_client/http_client.dart';
import 'package:apod_nasa/core/keys/nasa_api_keys.dart';
import 'package:apod_nasa/core/utils/data_to_string__converter.dart';
import 'package:apod_nasa/features/data/datasources/endpoints/nasa_endpoints.dart';
import 'package:apod_nasa/features/data/datasources/space_media_datasource.dart';
import 'package:apod_nasa/features/data/models/space_media_model.dart';

class NasaDatasourceImplementation implements ISpaceMediaDatasource {
  final HttpClient client;

  NasaDatasourceImplementation(this.client);

  @override
  Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime date) async {
    final response = await client.get(NasaEndpoints.apod(
        NasaApiKeys.apiKey, DataToStringConverter.convert(date)));

    if (response.statusCode == 200) {
      return SpaceMediaModel.fromJson(json.decode(response.data));
    } else {
      throw ServerException("error");
    }
  }
}
