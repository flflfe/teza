import 'package:flutter/material.dart';

class SeedWidget extends StatelessWidget {
  final List<String> seed;

  const SeedWidget({this.seed});

  List<Widget> _generateWidgets() {
    List<Widget> widgets = [];

    seed.forEach((element) {
      var newWidget = Padding(
        padding: const EdgeInsets.only(
          right: 5.0,
          top: 4.0,
          bottom: 4.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              element,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
      );

      widgets.add(newWidget);
    });

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _generateWidgets(),
    );
  }
}
