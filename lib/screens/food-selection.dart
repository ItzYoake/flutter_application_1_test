import 'package:flutter/material.dart';
import 'meal-list-page.dart'; // Import the MealListPage
import 'all-meals-page.dart'; // Import the AllMealsPage

class FoodSelectionPage extends StatefulWidget {
  @override
  _FoodSelectionPageState createState() => _FoodSelectionPageState();
}

class _FoodSelectionPageState extends State<FoodSelectionPage> {
  int _currentIndex = 0; // Track current index for the BottomNavigationBar

  // Map to store the selected meals and their images for breakfast, lunch, and dinner
  final Map<String, Map<String, String>> mealPlan = {
    'Breakfast': {'name': '', 'imageUrl': '', 'ingredients': '', 'time': '', 'calories': ''},
    'Lunch': {'name': '', 'imageUrl': '', 'ingredients': '', 'time': '', 'calories': ''},
    'Dinner': {'name': '', 'imageUrl': '', 'ingredients': '', 'time': '', 'calories': ''},
  };

  // Method to update the meal plan (both meal name and image)
  void _updateMealPlan(String mealType, String selectedMeal, String imageUrl, String ingredients, String time, String calories) {
    setState(() {
      mealPlan[mealType] = {
        'name': selectedMeal,
        'imageUrl': imageUrl,
        'ingredients': ingredients,
        'time': time,
        'calories': calories,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Selection'),
        centerTitle: true,
      ),
      body: _currentIndex == 1
          ? AllMealsPage(
              onMealSelected: (mealType, name, imageUrl, ingredients, time, calories) {
                print('Meal Selected: $mealType - $name');
                _updateMealPlan(mealType, name, imageUrl, ingredients, time, calories);
                setState(() {
                  _currentIndex = 0; // Navigate back to the main food selection screen
                });
              },
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  FoodItemCard(
                    mealType: 'Breakfast',
                    icon: Icons.star,
                    iconColor: Colors.amber,
                    selectedMeal: mealPlan['Breakfast']!,
                    onMealSelected: _updateMealPlan,
                  ),
                  FoodItemCard(
                    mealType: 'Lunch',
                    icon: Icons.favorite,
                    iconColor: Colors.red,
                    selectedMeal: mealPlan['Lunch']!,
                    onMealSelected: _updateMealPlan,
                  ),
                  FoodItemCard(
                    mealType: 'Dinner',
                    icon: Icons.card_giftcard,
                    iconColor: Colors.blue,
                    selectedMeal: mealPlan['Dinner']!,
                    onMealSelected: _updateMealPlan,
                  ),
                ],
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: 'Food'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class FoodItemCard extends StatelessWidget {
  final String mealType;
  final IconData icon;
  final Color iconColor;
  final Map<String, String> selectedMeal;
  final Function(String, String, String, String, String, String) onMealSelected;

  const FoodItemCard({
    Key? key,
    required this.mealType,
    required this.icon,
    required this.iconColor,
    required this.selectedMeal,
    required this.onMealSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Aligns content to the start of the column
          children: [
            Row(
              children: [
                Icon(icon, color: iconColor), // Icon for meal type
                const SizedBox(width: 8.0), // Spacing between icon and text
                Text(mealType, style: const TextStyle(fontSize: 18.0)), // Meal type title
              ],
            ),
            const SizedBox(height: 8.0), // Space between title and subtitle
            Text(
              selectedMeal['name'] != null && selectedMeal['name']!.isNotEmpty
                  ? selectedMeal['name']! // Just display the meal name
                  : '',
              style: const TextStyle(
                fontSize: 20.0, // Increase font size
                fontWeight: FontWeight.bold, // Make the text bold
              ),
            ),
            const SizedBox(height: 12.0), // Space between text and image
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left side: Image
                GestureDetector(
                  onTap: () {
                    // Navigate to the MealListPage for the selected meal type
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MealListPage(
                          mealType: mealType,
                          onMealSelected: (String mealName, String imageUrl, String ingredients, String time, String calories) {
                            // Call the callback with mealType, mealName, imageUrl, ingredients, time, and calories
                            onMealSelected(mealType, mealName, imageUrl, ingredients, time, calories);
                          }, // Pass the callback to update meal plan
                        ),
                      ),
                    );
                  },
                  child: selectedMeal['imageUrl'] != null && selectedMeal['imageUrl']!.isNotEmpty
                      ? Image.asset(
                          selectedMeal['imageUrl']!,
                          height: 100, // Adjusted size
                          width: 100, // Adjusted size
                        )
                      : const Icon(Icons.add, size: 40), // "+" icon if no image
                ),

                const SizedBox(width: 16.0), // Space between image and details

                // Right side: Details (Ingredients, Time, Calories)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedMeal['ingredients'] != null && selectedMeal['ingredients']!.isNotEmpty
                          ? 'Ingredients: ${selectedMeal['ingredients']}'
                          : '',
                      style: const TextStyle(fontSize: 14.0),
                    ),
                    const SizedBox(height: 8.0), // Spacing between details
                    Text(
                      selectedMeal['time'] != null && selectedMeal['time']!.isNotEmpty
                          ? 'Time: ${selectedMeal['time']}'
                          : '',
                      style: const TextStyle(fontSize: 14.0),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      selectedMeal['calories'] != null && selectedMeal['calories']!.isNotEmpty
                          ? 'Calories: ${selectedMeal['calories']}'
                          : '',
                      style: const TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
