import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:fsdh_app/models/data_model.dart';
import 'package:fsdh_app/screens/budget_analysis.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FSDH APP',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  late PageController _pageController;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Category> listOfCategories = [
    Category("Food", "40"),
    Category("Transportation", "30"),
    Category("Misc.", "30"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Budget Analysis",
          ),
        ),
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
              const BudgetAnalysis(),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: ProvideData.barChart(),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: ProvideData.lineChart(),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          items: <BottomNavyBarItem> [
            BottomNavyBarItem(
                title: const Text('Home'),
                icon: const Icon(Icons.home)
            ),
            BottomNavyBarItem(
                title: const Text('_/time'),
                icon: const Icon(Icons.stacked_bar_chart)
            ),
            BottomNavyBarItem(
                title: const Text('_/category'),
                icon: const Icon(Icons.add_chart)
            ),
          ],
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
        )
    );
  }
}
