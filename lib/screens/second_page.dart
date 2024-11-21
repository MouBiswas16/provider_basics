import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final List<int> numbers;
  const SecondPage({super.key, required this.numbers});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Second",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Text(
            widget.numbers.last.toString(),
            style: const TextStyle(fontSize: 24),
          ),
          Expanded(
            child: ListView.builder(
              // scrollDirection: Axis.vertical,
              itemCount: widget.numbers.length,
              itemBuilder: (context, index) {
                return Text(
                  widget.numbers[index].toString(),
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          int last = widget.numbers.last;
          setState(() {
            widget.numbers.add(last + 1);
          });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
