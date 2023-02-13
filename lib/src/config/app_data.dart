import 'package:lojinha/src/models/cart_item_model.dart';
import 'package:lojinha/src/models/item_model.dart';
import 'package:lojinha/src/models/order_models.dart';
import 'package:lojinha/src/models/user_model.dart';

ItemModel apple = ItemModel(
  description:
      'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  imgUrl: 'assets/fruits/apple.png',
  itemName: 'Maçã',
  price: 5.5,
  unit: 'kg',
);

ItemModel grape = ItemModel(
  imgUrl: 'assets/fruits/grape.png',
  itemName: 'Uva',
  price: 7.4,
  unit: 'kg',
  description:
      'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel goiaba = ItemModel(
  imgUrl: 'assets/fruits/guava.png',
  itemName: 'Goiaba',
  price: 11.5,
  unit: 'kg',
  description:
      'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel kiwi = ItemModel(
  imgUrl: 'assets/fruits/kiwi.png',
  itemName: 'Kiwi',
  price: 2.5,
  unit: 'un',
  description:
      'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel mango = ItemModel(
  imgUrl: 'assets/fruits/mango.png',
  itemName: 'Manga',
  price: 2.5,
  unit: 'un',
  description:
      'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel papaya = ItemModel(
  imgUrl: 'assets/fruits/papaya.png',
  itemName: 'Mamão papaya',
  price: 8,
  unit: 'kg',
  description:
      'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

// Lista de produtos
List<ItemModel> items = [
  apple,
  grape,
  goiaba,
  kiwi,
  mango,
  papaya,
];

List<String> categorias = [
  "Todos",
  "Roupas",
  "Eletrônicos",
  "Esporte",
  "Automotivo",
  "Brinquedos",
];

List<CartItemModel> cartItems = [
  CartItemModel(
    item: apple,
    quantity: 1,
  ),
  CartItemModel(
    item: grape,
    quantity: 2,
  ),
  CartItemModel(
    item: goiaba,
    quantity: 3,
  ),
  CartItemModel(
    item: kiwi,
    quantity: 4,
  ),
  CartItemModel(
    item: mango,
    quantity: 5,
  ),
  CartItemModel(
    item: papaya,
    quantity: 1,
  ),
];

UserModel user = UserModel(
  phone: '99 9999 9999',
  cpf: '222.222.222-22',
  email: 'elder.santana@123',
  name: 'Elder ',
  password: '',
);

List<OrderModel> orders = [
  //Pedido 01
  OrderModel(
    copyAndPaste: 'a12dasdas2321',
    createdDateTime: DateTime.parse(
      '2023-06-08 10:00:10.458',
    ),
    id: 'PD1234',
    overdueDateTime: DateTime.parse(
      '2023-06-08 11:00:10.458',
    ),
    status: 'pending_payment',
    total: 11.0,
    items: [
      CartItemModel(
        item: apple,
        quantity: 2,
      ),
      CartItemModel(
        item: mango,
        quantity: 2,
      ),
    ],
  ),

  OrderModel(
    copyAndPaste: 'a12dasdas2321',
    createdDateTime: DateTime.parse(
      '2023-06-08 10:00:10.458',
    ),
    id: 'PD1243',
    overdueDateTime: DateTime.parse(
      '2023-06-08 11:00:10.458',
    ),
    status: 'paid',
    total: 11.0,
    items: [
      CartItemModel(
        item: goiaba,
        quantity: 2,
      ),
    ],
  ),
];
