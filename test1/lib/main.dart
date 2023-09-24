import 'package:flutter/material.dart';

void main() {
}

class Song{
  final String title = "";
  final String artist = "";
  final Duration duration = Duration(seconds: 0);
  final String year = "";
  }

class Playlist{
  final String name = "Playlist";

  void addSong(Song song) => songs.add(song);

  void removeSong(Song song) => songs.remove(song);
}

