import 'package:booking_calendar/src/components/common_card.dart';
import 'package:flutter/material.dart';
import 'package:nil/nil.dart';

class BookingSlot extends StatelessWidget {
  const BookingSlot({
    Key? key,
    required this.child,
    required this.isBooked,
    required this.onTap,
    required this.isSelected,
    required this.isPauseTime,
    this.bookedSlotColor,
    this.selectedSlotColor,
    this.availableSlotColor,
    this.pauseSlotColor,
    this.hideBreakSlot,
  }) : super(key: key);

  final Widget child;
  final bool isBooked;
  final bool isPauseTime;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? bookedSlotColor;
  final Color? selectedSlotColor;
  final Color? availableSlotColor;
  final Color? pauseSlotColor;
  final bool? hideBreakSlot;

  Color getSlotColor() {
    if (isPauseTime) {
      return pauseSlotColor ?? Colors.grey;
    }

    if (isBooked) {
      return bookedSlotColor ?? Colors.redAccent;
    } else {
      return isSelected
          ? selectedSlotColor ?? Colors.orangeAccent
          : availableSlotColor ?? Colors.greenAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    if ((hideBreakSlot != null && hideBreakSlot == true && isPauseTime)) {
      return nil;
    } else {
      return GestureDetector(
            onTap: (!isBooked && !isPauseTime) ? onTap : null,
            child: CommonCard(
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                color: getSlotColor(),
                child: child),
          );
    }
  }
}
