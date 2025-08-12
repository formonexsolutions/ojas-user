import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../Routes/AppRoutes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 50), () {
      Get.offNamed(AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Set system overlay style for a clean look (optional)
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;

          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: screenHeight),
              child: IntrinsicHeight(
                child: Stack(
                  children: <Widget>[
                    // Background with curved bottom
                    Positioned.fill(
                      child: CustomPaint(
                        painter: _BackgroundPainter(),
                      ),
                    ),
                    // Main content and image column
                    Column(
                      children: [
                        // Top content section
                        Padding(
                          padding: EdgeInsets.only(
                            top: screenHeight * 0.1,
                            left: screenWidth * 0.08,
                            right: screenWidth * 0.08,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Welcome to',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.06,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                'Ojas!',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.1,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Text(
                                'Connect with divine rituals Book priests, donate\nto temples, and immerse in sacred mantras',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.03),
                              Container(
                                width: screenWidth * 0.1,
                                height: 2,
                                color: Colors.orange,
                              ),
                            ],
                          ),
                        ),
                        // Flexible space to push the image down
                        const Spacer(),
                        // Pandit Image
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                          child: Image.asset(
                            'assets/splash/pandit.png',
                            // The height of the image is now flexible,
                            // taking up to 50% of the screen height.
                            height: screenHeight * 0.5,
                            fit: BoxFit.contain,
                          ),
                        ),
                        // Decorative elements at the bottom
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              _buildFlower(screenWidth, Colors.white),
                              _buildLeaf(screenWidth, Colors.green.shade300),
                              _buildFlower(screenWidth, Colors.white),
                              _buildLeaf(screenWidth, Colors.green.shade300),
                              _buildFlower(screenWidth, Colors.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Arrow Icon (still using Positioned for absolute placement)
                    Positioned(
                      top: screenHeight * 0.18,
                      right: screenWidth * 0.08,
                      child: Container(
                        width: screenWidth * 0.12,
                        height: screenWidth * 0.12,
                        decoration: BoxDecoration(
                          color: Colors.orange.shade300,
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                          onTap:   (){
                            Get.offNamed(AppRoutes.home);
                          },
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: screenWidth * 0.07,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Decorative Mandala (still using Positioned)
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: screenHeight * 0.2,
                      child: Opacity(
                        opacity: 0.3,
                        child: Center(
                          child: SizedBox(
                            width: screenWidth * 0.6,
                            height: screenWidth * 0.6,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange.shade100),
                              strokeWidth: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFlower(double screenWidth, Color color) {
    return Icon(
      Icons.brightness_1,
      color: color,
      size: screenWidth * 0.04,
    );
  }

  Widget _buildLeaf(double screenWidth, Color color) {
    return Icon(
      Icons.spa,
      color: color,
      size: screenWidth * 0.05,
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint()
      ..color = Colors.orange.shade100
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.lineTo(0, height * 0.8);
    path.quadraticBezierTo(width * 0.2, height * 0.9, width * 0.5, height * 0.85);
    path.quadraticBezierTo(width * 0.8, height * 0.8, width, height * 0.9);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();

    canvas.drawPath(path, paint);

    canvas.drawRect(Rect.fromLTWH(0, 0, width, height * 0.8), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}