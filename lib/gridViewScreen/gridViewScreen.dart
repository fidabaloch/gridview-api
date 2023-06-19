import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GridViewScreen extends StatefulWidget {
  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
        print(data);
      });
    } else {
      print('Error in fetching data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Demo'),
      ),
      body: GridView.builder(
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 30,
        ),
        itemBuilder: (context, index) {
          return Container(
              color: Colors.teal,
              child: Column(
                children: [
                  // Image(image: ),
                  Center(
                    child: Text(
                      data[index]['name'],
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      data[index]['address']['city'],
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
