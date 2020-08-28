import 'package:flutter/material.dart';
import 'package:flutter_example/model/dog.dart';

class DogPage extends StatelessWidget {
  final Dog dog;

  const DogPage({Key key, this.dog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dog.name),
      ),
      body: Image.asset(dog.photo),
    );
  }
}
