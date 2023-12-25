import 'package:flutter/material.dart';
import 'package:app_01/pages/home.dart';
import 'package:app_01/constant/product.dart';

class DetailProduct extends StatelessWidget {
  final Product product;
  const DetailProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(product.image),
                SafeArea(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                                backgroundColor: Colors.grey,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )),
                            const FavoriteButton(),
                          ],
                        ))),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: Text(product.label,
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('Rp. ${product.harga.toStringAsFixed(0)}',
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.green)),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('Description',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(product.deskripsi,
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black26)),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Berhasil Ditambahkan!'),
                duration: Duration(seconds: 3),
                backgroundColor: Colors.greenAccent,
              ),
            );
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Home();
            }));
          },
          child: const Icon(
            Icons.shopping_bag,
            color: Colors.white,
          ),
          backgroundColor: Colors.redAccent,
        ));
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
