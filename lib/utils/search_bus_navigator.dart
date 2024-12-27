import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../screens/bus_search_results_screen.dart';

class SearchBusNavigator {
  static void navigateToSearchResults({
    required BuildContext context,
    required String fromCity,
    required String toCity,
    required DateTime selectedDate,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BusSearchResultsScreen(
          fromCity: fromCity,
          toCity: toCity,
          selectedDate: DateFormat('dd MMM yyyy').format(selectedDate),
        ),
      ),
    );
  }
}
