import 'package:flutter/material.dart';

class CalendarHomeScreen extends StatefulWidget {
  const CalendarHomeScreen({Key? key}) : super(key: key);

  @override
  State<CalendarHomeScreen> createState() => _CalendarHomeScreenState();
}

class _CalendarHomeScreenState extends State<CalendarHomeScreen> {
  DateTime _selectedDate = DateTime.now();
  int _currentIndex = 0;

  final Map<DateTime, List<Event>> _events = {
    DateTime.now(): [
      Event('Team Meeting', '10:00 AM', Colors.orange),
      Event('Lunch', '12:30 PM', Colors.green),
    ],
    DateTime.now().add(const Duration(days: 1)): [
      Event('Project Review', '2:00 PM', Colors.blue),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Calendar'),
        backgroundColor: Colors.grey[900],
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Calendar view would go here
          Expanded(
            child: ListView.builder(
              itemCount: _events[_selectedDate]?.length ?? 0,
              itemBuilder: (context, index) {
                final event = _events[_selectedDate]![index];
                return Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(12),
                    border: Border(
                      left: BorderSide(
                        color: event.color,
                        width: 4,
                      ),
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      event.title,
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      event.time,
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Event {
  final String title;
  final String time;
  final Color color;

  const Event(this.title, this.time, this.color);
}