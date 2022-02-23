import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:fsdh_app/models/data_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


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
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24
            ),
          ),
        ),
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(24),
                height: double.infinity,
                width: double.infinity,
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Total Income", style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 18,
                                ),),
                                Text("NGN 150,000", style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                ),)
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Total Budget", style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 18,
                                ),),
                                Text("NGN 100,000", style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24,),
                    Column(
                      children: [
                        Row(
                          children: const [
                            Text("Budget Categories ..limits", style: TextStyle(
                                fontSize: 24,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold
                            ),),
                            Spacer()
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          decoration: const BoxDecoration(
                              color: Colors.white
                          ),
                          height: 280,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: listOfCategories.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(right: 16),
                                height: 250,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.grey
                                    )
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 70,
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                          color: Colors.blueGrey,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)
                                          )
                                      ),
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: Text(listOfCategories[index].category, style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.white
                                          ),)
                                      ),
                                    ),
                                    Expanded(child: Align(
                                      alignment: Alignment.center,
                                      child: Text("NGN\n${listOfCategories[index].limit.toString()}", style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          color: Colors.blueGrey
                                      ),),
                                    ))
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 24,),
                    Column(
                      children: [
                        Row(
                          children: const [
                            Text("Create Budget", style: TextStyle(
                                fontSize: 24,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold
                            ),),
                            Spacer()
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.symmetric(vertical: 16),
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextField(
                                controller: titleController,
                                decoration: const InputDecoration(
                                  hintText: 'Budget Title',
                                  filled: true,
                                  fillColor: Color(0xFFDBEDFF),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4,),
                              TextField(
                                controller: amountController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: 'Budget amount',
                                  filled: true,
                                  fillColor: Color(0xFFDBEDFF),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20,),
                              RaisedButton(
                                shape: const StadiumBorder(),
                                color: Colors.green,
                                onPressed: () {
                                  if (titleController.text.isNotEmpty && amountController.text.isNotEmpty) {
                                    setState(() {
                                      listOfCategories.insert(
                                          0, Category(titleController.text, amountController.text)
                                      );
                                      titleController.text = "";
                                      amountController.text = "";
                                    });
                                  }
                                },
                                child: Row(
                                  children: const [
                                    Spacer(),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 16),
                                      child: Text("Create Budget", style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),),
                                    ),
                                    Spacer()
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
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
