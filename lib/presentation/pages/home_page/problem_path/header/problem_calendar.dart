import 'package:algopath_app/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProblemCalendar extends StatefulWidget {
  const ProblemCalendar({super.key});

  @override
  State<ProblemCalendar> createState() => _ProblemCalendarState();
}

class _ProblemCalendarState extends State<ProblemCalendar> {
  late DateTime _selectedWeekStart;
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _selectedWeekStart = now.subtract(Duration(days: now.weekday - 1));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              _MonthTitlePicker(
                selectedWeekStart: _selectedWeekStart,
                onMonthSelected: (month) {
                  setState(() {
                    _selectedWeekStart = month;
                    _selectedDay = null;
                  });
                },
              ),
              // Week navigation
              _WeekNavigationButton(
                selectedWeekStart: _selectedWeekStart,
                leftPressed: () {
                  setState(() {
                    _selectedWeekStart = _selectedWeekStart.subtract(const Duration(days: 7));
                    _selectedDay = null;
                  });
                },
                rightPressed: () {
                  setState(() {
                    _selectedWeekStart = _selectedWeekStart.add(const Duration(days: 7));
                    _selectedDay = null;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildWeekView(),
        ],
      ),
    );
  }

  Widget _buildWeekView() {
    return Column(
      children: [
        _buildWeekDayHeaders(),
        const SizedBox(height: 16),
        _buildWeekDays(),
      ],
    );
  }

  Widget _buildWeekDayHeaders() {
    final weekDays = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: weekDays
          .map((day) => SizedBox(
                width: 40,
                child: Text(
                  day,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildWeekDays() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(7, (index) {
        final date = _selectedWeekStart.add(Duration(days: index));
        final isSelected = _selectedDay?.day == date.day && _selectedDay?.month == date.month;
        final hasEvents = _getEventsForDay(date).isNotEmpty;

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedDay = date;
            });
          },
          child: Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue.shade50 : null,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  date.day.toString(),
                  style: GoogleFonts.inter(
                    color: isSelected ? Colors.blue : Colors.black87,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                if (hasEvents)
                  Positioned(
                    bottom: 4,
                    child: Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }

  String _getDayName(int weekday) {
    const days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    return days[weekday - 1];
  }

  List<CalendarEvent> _getEventsForDay(DateTime date) {
    // Simulate some events
    if (date.day % 3 == 0) {
      return [
        CalendarEvent(
          title: 'Abstraction in one tone',
          startTime: '8:30',
          endTime: '10:00',
        ),
        CalendarEvent(
          title: 'Programming in Java',
          startTime: '10:30',
          endTime: '11:00',
        ),
      ];
    }
    return [];
  }
}

class CalendarEvent {
  final String title;
  final String startTime;
  final String endTime;

  CalendarEvent({
    required this.title,
    required this.startTime,
    required this.endTime,
  });
}

class _WeekNavigationButton extends StatelessWidget {
  const _WeekNavigationButton({
    required this.selectedWeekStart,
    required this.leftPressed,
    required this.rightPressed,
  });

  final DateTime selectedWeekStart;
  final VoidCallback leftPressed;
  final VoidCallback rightPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: leftPressed,
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: rightPressed,
        ),
      ],
    );
  }
}

class _MonthTitlePicker extends StatelessWidget {
  const _MonthTitlePicker({
    required this.selectedWeekStart,
    required this.onMonthSelected,
  });

  final DateTime selectedWeekStart;
  final ValueChanged<DateTime> onMonthSelected;

  @override
  Widget build(BuildContext context) {
    final currentMonthName = _getMonthName(selectedWeekStart);
    return PopupMenuButton<DateTime>(
      itemBuilder: (context) {
        return List.generate(12, (index) {
          final month = DateTime(selectedWeekStart.year, index + 1);
          return PopupMenuItem(
            value: month,
            child: Text(_getMonthName(month)),
          );
        });
      },
      tooltip: '',
      onSelected: onMonthSelected,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Text(
              currentMonthName,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }

  String _getMonthName(DateTime date) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[date.month - 1];
  }
}
