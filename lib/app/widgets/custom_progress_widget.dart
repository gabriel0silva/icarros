import 'package:flutter/material.dart';

class CustomProgressWidget extends StatelessWidget {

  const CustomProgressWidget({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const CircularProgressIndicator(
        backgroundColor: Colors.black,
        color: Colors.white,
      ),
    );
  }
}
