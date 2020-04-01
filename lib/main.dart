import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TabletBottomNavigationBar(),
      ),
    );

class TabletBottomNavigationBar extends StatefulWidget {
//  const BottomNavigationBar(this.tabPages, {this.isTablet = true});

//  final List<Widget> tabPages;

  ///Content
  final List<Widget> tabPages = <Widget>[
    Center(
      child: Icon(
        Icons.check_circle_outline,
        size: 84.0,
        color: Colors.redAccent,
      ),
    ),
    Center(
      child: Icon(
        Icons.arrow_downward,
        size: 84.0,
        color: Colors.teal,
      ),
    ),
    Center(
      child: Icon(
        Icons.search,
        size: 84.0,
        color: Colors.cyan,
      ),
    ),
    Center(
      child: Icon(
        Icons.playlist_add,
        size: 84.0,
        color: Colors.black,
      ),
    ),
    Center(
      child: Icon(
        Icons.dehaze,
        size: 84.0,
        color: Colors.blue,
      ),
    ),
  ];

  @override
  _TabletBottomNavigationBarState createState() =>
      _TabletBottomNavigationBarState();
}

class _TabletBottomNavigationBarState extends State<TabletBottomNavigationBar> {
  static const int kTabletBreakpoint = 600;
  int _currentTabIndex = 0;
  bool isTablet = false;

  /// for Tablet
  Widget _buildBottomNavigationBar() {
    return SafeArea(
      child: SizedBox(
        height: 90.0,
        child: Card(
          color: Colors.black,
          shape: RoundedRectangleBorder(),
          margin: EdgeInsets.all(0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _buildBottomItem(
                        image: _currentTabIndex == 0
                            ? NavigationItem(Icons.check_circle_outline, size: 40)
                                .icoItemWhite
                            : NavigationItem(Icons.check_circle_outline, size: 40)
                                .icoItemGrey,
                        text: 'Home',
                        index: 0),
                    _buildBottomItem(
                        image: _currentTabIndex == 1
                            ? NavigationItem(Icons.arrow_downward, size: 40)
                              .icoItemWhite
                            : NavigationItem(Icons.arrow_downward, size: 40)
                              .icoItemGrey,
                        text: 'Download',
                        index: 1),
                    _buildBottomItem(
                        image: _currentTabIndex == 2
                            ? NavigationItem(
                                Icons.search,
                                size: 40
                              ).icoItemWhite
                            : NavigationItem(
                                Icons.search,
                                size: 40
                              ).icoItemGrey,
                        text: 'Search',
                        index: 2),
                    _buildBottomItem(
                        image: _currentTabIndex == 3
                            ? NavigationItem(
                                Icons.playlist_add,
                                size: 40
                              ).icoItemWhite
                            : NavigationItem(
                                Icons.playlist_add,
                                size: 40
                              ).icoItemGrey,
                        text: 'Watchils',
                        index: 3),
                    _buildBottomItem(
                        image: _currentTabIndex == 4
                            ? NavigationItem(
                                Icons.dehaze,
                                size: 40
                              ).icoItemWhite
                            : NavigationItem(
                                Icons.dehaze,
                                size: 40
                              ).icoItemGrey,
                        text: 'More',
                        index: 4),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// item of navigation
  Widget _buildBottomItem({Widget image, String text, int index}) {
    Color color = _currentTabIndex == index ? Colors.white : Colors.white60;
    return Expanded(
      child: InkResponse(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            image,
            Container(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(text, style: TextStyle(color: color, fontSize: 24.0)),
            ),
          ],
        ),
        onTap: () => setState(() => _currentTabIndex = index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;

    if (shortestSide < kTabletBreakpoint) {
      isTablet = false;
    } else {
      isTablet = true;
    }
    /// navigation item by default
    final _bottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: NavigationItem(Icons.check_circle_outline).icoItemGrey,
          activeIcon: NavigationItem(Icons.check_circle_outline).icoItemWhite,
          title: Text('Home')),
      BottomNavigationBarItem(
          icon: NavigationItem(
            Icons.arrow_downward,
          ).icoItemGrey,
          activeIcon: NavigationItem(
            Icons.arrow_downward,
          ).icoItemWhite,
          title: Text('Download')),
      BottomNavigationBarItem(
          icon: NavigationItem(
            Icons.search,
          ).icoItemGrey,
          activeIcon: NavigationItem(
            Icons.search,
          ).icoItemWhite,
          title: Text('Search')),
      BottomNavigationBarItem(
          icon: NavigationItem(
            Icons.playlist_add,
          ).icoItemGrey,
          activeIcon: NavigationItem(
            Icons.playlist_add,
          ).icoItemWhite,
          title: Text(
            'Watchils',
          )),
      BottomNavigationBarItem(
          icon: NavigationItem(
            Icons.dehaze,
          ).icoItemGrey,
          activeIcon: NavigationItem(
            Icons.dehaze,
          ).icoItemWhite,
          title: Text(
            'More',
          )),
    ];
    assert(widget.tabPages.length == _bottomNavBarItems.length);

    /// navigation item by default
    final _bottomNavBar = BottomNavigationBar(
      backgroundColor: Colors.black,
      items: _bottomNavBarItems,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white60,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedFontSize: 12.0,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );

    return Scaffold(
      backgroundColor: Colors.white30,
      body: widget.tabPages[_currentTabIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 15.0),
        child: isTablet ? _buildBottomNavigationBar() : _bottomNavBar,
      ),
    );
  }
}

class NavigationItem {
  NavigationItem(this.ico, {this.size = 24.0});
  final IconData ico;
  final double size;

  Widget get icoItemWhite => Icon(
        ico,
        size: size,
        color: Colors.white,);
  Widget get icoItemGrey => Icon(
        ico,
        size: size,
        color: Colors.white60,);
}
