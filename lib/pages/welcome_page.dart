import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:asisten_petani/theme.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController _controller = PageController();

  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    _checkFirstSeen();
  }

  Future<void> _checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (!_seen) {
      await prefs.setBool('seen', true);
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  //2 is our last page starting from 0
                  isLastPage = index == 3;
                });
              },
              children: [
                //One page layout
                BuildIntroPage(
                  img: 'assets/slide1.png',
                  title: ' Selamat Datang di Sawah Sehat!',
                  description:
                      'Temukan solusi tepat untuk meningkatkan hasil panen Anda dengan teknologi deteksi penyakit padi yang canggih',
                ),

                BuildIntroPage(
                  img: 'assets/slide2.png',
                  title: 'Mudah & Akurat dalam Deteksi',
                  description:
                      'Dengan antarmuka yang sederhana dan deteksi yang akurat 4 penyakit padi secara cepat dan efisien.',
                ),

                BuildIntroPage(
                  img: 'assets/slide3.png',
                  title: 'Catat Hasil Panen dengan Mudah',
                  description:
                      'Tingkatkan produktivitas pertanian Anda dengan fitur pencatatan yang praktis, efesien dan mudah',
                ),

                BuildIntroPage(
                  img: 'assets/slide4.png',
                  title: 'Catat Hasil Panen dengan Mudah',
                  description:
                      'Tingkatkan produktivitas pertanian Anda dengan fitur pencatatan yang praktis, efesien dan mudah',
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Center(
            child: SmoothPageIndicator(
              controller: _controller,
              count: 4,
              onDotClicked: (index) {
                _controller.animateToPage(index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              },
              effect: ExpandingDotsEffect(
                activeDotColor: buttonColor1,
                dotHeight: 7.0,
                dotWidth: 7.0,
                dotColor: Color.fromARGB(31, 0, 0, 0),
              ),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: buttonColor1, backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: BorderSide(color: Colors.grey, width: 2),
                    ),
                    minimumSize:
                        Size(120, 45), // Atur tinggi dan lebar tombol di sini
                  ),
                  onPressed: isLastPage
                      ? () {
                          Navigator.pushNamed(context, '/home');
                        }
                      : () {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                  child: Text(
                    isLastPage ? 'Done' : 'Next',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: buttonColor1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: BorderSide(color: Colors.grey, width: 2),
                    ),
                    minimumSize:
                        Size(120, 45), // Atur tinggi dan lebar tombol di sini
                  ),
                  onPressed: () {
                    _controller.jumpToPage(3);
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}

class BuildIntroPage extends StatelessWidget {
  String title;
  String img;
  String description;
  BuildIntroPage({
    required this.title,
    required this.description,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Atau warna lain yang diinginkan,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
                bottomLeft: Radius.circular(40),
              ),
              image: DecorationImage(
                image: AssetImage(img),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 30),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
