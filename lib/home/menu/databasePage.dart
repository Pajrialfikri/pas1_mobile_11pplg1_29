import 'package:flutter/material.dart';
import 'package:pas1_mobile_11pplg1_29/model/TeamModel.dart';
import 'package:pas1_mobile_11pplg1_29/widgets/team_item.dart';
import 'package:pas1_mobile_11pplg1_29/services/database_helper.dart';

class DatabasePage extends StatefulWidget {
  @override
  _DatabasePageState createState() => _DatabasePageState();
}

class _DatabasePageState extends State<DatabasePage> {
  List<Team> likedTeams = [];

  @override
  void initState() {
    super.initState();
    _loadLikedTeams();
  }

  _loadLikedTeams() async {
    List<Team> loadedTeams = await DatabaseHelper.instance.getTeams();
    setState(() {
      likedTeams = loadedTeams.where((team) => team.isLiked).toList();
    });
  }

  _toggleLike(Team team) async {
    setState(() {
      team.isLiked = !team.isLiked;
    });
    if (team.isLiked) {
      await DatabaseHelper.instance.insertTeam(team);
    } else {
      await DatabaseHelper.instance.updateTeam(team);
    }
    _loadLikedTeams(); // Refresh the list after toggling like
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Liked Teams')),
      body: likedTeams.isEmpty
          ? Center(child: Text('No teams liked yet.'))
          : ListView.builder(
        itemCount: likedTeams.length,
        itemBuilder: (context, index) {
          final team = likedTeams[index];
          return TeamItem(
            team: team,
            onLikePressed: () => _toggleLike(team),
          );
        },
      ),
    );
  }
}
