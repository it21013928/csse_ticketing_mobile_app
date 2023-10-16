import 'package:flutter/material.dart';

class BusScreen extends StatefulWidget {
  @override
  _BusScreenState createState() => _BusScreenState();
}

class _BusScreenState extends State<BusScreen> {
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
        title: Text('Bus Schedule'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Add your navigation logic here
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Add your navigation logic here
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Departure:'),
                Container(
                  width: 150,
                  height: 33,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.blue, width: 1.0), // Add border styling
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0), // Add padding
                            child: Text(
                              selectedDeparture,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          width: 33, // Adjust the width as needed
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 0),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(2.0),
                              bottomRight: Radius.circular(2.0),
                            ),
                          ),
                          child: Center(
                            child: IconButton(
                              icon: Icon(Icons.arrow_drop_down),
                              onPressed: showDepartureDropdown,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Destination:'),
                Container(
                  width: 150,
                  height: 33,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.blue, width: 1.0), // Add border styling
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0), // Add padding
                            child: Text(
                              selectedDestination,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          width: 33, // Adjust the width as needed
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 0),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(2.0),
                              bottomRight: Radius.circular(2.0),
                            ),
                          ),
                          child: Center(
                            child: IconButton(
                              icon: Icon(Icons.arrow_drop_down),
                              onPressed: showDestinationDropdown,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Date:'),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Container(
                    width: 150,
                    height: 33,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue, // Set the border color here
                        width: 1.0, // Set the border width here
                      ),
                      borderRadius: BorderRadius.circular(
                        5.0, // Set the border radius here
                      ),
                    ),
                    child: Center(child: Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style: TextStyle(fontSize: 18),
                    ),)
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Perform search action
                },
                child: Text('Search'),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              color: Colors.lightBlue, // Set the background color of the table
              child: DataTable(
                columnSpacing: 10,
                columns: [
                  DataColumn(
                      label: Container(
                          width: 50,
                          child: Text('Date',
                              style: TextStyle(color: Colors.black)))),
                  DataColumn(
                      label: Container(
                          width: 100,
                          child: Text('Departure Time',
                              style: TextStyle(color: Colors.black)))),
                  DataColumn(
                      label: Container(
                          width: 80,
                          child: Text('Arrival Time',
                              style: TextStyle(color: Colors.black)))),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('2023-10-15')),
                    DataCell(Text('08:00 AM')),
                    DataCell(Text('10:00 AM')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('2023-10-16')),
                    DataCell(Text('09:00 AM')),
                    DataCell(Text('11:00 AM')),
                  ]),
                  // Add more rows as needed
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
