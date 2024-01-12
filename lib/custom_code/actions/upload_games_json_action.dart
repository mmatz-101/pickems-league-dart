// Automatic FlutterFlow imports
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase/supabase.dart';
import 'package:intl/intl.dart';

Future uploadGamesJsonAction(
  dynamic games,
  String week,
  String league,
) async {
  // Add your function code here!
  // Get a reference your Supabase client
  final supabase = SupabaseClient('https://zxccvdjhozhrknywjsev.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inp4Y2N2ZGpob3pocmtueXdqc2V2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDM2ODc4NzIsImV4cCI6MjAxOTI2Mzg3Mn0.EC8kgtexFm-dpEROUrlJhmtJFEo5NGjnzpcK0DGUZ_w');

  for (var gameID in games.keys) {
    var gameData = games[gameID];
    // HOME TEAM INFO
    var homeNameInfo = gameData["teams"]["home"]["names"];
    var homeName = homeNameInfo["name"];
    var homeNameAbbreviation = homeNameInfo["abbreviation"];
    var homeNameDisplayName = homeNameInfo["display_name"];
    var homeNameNickName = homeNameInfo["nick_name"];
    var homeShortName = homeNameInfo["short_name"];
    var homeSpread = gameData["teams"]["home"]["spread"];
    var homeScore = gameData["teams"]["home"]["score"];

    // AWAY TEAM INFO
    var awayNameInfo = gameData["teams"]["away"]["names"];
    var awayName = awayNameInfo["name"];
    var awayNameAbbreviation = awayNameInfo["abbreviation"];
    var awayNameDisplayName = awayNameInfo["display_name"];
    var awayNameNickName = awayNameInfo["nick_name"];
    var awayShortName = awayNameInfo["short_name"];
    var awaySpread = gameData["teams"]["away"]["spread"];
    var awayScore = gameData["teams"]["away"]["score"];

    // GAME INFO
    var status = gameData["status"];
    var stadium = gameData["stadium"]["stadium"];
    var date = gameData["date"];
    var tvStation = gameData["tvStation"];

    // Create a UTC DateTime object from the timestamp:
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(date * 1000, isUtc: true);
    const easternOffset = Duration(hours: -4);

    var dateTimeOffset = dateTime.add(easternOffset);
    // Format the DateTime object to the desired string:
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTimeOffset);

    // Convert league
    String formattedLeague;
    if (league == "nfl") {
      formattedLeague = "NFL";
    } else {
      formattedLeague = "NCAA";
    }

    await supabase.from("games").upsert({
      "away_abbreviation": awayNameAbbreviation,
      "away_display_name": awayNameDisplayName,
      "away_name": awayName,
      "away_nick_name": awayNameNickName,
      "away_short_name": awayShortName,
      "away_score": awayScore,
      "away_spread": awaySpread,
      "home_abbreviation": homeNameAbbreviation,
      "home_display_name": homeNameDisplayName,
      "home_name": homeName,
      "home_nick_name": homeNameNickName,
      "home_short_name": homeShortName,
      "home_score": homeScore,
      "home_spread": homeSpread,
      "status": status,
      "date": formattedDate,
      "stadium": stadium,
      "tv_station": tvStation,
      "oddshark_id": gameID,
      "week": int.parse(week),
      "league": formattedLeague,
    }, onConflict: "oddshark_id");
  }
}
