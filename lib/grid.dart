import 'package:flutter/material.dart';

import './grid_button.dart';

class Grid extends StatelessWidget {
  var numbers = [];
  var size;
  Function clickGrid;
  var level;

  Grid(
    this.numbers,
    this.size,
    this.clickGrid,
    this.level,
  );

  @override
  Widget build(BuildContext context) {
    var height = size.height;

    return SizedBox(
      height: height * 0.42,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: level,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            itemCount: numbers.length,
            itemBuilder: (ctx, i) {
              return numbers[i] != 0
                  ? GridButton('${numbers[i]}', () {
                      clickGrid(i);
                    })
                  : const SizedBox.shrink();
            }),
      ),
    );
  }
}
