import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itunes/src/widget/grid_card.dart';
import 'package:itunes/src/widget/header_widget.dart';
import 'package:itunes/src/widget/text_widget.dart';
import '../app/utils/string_resources.dart';
import '../providers/itunes_provider.dart';
// import '../viewmodel/itunes_viewmodel.dart';
import '../viewmodel/search_itunes_viewmodel.dart';
import '../viewmodel/update_style_viewmodel.dart';
import '../widget/loading_widget.dart';
import '../widget/search_widget.dart';
import '../widget/tabbar_widget.dart';
import '../widget/listview_card_widget.dart';

class ITunesScreen extends ConsumerWidget {
  const ITunesScreen({super.key, required this.term, required this.entity});
  final String term;
  final String entity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itunesData =
        ref.watch(iTunesProvider(ITuneParameter(term: term, entity: entity)));
    final filteredData = ref.watch(searchItunesProvider);
    final isGridView = ref.watch(updateStyleProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const TextWidget(
          text: StringResource.itunes,
          textStyle: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: TabbarWidget(
          tabs: const [StringResource.gridLayout, StringResource.listLayout],
          labelPadding: const EdgeInsets.symmetric(horizontal: 3.0),
          tabMargin: const EdgeInsets.symmetric(horizontal: 0, vertical: 3),
          tabBorder:
              const Border(bottom: BorderSide(color: Colors.transparent)),
          selectedTabDecoration: BoxDecoration(
              color: Colors.teal[200],
              borderRadius: const BorderRadius.all(Radius.circular(6))),
          lableStyle:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          unSelectedLabelStyle:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          initialIndex: isGridView ? 0 : 1,
          unSelectBackgroundColor: Colors.grey[700],
          onTap: (index) {
            ref.read(updateStyleProvider.notifier).changeView();
          },
        ),
      ),
      body: SafeArea(
        child: itunesData.when(
          data: (data) {
            return data.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        SearchWidget(itunesData: data),
                        const SizedBox(height: 4),
                        Expanded(
                            child: ListView.builder(
                                itemCount: filteredData.isNotEmpty
                                    ? filteredData.length
                                    : data.length,
                                itemBuilder: (context, index) {
                                  var res = filteredData.isNotEmpty
                                      ? filteredData
                                      : data;
                                  var wrapSpace =
                                      (MediaQuery.sizeOf(context).width - 346) /
                                          3;
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      HeaderWidget(text: res[index].title),
                                      const SizedBox(height: 4),
                                      if (isGridView)
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8,
                                              horizontal: wrapSpace),
                                          child: Wrap(
                                            direction: Axis.horizontal,
                                            alignment: WrapAlignment.start,
                                            runSpacing: 14,
                                            spacing: wrapSpace,
                                            children: List.generate(
                                                res[index].data.length, (i) {
                                              return SizedBox(
                                                  height: 220,
                                                  child: GridCardView(
                                                      data:
                                                          res[index].data[i]));
                                            }),
                                          ),
                                        )
                                      else
                                        ListViewCardWidget(
                                            listData: res[index].data),
                                    ],
                                  );
                                })),
                        const SizedBox(height: 2),
                      ],
                    ),
                  )
                : const Center(
                    child: TextWidget(
                      text: StringResource.noDataFound,
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  );
          },
          loading: () => const LoadingWidget(),
          error: (error, stack) => const Center(
            child: TextWidget(
              text: 'Error: Something went wrong.',
              textStyle: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
