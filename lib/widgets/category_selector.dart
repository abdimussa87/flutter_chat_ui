import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
    int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> _categories = [
      "Messages",
      "Online",
      "Groups",
      "Requests"
    ];

    return Container(
      color: Theme.of(context).primaryColor,
      height: 90,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _categories.length,
          itemBuilder: (context, int index) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Text(
                  _categories[index],
                  style: TextStyle(
                    color:
                        _selectedIndex == index ? Colors.white : Colors.white60,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
