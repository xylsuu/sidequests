

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Sidequests',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var liked = List.empty();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  void likeCurrent() {
    if (!liked.contains(current))
    liked.add(current);

  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;
    var liked = appState.liked;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text('Flutter je crazy:'),
            BigCard(pair: pair),
        
            ElevatedButton(
              onPressed: () {
                appState.getNext();
              }, 
              child: Text('NEXT')
            )

            ElevatedButton(
              onPressed: ,
              child: child
            )
          ],
          
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    
    required this.pair,
  });

  
  final WordPair pair;
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontFamily: 'Times New Roman',
    );

    return Card(
      elevation: 30,
      
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Text(
          pair.asLowerCase,
          style: style,
        )
      ),
    );
  }
}