import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kuis_tpm_123210022/data/game_store.dart';

const dune = Color.fromARGB(255, 51, 51, 51);
const lightGrey = Color.fromARGB(255, 217, 217, 217);
const paleSky = Color.fromARGB(255, 127, 116, 123);
const pacificBlue = Color.fromARGB(255, 0, 145, 182);
const oceanBlue = Color.fromARGB(255, 0, 123, 165);

class GameDetailPage extends StatelessWidget {
  const GameDetailPage(this.gameItem, {super.key});

  final GameStore gameItem;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            gameItem.name,
          ),
          backgroundColor: oceanBlue,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              imageSlider(gameItem.imageUrls),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: cardDetails(),
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget imageSlider(List<String> imageUrls) {
    return CarouselSlider(
      items: imageUrls
          .map((imageUrl) => Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ))
          .toList(),
      options: CarouselOptions(
          height: 350.0,
          viewportFraction: 1,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayCurve: Easing.standard),
    );
  }

  Widget cardDetails() {
    return (Card(
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            gameItem.name,
            style: const TextStyle(
              color: dune,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "Release date: ${gameItem.releaseDate}",
            style: const TextStyle(
              color: dune,
              fontSize: 12,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              const Text(
                "Tags: ",
                style: TextStyle(fontSize: 12, color: dune),
              ),
              Text(
                gameItem.tags
                    .toString()
                    .replaceAll('[', '')
                    .replaceAll(']', ''),
                style: const TextStyle(
                  fontSize: 12,
                  color: dune,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                size: 12,
                color: Color.fromARGB(255, 232, 175, 30),
              ),
              Text(
                gameItem.reviewAverage,
                style: const TextStyle(
                  color: Color.fromARGB(255, 232, 175, 30),
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              const Icon(
                Icons.person,
                size: 12,
                color: dune,
              ),
              Text(
                gameItem.reviewCount,
                style: const TextStyle(
                  color: dune,
                  fontSize: 12,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            gameItem.price,
            style: const TextStyle(fontSize: 12, color: dune),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            gameItem.about,
            style: const TextStyle(fontSize: 12, color: dune),
          )
        ],
      ),
    ));
  }
}
