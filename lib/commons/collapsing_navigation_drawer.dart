import 'package:flutter/material.dart';
import 'package:flutter_collapsing_navigation_drawer_sidebar/commons/collapsing_list_tile.dart';
import 'package:flutter_collapsing_navigation_drawer_sidebar/model/navigation_model.dart';
import 'package:flutter_collapsing_navigation_drawer_sidebar/theme.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  CollapsingNavigationDrawerState createState() {
    return CollapsingNavigationDrawerState();
  }
}

class CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 250;
  double minWidth = 70;

  bool isCollpased = true;

  AnimationController _animationController;
  Animation<double> widthAnimation;

  int currentSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
    );
    widthAnimation = Tween<double>(
      begin: maxWidth,
      end: minWidth,
    ).animate(_animationController);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => getWidget(context, widget),
    );
  }

  Widget getWidget(context, widget) {
    return Material(
      elevation: 80.0,
      child: Container(
        width: widthAnimation.value,
        color: drawerBackgroundColor,
        child: Column(
          children: <Widget>[
            CollapsingListTile(
              title: 'Nome do Cliente',
              icon: Icons.face,
              animationController: _animationController,
            ),
            Divider(
              color: selectedColor,
              height: 40.0,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, counter) {
                  return Divider(
                    height: 12.0,
                  );
                },
                itemBuilder: (context, counter) {
                  return CollapsingListTile(
                    onTap: () {
                      setState(() {
                        currentSelectedIndex = counter;
                      });
                    },
                    isSelected: currentSelectedIndex == counter,
                    title: navigationItems[counter].title,
                    icon: navigationItems[counter].icon,
                    animationController: _animationController,
                  );
                },
                itemCount: navigationItems.length,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isCollpased = !isCollpased;
                  isCollpased
                      ? _animationController.forward()
                      : _animationController.reverse();
                });
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.close_menu,
                progress: _animationController,
                color: Colors.white,
                size: 50.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
