// import 'package:flutter/material.dart';
// import 'package:fundamental_flutter/style/color_theme.dart';
// import '../model/response_detail.dart';
// import 'item_tabs.dart';

// class TabView extends StatefulWidget {
//   Menus menus;

//   TabView({required this.menus, Key? key}) : super(key: key);

//   @override
//   State<TabView> createState() => _TabViewState();
// }

// class _TabViewState extends State<TabView> with TickerProviderStateMixin {
//   @override
//   Widget build(BuildContext context) {
//     late TabController _tabController;
//     _tabController = TabController(length: 2, vsync: this);
//     return Column(
//       children: [
//         Container(
//           color: blackPrimary,
//           child: TabBar(
//             labelColor: white,
//             unselectedLabelColor: greyPrimary,
//             controller: _tabController,
//             indicatorColor: greyPrimary,
//             tabs: const [
//               Tab(
//                 text: 'Foods',
//               ),
//               Tab(
//                 text: 'Drinks',
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           width: double.maxFinite,
//           height: 300,
//           child: TabBarView(
//             controller: _tabController,
//             children: [
//               ItemTabs(foods: widget.menus.foods, product: 'foods'),
//               ItemTabs(foods: widget.menus.drinks, product: 'drinks')
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
