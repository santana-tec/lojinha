import 'package:flutter/material.dart';
import 'package:lojinha/src/models/cart_item_model.dart';
import 'package:lojinha/src/models/order_models.dart';
import 'package:lojinha/src/pages/common_widgets/payment_dialog.dart';
import 'package:lojinha/src/pages/orders/components/order_status_widget.dart';
import 'package:lojinha/src/services/utils_services.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;

  OrderTile({
    super.key,
    required this.order,
  });

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: order.status == 'pending_payment',
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pedido: ${order.id}'),
              Text(
                utilsServices.formatDateTime(order.createdDateTime),
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: order.items.map((orderItem) {
                          return _OrderItemWidget(
                            utilsServices: utilsServices,
                            orderItem: orderItem,
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  // Divisao
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    width: 8,
                  ),

                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      status: order.status,
                      isOverdue: order.overdueDateTime.isBefore(DateTime.now()),
                    ),
                  ),
                ],
              ),
            ),

            //Total
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Total  ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: utilsServices.priceToCurency(order.total)),
                ],
              ),
            ),

            //Botao Pagamento

            Visibility(
              visible: order.status == 'pending_payment',
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                 showDialog(
                    context: context,
                    builder: (_) {
                      return PaymentDialog(order: order);
                    },
                  ); 
                },
                icon: Image.asset(
                  'assets/app_images/pix.png',
                  height: 18,
                ),
                label: const Text('Ver QR Code Pix'),
              ),

              //replacement: outroWidget ,
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({
    Key? key,
    required this.utilsServices,
    required this.orderItem,
  }) : super(key: key);

  final UtilsServices utilsServices;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity} ${orderItem.item.unit}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(orderItem.item.itemName)),
          Text(utilsServices.priceToCurency(orderItem.totalPrice()))
        ],
      ),
    );
  }
}
