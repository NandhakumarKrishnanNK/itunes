import 'package:flutter/material.dart';
import 'package:itunes/src/model/itunes_model.dart';

import 'list_card.dart';

class ListViewCardWidget extends StatelessWidget {
  const ListViewCardWidget({super.key, required this.listData});
  final List<Results> listData;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return ListCardView(data: listData[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 8.0);
        },
        itemCount: listData.length);
  }
}
