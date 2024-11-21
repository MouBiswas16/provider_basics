// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider_basics/screens/list_provider.dart';
import 'package:provider_basics/screens/second_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ListProvider>(
      builder: (BuildContext context, ListProvider provider, Widget? child) {
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
                provider.numbers.last.toString(),
                style: TextStyle(fontSize: 24),
              ),
              Expanded(
                child: ListView.builder(
                  // scrollDirection: Axis.vertical,
                  itemCount: provider.numbers.length,
                  itemBuilder: (context, index) {
                    return Text(
                      provider.numbers[index].toString(),
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
                      builder: (context) => SecondPage(),
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
              provider.add();
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
