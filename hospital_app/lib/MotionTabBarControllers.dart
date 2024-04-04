import 'package:flutter/material.dart';
import 'package:hospital_app/ChangeNotifier.dart';
import 'package:hospital_app/MotionTabBar.dart';
import 'package:hospital_app/MotionTabBarController.dart';
import 'package:provider/provider.dart';

class YourWidget extends StatefulWidget {
  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget>
    with SingleTickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: 1,
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TabProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your App'),
        ),
        body: Consumer<TabProvider>(
          builder: (context, tabProvider, child) {
            return MotionTabBarView(
              controller: _motionTabBarController,
              children: [
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.blue,
                ),
                Container(
                  color: Colors.green,
                ),
                Container(
                  color: Colors.yellow,
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: Consumer<TabProvider>(
          builder: (context, tabProvider, child) {
            return MotionTabBar(
              labels: ['Tab 1', 'Tab 2', 'Tab 3', 'Tab 4'],
              initialSelectedTab: 1,
              tabIconColor: Colors.grey,
              tabSelectedColor: Colors.blue,
              onTabItemSelected: (int index) {
                tabProvider.setTabIndex(index);
                _motionTabBarController!.index = index;
              },
              icons: [
                Icons.home,
                Icons.notifications,
                Icons.search,
                Icons.account_circle,
              ],
              textStyle: TextStyle(color: Colors.red),
            );
          },
        ),
      ),
    );
  }
}
