import 'package:flutter/material.dart';
import 'package:news_app/views/home_view.dart';
import 'package:news_app/views/web_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeView.id: (context) => HomeView(),
        WebView.id: (context) => WebView()
      },
      initialRoute: HomeView.id,
    );
  }
}
