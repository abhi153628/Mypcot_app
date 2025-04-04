// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width to make responsive adjustments
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Container(
      color: const Color.fromARGB(255, 245, 249, 249),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              // For very small screens, use a column layout instead of row
              if (screenWidth < 360) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDateSection(),
                    const SizedBox(height: 12),
                    _buildButtonsSection(true),
                  ],
                );
              } else {
                // Normal layout for larger screens
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildDateSection(),
                    _buildButtonsSection(false),
                  ],
                );
              }
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  // Date section with today and date
  Widget _buildDateSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'January, 23 2021',
          style: TextStyle(
            fontSize: 10,
            color: Color(0xFF5D7599),
            fontWeight: FontWeight.w600,
          ),
        ),
        const Text(
          'Today',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3E50),
          ),
        ),
      ],
    );
  }

  // Action buttons section
  Widget _buildButtonsSection(bool isSmallScreen) {
    return Flex(
      direction: isSmallScreen ? Axis.vertical : Axis.horizontal,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildActionButton(
          'TIMELINE',
          Icons.keyboard_arrow_down,
          iconAfterText: true,
        ),
        if (isSmallScreen) const SizedBox(height: 12) else const SizedBox(width: 8),
        _buildActionButton(
          'JAN, 2021',
          Icons.calendar_today,
          iconAfterText: false,
        ),
      ],
    );
  }

  // Generic action button builder
  Widget _buildActionButton(String text, IconData icon, {required bool iconAfterText}) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 160),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!iconAfterText) ...[
            Icon(
              icon,
              color: const Color(0xFF4A5568),
              size: 15,
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A5568),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (iconAfterText) ...[
            const SizedBox(width: 4),
            Icon(
              icon,
              color: const Color(0xFF4A5568),
              size: 15,
            ),
          ],
        ],
      ),
    );
  }
}