import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ScoreList()));
}

class ScoreList extends StatelessWidget {
  const ScoreList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA4C639),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScoreCard(title: 'Flutter', initialScore: 6),
            SizedBox(height: 10,),
            ScoreCard(title: 'Dart', initialScore: 3),
            SizedBox(height: 10,),
            ScoreCard(title: 'React', initialScore: 10),
          ],
        ),
      ),
    );
  }
}

class ScoreCard extends StatefulWidget {
  final String title;
  final int initialScore;

  const ScoreCard({super.key, required this.title, required this.initialScore});

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  late int score;

  @override
  void initState() {
    super.initState();
    score = widget.initialScore;
  }

  void onMinus() {
    setState(() {
      if (score > 0) {
        score--;
      }
    });
  }

  void onPlus() {
    setState(() {
      if (score < 10) {
        score++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Text(
                'My score in ${widget.title}',
                style: TextStyle(fontSize: 22, color: Colors.grey),
              ),

              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: onMinus,
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Text(
                        '-',
                        style: TextStyle(fontSize: 30, color: Colors.grey[700]),
                      ),
                    ),
                  ),

                  SizedBox(width: 40),

                  GestureDetector(
                    onTap: onPlus,
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Text(
                        '+',
                        style: TextStyle(fontSize: 30, color: Colors.grey[700]),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              ProgressBar(score: score),
            ],
          ),
        ),
      ],
    );
  }
}

class ProgressBar extends StatelessWidget {
  final int score;
  const ProgressBar({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    double fillAmount = score / 10.0;
    
    Color barColor;
    if (score <= 3) {
      barColor = Color(0xFF8BC34A); // Light green
    } else if (score <= 6) {
      barColor = Color(0xFF4CAF50); // Medium green
    } else {
      barColor = Color(0xFF2E7D32); // Dark green
    }

    return Container(
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!, width: 2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(23),
        child: Stack(
          children: [
            Container(color: Colors.grey[100]),

            FractionallySizedBox(
              widthFactor: fillAmount,
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  color: barColor,
                  borderRadius: BorderRadius.circular(23),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
