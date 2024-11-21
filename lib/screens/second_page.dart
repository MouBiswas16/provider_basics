import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basics/screens/list_provider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({
    super.key,
  });

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ListProvider>(
      builder: (BuildContext context, ListProvider provider, Widget? child) {
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
                provider.numbers.last.toString(),
                style: const TextStyle(fontSize: 24),
              ),
              Expanded(
                child: ListView.builder(
                  // scrollDirection: Axis.vertical,
                  itemCount: provider.numbers.length,
                  itemBuilder: (context, index) {
                    return Text(
                      provider.numbers[index].toString(),
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
              provider.add();
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
