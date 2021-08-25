import 'package:apod_nasa/core/http_client/http_client_implementation.dart';
import 'package:apod_nasa/features/data/datasources/nasa_datasource_implementation.dart';
import 'package:apod_nasa/features/data/repositories/space_media_repository_implementation.dart';
import 'package:apod_nasa/features/domain/usecases/get_space_media_fromdate_usecase.dart';
import 'package:apod_nasa/features/presenter/controllers/home_controller.dart';
import 'package:apod_nasa/features/presenter/pages/home_page.dart';
import 'package:apod_nasa/features/presenter/pages/picture_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class AppModule extends Module {
  @override
  List<Bind> binds = [
    Bind((i) => HomeStore(i())),
    Bind((i) => GetSpaceMediaFromDateUsecase(i())),
    Bind((i) => SpaceMediaRepositoryImplementation(i())),
    Bind((i) => NasaDatasourceImplementation(i())),
    Bind((i) => HttpClientImplementation()),
    Bind((i) => http.Client()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => HomePage()),
    ChildRoute('/picture', child: (_, __) => PicturePage()),
  ];
}
