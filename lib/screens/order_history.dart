import 'package:flutter/material.dart';

class OrderHistory extends StatelessWidget {
  final List<Map<String, dynamic>> orders = [
    {
      "orderId": "#ORD-001",
      "date": "Jan 15, 2024 - 2:30 PM",
      "items": 3,
      "status": "Delivered",
      "total": 1650,
    },
    {
      "orderId": "#ORD-002",
      "date": "Jan 10, 2024 - 6:15 PM",
      "items": 2,
      "status": "Delivered",
      "total": 1200,
    },
    {
      "orderId": "#ORD-003",
      "date": "Jan 5, 2024 - 1:45 PM",
      "items": 4,
      "status": "Cancelled",
      "total": 2100,
    },
    {
      "orderId": "#ORD-004",
      "date": "Dec 28, 2023 - 7:00 PM",
      "items": 2,
      "status": "Delivered",
      "total": 900,
    },
  ];

  OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order History"),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          final isDelivered = order['status'] == 'Delivered';

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 3,
            child: Theme(
              data: Theme.of(
                context,
              ).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order['orderId'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          order['date'],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: isDelivered
                            ? Colors.green.shade100
                            : Colors.red.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        order['status'],
                        style: TextStyle(
                          color: isDelivered ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Items Count:",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text("${order['items']} items"),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Divider(),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Total Price:",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Rs ${order['total']}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        if (isDelivered)
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              minimumSize: const Size(double.infinity, 40),
                            ),
                            onPressed: () {
                              // TODO: Reorder functionality
                            },
                            icon: const Icon(Icons.refresh),
                            label: const Text("Reorder"),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
