
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mypcot_assesment/view/home_page/widget/bottom_navigation_bar.dart';
import 'dart:math' as math;

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}


class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  
  // List of colors for the carousel cards
  final List<Color> cardColors = [
    const Color(0xFFFFCC33), // Yellow
    const Color(0xFF3399FF), // Blue
    const Color(0xFF33CC99), // Green
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFffffff),
      
      //! ----------- A P P B A R -----------
     appBar: AppBar(
  backgroundColor: Color(0xFFffffff),
  elevation: 0,
  automaticallyImplyLeading: false,
  title: Padding(
    padding: const EdgeInsets.only(left: 8.0),
    child: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.asset('asset/≡ƒôì Leading Icon l Use High Emphasis.jpg',fit: BoxFit.fill,))
    ),
  ),
  actions: [
    //! Favorite icon with border
    Container(
      width: 35,
      height: 35,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey,
          width: 1.5,
          
        ),
        
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 2),
          )],
      ),
      child: SizedBox(height: 20,child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('asset/pngtree-favourite-icon-design-png-image_1014864-removebg-preview.png', ),
      ))
    ),
    
    //! Notification icon with shadow
    Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
         ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.asset('asset/≡ƒôìTrailing icon 1.jpg', height: 90,)),
          Positioned(
            top: -0.1,
            right: 5,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: const Text(
                '2',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    ),
    
    //! Profile avatar
    Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.only(left: 8, right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.asset('asset/subwaysurfers_01.png',fit: BoxFit.fill,)),
      ),
    ),
  ],
),
      
      //! ----------- B O D Y -----------
      body: Column(
        children: [
          
      
          //! Search Bar
         Stack(
           children:[ Padding(
             padding: const EdgeInsets.only(top: 30,),
             child: Column(
               children: [
                
                 Text('Welcome, Mypcot !!',style: GoogleFonts.roboto(fontSize: 23,fontWeight: FontWeight.w600,color: Color(0xFF273d66)),),
                  SizedBox(height: 5,),
                Padding(
                      padding: const EdgeInsets.only(right: 20,),
                  child: Text('here is your dashboard....',style: GoogleFonts.roboto(fontSize: 15,fontWeight: FontWeight.w600,color: Color(0xFF273d66)),),
                ),
              ],
             ),
           ),
             Padding(
               padding: const EdgeInsets.only(left: 280,top: 35),
               child: Container(
                     width: 60,
                     height: 60,
                     decoration: BoxDecoration(
                       color: Colors.white,
                       shape: BoxShape.circle,
                       boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
                       ],
                     ),
                     child: IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Color(0xFF273d66),size: 40,))
                   ),
             ), 
                  ] ),
       
        SizedBox(height: 5,),
          
          //! Carousel
          // SizedBox(
          //   height: 220,
          //   child: PageView.builder(
          //     controller: _pageController,
          //     itemCount: cardColors.length,
          //     itemBuilder: (context, index) {
          //       return _buildCarouselCard(index);
          //     },
          //   ),
          // ),
          Stack(
  clipBehavior: Clip.none,
  children: [
    // Yellow Container
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        height: 252,
        decoration: BoxDecoration(
          color: const Color(0xFF31ce95),
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
              // Schedule icon and clock
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        'asset/customers-illustration-image-removebg-preview (1).png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              //! Customers button 
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFce316a),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child:  Text('View Customers',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,fontSize: 15),),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
     //! "10 Active Subscriptions" card
     Positioned(
      top: 100,
      right: 30,
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
                  padding: const EdgeInsets.only(left: 20,top: 2),
                  child:  Text(
                    '1.8%',
                    style: GoogleFonts.roboto(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3748),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              const Icon(Icons.arrow_upward,color:  Color(0xFF31ce95),size: 35,)
              ],
            ),
            const SizedBox(height: 2),
           
         Padding(
           padding: const EdgeInsets.only(left: 20,),
           child: Image.asset('asset/Screenshot_2025-04-03_221651-removebg-preview (1).png'),
         )
          ],
        ),
      ),
    ),

    //! "03 deliveries" card with user avatars
    Positioned(
      top: 5,
      right: 50,
      child: Container(
        width: 160,
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 9),
        decoration: BoxDecoration(
          color: const Color(0xFF3866E6),
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
              children: const [
                Text(
                  '03',
                  style: TextStyle(
                    fontSize: 25,
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
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.only(right: 50,top: 3),
              child: _buildUserAvatars(maxAvatars: 3,assetImages: ['asset/IPL-Opening-11_1743655111241_1743655161350.avif','asset/bollywood-actor-salman-khan-at-nika-mukesh-ambani-cultural-center-nmacc-mumbai-india.webp', 'asset/Deepika_Padukone_Cannes_2018_(cropped).jpg'] ),
            ),
          ],
        ),
      ),
    ),
      Padding(
              padding: const EdgeInsets.only(right: 50,top: 3),
              child:Container(decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white,),)
            ),
    
   

   
    
    //! "119 Pending Deliveries" card
    Positioned(
      top: 190,
      right: 80,
      child: Container(
        padding: const EdgeInsets.all(12),
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
          children:  [
            Row(
              children: [
                Text(
                  '10',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3748),
                  ),
                ),
                    SizedBox(width: 6),
                 Text(
              'Active ',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF718096),
                fontWeight: FontWeight.bold
              ),
            ),
             
              ],
            ),
        
           
            Text(
              'Customers',
              style: TextStyle(
                fontSize: 16,
              color: Color.fromARGB(255, 85, 96, 113),
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    ),
      Padding(
              padding:  EdgeInsets.only(left: 280,top: 200),
              child: _buildUserAvatars(maxAvatars: 3,assetImages: ['asset/IPL-Opening-11_1743655111241_1743655161350.avif','asset/bollywood-actor-salman-khan-at-nika-mukesh-ambani-cultural-center-nmacc-mumbai-india.webp', 'asset/Deepika_Padukone_Cannes_2018_(cropped).jpg'], avatarRadius: 15, spacing: 23, borderColor: Color(0xFF48c4e5) ),
            ),
  ],
),
            
          // Calendar Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Today',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3748),
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          'TIMELINE',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4A5568),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.keyboard_arrow_down),
                          onPressed: () {},
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.calendar_today, size: 18),
                              SizedBox(width: 4),
                              Text('JAN, 2021'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                
                // Calendar Days
                _buildCalendarDays(),
                
                // New Order Card
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'New order created',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4A5568),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'New Order created with Order',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF718096),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '09:00 AM',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF718096),
                            ),
                          ),
                          Icon(Icons.arrow_forward, color: Colors.grey),
                        ],
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF97360),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Icon(
                          Icons.assignment,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      
      // ----------- F L O A T I N G  A C T I O N  B U T T O N -----------
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF34495E),
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
      // ----------- B O T T O M  N A V I G A T I O N  B A R -----------
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  // ----------- C A R O U S E L  C A R D -----------
  Widget _buildCarouselCard(int index) {
    // Define different UI layouts based on index
    Widget cardContent;
    
    switch (index) {
      case 0: // Yellow card - Subscriptions Dashboard
        cardContent = _buildSubscriptionsDashboard();
        break;
      case 1: // Blue card - Orders Dashboard
        cardContent = _buildOrdersDashboard();
        break;
      case 2: // Green card - Customers Dashboard
        cardContent = _buildCustomersDashboard();
        break;
      default:
        cardContent = _buildSubscriptionsDashboard();
    }
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: cardColors[index],
          borderRadius: BorderRadius.circular(25),
        ),
        child: cardContent,
      ),
    );
  }

  // ----------- S U B S C R I P T I O N S  D A S H B O A R D -----------
  Widget _buildSubscriptionsDashboard() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Left side - Calendar and clock icon
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                    'asset/orders-illustration-image.jpg',
                        width: 80,
                        height: 80,
                      ),
                      Positioned(
                        bottom: 15,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF97360),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Text(
                            'Subscribe!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                  ),
                  onPressed: () {},
                  child: const Text('Subscriptions'),
                ),
              ],
            ),
          ),
          
          // Right side - Stats
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Deliveries
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        '03',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'deliveries',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 8),
                      _buildUserAvatars(),
                    ],
                  ),
                ),
                
                const SizedBox(height: 8),
                
                // Active Subscriptions
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        '10',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Active',
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            'Subscriptions',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 8),
                
                // Pending Deliveries
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '119',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Pending Deliveries',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ----------- O R D E R S  D A S H B O A R D -----------
Widget _buildOrdersDashboard() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Row(
      children: [
        // Left side - Document icon
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(809),
                  child: Image.asset(
                    'asset/orders-illustration-image.jpg',
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF97360),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 39),
                ),
                onPressed: () {},
                child: Text('Orders', style: GoogleFonts.aBeeZee(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        
        //! Right side - Stats
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Active Orders
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 30),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 99, 37),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'You have 3 active',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'orders from',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -20,
                    left: 0, 
                    right: 0,
                    child: Center(
                      child: _buildUserAvatars(),
                    ),
                  ),
                ],
              ),
              

              
              // Pending Orders
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text(
                              '02',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xFF273d66),
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Pending',
                              style: TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                        const Text(
                          'Orders from',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -20,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: _buildUserAvatars(maxAvatars: 2),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

  // ----------- C U S T O M E R S  D A S H B O A R D -----------
  Widget _buildCustomersDashboard() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Left side - Customer icon
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                'asset/orders-illustration-image.jpg',
                    width: 80,
                    height: 80,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE84C88),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                  ),
                  onPressed: () {},
                  child: const Text('View Customers'),
                ),
              ],
            ),
          ),
          
          // Right side - Stats
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // New Customers
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE84C88),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        '15',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'New customers',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 8),
                      _buildUserAvatars(),
                    ],
                  ),
                ),
                
                const SizedBox(height: 8),
                
                // Growth Rate
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text(
                            '1.8%',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.arrow_upward,
                            color: Colors.green,
                            size: 18,
                          ),
                        ],
                      ),
                      Container(
                        width: 80,
                        height: 20,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('asset/orders-illustration-image.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 8),
                
                // Active Customers
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        '10',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Active',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Customers',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(width: 8),
                      _buildUserAvatars(maxAvatars: 3),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ----------- U S E R  A V A T A R S -----------
Widget _buildUserAvatars({
  int maxAvatars = 3,
  List<String>? assetImages,
    double avatarRadius = 23.0,
    Color borderColor = const Color(0xFF3866E6),
      double spacing = 33.0,
}) {
  // Default images if none provided
  final List<String> images = assetImages ?? [
    'asset/subwaysurfers_01.png',
    'asset/≡ƒôì Leading Icon l Use High Emphasis.jpg',
    'asset/≡ƒôìTrailing icon 1.jpg',
  ];
  
  // Use the minimum between provided images and maxAvatars
  final int avatarCount = math.min(images.length, maxAvatars);
  
  return SizedBox(
    height: 30,
    width: 90,
    child: Stack(
      clipBehavior: Clip.none,
      children: List.generate(avatarCount, (index) {
        return Positioned(
          left: index * spacing,// Reduced spacing for better overlap like in image
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


  // ----------- C A L E N D A R  D A Y S -----------
  Widget _buildCalendarDays() {
    final List<String> days = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
    final List<String> dates = ['20', '21', '22', '23', '24', '25', '26'];
    int selectedDay = 3; // Thursday (index 3)
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(7, (index) {
        bool isSelected = index == selectedDay;
        
        return Column(
          children: [
            Text(
              days[index],
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? Colors.blue : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              dates[index],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.blue : Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            if (isSelected)
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        );
      }),
    );
  }
}
