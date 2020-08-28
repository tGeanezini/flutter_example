import 'package:flutter/material.dart';
import 'package:flutter_example/model/dog.dart';

class HelloListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: _body(),
    );
  }

  _body() {
    final dogs = [
      Dog('Jack Russel', 'assets/images/dog1.png'),
      Dog('Golden Retriever', 'assets/images/dog2.png'),
      Dog('Pug', 'assets/images/dog3.png'),
      Dog('Rottweiler', 'assets/images/dog4.png'),
      Dog('Border Collie', 'assets/images/dog5.png'),
    ];

    return ListView.builder(
      itemCount: dogs.length,
      itemExtent: 300,
      itemBuilder: (context, index) {
        final dog = dogs[index];
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _img(dog.photo),
            Container(
              child: Text(
                dog.name,
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.yellow,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  _img(String img) {
    return Container(
      child: Image.asset(
        img,
        fit: BoxFit.cover,
      ),
    );
  }
}
