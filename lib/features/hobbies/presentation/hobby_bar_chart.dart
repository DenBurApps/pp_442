import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pp_442/config/theme/color_theme_extension.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby_time/hobby_time.dart';

class HobbyBarChart extends StatefulWidget {
  final List<HobbyTime> hobbyTimes;
  final DateTime selectedDate;

  const HobbyBarChart({
    super.key,
    required this.hobbyTimes,
    required this.selectedDate,
  });

  @override
  HobbyBarChartState createState() => HobbyBarChartState();
}

class HobbyBarChartState extends State<HobbyBarChart> {
  late DateTime monday;
  List<int> counts = [];
  List<BarChartGroupData> barGroups = [];

  @override
  void didUpdateWidget(covariant HobbyBarChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedDate != widget.selectedDate ||
        oldWidget.hobbyTimes != widget.hobbyTimes) {
      calculate();
    }
  }

  @override
  void initState() {
    super.initState();
    calculate();
  }

  void calculate() {
    monday = widget.selectedDate.subtract(
      Duration(days: widget.selectedDate.weekday - 1),
    );

    counts = List.generate(7, (_) => 0);

    for (var hobbyTime in widget.hobbyTimes) {
      final hobbyDate = DateTime(
          hobbyTime.date.year, hobbyTime.date.month, hobbyTime.date.day);
      for (int i = 0; i < 7; i++) {
        final currentDate = monday.add(Duration(days: i));
        final comparisonDate =
            DateTime(currentDate.year, currentDate.month, currentDate.day);

        if (hobbyDate == comparisonDate) {
          counts[i]++;
        }
      }
    }

    barGroups = List.generate(
      7,
      (index) => makeGroupData(index, counts[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        maxY: counts.isNotEmpty
            ? counts.reduce((a, b) => a > b ? a : b).toDouble()
            : 0.0,
        barGroups: barGroups,
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) =>
                  bottomTitles(value, meta, monday),
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
            ),
          ),
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
            ),
          ),
          topTitles: const AxisTitles(),
        ),
        borderData: FlBorderData(
          border: Border.all(
            color: context.colors.primary,
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, int y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y.toDouble(),
          color: ColorThemeExtension.instance.primary,
          width: 15,
        ),
      ],
    );
  }

  Widget bottomTitles(double value, TitleMeta meta, DateTime monday) {
    DateTime day = monday.add(Duration(days: value.toInt()));
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(day.day.toString()),
    );
  }
}
