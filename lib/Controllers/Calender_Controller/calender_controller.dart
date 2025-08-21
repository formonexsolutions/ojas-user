import 'package:get/get.dart';


class CalendarController extends GetxController {
  var focusedDay = DateTime.now().obs;
  var selectedDay = DateTime.now().obs;
  var events = <DateTime, List<String>>{}.obs;

  @override
  void onInit() {
    super.onInit();
    selectedDay.value = _normalizeDate(focusedDay.value);
    events.value = _loadIndianHolidays2025();
  }

  DateTime _normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  void onDaySelected(DateTime selected, DateTime focused) {
    selectedDay.value = _normalizeDate(selected);
    focusedDay.value = focused;
  }

  void onPageChanged(DateTime focused) {
    focusedDay.value = focused;
  }

  List<String> getEventsForDay(DateTime day) {
    return events[_normalizeDate(day)] ?? [];
  }

  void _addEvent(Map<DateTime, List<String>> map, DateTime date, String event) {
    final key = _normalizeDate(date);
    if (map.containsKey(key)) {
      map[key]!.add(event);
    } else {
      map[key] = [event];
    }
  }

  Map<DateTime, List<String>> _loadIndianHolidays2025() {

    final Map<DateTime, List<String>> holidays = {};

    // ✅ Major Holidays
    _addEvent(holidays, DateTime(2025, 1, 1), 'New Year’s Day');
    _addEvent(holidays, DateTime(2025, 1, 26), 'Republic Day');
    _addEvent(holidays, DateTime(2025, 8, 15), 'Independence Day');
    _addEvent(holidays, DateTime(2025, 10, 2), 'Gandhi Jayanti');
    _addEvent(holidays, DateTime(2025, 12, 25), 'Christmas');

    // ✅ Festivals
    _addEvent(holidays, DateTime(2025, 1, 6), 'Guru Gobind Singh Jayanti');
    _addEvent(holidays, DateTime(2025, 1, 10), 'Swami Vivekananda Jayanti');
    _addEvent(holidays, DateTime(2025, 2, 19), 'Shivaji Maharaj Jayanti');
    _addEvent(holidays, DateTime(2025, 2, 26), 'Maha Shivaratri');
    _addEvent(holidays, DateTime(2025, 3, 14), 'Holi');
    _addEvent(holidays, DateTime(2025, 3, 30), 'Gudi Padwa');
    _addEvent(holidays, DateTime(2025, 4, 6), 'Ram Navami');
    _addEvent(holidays, DateTime(2025, 4, 14), 'Ambedkar Jayanti');
    _addEvent(holidays, DateTime(2025, 5, 12), 'Buddha Purnima');
    _addEvent(holidays, DateTime(2025, 6, 7), 'Eid al-Adha');
    _addEvent(holidays, DateTime(2025, 7, 10), 'Guru Purnima');
    _addEvent(holidays, DateTime(2025, 8, 9), 'Raksha Bandhan');
    _addEvent(holidays, DateTime(2025, 8, 27), 'Ganesh Chaturthi');
    _addEvent(holidays, DateTime(2025, 10, 2), 'Dussehra');
    _addEvent(holidays, DateTime(2025, 10, 20), 'Diwali');
    _addEvent(holidays, DateTime(2025, 11, 5), 'Guru Nanak Jayanti');
    _addEvent(holidays, DateTime(2025, 12, 30), 'Tailang Swami Jayanti');

    // ✅ Ekadashi
    List<DateTime> ekadashi = [
      DateTime(2025, 1, 9),
      DateTime(2025, 1, 23),
      DateTime(2025, 2, 7),
      DateTime(2025, 2, 21),
      DateTime(2025, 3, 9),
      DateTime(2025, 3, 23),
      DateTime(2025, 4, 8),
      DateTime(2025, 4, 22),
      DateTime(2025, 5, 7),
      DateTime(2025, 5, 21),
      DateTime(2025, 6, 5),
      DateTime(2025, 6, 19),
      DateTime(2025, 7, 5),
      DateTime(2025, 7, 19),
      DateTime(2025, 8, 3),
      DateTime(2025, 8, 18),
      DateTime(2025, 9, 2),
      DateTime(2025, 9, 16),
      DateTime(2025, 10, 2),
      DateTime(2025, 10, 16),
      DateTime(2025, 11, 1),
      DateTime(2025, 11, 15),
      DateTime(2025, 12, 1),
      DateTime(2025, 12, 15),
    ];
    for (var d in ekadashi) _addEvent(holidays, d, 'Ekadashi Vrat');

    // ✅ Chaturthi
    List<DateTime> sankashti = [
      DateTime(2025, 1, 16),
      DateTime(2025, 2, 14),
      DateTime(2025, 3, 16),
      DateTime(2025, 4, 15),
      DateTime(2025, 5, 14),
      DateTime(2025, 6, 13),
      DateTime(2025, 7, 12),
      DateTime(2025, 8, 11),
      DateTime(2025, 9, 10),
      DateTime(2025, 10, 9),
      DateTime(2025, 11, 8),
      DateTime(2025, 12, 8),
    ];
    for (var d in sankashti) _addEvent(holidays, d, 'Sankashti Chaturthi');

    // ✅ Amavasya
    List<DateTime> amavasya = [
      DateTime(2025, 1, 29),
      DateTime(2025, 2, 27),
      DateTime(2025, 3, 29),
      DateTime(2025, 4, 28),
      DateTime(2025, 5, 28),
      DateTime(2025, 6, 26),
      DateTime(2025, 7, 26),
      DateTime(2025, 8, 24),
      DateTime(2025, 9, 23),
      DateTime(2025, 10, 23),
      DateTime(2025, 11, 21),
      DateTime(2025, 12, 21),
    ];
    for (var d in amavasya) _addEvent(holidays, d, 'Amavasya');

    // ✅ Purnima
    List<DateTime> purnima = [
      DateTime(2025, 1, 13),
      DateTime(2025, 2, 12),
      DateTime(2025, 3, 13),
      DateTime(2025, 4, 12),
      DateTime(2025, 5, 12),
      DateTime(2025, 6, 11),
      DateTime(2025, 7, 10),
      DateTime(2025, 8, 9),
      DateTime(2025, 9, 7),
      DateTime(2025, 10, 7),
      DateTime(2025, 11, 5),
      DateTime(2025, 12, 5),
    ];
    for (var d in purnima) _addEvent(holidays, d, 'Purnima Vrat');
    return holidays;
  }
}
