import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const SubscriptionDashboard(),
    );
  }
}

class SubscriptionDashboard extends StatelessWidget {
  const SubscriptionDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // First container
              DashboardContainer(),
              // const SizedBox(height: 16),
              // // Second container (identical)
              // DashboardContainer(),
              // const SizedBox(height: 16),
              // // Third container (identical)
              // DashboardContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      decoration: const BoxDecoration(
        color: Colors.red,
        
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
              ])),
   ] )
    
      );
      
  }
  
  Widget _buildUserAvatars({int maxAvatars = 3}) {
  // Calculate total width based on avatar sizes and overlapping
  double totalWidth = maxAvatars * 30.0 - ((maxAvatars - 1) * 15.0);
  
  return SizedBox(
    height: 40,
    width: totalWidth,
    child: Stack(
      clipBehavior: Clip.none,
      children: List.generate(maxAvatars, (index) {
        return Positioned(
          left: index * 30.0,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('asset/orders-illustration-image.jpg'),
            ),
          ),
        );
      }),
    ),
  );
}

}
