# MealMate

MealMate is an iOS application that combines food delivery and grocery shopping in one convenient platform. The app features restaurant ordering, mart shopping, and basket management with custom iOS 18 widgets for quick access to key features.

This project is done to learn about widgets, control widgets and deeplinking into application

#Video Demo
https://drive.google.com/file/d/1CJUYtZ4E3be2Xwk-JKa6ZLFDIoh7Rcue/view?t=12

#ScreenShots of Widgets implementation 

<div style="display: flex; justify-content: center; gap: 20px;">
  <img width="400" height="800" alt="IMG_0479" src="https://github.com/user-attachments/assets/e289d593-11f9-412a-9d67-afada54b1000" />
  <img width="400" height="800" alt="IMG_0478" src="https://github.com/user-attachments/assets/3e229c23-a229-4fc6-8541-f220663c0bcb" />
</div>



# App Structure

The app consists of four main sections accessible through bottom navigation:

1. Home - Main dashboard with categories and promotions
2. Mart - Grocery shopping section
3. Baskets - Order tracking and management
4. Restaurants - Food delivery service

# Widgets

MealMate provides four Control Widgets for iOS 18:
• Basket Widget (cart icon)
• Restaurant Widget (fork.knife icon)
• Mart Widget (carrot icon)
• Search Widget (magnifying glass icon)

# Each widget opens the corresponding section of the app through custom URL schemes.

# Deep Linking

The app supports custom URL schemes for direct navigation:
• mealmate://baskets - Opens basket view
• mealmate://mart - Opens mart view
• mealmate://restaurants - Opens restaurants view
• mealmate://search - Opens search view

# Data Models

The app uses structured data models for:
• Restaurants and food items
• Mart categories and products
• Basket items
• Home categories and promotional banners

#Features

- **Restaurant Ordering**: Browse restaurants, view menus, and order food
- **Grocery Shopping**: Shop for groceries and beverages with detailed product information
- **Basket Management**: Track your orders and shopping items
- **Search Functionality**: Find restaurants, food items, drinks, and groceries
- **iOS 18 Widgets**: Quick access widgets for baskets, restaurants, mart, and search
- **Custom URL Handling**: Deep linking support for navigation between features

## Requirements

- iOS 17.0+
- Xcode 16.0+
- Swift 5.9+



  
