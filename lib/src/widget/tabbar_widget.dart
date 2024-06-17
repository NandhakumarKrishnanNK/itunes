import 'package:flutter/material.dart';
import 'package:itunes/src/widget/text_widget.dart';

// ignore: must_be_immutable
class TabbarWidget extends StatefulWidget {
  TabbarWidget({
    super.key,
    required this.tabs,
    required this.onTap,
    this.lableStyle,
    this.unSelectedLabelStyle,
    this.lableColor,
    this.selectBackgroundColor,
    this.indicatorWeight = 2,
    this.unselectedLabelColor,
    this.selectedTabDecoration,
    this.indicatorColor,
    this.labelPadding,
    this.isScrollable = false,
    this.unSelectBackgroundColor,
    this.tabBorder,
    this.tabMargin,
    this.padding,
    this.indicatorPadding,
    this.physics,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.isPrefixIcon = true,
    this.isSuffixIcon = false,
  });
  final List<String> tabs;
  final List<dynamic>? prefixIcon;
  final List<dynamic>? suffixIcon;
  final Function(int) onTap;
  final TextStyle? lableStyle;
  final TextStyle? unSelectedLabelStyle;
  final Color? lableColor;
  final double? indicatorWeight;
  final Color? unselectedLabelColor;
  final Color? selectBackgroundColor;

  final Decoration? selectedTabDecoration;
  final Color? indicatorColor;
  final EdgeInsetsGeometry? labelPadding;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? tabMargin;
  final bool isScrollable;
  final Color? unSelectBackgroundColor;
  final BoxBorder? tabBorder;
  final EdgeInsetsGeometry? indicatorPadding;
  final ScrollPhysics? physics;
  final TabController? controller;
  bool isPrefixIcon;
  bool isSuffixIcon;

  @override
  State<TabbarWidget> createState() => _TabbarWidgetState();
}

class _TabbarWidgetState extends State<TabbarWidget>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: widget.tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // Container(
    //   height: 48,
    //   decoration: BoxDecoration(
    //     // color: widget.unSelectBackgroundColor ??
    //     //     Theme.of(context).tabBarTheme.unselectedLabelColor,
    //     border: widget.tabBorder ?? Border.all(color: Colors.transparent),
    //     borderRadius: const BorderRadius.all(
    //       Radius.circular(12.0),
    //     ),
    //   ),
    return Container(
      height: 42,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: widget.unSelectBackgroundColor ??
            Theme.of(context).tabBarTheme.unselectedLabelColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(6.0),
        ),
      ),
      width: double.infinity,
      child: Container(
        margin: widget.tabMargin ??
            const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        alignment: Alignment.center,
        child: TabBar(
          controller: controller,
          padding: widget.padding,
          isScrollable: widget.isScrollable,
          labelPadding:
              widget.labelPadding ?? Theme.of(context).tabBarTheme.labelPadding,
          indicatorPadding: widget.indicatorPadding ?? EdgeInsets.zero,
          indicatorColor: widget.indicatorColor ??
              Theme.of(context).tabBarTheme.indicatorColor,
          labelStyle:
              widget.lableStyle ?? Theme.of(context).tabBarTheme.labelStyle,
          unselectedLabelStyle: widget.unSelectedLabelStyle ??
              Theme.of(context).tabBarTheme.unselectedLabelStyle,
          indicatorWeight: widget.indicatorWeight ?? 2.0,
          dividerColor: Colors.transparent,
          labelColor:
              widget.lableColor ?? Theme.of(context).tabBarTheme.labelColor,
          unselectedLabelColor: widget.unselectedLabelColor ??
              Theme.of(context).tabBarTheme.unselectedLabelColor,
          indicator: widget.selectedTabDecoration ??
              Theme.of(context).tabBarTheme.indicator,
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
            widget.onTap(index);
          },
          tabs: [
            for (int index = 0; index < widget.tabs.length; index++)
              Tab(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.tabs.length ==
                            (widget.prefixIcon?.length ?? 0))
                          Icon(widget.prefixIcon?[index],
                              size: 20,
                              color:
                                  index == selectedIndex
                                      ? Theme.of(context)
                                          .tabBarTheme
                                          .labelStyle!
                                          .color
                                      : widget.unselectedLabelColor ??
                                          Theme.of(context)
                                              .tabBarTheme
                                              .unselectedLabelStyle!
                                              .color),
                        const SizedBox(
                          width: 5,
                        ),
                        TextWidget(
                            text: widget.tabs[index],
                            textStyle: index == selectedIndex
                                ? widget.lableStyle ??
                                    Theme.of(context).tabBarTheme.labelStyle
                                : widget.unSelectedLabelStyle ??
                                    Theme.of(context)
                                        .tabBarTheme
                                        .unselectedLabelStyle),
                        const SizedBox(
                          width: 5,
                        ),
                        if (widget.tabs.length ==
                            (widget.suffixIcon?.length ?? 0))
                          Icon(widget.suffixIcon?[index],
                              size: 20,
                              color: index == selectedIndex
                                  ? widget.lableColor ??
                                      Theme.of(context)
                                          .tabBarTheme
                                          .labelStyle!
                                          .color
                                  : widget.unselectedLabelColor ??
                                      Theme.of(context)
                                          .tabBarTheme
                                          .unselectedLabelStyle!
                                          .color),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class TabbarWidgetModels {
  String? title;
  IconData? prefixIcon;
  IconData? suffixIcon;

  TabbarWidgetModels({
    this.title,
    this.prefixIcon,
    this.suffixIcon,
  });
}
