import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:lojinha/src/config/custom_colors.dart';
import 'package:lojinha/src/pages/home/components/category_tile.dart';
import 'package:lojinha/src/config/app_data.dart' as appData;
import 'package:lojinha/src/pages/home/components/item_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = "Todos";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            style: const TextStyle(
              fontSize: 30,
            ),
            children: [
              TextSpan(
                text: "Sua",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: CustomColors.customSawtchColor,
                ),
              ),
              TextSpan(
                text: "Loja",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: CustomColors.customContrastColor,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 15,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                badgeColor: CustomColors.customContrastColor,
                badgeContent: const Text(
                  "1",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: CustomColors.customSawtchColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(children: [
        // campo de pesquisa
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              isDense: true,
              hintText: "Pesquisar",
              hintStyle: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 14,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: CustomColors.customContrastColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(60),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),

        // categorias

        Container(
          padding: const EdgeInsets.only(left: 25),
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return CategoryTile(
                onPressed: () {
                  setState(() {
                    selectedCategory = appData.categorias[index];
                  });
                },
                category: appData.categorias[index],
                isSelected: selectedCategory == appData.categorias[index],
              );
            },
            separatorBuilder: (_, index) => const SizedBox(
              width: 10,
            ),
            itemCount: appData.categorias.length,
          ),
        ),

        // grid
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 800 ? 3 : 2,
              childAspectRatio: 9 / 11.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: appData.items.length,
            itemBuilder: (_, index) {
              return ItemTile(
                item: appData.items[index],
              );
            },
          ),
        )
      ]),
    );
  }
}
