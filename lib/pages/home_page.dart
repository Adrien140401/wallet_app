import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_app/main.dart';
import 'package:wallet_app/util/my_button.dart';
import 'package:wallet_app/util/my_card.dart';
import 'package:wallet_app/util/my_list_tile.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: Icon(Icons.monetization_on, size: 32,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.home, size: 32,),
              ),

              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings, size: 32, color: Colors.grey,)
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'My', 
                        style: TextStyle(
                          fontSize: 28, 
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        ' Cards',
                        style: TextStyle(fontSize: 28),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[400]
                    ),
                    child: Icon(Icons.add),
                  )
                ],
              ),
            ),
            SizedBox(height: 25,),
            

            Container(
              height: 200,
              child: PageView(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                children: [
                  MyCard(
                    balance: 5252.20,
                    cardNumber: 2345,
                    expiryMonth: 12,
                    expiryYear: 44,
                    color: Colors.deepPurple[400],
                  ),
                  MyCard(
                    balance: 100.190,
                    cardNumber: 134545,
                    expiryMonth: 443,
                    expiryYear: 76,
                    color: Colors.blue,
                  ),
                  MyCard(
                    balance: 13131.10,
                    cardNumber: 345,
                    expiryMonth: 112,
                    expiryYear: 414,
                    color: Colors.green,
                  ),
                ],
              ),
            ),

            SizedBox(height: 25,),

            SmoothPageIndicator(
              controller: _controller, 
              count: 3,
              effect: ExpandingDotsEffect(),
            ),

            SizedBox(height: 25,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Send money button 
                MyButton(
                  iconImagePath: 'lib/icons/envoyer-de-largent.png', 
                  buttonText: 'Send',
                ),


                // Pay button
                MyButton(
                  iconImagePath: 'lib/icons/carte-bancaire.png', 
                  buttonText: 'Pay',
                ),

                // bills button
                MyButton(
                  iconImagePath: 'lib/icons/de-largent.png', 
                  buttonText: 'Bills',
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  //  statistics
                  MyListTile(
                    iconImagePath: 'lib/icons/statistiques.png', 
                    tileTitle: 'Statistics', 
                    tileSubTitle: 'Payments and Icome',
                  ),

                  //  transaction historique
                  MyListTile(
                    iconImagePath: 'lib/icons/transaction.png', 
                    tileTitle: 'Transactions', 
                    tileSubTitle: 'Transaction History',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}