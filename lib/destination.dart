import 'package:flutter/material.dart';

class MyHomePage2 extends StatefulWidget {
  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
   TextEditingController _controller = TextEditingController();
  List<String> startingPoints = [
    'New York',
    'Los Angeles',
    'Chicago',
    'Houston',
    'Phoenix',
    'Philadelphia',
    'San Antonio',
    'San Diego',
    'Dallas',
    'San Jose',
    'Austin',
    'Jacksonville',
    'San Francisco',
    'Columbus',
    'Fort Worth',
  ];

  List<String> filteredStartingPoints = [];

  @override
  void initState() {
    super.initState();
  }

  void _filterStartingPoints(String searchText) {
    setState(() {
      filteredStartingPoints = startingPoints
          .where((startingPoint) =>
              startingPoint.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Starting Point Selection'),
      ),
      body: Column(
        children: <Widget>[
          TextFormField(
            controller: _controller,
            onChanged: (value) {
              if (value.length >= 2) {
                _filterStartingPoints(value);
              } else {
                setState(() {
                  filteredStartingPoints.clear();
                });
              }
            },
            decoration: InputDecoration(
              labelText: 'Enter Starting Point',
            ),
          ),
          Visibility(
            visible: filteredStartingPoints.isNotEmpty,
            child: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: filteredStartingPoints.map((startingPoint) {
                    return ListTile(
                      title: Text(startingPoint),
                      onTap: () {
                        _controller.text = startingPoint;
                        setState(() {
                          filteredStartingPoints.clear();
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
),
);
}
}
