import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/medical_notes_provider.dart';
import 'package:todo/screens/medical_notes/medical_notes_page.dart';

void main() {
  runApp(
    // Wrap your MyApp widget with a MultiProvider to accept providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodosProvider(),
          child: const MyApp(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MedicalNotes(),
    );
  }
}
