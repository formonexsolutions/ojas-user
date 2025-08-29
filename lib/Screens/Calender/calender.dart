import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ojas_app/Utils/custom_appbar/custome_appbar.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../Controllers/Calender_Controller/calender_controller.dart';


class CalendarView extends StatelessWidget {
  final CalendarController c = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: CustomAppBar(
          title: "Calender",
          screenWidth: Get.width,
        showBack: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Obx(
                  () => Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(10),
                child: TableCalendar(
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: c.focusedDay.value,
                  selectedDayPredicate: (day) => isSameDay(c.selectedDay.value, day),
                  onDaySelected: c.onDaySelected,
                  onPageChanged: c.onPageChanged,
                  eventLoader: (day) => c.getEventsForDay(day),
                  calendarStyle: const CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    markerDecoration: BoxDecoration(color: Colors.transparent),
                  ),
                  headerStyle: const HeaderStyle(
                    titleCentered: true,
                    formatButtonVisible: false,
                  ),
                  calendarBuilders: CalendarBuilders(
                    defaultBuilder: (context, day, focusedDay) {
                      final normalized = DateTime(day.year, day.month, day.day);
                      if (c.events.containsKey(normalized)) {
                        return Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                            shape: BoxShape.circle,
                          ),
                          child: Center(child: Text('${day.day}')),
                        );
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Obx(
                  () => Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                 // color: Colors.orange.shade500,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: 
                Container(
                   decoration:  BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(10),
                   ),
                  height: 200,
                  padding: const EdgeInsets.all(10),
                  child: 
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Festivals in ${c.focusedDay.value.month}/${c.focusedDay.value.year}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Colors.green
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...c.events.entries
                            .where((e) => e.key.month == c.focusedDay.value.month)
                            .expand((e) => e.value.map((v) => {'event': v, 'date': e.key}))
                            .map(
                              (item) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${item['event']}",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "→ ${item['date'].toString().substring(0, 10)}",
                                style: TextStyle(color: Colors.black54),
                              ),
                              const SizedBox(height: 6),
                            ],
                          ),
                        ),
                      ],
                    ),
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
