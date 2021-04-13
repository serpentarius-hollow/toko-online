import 'package:flutter/material.dart';

import '../../../core/constant/constant.dart';
import '../../../data/dummy.dart';
import 'item_grid.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    Key key,
  }) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> with TickerProviderStateMixin {
  final _snk = items.where((element) => element.category == 'SNK').toList();
  final _wtc = items.where((element) => element.category == 'WTC').toList();
  final _bkp = items.where((element) => element.category == 'BKP').toList();

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(kPadding),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Our Products',
              style: Theme.of(context).textTheme.headline5.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Row(
              children: [
                Text(
                  'Sort by',
                  style: TextStyle(color: Colors.grey[800]),
                ),
                DropdownButton(
                  items: const [],
                  onChanged: null,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Theme(
          data: ThemeData(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
          child: buildTabBar(context),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: [
            ItemGrid(items: _snk),
            ItemGrid(items: _wtc),
            ItemGrid(items: _bkp),
          ][_tabController.index],
        ),
      ],
    );
  }

  TabBar buildTabBar(BuildContext context) {
    return TabBar(
      controller: _tabController,
      indicatorColor: Colors.transparent,
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: Theme.of(context).primaryColor,
      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
      isScrollable: true,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      tabs: const [
        Tab(text: 'Sneakers'),
        Tab(text: 'Watch'),
        Tab(text: 'Backpack'),
      ],
    );
  }
}
