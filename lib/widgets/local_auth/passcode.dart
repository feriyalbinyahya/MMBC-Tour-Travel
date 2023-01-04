import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:passcode_screen/passcode_screen.dart';

// ignore: must_be_immutable
class PasscodeWidget extends StatefulWidget {
  Stream<bool> verficationStream;
  Function(String) onPassCallback;
  late final onCancelCallback;

  PasscodeWidget(
      this.verficationStream,
      this.onPassCallback,
      this.onCancelCallback,
      );


  @override
  State<PasscodeWidget> createState() => _PasscodeWidgetState();
}

class _PasscodeWidgetState extends State<PasscodeWidget> {
  @override
  Widget build(BuildContext context) {
    return PasscodeScreen(
      shouldTriggerVerification: widget.verficationStream,
      title: Text('Enter your passcode'),
      passwordEnteredCallback: widget.onPassCallback,
      deleteButton: Text('Delete'),
      cancelButton: Text('Fingerprint'),
      cancelCallback: widget.onCancelCallback,
      backgroundColor: Colors.indigo[200],
    );
  }
}