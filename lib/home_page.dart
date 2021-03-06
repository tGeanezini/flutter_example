import 'package:flutter/material.dart';
import 'package:flutter_example/drawer_list.dart';
import 'package:flutter_example/pages/hello_page1.dart';
import 'package:flutter_example/pages/hello_page2.dart';
import 'package:flutter_example/pages/hello_page3.dart';
import 'package:flutter_example/nav.dart';
import 'package:flutter_example/pages/hello_list_view.dart';
import 'package:flutter_example/widgets/custom_button.dart';
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
          _buttons(),
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

  _buttons() {
    return Builder(
      builder: (context) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CustomButton(
                  text: 'ListView',
                  onPressed: () => _onClickNavigator(context, HelloListView()),
                ),
                CustomButton(
                  text: 'Page 2',
                  onPressed: () => _onClickNavigator(context, HelloPage2()),
                ),
                CustomButton(
                  text: 'Page 3',
                  onPressed: () => _onClickNavigator(context, HelloPage3()),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CustomButton(
                    text: 'Snack', onPressed: () => _onClickSnack(context)),
                CustomButton(
                    text: 'Dialog', onPressed: () => _onClickDialog(context)),
                CustomButton(text: 'Toast', onPressed: _onClickToast),
              ],
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
    ));
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);
    print('>> $s');
  }

  _onClickSnack(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Olá Marilene'),
    ));
  }

  _onClickDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text('Isso é um dialog'),
            actions: [
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  _onClickToast() {
    Fluttertoast.showToast(
      msg: 'Testando o plugin do toast',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }
}
