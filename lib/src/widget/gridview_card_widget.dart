import 'package:flutter/material.dart';
import 'package:itunes/src/model/itunes_model.dart';

import 'grid_card.dart';

class GridviewCardWidget extends StatelessWidget {
  const GridviewCardWidget({super.key, required this.listData});
  final List<Results> listData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          itemCount: listData.length,
          itemBuilder: (context, index) {
            return GridCardView(
              data: listData[index],
            );
          }),
    );
  }
}
