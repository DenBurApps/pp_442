// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:pp_521/config/router/bottoom_navbar_item.dart';
// import 'package:pp_521/config/router/router.dart';
// import 'package:pp_521/core/extensions/theme_context_extension.dart';
// import 'package:pp_521/gen/assets.gen.dart';

// @RoutePage()
// class NavbarWrapperScreen extends StatelessWidget {
//   const NavbarWrapperScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AutoTabsScaffold(
//       animationDuration: Duration.zero,
//       routes: const [
        
//       ],
//       bottomNavigationBuilder: (_, tabsRouter) {
//         return SizedBox(
//           height: 100,
//           child: Column(
//             children: [
//               Divider(
//                 color: context.colors.outline,
//                 height: 0,
//                 thickness: 0.1,
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   BottomNavbarItem(
//                     title: 'Home',
//                     assetName: Assets.icons.navbar.home,
//                     index: 0,
//                     activeIndex: tabsRouter.activeIndex,
//                   ),
//                   BottomNavbarItem(
//                     title: 'Cleaning',
//                     assetName: Assets.icons.navbar.cleaning,
//                     index: 1,
//                     activeIndex: tabsRouter.activeIndex,
//                   ),
//                   BottomNavbarItem(
//                     title: 'Shopping',
//                     assetName: Assets.icons.navbar.shopping,
//                     index: 2,
//                     activeIndex: tabsRouter.activeIndex,
//                   ),
//                   BottomNavbarItem(
//                     title: 'Settings',
//                     assetName: Assets.icons.navbar.settings,
//                     index: 3,
//                     activeIndex: tabsRouter.activeIndex,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
