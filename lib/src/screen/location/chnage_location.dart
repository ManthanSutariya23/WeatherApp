import 'package:flutter/material.dart';


class ChangeLocation extends StatefulWidget {
  const ChangeLocation({Key? key}) : super(key: key);

  @override
  State<ChangeLocation> createState() => _ChangeLocationState();
}

class _ChangeLocationState extends State<ChangeLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('chnage location'),
      ),
    );
  }
}

