import 'package:flutter/material.dart';

class JourneyScreen extends StatefulWidget {
  @override
  _JourneyScreenState createState() => _JourneyScreenState();
}

class _JourneyScreenState extends State<JourneyScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          _buildDashboardCard(
            icon: Icons.card_membership,
            title: 'My Token',
          ),
          _buildDashboardCard(
            icon: Icons.calendar_month,
            title: 'Bus Schedule',
          ),
          _buildDashboardCard(
            icon: Icons.account_balance_wallet,
            title: 'My Balance',
          ),
          _buildDashboardCard(
            icon: Icons.money,
            title: 'Recharge',
          ),
          _buildDashboardCard(
            icon: Icons.directions_bus,
            title: 'My Journeys',
          ),
          _buildDashboardCard(
            icon: Icons.person,
            title: 'My Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardCard({required IconData icon, required String title}) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, size: 40),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
