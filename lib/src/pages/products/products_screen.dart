import 'package:flutter/material.dart';
import 'package:lojinha/src/config/custom_colors.dart';
import 'package:lojinha/src/models/item_model.dart';
import 'package:lojinha/src/pages/common_widgets/quantity_widget.dart';
import 'package:lojinha/src/services/utils_services.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ItemModel item;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final UtilsServices utilsServices = UtilsServices();

  int cartItemQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(255),
      body: Stack(
        children: [
          // conteudo da tela
          Column(
            children: [
              Expanded(
                child: Hero(
                  tag: widget.item.imgUrl,
                  child: Image.asset(widget.item.imgUrl),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //NOME - QUANTIDADE
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.item.itemName,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          QuantityWidget(
                            value: cartItemQuantity,
                            suffixText: widget.item.unit,
                            result: (quantity) {
                              setState(
                                () {
                                  cartItemQuantity = quantity;
                                },
                              );
                            },
                          ),
                        ],
                      ),

                      // pRECO
                      Text(
                        utilsServices.priceToCurency(widget.item.price),
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.customSawtchColor,
                        ),
                      ),

                      // DESCRIÇÃO

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SingleChildScrollView(
                            child: Text(
                              widget.item.description,
                              style: const TextStyle(
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // BOTÃO COMPRAR
                      SizedBox(
                        height: 50,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {},
                          label: const Text('Comprar'),
                          icon:
                              const Icon(Icons.shopping_cart_checkout_outlined),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Positioned(
            top: 10,
            left: 10,
            child: SafeArea(
                child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
            )),
          ),
        ],
      ),
    );
  }
}
