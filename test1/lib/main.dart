
class Song{
  String title = "";
  String artist = "";
  Duration duration = Duration(seconds: 0);
  int year = 0;
  }


class Playlist with SearchMixin {
  final List<Song> songs = [];

  Playlist(List<Song> songs) {
    this.songs.addAll(songs);
  }

  // Пошук пісень у плейлисті
  List<Song> search(String query) {
    return songs.where((song) => song.title.contains(query)).toList();
    songs.where((song) => song.artist.contains(query)).toList();
  }
}

mixin SearchMixin
  /*String title = "";
  String artist = "";
  Duration duration = Duration(seconds: 0);
  int year = 0;

  @override
  bool matches(String query) {
    return title.contains(query) || age == int.parse(query);
  }*/

void main() {
  Song song1 = Song(
    title: "Song1",
    artist: "Artist1"
    duration: Duration(minutes: 1, seconds: 15)
    year: 2023
  )
}



Playlist playlist = Playlist([
  Song(title: "Song1", artist: "Artist1"),
  Song(title: "Song2", artist: "Artist2"),

]);

List<Song> results = playlist.search("Song1");

for (Song result in results) {
  print(result.title);
}


/*
mixin SearchMixin {
  final List<Song> songs = [];

  List<Song> search(String query) {
    return songs.where((song) {
      return song.title.toLowerCase().contains(query.toLowerCase()) ||
          song.artist.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}

class Song {
  final String title;
  final String artist;
  final Duration duration;
  final int year;

  Song({
    required this.title,
    required this.artist,
    required this.duration,
    required this.year,
  });
}

class Playlist with SearchMixin {
  final List<Song> songs = [];

  Playlist(List<Song> songs) {
    this.songs.addAll(songs);
  }

  // Пошук пісень у плейлисті
  List<Song> search(String query) {
    return songs.where((song) {
      return song.title.toLowerCase().contains(query.toLowerCase()) ||
          song.artist.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}

void main() {
  // Створити список пісень
  List<Song> songs = [
    Song(title: "Song1", artist: "Artist1"),
    Song(title: "Song2", artist: "Artist2"),
    Song(title: "Song3", artist: "Artist3"),
  ];

  // Створити плейлист
  Playlist playlist = Playlist(songs);

  // Знайти пісні по назві
  List<Song> results = playlist.search("Song1");

  // Вивести результати пошуку
  for (Song result in results) {
    print(result.title);
  }

  // Знайти пісні по виконавцю
  results = playlist.search("Artist2");

  // Вивести результати пошуку
  for (Song result in results) {
    print(result.title);
  }
}