import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/user.dart';
import 'package:river_pod/web_service.dart';

import 'counter_page.dart';

final counterProvider = StateProvider.autoDispose((ref) => 0);

final userProvider = StateProvider.autoDispose<User>((ref) => User());

final websocketClientProvider = Provider.autoDispose<WebSocketClient>((ref) => FakeWebSocketClient());
final countersProvider = StreamProvider.autoDispose<int>((ref) {
  final wsClient = ref.watch(websocketClientProvider);
  return wsClient.getCounterStream();
});

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'River Pod Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green,
            brightness: Brightness.dark,
            surface: const Color(0xff003909)
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CounterPage()));
          },
          child: Text('Go to counter page'),
        ),
      ),
    );
  }
}
