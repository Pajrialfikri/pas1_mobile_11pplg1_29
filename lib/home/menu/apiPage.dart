import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pas1_mobile_11pplg1_29/widgets/team_item.dart';
import 'package:pas1_mobile_11pplg1_29/model/TeamModel.dart';  // Import model Team

class ApiPage extends StatefulWidget {
  @override
  _ApiPageState createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  List<Team> teams = [];  // List yang berisi objek Team
  bool _isLoading = true;  // Menambahkan flag loading

  // Fungsi untuk mengambil data tim dari API
  Future<void> fetchTeams() async {
    const String url = 'https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League';

    try {
      final response = await http.get(Uri.parse(url));
      print('Response Status: ${response.statusCode}');  // Menampilkan status kode respon

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          teams = (data['teams'] as List)
              .map((team) => Team.fromMap(team))  // Parsing JSON ke objek Team
              .toList();
          _isLoading = false;  // Set loading selesai
        });
      } else {
        print('Error: ${response.body}');
        throw Exception('Failed to load teams');
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isLoading = false;  // Set loading selesai
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchTeams();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Page'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: teams.length,
        itemBuilder: (context, index) {
          final team = teams[index];
          return TeamItem(
            team: team,
            onLikePressed: () {
              setState(() {
                team.isLiked = !team.isLiked;
              });
            },
          );
        },
      ),
    );
  }
}
