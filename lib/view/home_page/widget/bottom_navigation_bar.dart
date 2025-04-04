import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  
  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });
  
  @override
 Widget build(BuildContext context) {
  return BottomAppBar(
    color: Color.fromARGB(255, 255, 255, 255),
    shadowColor: Colors.grey[300], 
    elevation: 15, 
    surfaceTintColor: const Color.fromARGB(0, 0, 0, 0), 
    shape: AutomaticNotchedShape(
        RoundedRectangleBorder(),
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0), 
        ),
      ),
   
    notchMargin: 8.0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildNavItem(0, 'asset/Group 910.jpg', 'Home'),
        _buildNavItem(1, 'asset/Group 912.jpg', 'Customers'),
        const SizedBox(width: 40),
        _buildNavItem(2, 'asset/Group 913.jpg', 'Khata'),
        _buildNavItem(3, 'asset/Group 914.jpg', 'Orders'),
      ],
    ),
  );
}
  
  Widget _buildNavItem(int index, String imagePath, String label) {
    final bool isSelected = index == selectedIndex;
    
    return InkWell(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 34,
            height: 34,
          
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Color(0xFF21355b) : Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
    );
  }
}