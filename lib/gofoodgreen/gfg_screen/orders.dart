import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Orders',
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.download, color: Colors.grey),
            onPressed: () {
              // Download action here
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.green,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          labelStyle:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          tabs: const [
            Tab(text: 'History'),
            Tab(text: 'On Progress'),
            Tab(text: 'Scheduled'),
          ],
        ),
      ),
      body: Column(
        children: [
          // Filters
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildFilterButton(label: 'GoFood', color: Colors.green),
                _buildFilterButton(
                    label: 'Status', color: Colors.green, isDropdown: true),
              ],
            ),
          ),
          // Gopay Transactions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GestureDetector(
              onTap: () {
                // Navigate to Gopay Transactions
              },
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.green, width: 1.5),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.account_balance_wallet,
                            color: Color.fromARGB(255, 0, 173, 214)),
                        SizedBox(width: 8.0),
                        Text(
                          'Gopay Transactions',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios,
                        color: Colors.grey, size: 16),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          // Order List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                _buildOrderItem(
                  title: 'Ayam Benjoss, kedungkandang',
                  items: '3 item',
                  description: '2 Paket Ayam Bakar Jum...',
                  status: 'Food has been delivered',
                  time: '28 Nov 11.36',
                  price: 'Rp.58.800',
                ),
                _buildOrderItem(
                  title: 'Ayam Benjoss, kedungkandang',
                  items: '3 item',
                  description: '2 Paket Ayam Bakar Jum...',
                  status: 'Food has been delivered',
                  time: '28 Des 11.36',
                  price: 'Rp.58.800',
                ),
                _buildOrderItem(
                  title: 'Ayam Benjoss, kedungkandang',
                  items: '3 item',
                  description: '2 Paket Ayam Bakar Jum...',
                  status: 'Food has been delivered',
                  time: '28 Des 11.36',
                  price: 'Rp.58.800',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(
      {required String label, required Color color, bool isDropdown = false}) {
    return ElevatedButton(
      onPressed: () {
        // Add filter logic here
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 0,
      ),
      child: Row(
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          if (isDropdown)
            const Icon(
              Icons.arrow_drop_down,
              size: 20,
              color: Colors.white,
            ),
        ],
      ),
    );
  }

  Widget _buildOrderItem({
    required String title,
    required String items,
    required String description,
    required String status,
    required String time,
    required String price,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          const CircleAvatar(
            radius: 24,
            backgroundColor: Colors.green,
            child: Icon(Icons.restaurant_menu, color: Colors.white),
          ),
          const SizedBox(width: 16.0),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                Text(items,
                    style: const TextStyle(fontSize: 14, color: Colors.grey)),
                Text(description,
                    style: const TextStyle(fontSize: 14, color: Colors.grey)),
                Text(
                  '$status\n$time',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          // Price and Action
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8.0),
              OutlinedButton(
                onPressed: () {
                  // Add order again logic here
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.green),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                ),
                child: const Text(
                  'Order again',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
