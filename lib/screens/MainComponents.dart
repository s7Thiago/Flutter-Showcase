import 'package:flutter/material.dart';

import 'SamplesList.dart';

class MainComponents {
  Widget mainScreen({List<Widget> itens}) {
    return SamplesList();
  }

  Widget mainShowCaseList({List<Widget> itens}) {
    return ListView(
      children: itens == null
          ? <Widget>[mainVoidShowcaseWarning()]
          : itens.length > 0 ? itens : <Widget>[mainVoidShowcaseWarning()],
    );
  }

  Widget mainVoidShowcaseWarning() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        trailing: Icon(Icons.warning),
        leading: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
                color: Colors.black38, borderRadius: BorderRadius.circular(25)),
          ),
        ),
        title: Text("O showcase está vazio"),
        subtitle: Text(
            "Assim que um exemplo for adicionado ao showcase, ele aparecerá aqui"),
      ),
    );
  }
}
