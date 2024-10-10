import 'package:flutter/material.dart';

void main() {
  runApp(DatagridApp());
}

class DatagridApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POTAT ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  final List<Map<String, dynamic>> titles = [
    {"name": "Dashboard", "icon": Icons.dashboard},
    {"name": "Settings", "icon": Icons.settings},
    {"name": "Accounts", "icon": Icons.account_circle},
    {"name": "Transaction", "icon": Icons.swap_horiz},
    {"name": "Reports", "icon": Icons.bar_chart},
    {"name": "Data Analysis", "icon": Icons.analytics},
    {"name": "About", "icon": Icons.info},
    {"name": "Help", "icon": Icons.help},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Grid'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Row(
                      children: [
                        Icon(
                          titles[index]["icon"],
                          color: Colors.blue,
                        ),
                        SizedBox(width: 10),
                        Text(titles[index]["name"]),
                      ],
                    ),
                    content: Text('Eto ang ${titles[index]["name"]} .'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors. blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    titles[index]["icon"],
                    color: Colors.white,
                    size: 50,
                  ),
                  SizedBox(height: 1),
                  Text(
                    titles[index]["name"],
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}