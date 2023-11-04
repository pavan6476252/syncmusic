import 'package:flutter/material.dart';

class Constants {
  static List<String> saavanLanguages = [
    'Hindi',
    'English',
    'Punjabi',
    'Tamil',
    'Telugu',
    'Marathi',
    'Gujarati',
    'Bengali',
    'Kannada',
    'Bhojpuri',
    'Malayalam',
    'Urdu',
    'Haryanvi',
    'Rajasthani',
    'Odia',
    'Assamese'
  ];

  static List<NavigationDestination> bottomNavigationBarItems = [
    const NavigationDestination(icon: Icon(Icons.home_filled), label: "Home"),
    const NavigationDestination(
        icon: Icon(Icons.favorite_border_rounded), label: "Favorite"),
    const NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
  ];
}
