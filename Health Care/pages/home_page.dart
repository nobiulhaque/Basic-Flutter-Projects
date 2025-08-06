import 'package:flutter/material.dart';
import 'package:healthcare/utils/category_card.dart';
import 'package:healthcare/utils/doctor_card.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10), // Space at the top
              //app bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hellow,",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Md Riyad",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    //profile picture
                    SizedBox(
                      height: 60,
                      child: Image.asset("assets/docn.png"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10), // Space after app bar
              //card -> how do you feel?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  padding: const EdgeInsets.all(16), // Reduced from 20
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      // Text content + button
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize:
                              MainAxisSize.min, // Prevents extra vertical space
                          children: [
                            Text(
                              "How do you feel?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16, // Slightly larger for emphasis
                              ),
                            ),
                            SizedBox(height: 12), // Reduced spacing
                            Text(
                              "Fill out your medical card right now!",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 12),

                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.blue[200],
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue.withAlpha(
                                      (0.3 * 255).round(),
                                    ),
                                    blurRadius: 6,
                                    offset: Offset(
                                      0,
                                      3,
                                    ), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "Get Started",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            // Space before button
                          ],
                        ),
                      ),

                      // Image
                      Container(
                        height: 150,
                        width: 150,
                        margin: EdgeInsets.only(
                          left: 16,
                        ), // Space between text and image
                        child: Lottie.asset(
                          'assets/docn.json', // Example: Doctor animation
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //search bar
              SizedBox(height: 20), // Space after the card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.blue[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 70,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 25.0),
                  children: [
                    CategoryCard(
                      iconImagePath: "assets/icons/dentist.png",
                      categoryName: "Dentist",
                    ),
                    CategoryCard(
                      iconImagePath: "assets/icons/surgeon.png",
                      categoryName: "Surgeon",
                    ),
                    CategoryCard(
                      iconImagePath: "assets/icons/medicine.png",
                      categoryName: "Pharmacist",
                    ),
                    CategoryCard(
                      iconImagePath: "assets/icons/nephrologist.png",
                      categoryName: "Nephrologist",
                    ),
                    CategoryCard(
                      iconImagePath: "assets/icons/neurology.png",
                      categoryName: "Neurologist",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20), // Space after categories
              //doctor list
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Doctor list",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Add your onTap logic here
                      },
                      child: Text(
                        "See all",
                        style: TextStyle(fontSize: 14, color: Colors.blueGrey),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10), // Space after "Doctor list"
              // List of doctors cards

              // child: Padding(
              // padding: const EdgeInsets.only(left: 25.0),
              SizedBox(
                height: 250, // Set a fixed height for the horizontal list
                child: ListView(
                  padding: const EdgeInsets.only(left: 25.0),
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(), // iOS-style scrolling
                  children: [
                    // Doctor 1
                    DoctorCard(
                      doctorImagePath: "assets/doc1.jpg",
                      rating: "4.9",
                      doctorName: "Dr. Sarah Smith",
                      doctorProfession: "Neurologist, 5 y.e.",
                    ),

                    // Doctor 2
                    DoctorCard(
                      doctorImagePath: "assets/doc2.jpg",
                      rating: "4.5",
                      doctorName: "Dr. Lisa Wong",
                      doctorProfession: "Surgeon, 7 y.e.",
                    ),

                    // Doctor 3
                    DoctorCard(
                      doctorImagePath: "assets/doc3.jpg",
                      rating: "4.6",
                      doctorName: "Dr. Emily Davis",
                      doctorProfession: "Neurologist, 6 y.e.",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}
