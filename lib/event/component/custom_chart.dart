import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mosaico/common/const/text_styles.dart';

class CustomChart extends StatelessWidget {
  final List<int> chartData;
  final double height;
  final Color dividerLineColor;
  final Color borderLineColor;
  final Color backgroundColor;
  final Color textColor;
  final Color axisColor;
  final List<Color> gradientColors;
  final String sideTitle;
  final String bottomTitle;

  const CustomChart({
    super.key,
    required this.height,
    required this.chartData,
    required this.dividerLineColor,
    required this.borderLineColor,
    required this.backgroundColor,
    required this.textColor,
    required this.axisColor,
    required this.gradientColors,
    required this.sideTitle,
    required this.bottomTitle,
  });

  // 선 그라데이션
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: backgroundColor,
      ),
      child: SizedBox(
        height: height,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: LineChart(
            getLineChardData(),
            duration: const Duration(seconds: 2), // Optional
            curve: Curves.linear, // Optional
          ),
        ),
      ),
    );
  }

  FlLine getDividerLine(double value) {
    return FlLine(
      color: dividerLineColor,
      strokeWidth: 1,
    );
  }

  FlBorderData getFlBorderData() {
    return FlBorderData(
      show: true,
      border: Border.all(
        color: borderLineColor,
        width: 1,
      ),
    );
  }

  /// y축
  SideTitles getLeftSideTitles() {
    return SideTitles(
      showTitles: true,
      reservedSize: 8.0,
        interval: chartData.max / 4,
        getTitlesWidget: (double value, TitleMeta meta) {
          return Text(
            '',
            style: MyTextStyle.descriptionRegular.copyWith(
              color: axisColor,
            ),
            textAlign: TextAlign.center,
          );
        },
    );
    // return SideTitles(
    //   showTitles: true,
    //   reservedSize: 40.0,
    //   interval: chartData.max / 4,
    //   getTitlesWidget: (double value, TitleMeta meta) {
    //     return Text(
    //       '${value.toInt()}',
    //       style: MyTextStyle.descriptionRegular.copyWith(
    //         color: axisColor,
    //       ),
    //       textAlign: TextAlign.center,
    //     );
    //   },
    // );
  }

  /// x축
  SideTitles getBottomSideTitles() {
    return SideTitles(
      showTitles: true,
      reservedSize: 8.0,
      interval: chartData.length / 8,
      getTitlesWidget: (double value, TitleMeta meta) {
        return Text(
          "",
          style: MyTextStyle.descriptionRegular.copyWith(
            color: axisColor,
          ),
        );
      },
    );
    // return SideTitles(
    //   showTitles: true,
    //   reservedSize: 20.0,
    //   interval: chartData.length / 8,
    //   getTitlesWidget: (double value, TitleMeta meta) {
    //     return Text(
    //       "${value.toInt()}",
    //       style: MyTextStyle.descriptionRegular.copyWith(
    //         color: axisColor,
    //       ),
    //     );
    //   },
    // );
  }

  /// 전체 차트 모양
  LineChartData getLineChardData() {
    return LineChartData(
      lineBarsData: getLineBarsData(),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: getDividerLine,
        getDrawingVerticalLine: getDividerLine,
      ),

      /// x축, y축 title
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: getBottomSideTitles(),
          drawBelowEverything: true,
          axisNameWidget: Text(
            bottomTitle,
            style: MyTextStyle.descriptionRegular.copyWith(
              color: textColor,
            ),
          ),
          axisNameSize: 18.0,
        ),
        leftTitles: AxisTitles(
          sideTitles: getLeftSideTitles(),
          drawBelowEverything: true,
          axisNameWidget: Text(
            sideTitle,
            style: MyTextStyle.descriptionRegular.copyWith(
              color: textColor,
            ),
          ),
          axisNameSize: 24.0,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: getFlBorderData(),
    );
  }

  List<LineChartBarData> getLineBarsData() {
    List<FlSpot> flSpotList = chartData.mapIndexed((index, element) {
      return FlSpot(
        (1 + index).toDouble(),
        element.toDouble(),
      );
    }).toList();

    return [
      LineChartBarData(
        spots: flSpotList,
        isCurved: false,
        gradient: LinearGradient(
          colors: gradientColors,
        ),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(
          show: true,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors: gradientColors
                .map(
                  (color) => color.withOpacity(0.3),
                )
                .toList(),
          ),
        ),
      ),
    ];
  }
}
