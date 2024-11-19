import 'package:flutter/material.dart';
import 'package:pas1_mobile_11pplg1_29/model/TeamModel.dart';

class TeamItem extends StatelessWidget {
  final Team team;
  final VoidCallback onLikePressed;  // Add this to handle like press

  TeamItem({
    required this.team,
    required this.onLikePressed,  // Add this to accept the callback
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(team.strTeam),
        subtitle: Text(team.strLeague),
        leading: Image.network(team.strBadge), // Display team logo
        trailing: IconButton(
          icon: Icon(
            team.isLiked ? Icons.favorite : Icons.favorite_border, // Change icon based on like status
            color: team.isLiked ? Colors.red : null,
          ),
          onPressed: onLikePressed, // Trigger the callback when pressed
        ),
      ),
    );
  }
}
