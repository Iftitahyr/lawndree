import 'package:flutter/material.dart';

class OrderItemWidget extends StatelessWidget {
  final String orderId;
  final String date;
  final String amount;
  final bool isCompleted;

  const OrderItemWidget({
    required this.orderId,
    required this.date,
    required this.amount,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          orderId,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(amount),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(date),
            SizedBox(height: 4),
            Icon(
              isCompleted ? Icons.check : Icons.close,
              color: isCompleted ? Colors.green : Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}