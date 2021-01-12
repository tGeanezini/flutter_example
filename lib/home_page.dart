import 'package:flutter/material.dart';
import 'package:flutter_example/drawer_list.dart';
import 'package:flutter_example/pages/hello_page1.dart';
import 'package:flutter_example/pages/hello_page2.dart';
import 'package:flutter_example/pages/hello_page3.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Hello Flutter",
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: 'Tab 1',),
              Tab(text: 'Tab 2',),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            _body(context),
            Container(
              color: Colors.amberAccent,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
              Icons.favorite
          ),
          onPressed: () {
            _onClickFab();
          },
        ),
        drawer: DrawerList(),
      ),
    );
  }

  _onClickFab() {

  }

  _body(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16.0),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(context),
        ],
      ),
    );
  }

  _text() {
    return Text(
      "Hello World",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
      ),
    );
  }

  _pageView() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      height: 300,
      child: PageView(
        children: <Widget>[
          _img('assets/images/dog1.png'),
          _img('assets/images/dog2.png'),
          _img('assets/images/dog3.png'),
          _img('assets/images/dog4.png'),
          _img('assets/images/dog5.png'),
        ],
      ),
    );
  }

  _buttons(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _button(context, 'ListView', () => _onClickNavigator(context, HelloPage1())),
            _button(context, 'Page 2', () => _onClickNavigator(context, HelloPage2())),
            _button(context, 'Page 3', () => _onClickNavigator(context, HelloPage3())),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _button(context, 'Snack', _onClickSnack),
            _button(context, 'Dialog', _onClickDialog),
            _button(context, 'Toast', _onClickToast),
          ],
        ),
      ],
    );
  }

  _img(String img) {
    return Container(
        child: Image.asset(
      img,
      fit: BoxFit.cover,
    ));
  }

  _button(BuildContext context, String text, Function onPressed) {
    return RaisedButton(
      color: Colors.blue,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: onPressed,
    );
  }

  void _onClickNavigator(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return page;
    }));
  }

  _onClickSnack() {}

  _onClickDialog() {}

  _onClickToast() {
    Fluttertoast.showToast(
      msg: 'Testando o plugin do toast',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 5,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }
}
