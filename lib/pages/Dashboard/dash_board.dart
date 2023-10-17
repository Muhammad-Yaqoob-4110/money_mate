import 'package:flutter/material.dart';
import 'package:money_mate/pages/Dashboard/account.dart';

class DashBoard extends StatelessWidget {
  final dynamic data;

  DashBoard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Mate',
      home: HomeScreen(data: data),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  final dynamic data;

  HomeScreen({Key? key, required this.data}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState(data: data);
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final Color customColor = const Color(0xFF666666);
  final Color appColor = const Color(0xFF64C9AC);
  late List<Widget> _pages;

  _HomeScreenState({required dynamic data});

  @override
  void initState() {
    super.initState();

    _pages = [
      const Center(child: Text('Groups')),
      const Center(child: Text('Friends')),
      const Center(child: Text('Activity')),
      AccountScreen(data: widget.data),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final List<String> tabTitles = ['GROUPS', 'FRIENDS', 'ACTIVITY', 'ACCOUNT'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _currentIndex == 3 ? 'ACCOUNT' : tabTitles[_currentIndex],
        ),
        backgroundColor: appColor,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: customColor,
        unselectedItemColor: customColor,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'GROUPS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'FRIENDS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'ACTIVITY',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'ACCOUNT',
          ),
        ],
      ),
    );
  }
}
