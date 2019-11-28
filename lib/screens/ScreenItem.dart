import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter_showcase/screens/parallax_example/HomeSimpleParallax.dart';

class ScreenItem extends StatelessWidget {
  final IconData representationIcon;
  final String title;
  final String description;
  final Widget destination;

  const ScreenItem({
    Key key,
    this.representationIcon = Icons.terrain,
    this.title = "Untiled",
    this.description = "Untiled description",
    this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(representationIcon),
      title: Text(title),
      subtitle: Text(description),
      onTap: () {
        // Caso seja uma instancia da tela do parallax, define as orientacoes permitidas para horizontal
        if (destination is HomeSimpleParallax) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ]).then((_) {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return Center(
                child: destination == null
                    ? Text(
                        "Sem destino definido",
                        textAlign: TextAlign.center,
                      )
                    : destination,
              );
            }));
          });
        } else {
          // Caso nao seja, permite todas as orientacoes padrao
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return Center(
              child: destination == null
                  ? Text(
                      "Sem destino definido",
                      textAlign: TextAlign.center,
                    )
                  : destination,
            );
          }));
        }
      },
    );
  }
}
