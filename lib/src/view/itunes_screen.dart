import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itunes/src/widget/grid_card.dart';
import 'package:itunes/src/widget/header_widget.dart';
import 'package:itunes/src/widget/text_widget.dart';
import '../app/utils/string_resources.dart';
import '../providers/itunes_provider.dart';
import '../viewmodel/search_itunes_viewmodel.dart';
import '../viewmodel/update_style_viewmodel.dart';
import '../widget/loading_widget.dart';
import '../widget/search_widget.dart';
import '../widget/tabbar_widget.dart';
import '../widget/listview_card_widget.dart';

class ITunesScreen extends ConsumerWidget {
  const ITunesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itunesData = ref.watch(iTunesProvider);
    final filteredData = ref.watch(searchItunesProvider);
    final isGridView = ref.watch(updateStyleProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const TextWidget(
          text: StringResource.itunes,
          textStyle: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: TabbarWidget(
        tabs: const [StringResource.gridLayout, StringResource.listLayout],
        labelPadding: const EdgeInsets.symmetric(horizontal: 3.0),
        tabMargin: const EdgeInsets.symmetric(horizontal: 0, vertical: 3),
        tabBorder: const Border(bottom: BorderSide(color: Colors.transparent)),
        selectedTabDecoration: BoxDecoration(
            color: Colors.teal[200],
            borderRadius: const BorderRadius.all(Radius.circular(6))),
        lableStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        unSelectedLabelStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        unSelectBackgroundColor: Colors.grey[700],
        onTap: (index) {
          ref.read(updateStyleProvider.notifier).changeView();
        },
      ),
      body: SafeArea(
        child: itunesData.when(
          data: (data) {
            return Column(
              children: [
                SearchWidget(itunesData: data),
                const SizedBox(height: 4),
                Expanded(
                    child: ListView.builder(
                        itemCount: filteredData.isNotEmpty
                            ? filteredData.length
                            : data.length,
                        itemBuilder: (context, index) {
                          var res =
                              filteredData.isNotEmpty ? filteredData : data;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeaderWidget(text: res[index].title),
                              const SizedBox(height: 4),
                              if (isGridView)
                                Wrap(
                                  direction: Axis.horizontal,
                                  runSpacing: 14,
                                  children: List.generate(
                                      res[index].data.length, (i) {
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 14),
                                      child: SizedBox(
                                          height: 220,
                                          child: GridCardView(
                                              data: res[index].data[i])),
                                    );
                                  }),
                                )
                              else
                                ListViewCardWidget(listData: res[index].data),
                            ],
                          );
                        })),
                const SizedBox(height: 2),
              ],
            );
          },
          loading: () => const LoadingWidget(),
          error: (error, stack) => Center(
            child: TextWidget(text: 'Error: $error'),
          ),
        ),
      ),
    );
  }
}
