import 'package:flutter/material.dart';
import 'package:kuis_tpm_123210022/data/game_store.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kuis_tpm_123210022/pages/game_detail_page.dart';

//Template color dari tugas
const dune = Color.fromARGB(255, 51, 51, 51);
const lightGrey = Color.fromARGB(255, 217, 217, 217);
const paleSky = Color.fromARGB(255, 107, 116, 123);
const pacificBlue = Color.fromARGB(255, 0, 145, 182);
const oceanBlue = Color.fromARGB(255, 0, 103, 165);

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: (Scaffold(
          body: Column(
        children: [header(context), gridViewLayout(context)],
      ))),
    );
  }

  Widget header(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: oceanBlue,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Text(
        "Game List",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget gridViewLayout(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: (GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: gameList.length,
          itemBuilder: (context, index) {
            return gameCard(context, index);
          },
          shrinkWrap: true,
        )),
      ),
    );
  }

  Widget gameCard(BuildContext context, int index) {
    String gameTags =
        gameList[index].tags.toString().replaceAll('[', '').replaceAll(']', '');

    return (Card(
      child: ListView(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(6.0),
              topRight: Radius.circular(6.0),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameDetailPage(gameList[index]),
                  ),
                );
              },
              child: imageSlider(gameList[index].imageUrls),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  gameList[index].name,
                  style: const TextStyle(
                    color: dune,
                    fontSize: 8,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "Tags: $gameTags",
                  style: const TextStyle(fontSize: 6, color: dune),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 10,
                      color: Color.fromARGB(255, 232, 175, 30),
                    ),
                    Text(
                      gameList[index].reviewAverage,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 232, 175, 30),
                        fontSize: 10,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 10,
                      color: dune,
                    ),
                    Text(
                      gameList[index].reviewCount,
                      style: const TextStyle(
                        color: dune,
                        fontSize: 10,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.money_rounded,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      gameList[index].price,
                      style: const TextStyle(fontSize: 8, color: dune),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget imageSlider(List<String> imageUrls) {
    return (CarouselSlider(
      items: imageUrls
          .map((imageUrl) => Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ))
          .toList(),
      options: CarouselOptions(
          height: 80.0,
          viewportFraction: 1,
          enableInfiniteScroll: true,
          autoPlayCurve: Easing.standard),
    ));
  }
}
