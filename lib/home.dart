import 'package:draggable_example/my_card.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showFab = false;
  List<String> myList = [
    'Leonardo',
    'Getx',
    'Flutter',
    'Dart',
    'Teste',
    'Widget',
    'Container',
    'Row',
    'Scaffold',
    'SizedBox',
    'Stack',
    'Text',
    'FAB',
    'Column',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draggable LS example'),
      ),
      body: Center(
        child: Column(
          children: myList
              .map(
                (e) => MyCard(
                  content: e,
                  onDragStarted: () => setState(() {
                    showFab = true;
                  }),
                  onDragEnd: (detail) => setState(() {
                    showFab = false;
                  }),
                ),
              )
              .toList(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AnimatedSlide(
        duration: const Duration(seconds: 1),
        offset: showFab ? Offset.zero : const Offset(0, 2),
        child: AnimatedOpacity(
          duration: const Duration(seconds: 1),
          opacity: showFab ? 1 : 0,
          child: DragTarget<String>(
            onAccept: (content) {
              final result = myList.remove(content);
              if (result) {
                setState(() {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Removido $content'),
                    ),
                  );
                });
              }
            },
            builder: (context, candidateData, rejectedData) => Container(
              constraints: const BoxConstraints(
                minWidth: 50,
                minHeight: 50,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
                border: Border.all(color: Colors.black),
              ),
              child: const Icon(Icons.close),
            ),
          ),
        ),
      ),
    );
  }
}
