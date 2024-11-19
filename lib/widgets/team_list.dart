import 'package:flutter/material.dart';
import 'package:pas1_mobile_11pplg1_29/widgets/team_item.dart';
import 'package:pas1_mobile_11pplg1_29/model/TeamModel.dart'; // Pastikan TeamModel diimpor

class TeamList extends StatelessWidget {
  final List<Team> teams;  // List yang berisi objek Team
  final Function(Team) onLikePressed;  // Fungsi untuk like, menerima objek Team

  // Constructor
  TeamList({
    required this.teams,
    required this.onLikePressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: teams.length,
      itemBuilder: (context, index) {
        final team = teams[index];
        return TeamItem(
          team: team,
          onLikePressed: () {
            onLikePressed(team);  // Aksi ketika tombol like ditekan
          },
        );
      },
    );
  }
}
