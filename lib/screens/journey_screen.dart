import 'package:flutter/material.dart';

class JourneyScreen extends StatefulWidget {
  @override
  _JourneyScreenState createState() => _JourneyScreenState();
}

class _JourneyScreenState extends State<JourneyScreen> {
  String selectedDeparture = 'City A';
  String selectedDestination = 'City X';
  DateTime selectedDate = DateTime.now(); // Default date value

  void showDepartureDropdown() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          children: getDepartures().map((item) {
            return ListTile(
              title: Text(item.value!),
              onTap: () {
                setState(() {
                  selectedDeparture = item.value!;
                  Navigator.pop(context);
                });
              },
            );
          }).toList(),
        );
      },
    );
  }

  void showDestinationDropdown() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          children: getDestinations().map((item) {
            return ListTile(
              title: Text(item.value!),
              onTap: () {
                setState(() {
                  selectedDestination = item.value!;
                  Navigator.pop(context);
                });
              },
            );
          }).toList(),
        );
      },
    );
  }

  List<DropdownMenuItem<String>> getDepartures() {
    List<DropdownMenuItem<String>> items = [
      DropdownMenuItem(value: 'New York', child: Text('New York')),
      DropdownMenuItem(value: 'Los Angeles', child: Text('Los Angeles')),
      DropdownMenuItem(value: 'Chicago', child: Text('Chicago')),
    ];
    return items;
  }

  List<DropdownMenuItem<String>> getDestinations() {
    List<DropdownMenuItem<String>> items = [
      DropdownMenuItem(value: 'Galle', child: Text('Galle')),
      DropdownMenuItem(value: 'Matara', child: Text('Matara')),
      DropdownMenuItem(value: 'Colombo', child: Text('Colombo')),
    ];
    return items;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Journeys'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current Journey',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Date:'),
                      Text('07/08/2023'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Departure:'),
                      Text('Kandy'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Time:'),
                      Text('10.00 am'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Previous Journeys',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  DataTable(
                    columnSpacing: 20,
                    columns: [
                      DataColumn(label: Text('Date')),
                      DataColumn(label: Text('Departure')),
                      DataColumn(label: Text('Destination')),
                      DataColumn(label: Text('Fee')),
                      DataColumn(label: Text('Time')),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text('07/08/2023')),
                        DataCell(Text('Colombo')),
                        DataCell(Text('Malabe')),
                        DataCell(Text('Rs 250')),
                        DataCell(Text('10.00 am - 11.30 am')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('07/08/2023')),
                        DataCell(Text('Colombo')),
                        DataCell(Text('Malabe')),
                        DataCell(Text('Rs.250')),
                        DataCell(Text('10.00 am - 11.30 am')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('07/08/2023')),
                        DataCell(Text('Colombo')),
                        DataCell(Text('Malabe')),
                        DataCell(Text('Rs.250')),
                        DataCell(Text('10.00 am 11.30 am')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('07/08/2023')),
                        DataCell(Text('Malabe')),
                        DataCell(Text('Colombo')),
                        DataCell(Text('Rs 250')),
                        DataCell(Text('10.00 am 11:30 am')),
                      ]),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
