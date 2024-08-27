// lib/screens/dashboard/components/velocity_chart.dart
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class VelocityChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400, // Specify the width you want
      height: 300, // Specify the height you want
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color(0xFF2A2D3E),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Diagramme de Vélocité",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LegendItem(color: Colors.purple, text: "Commitment"),
                SizedBox(width: 10),
                LegendItem(color: Colors.yellow, text: "Completed"),
              ],
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: BarChart(
                BarChartData(
                  barGroups: [
                    BarChartGroupData(
                      x: 4,
                      barRods: [
                        BarChartRodData(
                          toY: 3,
                          color: Colors.purple,
                          width: 15,
                          borderRadius: BorderRadius.zero,
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 5,
                      barRods: [
                        BarChartRodData(
                          toY: 3,
                          color: Colors.purple,
                          width: 15,
                          borderRadius: BorderRadius.zero,
                        ),
                        BarChartRodData(
                          toY: 1,
                          color: Colors.yellow,
                          width: 15,
                          borderRadius: BorderRadius.zero,
                        ),
                      ],
                    ),
                  ],
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 4:
                              return Text(
                                'Sprint 4',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              );
                            case 5:
                              return Text(
                                'Sprint 5',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              );
                            default:
                              return Text(
                                '',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              );
                          }
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) => Text(
                          value.toInt().toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  gridData: FlGridData(show: false),
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          '${rod.toY}',
                          TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                    touchCallback: (FlTouchEvent event, barTouchResponse) {},
                    handleBuiltInTouches: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  LegendItem({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          color: color,
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
