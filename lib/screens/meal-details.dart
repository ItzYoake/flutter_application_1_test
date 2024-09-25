import 'package:flutter/material.dart';

class MealDetailsPage extends StatelessWidget {
  final String mealName;
  final String mealDescription;
  final String mealImage;
  final int calories;
  final int preparationTime;

  const MealDetailsPage({
    Key? key,
    required this.mealName,
    required this.mealDescription,
    required this.mealImage,
    required this.calories,
    required this.preparationTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mealName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(mealImage, height: 200), // Display meal image
            const SizedBox(height: 20),
            Text(
              mealDescription,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Calories: $calories cal"),
                Text("Prep Time: $preparationTime mins"),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle any action you want here, e.g., add to meal plan
              },
              child: const Text('Add to Meal Plan'),
            ),
          ],
        ),
      ),
    );
  }
}
