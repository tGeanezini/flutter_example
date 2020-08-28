import 'package:flutter/material.dart';
import 'package:flutter_example/widgets/custom_button.dart';

class HelloPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Center(
      child: CustomButton(
        text: 'Voltar',
        onPressed: () => _onClickVoltar(context),
        color: Colors.red,
      ),
    );
  }

  _onClickVoltar(context) {
    Navigator.pop(context, 'Page 2');
  }
}
