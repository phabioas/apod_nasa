import 'package:apod_nasa/features/presenter/controllers/home_controller.dart';
import 'package:apod_nasa/features/presenter/widgets/custom_app_bar.dart';
import 'package:apod_nasa/features/presenter/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  Function()? onPress() {
    var _ = showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(200, 01, 01),
      lastDate: DateTime.now(),
    ).then((value) async {
      print(value);
      await store.getSpaceMediaFromDate(value);

      Modular.to.pushNamed('/picture');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'APOD'),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Bem vindo',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  RoundButton(label: "informe a Data", onPressed: onPress),
                ],
              ),
            )),
      ),
    );
  }
}
