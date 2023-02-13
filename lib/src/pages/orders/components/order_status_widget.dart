import 'package:flutter/material.dart';
import 'package:lojinha/src/config/custom_colors.dart';

// Classe que exibe o status atual do pedido
class OrderStatusWidget extends StatelessWidget {
  // Propriedades do status do pedido
  final String status;
  final bool isOverdue;

  // Mapa que contém todos os status possíveis do pedido
  final Map<String, int> allStatus = <String, int>{
    'pending_payment': 0,
    'refunded': 1,
    'paid': 2,
    'preparing_purchase': 3,
    'shipping': 4,
    'delivered': 5
  };

  // Obtém o status atual do pedido
  int get curreentStatus => allStatus[status]!;

  // Construtor da classe
  OrderStatusWidget({
    Key? key,
    required this.isOverdue,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // Alinhamento do conteúdo na coluna
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Exibe o status "Pedido Confirmado"
        const _StatusDot(isActive: true, title: 'Pedido Confirmado'),
        // Exibe um divisor personalizado
        const _CustomDvider(),
        // Se o status atual for "refunded"
        if (curreentStatus == 1) ...[
          // Exibe o status "Pix estornado"
          const _StatusDot(
            isActive: true,
            title: 'Pix estornado',
            backgroundColor: Colors.orange,
          ),
        ] else if (isOverdue) ...[
          // Exibe o status "Pagamento Pix Vencido"
          const _StatusDot(
            isActive: true,
            title: 'Pagamento Pix Vencido',
            backgroundColor: Colors.red,
          ),
        ] else ...[
          // Exibe o status "Pagamento"
          _StatusDot(
            isActive: curreentStatus >= 2,
            title: 'Pagamento',
          ),
          // Exibe um divisor personalizado
          const _CustomDvider(),
          // Exibe o status "Preparando"
          _StatusDot(
            isActive: curreentStatus >= 3,
            title: 'Preparando',
          ),
          // Exibe um divisor personalizado
          const _CustomDvider(),
          // Exibe o status "Envio"
          _StatusDot(
            isActive: curreentStatus >= 4,
            title: 'Envio',
          ),
          // Exibe um divisor personalizado
          const _CustomDvider(),
          // Exibe o status "Entregue"
          _StatusDot(
            isActive: curreentStatus == 5,
            title: 'Entregue',
          ),
        ]
      ],
    );
  }
}

class _CustomDvider extends StatelessWidget {
  const _CustomDvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 3,
      ),
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}





class _StatusDot extends StatelessWidget {
  final bool isActive;
  final String title;
  final Color? backgroundColor;

  const _StatusDot({
    super.key,
    required this.isActive,
    required this.title,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Dot
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: CustomColors.customSawtchColor,
            ),
            color: isActive
                ? backgroundColor ?? CustomColors.customSawtchColor
                : Colors.transparent,
          ),
          child: isActive
              ? const Icon(
                  Icons.check,
                  size: 13,
                  color: Colors.white,
                )
              : const SizedBox.shrink(),
        ),

        const SizedBox(width: 5),

        // Texto com o status do pedido
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
