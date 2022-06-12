// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Dog>(
      create: (context) => Dog(name: 'Billy', breed: 'Bulldog', age: 3),
      child: MaterialApp(
        title: 'Provider 05',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider 05"),
      ),
      body: Consumer<Dog>(
        builder: (BuildContext context, Dog dog, Widget? child) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              child!,
              SizedBox(
                height: 10.0,
              ),
              Text(
                '- name: ${dog.name}',
                style: const TextStyle(fontSize: 20.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              BreedAndAge(),
            ],
          ),
        ),
        child: Text(
          'I like dogs very much',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Dog>(
      builder: (_, Dog dog, __) => Column(
        children: [
          Text('- breed: ${dog.breed}', style: TextStyle(fontSize: 20.0)),
          SizedBox(
            height: 10.0,
          ),
          Age(),
        ],
      ),
    );
  }
}

class Age extends StatelessWidget {
  const Age({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Dog>(
      builder: (_, Dog dog, __) => Column(
        children: [
          Text(
            '- age: ${dog.age}',
            style: TextStyle(fontSize: 20.0),
          ),
          ElevatedButton(
            onPressed: () => dog.grow(),
            child: Text(
              'Grow',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
