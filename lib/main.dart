import 'package:flutter/material.dart';
import 'stream.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocExample(),
    );
  }
}

class BlocExample extends StatefulWidget {
  @override
  _BlocExampleState createState() => _BlocExampleState();
}

class _BlocExampleState extends State<BlocExample> {
  final RandomNumberBloc bloc = RandomNumberBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BLoC Example')),
      body: StreamBuilder<int>(
        stream: bloc.stream,
        builder: (context, snapshot) {
          return Center(
            child: Text(
              snapshot.hasData ? '${snapshot.data}' : 'Tekan tombol!',
              style: TextStyle(fontSize: 24),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: bloc.generateNumber,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
