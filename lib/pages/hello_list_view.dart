import 'package:flutter/material.dart';
import 'package:flutter_example/model/dog.dart';
import 'package:flutter_example/nav.dart';
import 'package:flutter_example/pages/dog_page.dart';

class HelloListView extends StatefulWidget {
  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _isGridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              setState(() {
                _isGridView = false;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: () {
              setState(() {
                _isGridView = true;
              });
            },
          ),
        ],
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

    if (_isGridView) {
      return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          return _buildItemView(dogs, index);
        },
      );
    } else {
      return ListView.builder(
        itemCount: dogs.length,
        itemExtent: 300,
        itemBuilder: (context, index) {
          return _buildItemView(dogs, index);
        },
      );
    }
  }

  _buildItemView(List<Dog> dogs, int index) {
    final dog = dogs[index];
    return GestureDetector(
      onTap: () {
        push(
          context,
          DogPage(
            dog: dog,
          ),
        );
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _img(dog.photo),
          Container(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                dog.name,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
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
