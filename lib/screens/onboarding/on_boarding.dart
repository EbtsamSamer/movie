import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/screens/home/home_screen.dart';
import 'package:movie/models/onboard_item.dart';
import 'package:movie/screens/onboarding/onboard_viewModel.dart';
import 'package:movie/screens/register/login/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName="OnboardingScreen";
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<OnboardItem> pages = [
    OnboardItem(
      image: 'assets/images/poster1.png',
      title: 'Find Your Next Favorite Movie Here',
      description:
      'Get access to a huge library of movies to suit all tastes. You will surely like it',
    ),
    OnboardItem(
      image: 'assets/images/poster2.png',
      title: 'Discover Movies',
      description:
      'Explore a vast collection of movies in all qualities and genres. Find your next'
          ' favorite film with ease.',
    ),
    OnboardItem(
      image: 'assets/images/poster3.png',
      title: 'Explore All Genres',
      description:
      'Discover movies from every genre, in all available qualities. Find something new'
          ' and exciting to watch every day.',
    ),
    OnboardItem(
      image: 'assets/images/poster4.png',
      title: 'Create Watchlists',
      description:
      'Save movies to your watchlist to keep track of what you want to watch next. '
          'Enjoy films in various qualities and genres.',
    ),
    OnboardItem(
      image: 'assets/images/poster5.png',
      title: 'Rate, Review, and Learn',
      description:
      'Share your thoughts on the movies you have watched. Dive deep into film details '
          'and help others discover great movies with your reviews.',
    ),
    OnboardItem(
      image: 'assets/images/poster6.png',
      title: 'Start Watching Now',
      description:
      '',
    ),
  ];
  void _next() {
    if (_currentIndex < pages.length - 1) {
      _controller.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      _finish();
    }
  }

  void _previous() {
    if (_currentIndex > 0) {
      _controller.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void _finish() {

Navigator.pushNamed(context, LoginScreen.routeName);
  }
OnboardPageView? onboardPageView;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (i) => setState(() => _currentIndex = i),
                itemBuilder: (context, index) {
                  final isLast = index == pages.length - 1;
                  return OnboardPageView(page: pages[index], isLast: isLast);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
              child: Column(
                spacing: 16,
                children: [
                  _currentIndex > 0
                      ? ElevatedButton(
                    onPressed: _previous,
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(398, 55),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Color(0xFFF6BD00),width: 2)
                      ),
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(color: Color(0xFFF6BD00),  fontSize: 20,
                        fontWeight: FontWeight.w400,),
                    ),
                  ):SizedBox(height:16 ,),
                  ElevatedButton(
                    onPressed: _next,
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(398, 55),
                      backgroundColor: Color(0xFFF6BD00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(_currentIndex == pages.length - 1
                        ? 'Get Started'
                        : 'Next',style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black
                    ),),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}