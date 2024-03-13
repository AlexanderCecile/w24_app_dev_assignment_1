import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int _guestCounter = 0;
  int _roomCounter = 0;

  void _incrementGuest() {
    setState(() {
      _guestCounter++;
    });
  }

  void _decrementGuest() {
    if (_guestCounter >= 1) {
      setState(() {
        _guestCounter--;
      });
    }
  }

  void _incrementRoom() {
    setState(() {
      _roomCounter++;
    });
  }

  void _decrementRoom() {
    if (_roomCounter >= 1) {
      setState(() {
        _roomCounter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Row(children: [
          Text('Number of guests: ${_guestCounter}'),
          IconButton(
              onPressed: _decrementGuest, icon: const Icon(Icons.remove)),
          IconButton(onPressed: _incrementGuest, icon: const Icon(Icons.add))
        ]),
        Row(children: [
          Text('Number of rooms: ${_roomCounter}'),
          IconButton(onPressed: _decrementRoom, icon: const Icon(Icons.remove)),
          IconButton(onPressed: _incrementRoom, icon: const Icon(Icons.add))
        ]),
        ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      'Currently selected: ${_guestCounter} guests and ${_roomCounter} rooms')));
            },
            child: const Text('Verify reservation')),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(),
                    body: Text(
                        'Booking successful. You selected ${_guestCounter} guests and ${_roomCounter} rooms.'),
                  ),
                ),
              );
            },
            child: const Text('Finalize booking'))
      ]),
    );
  }
}
