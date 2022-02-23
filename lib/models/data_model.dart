import 'package:charts_flutter/flutter.dart' as charts;


class Category {
  String category;
  String limit;
  Category(this.category, this.limit);
}

class Day {
  int day;
  Map<String, int> expense;
  Day(this.day, this.expense);
}

// class Expense {
//   int day;
//   String category;
//   int amount;
// }

class Expense {
  late int day;
  late String category;
  late int amount;
}

var budgetData = {
  'totalBudget': 100,
  'categories': {
    'food': 40,
    'transport': 30,
    'misc': 30
  }
};

class Data {
  int week;
  Map<String, int> expense;
  Data(this.week, this.expense);
}

class FullAnalysis {
  int week;
  int amount;
  FullAnalysis(this.week, this.amount);
}

class ProvideData {
  static List<charts.Series<Data, String>> _createRandomData() {

    final weekData = [
      Data(1, {
        'food': 7,
        'transport': 7,
        'misc': 2
      }),
      Data(2, {
        'food': 10,
        'transport': 5,
        'misc': 3
      }),
      Data(3, {
        'food': 11,
        'transport': 11,
        'misc': 12
      }),
      Data(4, {
        'food': 12,
        'transport': 7,
        'misc': 8
      }),
    ];

    return [
      charts.Series<Data, String>(
        id: 'Expenses',
        domainFn: (Data data, _) => "Week ${data.week}",
        measureFn: (Data data, _) => data.expense['food'],
        data: weekData,
        fillColorFn: (Data data, _) {
          return charts.MaterialPalette.gray.shadeDefault;
        },
      ),
      charts.Series<Data, String>(
        id: 'Expenses',
        domainFn: (Data data, _) => "Week ${data.week}",
        measureFn: (Data data, _) => data.expense['transport'],
        data: weekData,
        fillColorFn: (Data data, _) {
          return charts.MaterialPalette.green.shadeDefault;
        },
      ),
      charts.Series<Data, String>(
        id: 'Expenses',
        domainFn: (Data data, _) => "Week ${data.week}",
        measureFn: (Data data, _) => data.expense['misc'],
        data: weekData,
        fillColorFn: (Data data, _) {
          return charts.MaterialPalette.teal.shadeDefault;
        },
      ),
    ];
  }


  static List<charts.Series<FullAnalysis, int>> _createSampleData() {

    final foodData = [
      FullAnalysis(0, 0),
      FullAnalysis(1, 7),
      FullAnalysis(2, 17),
      FullAnalysis(3, 28),
      FullAnalysis(4, 40)
    ];

    final transportData = [
      FullAnalysis(0, 0),
      FullAnalysis(1, 7),
      FullAnalysis(2, 12),
      FullAnalysis(3, 23),
      FullAnalysis(4, 30)
    ];

    final miscData = [
      FullAnalysis(0, 0),
      FullAnalysis(1, 2),
      FullAnalysis(2, 5),
      FullAnalysis(3, 19),
      FullAnalysis(4, 27)
    ];

    return [
      charts.Series<FullAnalysis, int>(
        id: 'Food',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (FullAnalysis data, _) => data.week,
        measureFn: (FullAnalysis data, _) => data.amount,
        data: foodData,
      ),
      charts.Series<FullAnalysis, int>(
        id: 'Transport',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (FullAnalysis data, _) => data.week,
        measureFn: (FullAnalysis data, _) => data.amount,
        data: transportData,
      ),
      charts.Series<FullAnalysis, int>(
        id: 'Miscellaneous',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (FullAnalysis data, _) => data.week,
        measureFn: (FullAnalysis data, _) => data.amount,
        data: miscData,
      ),
    ];
  }



  static barChart() {
    return charts.BarChart(
      _createRandomData(),
      animate: true,
      vertical: true,
      barGroupingType: charts.BarGroupingType.grouped,
      defaultRenderer: charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.grouped,
        strokeWidthPx: 1.0,
      ),
    );
  }

  static lineChart() {
    return charts.LineChart(
        _createSampleData(),
        defaultRenderer:
        charts.LineRendererConfig(includeArea: true, stacked: true),
        animate: false
    );
  }

}

var expenseDataPerWeek = {
  1: {
    'food': 7,
    'transport': 7,
    'misc': 2
  },
  2: {
    'food': 10,
    'transport': 5,
    'misc': 3
  },
  3: {
    'food': 11,
    'transport': 11,
    'misc': 12
  },
  4: {
    'food': 12,
    'transport': 7,
    'misc': 8
  },
};
