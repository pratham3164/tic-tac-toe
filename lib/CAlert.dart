import 'dart:ui';

import 'package:flutter/material.dart';

class CustomAlert extends StatelessWidget {
   final title;
   final content;
   final VoidCallback callBack;
   final actionText;

   CustomAlert(this.title,this.content,this.callBack,[this.actionText="Reset"]);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:Text(title),
      content: Text(content),
      actions: <Widget>[
        FlatButton(
          onPressed: callBack,
          color: Colors.red,
          child: Text(actionText),
          )

      ],
      
    );
  }
}