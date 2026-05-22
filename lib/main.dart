
import 'package:flutter/material.dart';

void main() {
  runApp(EarnApp());
}

class EarnApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Earn App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int coins = 0;

  void earnCoins() {
    setState(() {
      coins += 10;
    });
  }

  void withdrawCoins() {
    if (coins >= 100) {
      setState(() {
        coins -= 100;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Withdrawal Successful!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Not enough coins")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Earn Money App"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Coins: $coins",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),

            ElevatedButton(
              onPressed: earnCoins,
              child: Text("Watch Ad & Earn"),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: withdrawCoins,
              child: Text("Withdraw (100 coins)"),
            ),
          ],
        ),
      ),
    );
  }
}
