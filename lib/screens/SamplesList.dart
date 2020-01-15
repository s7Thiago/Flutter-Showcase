import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter_showcase/screens/ScreenItem.dart';

import 'MainComponents.dart';

class SamplesList extends StatefulWidget {
  final List<ScreenItem> itens;
  final String listTitle;

  const SamplesList({
    Key key,
    this.itens,
    this.listTitle = "",
  }) : super(key: key);

  @override
  _SamplesListState createState() => _SamplesListState(
        itens,
        listTitle,
      );
}

class _SamplesListState extends State<SamplesList>
    with MainComponents, WidgetsBindingObserver {
  final List<Widget> itens;
  final String listTitle;

  _SamplesListState(this.itens, this.listTitle);

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then((_) {
      build(context);
    });

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // went to Background
      print("MainScreen.dart : Paused");
    }
    if (state == AppLifecycleState.resumed) {
      // came back to Foreground
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
          .then((_) {
        build(context);
      });
    }
  }

  void defineOrientation() {
    setState(() {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ]).then((_) {
        // print("\n\nO novo metodo foi chamado\n\n");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    defineOrientation();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: listTitle.isEmpty
            ? null
            : AppBar(
                title: Text(listTitle),
              ),
        body: mainShowCaseList(
          itens: itens,
        ),
      ),
    );
  }
}
