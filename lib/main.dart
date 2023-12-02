import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore_for_file: public_member_api_docs
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smooth Page Indicator Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    // imagesディレクトリにある画像を読み込む
    final images = [
      'images/0.png',
      'images/1.png',
      'images/2.png',
      'images/3.png',
      'images/4.png',
      'images/5.png',
    ];
    // 画像の名前をリストに格納する
    final title = [
      '0.png',
      '1.png',
      '2.png',
      '3.png',
      '4.png',
      '5.png',
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 16),
              SizedBox(
                height: 270, // Cardの高さを調節する
                child: PageView.builder(
                  controller: controller,
                  itemCount: images.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              // ローカルの画像を表示する
                              child: SizedBox(
                                width: 150,
                                height: 150,
                                child: Image.asset(
                                  images[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              title[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            // スライドするCSSみたいな丸を表示する
                            // Cardの中で表示
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: SmoothPageIndicator(
                                controller: controller,
                                count: images.length,
                                effect: const JumpingDotEffect(
                                  activeDotColor: Colors.blue,
                                  dotColor: Colors.grey,
                                  dotHeight: 16,
                                  dotWidth: 16,
                                  spacing: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Cardの外で表示
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: SmoothPageIndicator(
                  controller: controller,
                  count: images.length,
                  effect: const SlideEffect(
                    activeDotColor: Colors.blue,
                    dotColor: Colors.grey,
                    dotHeight: 16,
                    dotWidth: 16,
                    spacing: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const colors = [
  Colors.red,
  Colors.green,
  Colors.greenAccent,
  Colors.amberAccent,
  Colors.blue,
  Colors.amber,
];
