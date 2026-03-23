import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class RecentActivitySection extends StatelessWidget {
  const RecentActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    final activities = [
      {
        'icon': Icons.check_circle_rounded,
        'color': Colors.green,
        'title': 'Pesanan #1042 selesai',
        'time': '2 jam lalu',
      },
      {
        'icon': Icons.local_shipping_rounded,
        'color': Colors.blue,
        'title': 'Pesanan #1041 dikirim',
        'time': '5 jam lalu',
      },
      {
        'icon': Icons.star_rounded,
        'color': Colors.amber,
        'title': 'Ulasan baru diterima',
        'time': '1 hari lalu',
      },
    ];
    return Column(
      children: activities.map((a) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(8),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: (a['color'] as Color).withAlpha(30),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(a['icon'] as IconData,
                    color: a['color'] as Color, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  a['title'] as String,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: AppTheme.textDark,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              Text(
                a['time'] as String,
                style: const TextStyle(
                  fontSize: 11,
                  color: AppTheme.textGrey,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
