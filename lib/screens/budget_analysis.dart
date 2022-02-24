import 'package:flutter/material.dart';

import '../models/data_model.dart';

class BudgetAnalysis extends StatefulWidget {
  const BudgetAnalysis({Key? key}) : super(key: key);

  @override
  State<BudgetAnalysis> createState() => _BudgetAnalysisState();
}

class _BudgetAnalysisState extends State<BudgetAnalysis> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  List<Category> listOfCategories = [
    Category("Food", "40"),
    Category("Transportation", "30"),
    Category("Misc.", "30"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(11),
                    border: Border.all(color: Colors.black12),
                  ),
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Total Income",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "NGN 150,000",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(11),
                    border: Border.all(color: Colors.black12),
                  ),
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Total Budget",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "NGN 100,000",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            "Budget Categories ..limits",
            style: TextStyle(
              fontSize: 18,
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 96,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: listOfCategories.length,
              separatorBuilder: (context, index) => const SizedBox(
                width: 16,
              ),
              itemBuilder: (context, index) {
                return Container(
                  height: 96,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.black12,
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 44,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            listOfCategories[index].category,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Center(
                            child: Text(
                              "NGN ${listOfCategories[index].limit.toString()}",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                          ))
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            "Create Budget",
            style: TextStyle(
              fontSize: 24,
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: 'Budget Title',
                  filled: true,
                  fillColor: Color(0xFFDBEDFF),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Budget amount',
                  filled: true,
                  fillColor: Color(0xFFDBEDFF),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                        (states) => const StadiumBorder(),
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (states) => Colors.green,
                  ),
                ),
                onPressed: () {
                  if (titleController.text.isNotEmpty &&
                      amountController.text.isNotEmpty) {
                    setState(() {
                      listOfCategories.insert(
                          0,
                          Category(
                              titleController.text, amountController.text));
                      titleController.text = "";
                      amountController.text = "";
                    });
                  }
                },
                child: const Text(
                  "Create Budget",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}