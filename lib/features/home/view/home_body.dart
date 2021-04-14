import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constant/constant.dart';
import '../bloc/home_bloc.dart';
import 'item_grid.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    Key key,
  }) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> with TickerProviderStateMixin {
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
          child: _buildTabBar(context),
        ),
        const SizedBox(
          height: 10,
        ),
        BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is HomeLoadSuccess) {
              final _snk = state.items
                  .where((element) => element.category == 'SNK')
                  .toList();
              final _wtc = state.items
                  .where((element) => element.category == 'WTC')
                  .toList();
              final _bkp = state.items
                  .where((element) => element.category == 'BKP')
                  .toList();

              return Center(
                child: [
                  ItemGrid(items: _snk),
                  ItemGrid(items: _wtc),
                  ItemGrid(items: _bkp),
                ][_tabController.index],
              );
            }
            return Container();
          },
        )
      ],
    );
  }

  TabBar _buildTabBar(BuildContext context) {
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
