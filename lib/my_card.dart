import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    Key? key,
    required this.content,
    this.onDragStarted,
    this.onDragEnd,
  }) : super(key: key);
  final String content;
  final void Function()? onDragStarted;
  final void Function(DraggableDetails)? onDragEnd;

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: content,
      //feedback é o Widget que mostra flutuando enquanto arrasta
      feedback: const FlutterLogo(),
      onDragStarted: onDragStarted,
      onDragEnd: onDragEnd,

      //Child é o Widget exibido
      child: ListTile(
        leading: const FlutterLogo(),
        title: Text(content),
        trailing: const Icon(Icons.arrow_right),
      ),
    );
  }
}
