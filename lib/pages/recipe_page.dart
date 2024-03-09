import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipbook/models/recipe.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({Key? key, required this.recipe}) : super(key: key);
  final Recipoe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          recipe.name,
          style: TextStyle(fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          Image.network(
            recipe.image,
            fit: BoxFit.cover,
            height: 400,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${recipe.cuisine}, ${recipe.difficulty}",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                Text(
                  "${recipe.name}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      letterSpacing: 2),
                ),
                Text(
                  "Prep Time : ${recipe.prepTimeMinutes}  |  Cook Time : ${recipe.cookTimeMinutes}",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                SizedBox(height: 15),
                ...recipe.ingredients
                    .map((e) => Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.bowlFood,
                              size: 20,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              e,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ))
                    .toList(),
                SizedBox(height: 15),
                ...recipe.instructions
                    .map((e) => Text(
                          "${recipe.instructions.indexOf(e) + 1}. $e\n",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ))
                    .toList(),
              ],
            ),
          )
        ],
      ),
    );
  }
}