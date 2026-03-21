import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = [
      {
        'name': 'Toko Fashion ID',
        'avatar': '🛍️',
        'last': 'Pesanan Anda sudah dikirim!',
        'time': '10:30',
        'unread': 2,
        'online': true,
      },
      {
        'name': 'Andi (Penjual)',
        'avatar': '👨',
        'last': 'Baik, nanti saya konfirmasi ya.',
        'time': '09:15',
        'unread': 0,
        'online': true,
      },
      {
        'name': 'CS Simple App',
        'avatar': '🤖',
        'last': 'Terima kasih sudah menghubungi kami!',
        'time': 'Kemarin',
        'unread': 0,
        'online': false,
      },
      {
        'name': 'Pusat Bantuan',
        'avatar': '🎧',
        'last': 'Laporan Anda sedang diproses.',
        'time': 'Sen',
        'unread': 1,
        'online': false,
      },
      {
        'name': 'Promo & Diskon',
        'avatar': '🎁',
        'last': 'Flash sale hari ini! Diskon hingga 70%!',
        'time': 'Min',
        'unread': 0,
        'online': false,
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Pesan', style: Theme.of(context).textTheme.titleLarge),
                      const Text(
                        '5 percakapan',
                        style: TextStyle(
                          color: AppTheme.textGrey,
                          fontSize: 13,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit_rounded, color: AppTheme.primary),
                  ),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(10),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search_rounded, color: AppTheme.textGrey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Cari percakapan...',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            color: AppTheme.textGrey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Message List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return _buildMessageTile(messages[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageTile(Map<String, dynamic> msg) {
    final hasUnread = (msg['unread'] as int) > 0;

    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: hasUnread ? AppTheme.primary.withAlpha(8) : AppTheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(10),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Avatar
            Stack(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withAlpha(20),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Text(
                      msg['avatar'] as String,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                if (msg['online'] as bool)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 14),

            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        msg['name'] as String,
                        style: TextStyle(
                          fontWeight: hasUnread ? FontWeight.bold : FontWeight.w500,
                          fontSize: 14,
                          color: AppTheme.textDark,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Text(
                        msg['time'] as String,
                        style: TextStyle(
                          fontSize: 11,
                          color: hasUnread ? AppTheme.primary : AppTheme.textGrey,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          msg['last'] as String,
                          style: TextStyle(
                            fontSize: 12,
                            color: hasUnread ? AppTheme.textDark : AppTheme.textGrey,
                            fontFamily: 'Poppins',
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (hasUnread)
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppTheme.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '${msg['unread']}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
