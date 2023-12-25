import 'package:app_01/pages/detail.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:app_01/constant/index.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Grocery App',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: const Text('Hello, Hermawan!',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54)),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20.0, left: 20.0),
              child: const Text('What are you looking for?',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54)),
            ),
            CarouselSlider(
              options: CarouselOptions(height: 200.0),
              items: carouselImage.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(color: Colors.amber),
                        child: Image.asset(i, fit: BoxFit.cover));
                  },
                );
              }).toList(),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('Featured Products!',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                children: List.generate(cardContent.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailProduct(product: cardContent[index]);
                      }));
                    },
                    child: Card(
                      color: Colors.white,
                      margin: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Image.asset(cardContent[index].image,
                              fit: BoxFit.cover),
                          const SizedBox(height: 10),
                          Text(cardContent[index].label,
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(height: 10),
                          Text(
                              'Rp. ${cardContent[index].harga.toStringAsFixed(0)}',
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ]),
    );
  }
}
