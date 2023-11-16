import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  testWidgets("Hello World Test", (WidgetTester tester)async{
    await tester.pumpWidget(const MyApp());

   expect(find.byKey(const Key("Result")), findsOneWidget);
  expect(find.byKey(const Key("displayone")), findsOneWidget);
  expect(find.byKey(const Key("displaytwo")), findsOneWidget);
  expect(find.byIcon(CupertinoIcons.multiply), findsOneWidget);
  await tester.enterText(find.byKey(Key("displayone")), "20");
  await tester.enterText(find.byKey(Key("displaytwo")), "10");
  await tester.tap(find.byIcon(CupertinoIcons.multiply));
  await tester.pump();
  expect(find.text("100"), findsOneWidget);

  
  
  });
}