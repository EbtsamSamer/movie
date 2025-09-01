import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/screens/home/home_screen.dart';
import 'package:movie/screens/home/tabs/profile/presentation/screens/update_pro.dart';
import 'package:movie/screens/home/tabs/profile/presentation/widgets/history_item.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 40,),
                      Container(
                        margin: EdgeInsets.all(8),
                        width: 118,
                        height: 118,
                        child: Image.asset(
                          "assets/images/avatar2.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        "Ebtsam Samer",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 32),
                  // stats
                  _statColumn("12", "Wish List"),
                  SizedBox(width: 32),
                  _statColumn("10", "History"),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF6BD00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.all(12),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, UpdateProfile.routeName);
                      },
                      child: Text(
                        "Edit Profile",
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE82626),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    },
                    child: Row(
                      children: [
                        Text(
                          "Exit",
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.exit_to_app_rounded, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              DefaultTabController(
                length: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white70,
                      labelStyle: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      unselectedLabelStyle: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      indicatorColor: Color(0xFFFFBB3B),
                      tabs: [
                        Tab(
                          text: "Watch List",
                          icon: ImageIcon(
                            AssetImage("assets/images/list_ic.png"),
                            color: Color(0xFFFFBB3B),
                          ),
                        ),
                        Tab(
                          text: "History",
                          icon: ImageIcon(
                            AssetImage("assets/images/ic_history.png"),
                            color: Color(0xFFFFBB3B),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      height: screenSize.height * 0.5,
                      child: TabBarView(
                        children: [
                         Image.asset("assets/images/empty.png"),
                          Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 0.65,
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 40,

                                  ),
                              itemCount: 100,
                              padding: EdgeInsets.all(6),
                              itemBuilder: (context, index) {
                                return HistoryItem();
                              },
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
        ),
      ),
    );
  }

  Widget _statColumn(String value, String label) {
    return Column(

      children: [
        SizedBox(height: 55,),
        Text(
          value,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 36,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
