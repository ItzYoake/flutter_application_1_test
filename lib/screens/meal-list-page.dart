import 'package:flutter/material.dart';

class MealListPage extends StatelessWidget {
  final String mealType;
  final Function(String, String, String, String, String) onMealSelected; // Updated to include more parameters

  const MealListPage({
    Key? key,
    required this.mealType,
    required this.onMealSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> mealData = _getMealData(mealType);

    return Scaffold(
      appBar: AppBar(
        title: Text('$mealType Meals'),
      ),
      body: ListView.builder(
        itemCount: mealData.length,
        itemBuilder: (context, index) {
          final meal = mealData[index];
          return ListTile(
            leading: Image.asset(meal['imageUrl'], height: 50, width: 50),
            title: Text(meal['name']),
            subtitle: Text('Calories: ${meal['calories']} | Prep Time: ${meal['prepTime']} mins'),
            onTap: () {
              // Pass the selected meal's name, image URL, ingredients, prep time, and calories back to FoodSelectionPage
              onMealSelected(
                meal['name'],
                meal['imageUrl'],
                meal['description'], // Pass the ingredients/description
                meal['prepTime'].toString(), // Pass the prep time
                meal['calories'].toString(), // Pass the calories
              );
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }

  List<Map<String, dynamic>> _getMealData(String mealType) {
    // Example data for Breakfast, Lunch, and Dinner
    if (mealType == 'Breakfast') {
      return [
        {
          'name': 'Avocado Toast',
          'description': 'Wheat bread, Ripe Avocado, Egg, Olive Oil',
          'imageUrl': 'assets/Avocado-Toast.png',
          'calories': 155,
          'prepTime': 20,
        },
        {
          'name': 'Peanut Butter Banana Oatmeal',
          'description': 'Oat, Milk, Peanut Butter, Sliced Banana, Honey',
          'imageUrl': 'assets/Peanut-Butter-Banana-Oatmeal.png',
          'calories': 139,
          'prepTime': 25,
        },
        {
          'name': 'Shrimp & Spinach Scramble',
          'description': 'Shrimp, Salt, Spinach, Egg, Vegetables',
          'imageUrl': 'assets/Shrimp-and-Spinach.png',
          'calories': 200,
          'prepTime': 25,
        },
      ];
    }

    if (mealType == 'Lunch') {
      return [
        {
          'name': 'Steamed White Fish with Vegetables',
          'description': 'Fish, Vegetables, Lemon, Olive Oil',
          'imageUrl': 'assets/Steamed-Fish.png',
          'calories': 229,
          'prepTime': 30,
        },
        {
          'name': 'Chicken Steak',
          'description': 'Chicken Breast, Avocado, Vegetables, Peanut Sauce',
          'imageUrl': 'assets/Chicken-Steak.png',
          'calories': 155,
          'prepTime': 20,
        },
        {
          'name': 'Cauliflower Fried Rice',
          'description': 'Rice, Cauliflower, Scramble White Egg',
          'imageUrl': 'assets/Cauliflower-Fried-Rice.png',
          'calories': 155,
          'prepTime': 20,
        },
      ];
    }

    if (mealType == 'Dinner') {
      return [
        {
          'name': 'Vegetable Soup',
          'description': 'Vegetable Broth, Milk, Carrots, Celeries, Tomatoes',
          'imageUrl': 'assets/Vegetable-Soup.png',
          'calories': 106,
          'prepTime': 15,
        },
        {
          'name': 'Grilled Salmon with Steamed Broccoli',
          'description': 'Salmon, Steamed Broccoli, Olive Oil',
          'imageUrl': 'assets/Steamed-Fish.png',
          'calories': 139,
          'prepTime': 25,
        },
        {
          'name': 'Grilled Oysters with Poached Egg',
          'description': 'Oyster, Spinach, Egg, Lemon Juice',
          'imageUrl': 'assets/Oyster.png',
          'calories': 181,
          'prepTime': 15,
        },
      ];
    }

    return [];
  }
}
