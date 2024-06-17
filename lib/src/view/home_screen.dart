import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itunes/src/widget/text_widget.dart';
import '../app/utils/string_resources.dart';
import '../providers/itunes_provider.dart';
import '../viewmodel/search_itunes_viewmodel.dart';
import '../viewmodel/update_style_viewmodel.dart';
import '../widget/loading_widget.dart';
import '../widget/search_widget.dart';
import '../widget/tabbar_widget.dart';
import '../widget/gridview_card_widget.dart';
import '../widget/listview_card_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itunesData = ref.watch(iTunesProvider);
    final filteredData = ref.watch(searchItunesProvider);
    final isGridView = ref.watch(updateStyleProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('iTunes'),
      ),
      body: SafeArea(
        child: itunesData.when(
          data: (data) {
            return Column(
              children: [
                TabbarWidget(
                  tabs: const [
                    StringResource.gridLayout,
                    StringResource.listLayout
                  ],
                  labelPadding: const EdgeInsets.symmetric(horizontal: 3.0),
                  tabMargin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 3),
                  tabBorder: const Border(
                      bottom: BorderSide(color: Colors.transparent)),
                  selectedTabDecoration: BoxDecoration(
                      color: Colors.teal[200],
                      borderRadius: const BorderRadius.all(Radius.circular(6))),
                  lableStyle: const TextStyle(color: Colors.white),
                  unSelectedLabelStyle: const TextStyle(color: Colors.white),
                  unSelectBackgroundColor: Colors.grey[700],
                  onTap: (index) {
                    ref.read(updateStyleProvider.notifier).changeView();
                  },
                ),
                SearchWidget(itunesData: data),
                const SizedBox(height: 2.0),
                Expanded(
                    child: ListView.builder(
                        itemCount: filteredData.isNotEmpty
                            ? filteredData.length
                            : data.length,
                        itemBuilder: (context, index) {
                          var res =
                              filteredData.isNotEmpty ? filteredData : data;
                          return Column(
                            children: [
                              TextWidget(text: res[index].title),
                              ListViewCardWidget(listData: res[index].data),
                            ],
                          );
                        })),
                // if (isGridView)
                //   Expanded(
                //       child: GridviewCardWidget(
                //           listData: searchController.isNotEmpty
                //               ? searchController
                //               : data))
                // else
                //   Expanded(
                //       child: ListViewCardWidget(
                //           listData: searchController.isNotEmpty
                //               ? searchController
                //               : data))
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
