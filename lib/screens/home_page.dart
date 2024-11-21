// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider_basics/screens/second_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> numbers = [1, 2, 3, 4];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "Home Page",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Text(
            numbers.last.toString(),
            style: TextStyle(fontSize: 24),
          ),
          Expanded(
            child: ListView.builder(
              // scrollDirection: Axis.vertical,
              itemCount: numbers.length,
              itemBuilder: (context, index) {
                return Text(
                  numbers[index].toString(),
                  style: TextStyle(fontSize: 24),
                );
              },
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.blue),
              padding: WidgetStateProperty.all(EdgeInsets.all(18)),
              textStyle: WidgetStateProperty.all(
                TextStyle(fontSize: 18),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SecondPage(
                    numbers: numbers,
                  ),
                ),
              );
            },
            child: Text(
              "Second Screen",
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          int last = numbers.last;
          setState(() {
            numbers.add(last + 1);
          });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
