import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Chat',
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Quick Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildQuickAction(
                  icon: Icons.inbox,
                  label: 'Inbox',
                  color: Colors.orange,
                ),
                _buildQuickAction(
                  icon: Icons.help,
                  label: 'Help Ticket',
                  color: Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Your Chats Section
            const Text(
              'Your Chats',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildChatItem(
                    name: 'Jeklin',
                    message: 'Important!........',
                    date: '04/12/2024',
                    unreadCount: 7,
                  ),
                  _buildChatItem(
                    name: 'GoJek',
                    message: 'Vocer ini untukmu..',
                    date: '04/12/2024',
                    unreadCount: 7,
                  ),
                  _buildChatItem(
                    name: 'GoPulsa',
                    message: 'Dapatkan gratis pulsa dengan..',
                    date: '04/12/2024',
                    unreadCount: 7,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          // Add chat creation logic here
        },
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }

  Widget _buildQuickAction(
      {required IconData icon, required String label, required Color color}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildChatItem({
    required String name,
    required String message,
    required String date,
    required int unreadCount,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
      leading: const CircleAvatar(
        radius: 24,
        backgroundColor: Colors.green,
        child: Icon(Icons.person, color: Colors.white),
      ),
      title: Text(
        name,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        message,
        style: const TextStyle(fontSize: 14, color: Colors.grey),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            date,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          CircleAvatar(
            radius: 10,
            backgroundColor: Colors.red,
            child: Text(
              unreadCount.toString(),
              style: const TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
