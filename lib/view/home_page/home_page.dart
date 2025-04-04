// ignore_for_file: deprecated_member_use

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mypcot_assesment/conntroller/state_controller.dart';
import 'package:mypcot_assesment/view/home_page/widget/bottom_navigation_bar.dart';
import 'package:mypcot_assesment/view/home_page/widget/calender.dart';
import 'package:mypcot_assesment/view/home_page/widget/carousel.dart';

/// A widget that displays the main dashboard of the application using ValueNotifier for state management.

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  // Create a controller instance
  final NavigationController _navigationController = NavigationController();

  // App theme colors
  final Color _primaryColor = const Color(0xFF273d66);
  final Color _accentColor = const Color(0xFFff6c35);
  final Color _calendarHighlightColor = const Color(0xFF10817e);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 249, 249),

      //! ----------- A P P B A R -----------
      appBar: _buildAppBar(),

      //! ----------- B O D Y -----------
      body: FadeIn(duration: Duration(seconds: 2), child: _buildBody()),

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
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 245, 249, 249),
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: _buildCircularIconContainer(
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
        _buildFavoriteIcon(),

        //! Notification icon with badge
        _buildNotificationIconWithBadge(),

        //! Profile avatar
        _buildProfileAvatar(),
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
  Widget _buildFavoriteIcon() {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
  Widget _buildNotificationIconWithBadge() {
    return _buildCircularIconContainer(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'asset/≡ƒôìTrailing icon 1.jpg',
              height: 90,
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

  /// Builds the profile avatar in the app bar
  Widget _buildProfileAvatar() {
    return _buildCircularIconContainer(
      size: 45,
      margin: const EdgeInsets.only(left: 8, right: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'asset/Screenshot 2025-04-04 015824.png',
        ),
      ),
    );
  }

  /// Builds the main body content with scrollable content
  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          //! ----------- W E L C O M E  S E C T I O N -----------
          _buildWelcomeSection(),

          const SizedBox(height: 5),

          //! ----------- C A R O U S E L -----------
          const ScrollableContainers(),

          //! ----------- C A L E N D A R  &  O R D E R  S E C T I O N -----------
          _buildCalendarAndOrderSection(),
        ],
      ),
    );
  }

  /// Builds the welcome section with greeting and search button
  Widget _buildWelcomeSection() {
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
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(217, 39, 61, 102),
                      ),
                    ),
                    Text(
                      ' Mypcot !!',
                      style: GoogleFonts.roboto(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: _primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(right: 180),
                child: Text(
                  'here is your dashboard....',
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(217, 39, 61, 102),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 300, top: 35),
          child: _buildSearchButton(),
        ),
      ],
    );
  }

  /// Builds the search button
  Widget _buildSearchButton() {
    return Container(
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
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.search,
          color: _primaryColor,
          size: 40,
        ),
      ),
    );
  }

  /// Builds the calendar section and new order card
  Widget _buildCalendarAndOrderSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //! ----------- C A L E N D A R  H E A D E R -----------
          const CalendarHeader(),

          //! ----------- C A L E N D A R  D A Y S -----------
          _buildCalendarDays(),

          //! ----------- N E W  O R D E R  C A R D -----------
          _buildNewOrderCard(),
        ],
      ),
    );
  }

  /// Builds the calendar days display with the selected day highlighted
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
                fontSize: 14,
                color: isSelected ? _calendarHighlightColor : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              dates[index],
              style: TextStyle(
                fontSize: 16,
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
  Widget _buildNewOrderCard() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New order created',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: _primaryColor,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'New Order created with Order',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  '09:00 AM',
                  style: TextStyle(
                    fontSize: 15,
                    color: _accentColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Icon(Icons.arrow_forward, color: _accentColor),
              ],
            ),
          ),
          Image.asset(
            'asset/Screenshot 2025-04-04 015228.png',
            height: 96,
          ),
        ],
      ),
    );
  }

  /// Builds the floating action button
  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: const Color(0xFF21355b),
      child: const Icon(Icons.add, color: Colors.white),
      onPressed: () {},
    );
  }
}
