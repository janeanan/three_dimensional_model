import 'package:flutter/material.dart';
import 'package:three_dimensional_model/model/product_model.dart';
import 'package:three_dimensional_model/view/detail/viewdetail.dart';

class ViewManage extends StatefulWidget {
  const ViewManage({super.key});

  @override
  State<ViewManage> createState() => _ViewManageState();
}

class _ViewManageState extends State<ViewManage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 255, 255, 255),
              const Color.fromARGB(255, 221, 240, 255),
              const Color.fromARGB(255, 173, 218, 255),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(spacing: 35, children: [banner(), itemGrid()]),
            ),
          ),
        ),
      ),
    );
  }

  banner() {
    var itemBanner = itemList[3];
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(itemBanner.imageUrl.toString()),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 3, offset: Offset(3, 3)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 26, 26, 26),
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    child: Text(
                      'NIKE',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.8),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    child: Text(
                      'Jordan 1 Retro High Dior',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 1, 0, 66),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                      255,
                      1,
                      0,
                      34,
                    ).withValues(alpha: 0.9),
                  ),
                  onPressed: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            ViewDetail(item: itemBanner),
                      ),
                    );
                  },
                  child: const Text(
                    'View Detail',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  itemGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          'Product list',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: const Color.fromARGB(255, 0, 12, 34),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            var itemIndex = itemList[index];
            return GestureDetector(
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        ViewDetail(item: itemList[index]),
                  ),
                );
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              itemIndex.imageUrl.isNotEmpty
                                  ? itemIndex.imageUrl.toString()
                                  : 'https://i.pinimg.com/736x/d6/58/6a/d6586a27e45d7978bbce68a57c262f2f.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        color: Colors.black.withValues(alpha: 0.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              itemIndex.name.toString(),
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                            ),
                            Text(
                              '฿${itemIndex.price.toString()}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  List<Product> itemList = [
    Product(
      id: '0',
      name: 'Air Jordan 1 Low OG Travis Scott Fragment',
      description:
          'Released in 2021, this is a rare triple collaboration between Travis Scott, Fragment Design (Hiroshi Fujiwara), and Jordan Brand. The design features a reversed Swoosh, clean white/blue/black color blocking, and branding from both collaborators — making it one of the most iconic collabs in sneaker history.',
      price: 1767,
      imageUrl:
          'https://i.pinimg.com/1200x/c7/26/9b/c7269bf9043c3cdf5567356786128bce.jpg',
      glbUrl: 'air_jordan_1_low_og_travis_scott_fragment.glb',
    ),
    Product(
      id: '1',
      name: 'Air Jordan 1 Low OG Travis Scott Mocha',
      description:
          'Launched in 2019, this was the first Travis Scott Jordan 1 Low. It introduced the reversed Swoosh trend and used earthy Mocha tones that became his signature. It marked the beginning of the “Cactus Jack” sneaker craze.',
      price: 1938,
      imageUrl:
          'https://i.pinimg.com/1200x/1c/59/6e/1c596e2b045ab549ff9a014ee6a976ae.jpg',
      glbUrl: 'air_jordan_1_low_og_travis_scott_mocha.glb',
    ),
    Product(
      id: '2',
      name: 'Air Jordan 1 Low OG Travis Scott SP Mocha',
      description:
          'Launched in 2019, this was the first Travis Scott Jordan 1 Low. It introduced the reversed Swoosh trend and used earthy Mocha tones that became his signature. It marked the beginning of the “Cactus Jack” sneaker craze.',
      price: 1938,
      imageUrl:
          'https://i.pinimg.com/1200x/a2/04/30/a2043082a3f25aa1e4b9bc4329518aed.jpg',
      glbUrl: 'air_jordan_1_low_og_travis_scott_sp_mocha.glb',
    ),
    Product(
      id: '3',
      name: 'Air Jordan 1 OG High Dior',
      description:
          'Released in 2020, this was the groundbreaking collaboration between Dior and Jordan Brand, merging high fashion with streetwear. With only 8,500 pairs made, crafted from premium Italian leather, and featuring the Dior Oblique monogram on the Swoosh — this sneaker became an instant legend.',
      price: 11500,
      imageUrl:
          'https://i.pinimg.com/736x/d6/58/6a/d6586a27e45d7978bbce68a57c262f2f.jpg',
      glbUrl: 'air_jordan_1_og_high_dior.glb',
    ),
    Product(
      id: '4',
      name: 'Air Jordan 1 OG High Travis Scott',
      description:
          'Travis Scott’s first Jordan 1 High, released in 2019. It made waves with its reversed Swoosh, Cactus Jack branding, and vintage-inspired Mocha colorway. This pair launched his long-standing partnership with Jordan Brand in a big way.',
      price: 1700,
      imageUrl:
          'https://i.pinimg.com/1200x/4e/a8/1f/4ea81f499d5bf845ad605fa5a952651c.jpg',
      glbUrl: 'air_jordan_1_og_high_travis_scott.glb',
    ),
    Product(
      id: '5',
      name: 'Air Jordan 1 OG Low Dior',
      description:
          'The low-top version of the Dior Jordan 1, released alongside the high in 2020. Only 4,700 pairs were produced, making it even rarer. It shares the same luxury materials, crafted in Italy, and features the iconic Dior-branded Swoosh.',
      price: 7200,
      imageUrl:
          'https://i.pinimg.com/1200x/13/7b/31/137b31138fbccdd8e3156c3b0a64b5a9.jpg',
      glbUrl: 'air_jordan_1_og_low_dior.glb',
    ),
    Product(
      id: '6',
      name: 'Air Jordan 1 Retro High Bred Toe',
      description:
          'Released in 2018, this colorway blends two Jordan classics — “Bred” and “Black Toe.” With its bold red, black, and white design, it’s a favorite among collectors and wearable for daily style.',
      price: 400,
      imageUrl:
          'https://i.pinimg.com/1200x/eb/4c/9f/eb4c9f1ace01822447abf0a0b277623b.jpg',
      glbUrl: 'air_jordan_1_retro_high_bred_toe.glb',
    ),
    Product(
      id: '7',
      name: 'Nike Air Force 1 Low White',
      description:
          'A timeless classic. Released in the early 2000s and still going strong, this all-white sneaker is simple, clean, and versatile. It’s one of Nike’s best-selling models of all time, loved for its minimal design and everyday comfort.',
      price: 91,
      imageUrl:
          'https://i.pinimg.com/1200x/ba/11/09/ba110904b5cb1411d0f3fa83e6ef1f95.jpg',
      glbUrl: 'nike_air_force_1_low_white.glb',
    ),
    Product(
      id: '8',
      name: 'Nike Air Force 1 Mid White',
      description:
          'The mid-cut version of the AF1 with added ankle straps for support. While keeping the all-white aesthetic, it offers a slightly bolder silhouette — ideal for those who want something between the low and high versions.',
      price: 120,
      imageUrl:
          'https://i.pinimg.com/1200x/de/3f/92/de3f92f13411fd25964594da4c6df250.jpg',
      glbUrl: 'nike_air_force_1_mid_white.glb',
    ),
    Product(
      id: '9',
      name: 'Nike Dunk SB Low Travis Scott',
      description:
          'Released in 2020, this pair brought wild creativity with plaid and bandana overlays that reveal hidden layers when worn or torn. A favorite among sneakerheads and skaters, it helped revive the SB Dunk line in the mainstream, thanks to Travis Scott’s influence.',
      price: 1387,
      imageUrl:
          'https://i.pinimg.com/1200x/e9/66/4e/e9664e7e643a6b02c68b5150f7638a9c.jpg',
      glbUrl: 'nike_dunk_sb_low_travis_scott.glb',
    ),
  ];
}
