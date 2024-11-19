class Team {
  final int id;
  final String strTeam;
  final String strLeague;
  final String strBadge;
  bool isLiked;

  Team({
    required this.id,
    required this.strTeam,
    required this.strLeague,
    required this.strBadge,
    this.isLiked = false,
  });

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      id: map['idTeam'],
      strTeam: map['strTeam'],
      strLeague: map['strLeague'],
      strBadge: map['strBadge'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idTeam': id,
      'strTeam': strTeam,
      'strLeague': strLeague,
      'strBadge': strBadge,
      'isLiked': isLiked ? 1 : 0,
    };
  }
}
