import 'package:flutter/material.dart';
import 'package:quick_learn/utils/font_helper.dart';
import 'package:quick_learn/utils/padding_helper.dart';

class NewCourseScreenForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: PaddingHelper.defaultPadding,
        child: Column(
          children: [
            Container(
              child: Center(
                child: Text(
                  'Quick Course',
                  style: FontHelper.TitleLarge,
                ),
              ),
            ),
            Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'I Will Teach about ..',
                        border: OutlineInputBorder(gapPadding: 2),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'put some description',
                        border: OutlineInputBorder(gapPadding: 2),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
