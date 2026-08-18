import 'package:basic_project/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../manager/layout_cubit.dart';

class LayoutView extends StatelessWidget {
  const LayoutView(this.navigationShell, {super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Scaffold(
          body: navigationShell,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navigationShell.currentIndex,
            onTap: (index) {
              navigationShell.goBranch(index);
              context.read<LayoutCubit>().changeCurrentIndex(index);
            },
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: context.colors.background,
            unselectedItemColor: context.colors.backgroundSecondary,
            type: BottomNavigationBarType.shifting,

            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'home',
                backgroundColor: context.colors.foreground,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'home',
                backgroundColor: context.colors.foreground,
              ),
            ],
          ),
        );
      },
    );
  }
}
