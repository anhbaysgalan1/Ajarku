import 'package:flutter/material.dart';

class NewCourseScreenForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Course Name',
                    border: OutlineInputBorder(gapPadding: 2)),
              ),
              TextFormField(),
              TextFormField(),
            ],
          ),
        )
      ],
    );
  }
}
