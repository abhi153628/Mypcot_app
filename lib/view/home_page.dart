// ignore_for_file: deprecated_member_use

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mypcot_assesment/controller/state_controller.dart';
import 'package:mypcot_assesment/view/widgets/bottom_navigation_bar.dart';
import 'package:mypcot_assesment/view/widgets/calender.dart';
import 'package:mypcot_assesment/view/widgets/carousel.dart';

/// The main dashboard of the application using ValueNotifier for state management.
/// This implementation includes responsive design to support different screen sizes.

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Create a controller instance
  final NavigationController _navigationController = NavigationController();

  // App theme colors
  final Color _primaryColor = const Color(0xFF273d66);
  final Color _accentColor = const Color(0xFFff6c35);
  final Color _calendarHighlightColor = const Color(0xFF10817e);

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive calculations
    final Size screenSize = MediaQuery.of(context).size;
    final bool isSmallScreen = screenSize.width < 360;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 249, 249),

      //! ----------- A P P B A R -----------
      appBar: _buildAppBar(context),

      //! ----------- B O D Y -----------
      body: FadeIn(duration: const Duration(seconds: 2), child: _buildBody(context)),

      //! ----------- F L O A T I N G  A C T I O N  B U T T O N -----------
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      //! ----------- B O T T O M  N A V I G A T I O N  B A R -----------
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _navigationController.selectedIndexNotifier,
        builder: (context, selectedIndex, _) {
          return BottomNavBar(
            selectedIndex: selectedIndex,
            onItemTapped: (index) {
              _navigationController.updateIndex(index);
            },
          );
        },
      ),
    );
  }

  /// Builds the app bar with menu, favorite, notification and profile icons
  /// Adjusted for responsive design based on screen width
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < 360;
    
    // Calculate sizes based on screen width
    final double iconSize = isSmallScreen ? 35 : 40;
    final double profileSize = isSmallScreen ? 40 : 45;
    final EdgeInsets rightPadding = isSmallScreen ? 
        const EdgeInsets.only(left: 4, right: 8) : 
        const EdgeInsets.only(left: 8, right: 16);

    return AppBar(
      backgroundColor: const Color.fromARGB(255, 245, 249, 249),
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: _buildCircularIconContainer(
          size: iconSize,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'asset/≡ƒôì Leading Icon l Use High Emphasis.jpg',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      actions: [
        //! Favorite icon with border
        _buildFavoriteIcon(context),

        //! Notification icon with badge
        _buildNotificationIconWithBadge(context),

        //! Profile avatar
        _buildCircularIconContainer(
          size: profileSize,
          margin: rightPadding,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'asset/Screenshot 2025-04-04 015824.png',
            ),
          ),
        ),
      ],
    );
  }

  /// Builds a circular container with shadow for icons
  Widget _buildCircularIconContainer({
    required Widget child,
    double size = 40,
    EdgeInsetsGeometry margin = EdgeInsets.zero,
  }) {
    return Container(
      width: size,
      height: size,
      margin: margin,
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
      child: child,
    );
  }

  /// Builds the favorite icon in the app bar
  /// Adjusted for responsive design
  Widget _buildFavoriteIcon(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double iconHeight = screenWidth < 360 ? 180 : 200;
    
    return SizedBox(
      height: iconHeight,
      child: Padding(
        padding: EdgeInsets.all(screenWidth < 360 ? 4.0 : 8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: Image.asset(
            'asset/Screenshot 2025-04-04 015511.png',
          ),
        ),
      ),
    );
  }

  /// Builds the notification icon with a badge showing unread count
  /// Adjusted for responsive design
  Widget _buildNotificationIconWithBadge(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < 360;
    final double iconSize = isSmallScreen ? 35 : 40;
    final EdgeInsets horizontalMargin = isSmallScreen ? 
        const EdgeInsets.symmetric(horizontal: 4) : 
        const EdgeInsets.symmetric(horizontal: 8);
    
    return _buildCircularIconContainer(
      size: iconSize,
      margin: horizontalMargin,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'asset/≡ƒôìTrailing icon 1.jpg',
              height: isSmallScreen ? 80 : 90,
            ),
          ),
          Positioned(
            top: -0.1,
            right: 5,
            child: _buildNotificationBadge(count: '2'),
          ),
        ],
      ),
    );
  }

  /// Builds a notification badge with count
  Widget _buildNotificationBadge({required String count}) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      constraints: const BoxConstraints(
        minWidth: 16,
        minHeight: 16,
      ),
      child: Text(
        count,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  /// Builds the main body content with scrollable content
  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //! ----------- W E L C O M E  S E C T I O N -----------
          _buildWelcomeSection(context),

          const SizedBox(height: 5),

          //! ----------- C A R O U S E L -----------
          const ScrollableContainers(),

          //! ----------- C A L E N D A R  &  O R D E R  S E C T I O N -----------
          _buildCalendarAndOrderSection(context),
        ],
      ),
    );
  }

  /// Builds the welcome section with greeting and search button
  /// Made responsive for different screen sizes
  Widget _buildWelcomeSection(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isSmallScreen = screenSize.width < 360;
    final double searchButtonRightPadding = isSmallScreen ? 
        screenSize.width * 0.65 : 300;
    
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      'Welcome,',
                      style: GoogleFonts.roboto(
                        fontSize: isSmallScreen ? 16 : 19,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(217, 39, 61, 102),
                      ),
                    ),
                    Text(
                      ' Mypcot !!',
                      style: GoogleFonts.roboto(
                        fontSize: isSmallScreen ? 19 : 23,
                        fontWeight: FontWeight.w600,
                        color: _primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 3),
              // Responsive padding calculation for subtitle
              Padding(
                padding: EdgeInsets.only(
                  right: isSmallScreen ? screenSize.width * 0.35 : 170,
                ),
                child: Text(
                  'here is your dashboard....',
                  style: GoogleFonts.roboto(
                    fontSize: isSmallScreen ? 10 : 12,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(217, 39, 61, 102),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: searchButtonRightPadding, 
            top: 35
          ),
          child: _buildSearchButton(context),
        ),
      ],
    );
  }

  /// Builds the search button with responsive size
  Widget _buildSearchButton(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 360;
    final double buttonSize = isSmallScreen ? 50 : 60;
    final double iconSize = isSmallScreen ? 30 : 40;
    
    return Container(
      width: buttonSize,
      height: buttonSize,
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
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.search,
          color: _primaryColor,
          size: iconSize,
        ),
      ),
    );
  }

  /// Builds the calendar section and new order card
  Widget _buildCalendarAndOrderSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //! ----------- C A L E N D A R  H E A D E R -----------
          const CalendarHeader(),

          //! ----------- C A L E N D A R  D A Y S -----------
          _buildCalendarDays(context),

          //! ----------- N E W  O R D E R  C A R D -----------
          _buildNewOrderCard(context),
        ],
      ),
    );
  }

  /// Builds the calendar days display with the selected day highlighted
  /// Made responsive for different screen sizes
  Widget _buildCalendarDays(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 360;
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
                fontSize: isSmallScreen ? 10 : 12,
                color: isSelected ? _calendarHighlightColor : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              dates[index],
              style: TextStyle(
                fontSize: isSmallScreen ? 12 : 14,
                fontWeight: FontWeight.bold,
                color: isSelected ? _calendarHighlightColor : Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            if (isSelected)
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _calendarHighlightColor,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        );
      }),
    );
  }

  /// Builds the new order card with details and image
  /// Made responsive for different screen sizes
  Widget _buildNewOrderCard(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 360;
    
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
      decoration: BoxDecoration(
        color: const Color(0xFFffffff),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(isSmallScreen ? 4.0 : 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New order created',
                    style: GoogleFonts.roboto(
                      fontSize: isSmallScreen ? 12 : 14,
                      fontWeight: FontWeight.bold,
                      color: _primaryColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'New Order created with Order',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 10 : 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 12 : 18),
                  Text(
                    '09:00 AM',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 9 : 10,
                      color: _accentColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 6 : 10),
                  Icon(
                    Icons.arrow_forward, 
                    color: _accentColor,
                    size: isSmallScreen ? 18 : 24,
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            'asset/Screenshot 2025-04-04 015228.png',
            height: isSmallScreen ? 50 : 60,
          ),
        ],
      ),
    );
  }

  /// Builds the floating action button
  /// Size adjusts based on screen dimensions
  Widget _buildFloatingActionButton() {
    return Builder(
      builder: (context) {
        final bool isSmallScreen = MediaQuery.of(context).size.width < 360;
        final double buttonSize = isSmallScreen ? 48 : 56;
        
        return SizedBox(
          height: buttonSize,
          width: buttonSize,
          child: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: const Color(0xFF21355b),
            child: Icon(
              Icons.add, 
              color: Colors.white,
              size: isSmallScreen ? 20 : 24,
            ),
            onPressed: () {},
          ),
        );
      }
    );
  }
}