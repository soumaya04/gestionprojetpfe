import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'components/header.dart';

class Event {
  final String title;
  final DateTime start;
  final DateTime end;
  final String type;

  Event(this.title, this.start, this.end, this.type);
}

class CalendarView extends StatefulWidget {
  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  DateTime? _selectedDay;
  late Map<DateTime, List<Event>> _events;

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _events = {
      DateTime(2024, 6, 4): [Event('Bug3', DateTime(2024, 6, 4), DateTime(2024, 6, 5), 'bug')],
      DateTime(2024, 6, 5): [Event('Ticket 3', DateTime(2024, 6, 5), DateTime(2024, 6, 10), 'story'), Event('One more', DateTime(2024, 6, 5), DateTime(2024, 6, 5), 'task')],
      DateTime(2024, 6, 9): [Event('Ticket 3', DateTime(2024, 6, 9), DateTime(2024, 6, 15), 'story')],
      DateTime(2024, 6, 16): [Event('Ticket 3', DateTime(2024, 6, 16), DateTime(2024, 6, 20), 'story'), Event('Ticket 1', DateTime(2024, 6, 16), DateTime(2024, 6, 16), 'task')],
      DateTime(2024, 6, 30): [Event('Bug2', DateTime(2024, 6, 30), DateTime(2024, 7, 2), 'bug')],
    };
  }

  List<Event> _getEventsForDay(DateTime day) {
    return _events.entries
        .where((entry) => entry.value.any((event) => day.isAfter(event.start.subtract(Duration(days: 1))) && day.isBefore(event.end.add(Duration(days: 1)))))
        .expand((entry) => entry.value)
        .toList();
  }

  Color _getEventColor(String type) {
    switch (type) {
      case 'bug':
        return Colors.red;
      case 'story':
        return Colors.blue;
      case 'task':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(411, 731), minTextAdapt: true);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChronologieHeader(),
            SizedBox(height: 16.0),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TableCalendar(
                      firstDay: DateTime.utc(2022, 1, 1),
                      lastDay: DateTime.utc(2025, 12, 31),
                      focusedDay: _focusedDay,
                      calendarFormat: _calendarFormat,
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      },
                      eventLoader: _getEventsForDay,
                      calendarStyle: CalendarStyle(
                        defaultTextStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
                        weekendTextStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
                        todayDecoration: BoxDecoration(
                          color: Colors.deepPurple,
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          shape: BoxShape.circle,
                        ),
                        markerDecoration: BoxDecoration(
                          color: Colors.blueAccent,
                          shape: BoxShape.circle,
                        ),
                      ),
                      headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                        formatButtonShowsNext: false,
                        formatButtonDecoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(8.0.r),
                        ),
                        formatButtonTextStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
                        titleTextStyle: TextStyle(color: Colors.white, fontSize: 18.sp),
                        leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white, size: 24.w),
                        rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white, size: 24.w),
                      ),
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
                        weekendStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _getEventsForDay(_selectedDay ?? DateTime.now()).length,
                      itemBuilder: (context, index) {
                        final event = _getEventsForDay(_selectedDay ?? DateTime.now())[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            color: _getEventColor(event.type),
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12.0.r),
                          ),
                          child: ListTile(
                            title: Text(
                              event.title,
                              style: TextStyle(color: Colors.white, fontSize: 16.sp),
                            ),
                            subtitle: Text(
                              '${event.start} - ${event.end}',
                              style: TextStyle(color: Colors.white70, fontSize: 12.sp),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFF202020),
    );
  }
}
