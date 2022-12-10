import 'package:flutter/material.dart';

import '../model/operation_file.dart';

class TwoPages extends StatefulWidget {
  const TwoPages({Key? key}) : super(key: key);

  @override
  State<TwoPages> createState() => _TwoPagesState();
}

class _TwoPagesState extends State<TwoPages> {
  late String text;

  final List<Operations> events = [
    Operations(id: 1, operation: 'operation', dataTime: 'dataTime'),
    Operations(id: 2, operation: 'operation', dataTime: 'dataTime'),
    Operations(id: 3, operation: 'operation', dataTime: 'dataTime'),
    Operations(id: 4, operation: 'operation', dataTime: 'dataTime'),
    Operations(id: 5, operation: 'operation', dataTime: 'dataTime'),
    Operations(id: 6, operation: 'operation', dataTime: 'dataTime'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('info database'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemCount: events.length,
        itemBuilder: (_, index) => Card(
          color: Colors.cyan,
          elevation: 10,
          shadowColor: Colors.black,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            title: Text(
              '${events[index].id}',
              style: const TextStyle(fontSize: 20),
            ),
            subtitle: Text('${events[index].operation} ${events[index].dataTime}'),
            leading: const Icon(
              Icons.access_alarm_outlined,
              size: 40,
              color: Colors.black87,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, size: 40),
              onPressed: (){},
            ),
            onTap: (){},
          ),
        ),
      ),
    );
  }
}
