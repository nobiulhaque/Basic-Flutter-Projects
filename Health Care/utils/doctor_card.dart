import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {

  final String doctorImagePath;
  final String rating;
  final String doctorName;
  final String doctorProfession;
  final bool isLastItem;



  const DoctorCard({
    super.key,
    required this.doctorImagePath,
    required this.rating,
    required this.doctorName,
    required this.doctorProfession,
    this.isLastItem = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(// Reduced left padding
        right: isLastItem ? 25.0 : 25.0, // Right padding only for last item
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            //Picture of doctor
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset(
                doctorImagePath,
                height: 120
                
                ),
            ),
      
            //rating out of 5
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow[600]),
                Text(rating),
              ],
            ),
      
            SizedBox(height: 15),
            //name
            Text(doctorName,
              style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18,
              ),
            ),
      
            //doctor title
            Text(
              doctorProfession,
              // "Neurologist, 5 y.e.",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
