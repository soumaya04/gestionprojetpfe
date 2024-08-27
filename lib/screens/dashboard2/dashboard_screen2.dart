import 'package:flutter/material.dart';
import 'package:admin/responsive.dart';
import '../../constants.dart';
import 'components/header.dart';
import 'components/recent_files.dart';
import 'components/task_details.dart';
import 'components/incident_chart.dart';
import 'components/velocity_chart.dart';
import 'components/table_member.dart';

class DashboardScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              children: [
                Expanded(child: IncidentChart()),
                SizedBox(width: defaultPadding),
                Expanded(child: VelocityChart()),
              ],
            ),
            SizedBox(height: defaultPadding),
            if (!Responsive.isMobile(context)) TaskDetails(),
            if (!Responsive.isMobile(context)) SizedBox(height: defaultPadding),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RecentFiles(),
                SizedBox(height: defaultPadding),
                TableMember(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
