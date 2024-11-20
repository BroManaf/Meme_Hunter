import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tamanaf/main.dart';  // Adjust 'tamanaf' if needed

void main() {
  testWidgets('Meme App launches and displays HomeScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Check if HomeScreen is displayed by finding a specific widget or text.
    expect(find.text('Memes'), findsOneWidget);  // Adjust text if necessary, or use find.byType(HomeScreen)
  });
}
