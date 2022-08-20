import 'package:flutter/material.dart';
import 'package:money_search/data/dataController.dart';
import 'package:money_search/model/moneyModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  moneyModel model = moneyModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            FutureBuilder<moneyModel?>(
                future: DataController().getMoney(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.error == true) {
                    return Text("Erro ao carregar!");
                  }
                  //moneyModel model = moneyModel();
                  model = snapshot.data ?? model;
                  return Text(model.bTCBRL?.name ?? "");
                })
          ],
        ));
  }
}
