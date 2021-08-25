import 'package:apod_nasa/features/domain/entities/space_media_entity.dart';
import 'package:apod_nasa/features/presenter/controllers/home_controller.dart';
import 'package:apod_nasa/features/presenter/widgets/custom_shimmer.dart';
import 'package:apod_nasa/features/presenter/widgets/description_bottom_sheet.dart';
import 'package:apod_nasa/features/presenter/widgets/image_network_with_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class PicturePage extends StatefulWidget {
  @override
  _PicturePageState createState() => _PicturePageState();
}

class _PicturePageState extends ModularState<PicturePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return ScopedBuilder(
      store: store,
      onLoading: (context) => Center(
        child: CircularProgressIndicator(),
      ),
      onError: (context, error) => Center(
        child: Text(
          'Ocorreu um erro',
          style: Theme.of(context).textTheme.caption,
        ),
      ),
      onState: (context, SpaceMediaEntity spaceMedia) => GestureDetector(
        onVerticalDragUpdate: (update) {
          if (update.delta.dy < 0) {
            showDescriptionBottonSheet(
              context: context,
              title: spaceMedia.title,
              description: spaceMedia.description,
            );
          }
        },
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: spaceMedia.mediaType == 'video'
                  ? Center(
                      child: Text('Não é possivel rodar o vídeo'),
                    )
                  : spaceMedia.mediaUrl.length > 0
                      ? ImageNetworkWithLoader(
                          spaceMedia.mediaUrl,
                        )
                      : Container(),
            ),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: Container(
                color: Colors.black.withOpacity(0.2),
                child: CustomShimmer(
                  child: Column(
                    children: [
                      Icon(
                        Icons.keyboard_arrow_up,
                        size: 35,
                      ),
                      Text(
                        'Slide up to see the description',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
