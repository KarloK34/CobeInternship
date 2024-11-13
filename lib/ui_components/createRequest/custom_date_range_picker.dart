import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/providers/notifier_providers/form_state_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CustomDateRangePickerDialog extends ConsumerStatefulWidget {
  const CustomDateRangePickerDialog({super.key});

  @override
  _CustomDateRangePickerDialogState createState() => _CustomDateRangePickerDialogState();
}

class _CustomDateRangePickerDialogState extends ConsumerState<CustomDateRangePickerDialog> {
  DateTime _currentDate = DateTime.now();
  DateTime? _startDate;
  DateTime? _endDate;

  String get month => DateFormat('MMMM').format(_currentDate);
  String get year => DateFormat('yyyy').format(_currentDate);

  void _nextMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month + 1, 1);
    });
  }

  void _previousMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month - 1, 1);
    });
  }

  bool isWithinRange(DateTime date) {
    if (_startDate == null || _endDate == null) return false;
    return date.isAfter(_startDate!.subtract(const Duration(days: 1))) && date.isBefore(_endDate!.add(const Duration(days: 1)));
  }

  @override
  Widget build(BuildContext context) {
    final daysLabels = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: context.onSecondary,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    month,
                    style: context.titleMediumBold,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  year,
                  style: context.labelMedium,
                ),
                const SizedBox(width: 25),
                IconButton(
                  iconSize: 16,
                  color: context.primary,
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: _previousMonth,
                ),
                IconButton(
                  iconSize: 16,
                  color: context.primary,
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: _nextMonth,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: daysLabels.map((label) => Text(label, style: context.labelMedium!.copyWith(color: context.onBackgroundVariant))).toList(),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 238,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                ),
                itemCount: daysInMonth(_currentDate) + firstDayOffset(_currentDate),
                itemBuilder: (context, index) {
                  int day = index - firstDayOffset(_currentDate) + 1;
                  if (day < 1 || day > daysInMonth(_currentDate)) {
                    return Container();
                  }
                  DateTime date = DateTime(_currentDate.year, _currentDate.month, day);

                  bool isSelected = date == _startDate || date == _endDate;
                  bool isInRange = isWithinRange(date);

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_startDate == null || (date != _startDate && _endDate != null) || (date == _startDate && _endDate != null)) {
                          _startDate = date;
                          _endDate = null;
                          return;
                        }
                        if (_endDate == null) {
                          if (date.isBefore(_startDate!)) {
                            _endDate = _startDate;
                            _startDate = date;
                            return;
                          }
                          _endDate = date;
                        }
                      });
                    },
                    child: Stack(
                      children: [
                        if (isInRange || date == _startDate || date == _endDate)
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                color: context.secondary.withOpacity(0.3),
                                borderRadius: date == _startDate && _endDate == null
                                    ? BorderRadius.circular(25)
                                    : date == _endDate
                                        ? const BorderRadius.only(
                                            topRight: Radius.circular(25),
                                            bottomRight: Radius.circular(25),
                                          )
                                        : date == _startDate && _endDate != null
                                            ? const BorderRadius.only(
                                                topLeft: Radius.circular(25),
                                                bottomLeft: Radius.circular(25),
                                              )
                                            : BorderRadius.zero,
                              ),
                            ),
                          ),
                        if (date == _startDate || date == _endDate)
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                color: context.secondary,
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '$day',
                                style: context.bodyMedium!.copyWith(color: context.onSecondary),
                              ),
                            ),
                          ),
                        if (!isSelected)
                          Positioned.fill(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                '$day',
                                style: context.bodyMedium!.copyWith(
                                  color: context.primary,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(context.onSecondary),
                      backgroundColor: WidgetStatePropertyAll(context.secondary),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))),
                  onPressed: () {
                    ref.read(formStateNotifierProvider.notifier).setDate(startDate: _startDate, endDate: _endDate);
                    Navigator.pop(context);
                  },
                  child: const Text('Save'),
                ),
                const SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  int daysInMonth(DateTime date) {
    var firstDayNextMonth = (date.month < 12) ? DateTime(date.year, date.month + 1, 1) : DateTime(date.year + 1, 1, 1);
    return firstDayNextMonth.subtract(const Duration(days: 1)).day;
  }

  int firstDayOffset(DateTime date) {
    return (DateTime(date.year, date.month, 1).weekday + 6) % 7;
  }
}
