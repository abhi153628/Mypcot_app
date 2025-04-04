// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class ScrollableContainers extends StatelessWidget {
  const ScrollableContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: [
            //! B L U E - C O N T A I N E R
            _buildBlueContainer(context),

            //! Y E L L O W - C O N T A I N E R
            _buildYellowContainer(context),

            //! G R E E N - C O N T A I N E R
            _buildGreenContainer(context),
          ],
        ),
      ),
    );
  }

  // Avatar widget builder that's common across all containers
  Widget _buildUserAvatars({
    int maxAvatars = 3,
    List<String>? assetImages,
    double avatarRadius = 23.0,
    Color borderColor = const Color(0xFF3866E6),
    double spacing = 33.0,
  }) {
    // Default images if none provided
    final List<String> images = assetImages ??
        [
          'asset/subwaysurfers_01.png',
          'asset/≡ƒôì Leading Icon l Use High Emphasis.jpg',
          'asset/≡ƒôìTrailing icon 1.jpg',
        ];

    // Use the minimum between provided images and maxAvatars
    final int avatarCount = math.min(images.length, maxAvatars);

    return SizedBox(
      height: 30,
      width: spacing * avatarCount, // Dynamic width based on avatar count and spacing
      child: Stack(
        clipBehavior: Clip.none,
        children: List.generate(avatarCount, (index) {
          return Positioned(
            left: index * spacing,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: borderColor, width: 2),
              ),
              child: CircleAvatar(
                radius: avatarRadius,
                backgroundImage: AssetImage(images[index]),
              ),
            ),
          );
        }),
      ),
    );
  }

  //! Blue container - Orders
  Widget _buildBlueContainer(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = math.min(screenWidth * 0.91, 350.0); // Cap the max width
    
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Main container
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: containerWidth,
       height: 285,
            decoration: BoxDecoration(
              color: const Color(0xFF019acb),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 30, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image section
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF019acb),
                        ),
                        width: 140,
                        height: 140,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(90),
                          child: Image.asset(
                            'asset/Screenshot 2025-04-04 003707.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Button section
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 107, 49),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                      ),
                      child: Text(
                        'Orders',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // "You have 3 active" card
        Positioned(
          top: 5,
          right: screenWidth < 360 ? 35 : 50, // Adjust position based on screen width
          child: Container(
            width: 160,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 107, 49),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Center the content
                  children: const [
                    Text(
                      'You have',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 6),
                    Text(
                      '3',
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 7),
                    Text(
                      'active',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Text(
                  'orders from',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 22, top: 5),
                  child: _buildUserAvatars(
                    maxAvatars: 3,
                    assetImages: [
                      'asset/IPL-Opening-11_1743655111241_1743655161350.avif',
                      'asset/bollywood-actor-salman-khan-at-nika-mukesh-ambani-cultural-center-nmacc-mumbai-india.webp',
                      'asset/Deepika_Padukone_Cannes_2018_(cropped).jpg'
                    ],
                    borderColor: const Color.fromARGB(255, 255, 107, 49),
                    avatarRadius: 20
                  ),
                ),
              ],
            ),
          ),
        ),

        // "Pending Orders" card
        Positioned(
          top: 130,
          right: screenWidth < 360 ? 35 : 50, // Adjust position based on screen width
          child: Container(
            padding: const EdgeInsets.all(8),
            width: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: const [
                    Text(
                      '02',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3748),
                      ),
                    ),
                    SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        'Pending ',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF718096),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Orders from',
                    style: TextStyle(
                        fontSize: 10,
                        color: Color.fromARGB(255, 85, 96, 113),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Avatars for pending orders
        Positioned(
          right: screenWidth < 360 ? 30 : 80,
          bottom: 75,
          child: _buildUserAvatars(
            maxAvatars: 2,
            assetImages: [
              'asset/IPL-Opening-11_1743655111241_1743655161350.avif',
              'asset/bollywood-actor-salman-khan-at-nika-mukesh-ambani-cultural-center-nmacc-mumbai-india.webp',
            ],
            avatarRadius: 23,
            spacing: 37,
            borderColor: const Color.fromARGB(255, 255, 107, 49),
          ),
        ),
      ],
    );
  }

  //! Yellow container - Subscriptions
  Widget _buildYellowContainer(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = math.min(screenWidth * 0.91, 350.0); // Cap the max width
    
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Main container
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: containerWidth,
       height: 285,
            decoration: BoxDecoration(
              color: const Color(0xFFe1a800),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 30, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image section
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 140,
                        height: 140,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(90),
                          child: Image.asset(
                            'asset/Screenshot 2025-04-04 004329.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Button section
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1241e1),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                      ),
                      child: Text(
                        'Subscriptions',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500, fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // "Active Subscriptions" card
        Positioned(
          top: 100,
          right: screenWidth < 360 ? 40 : 55,
          child: Container(
            padding: const EdgeInsets.all(8),
            width: 130,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: const [
                    Text(
                      '10',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        'Active',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF718096),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                const Flexible(
                  child: Text(
                    'Subscriptions',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 56, 63, 74),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // "Deliveries" card
        Positioned(
          top: 5,
          right: screenWidth < 360 ? 35 : 50,
          child: Container(
            width: 160,
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 9),
            decoration: BoxDecoration(
              color: const Color(0xFF1241e1),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '03',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 6),
                      Text(
                        'deliveries',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.only(right: 50, top: 6),
                  child: _buildUserAvatars(maxAvatars: 3, assetImages: [
                    'asset/IPL-Opening-11_1743655111241_1743655161350.avif',
                    'asset/bollywood-actor-salman-khan-at-nika-mukesh-ambani-cultural-center-nmacc-mumbai-india.webp',
                    'asset/Deepika_Padukone_Cannes_2018_(cropped).jpg',

                  ],avatarRadius: 20),
                ),
              ],
            ),
          ),
        ),

        // "Pending Deliveries" card
        Positioned(
          top: 190,
          right: screenWidth < 360 ? 20 : 30,
          child: Container(
            padding: const EdgeInsets.all(12),
            width: screenWidth < 360 ? 110 : 130,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Row(
                  children: [
                    Text(
                      '119',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        'Pending',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF718096),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Text(
                    'Deliveries',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 56, 63, 74),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  //! Green container - Customers
  Widget _buildGreenContainer(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = math.min(screenWidth * 0.91, 350.0); // Cap the max width
    
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Main container
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: containerWidth,
       height: 285,
            decoration: BoxDecoration(
              color: const Color(0xFF00cd85),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 30, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image section
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 130,
                        height: 130,
                        child: ClipRRect(
                          child: Image.asset(
                            'asset/Screenshot 2025-04-04 011101.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Button section
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFdf0f5f),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      ),
                      child: Text(
                        'View Customers',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500, fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Growth percentage card
        Positioned(
          top: 100,
          right: screenWidth < 360 ? 25 : 35,
          child: Container(
            padding: const EdgeInsets.all(1),
            width: 140,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 2),
                      child: Text(
                        '1.8%',
                        style: GoogleFonts.roboto(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D3748),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.arrow_upward,
                        color: Color(0xFF31ce95), size: 35),
                  ],
                ),
                const SizedBox(height: 2),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Image.asset(
                      'asset/Screenshot_2025-04-03_221651-removebg-preview (1).png'),
                )
              ],
            ),
          ),
        ),

        // "New Customers" card
        Positioned(
          top: 5,
          right: screenWidth < 360 ? 35 : 50,
          child: Container(
            width: 160,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
            decoration: BoxDecoration(
              color: const Color(0xFFdf0f5f),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '15',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'New Customers',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.only(right: 50, top: 3),
                  child: _buildUserAvatars(
                      maxAvatars: 3,
                      assetImages: [
                        'asset/IPL-Opening-11_1743655111241_1743655161350.avif',
                        'asset/bollywood-actor-salman-khan-at-nika-mukesh-ambani-cultural-center-nmacc-mumbai-india.webp',
                        'asset/Deepika_Padukone_Cannes_2018_(cropped).jpg'
                      ],
                      borderColor: Color(0xFF2fddfa),avatarRadius: 20),
                ),
              ],
            ),
          ),
        ),

        // Add icon
        Positioned(
          right: screenWidth < 360 ? 30 : 70,
          top: 70,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(
              Icons.add,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),

        // "Active Customers" card
        Positioned(
          top: 190,
          right: screenWidth < 360 ? 60 : 80,
          child: Container(
            padding: const EdgeInsets.all(8),
            width: 110,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Row(
                  children: [
                    Text(
                      '10',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3748),
                      ),
                    ),
                    SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        'Active ',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF718096),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Text(
                    'Customers',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Customer avatars
        Positioned(
          right: screenWidth < 360 ? 20 : 30,
          bottom: 60,
          child: _buildUserAvatars(
              maxAvatars: 3,
              assetImages: [
                'asset/IPL-Opening-11_1743655111241_1743655161350.avif',
                'asset/bollywood-actor-salman-khan-at-nika-mukesh-ambani-cultural-center-nmacc-mumbai-india.webp',
                'asset/Deepika_Padukone_Cannes_2018_(cropped).jpg'
              ],
              avatarRadius: 15,
              spacing: 23,
              borderColor: Color(0xFF48c4e5)),
        ),
      ],
    );
  }
}