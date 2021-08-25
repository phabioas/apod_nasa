import 'package:apod_nasa/core/errors/failures.dart';
import 'package:apod_nasa/features/domain/entities/space_media_entity.dart';
import 'package:apod_nasa/features/domain/usecases/get_space_media_fromdate_usecase.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HomeStore extends NotifierStore<Failure, SpaceMediaEntity> {
  final GetSpaceMediaFromDateUsecase useCase;

  HomeStore(this.useCase)
      : super(SpaceMediaEntity(
          description: '',
          mediaType: '',
          title: '',
          mediaUrl: '',
        ));

  getSpaceMediaFromDate(DateTime? date) async {
    print('ola');
    setLoading(true);

    final result = await useCase(date);
    print(result.isRight());

    result.fold((error) => setError(error), (success) => update(success));

    setLoading(false);

    // executeEither(() => useCase(date));
  }
}
