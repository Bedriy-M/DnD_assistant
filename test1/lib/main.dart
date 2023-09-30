
//Створюю міксін
mixin SearchMixin {
  List<Song> songs = [];

  List<Song> search(String query) {
    return songs.where((song) {
      return song.title.toLowerCase().contains(query.toLowerCase()) ||
          song.artist.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}

//Створюю клас Сонг
class Song {
  final String title;
  final String artist;
  final Duration duration;
  final int year;

//Конструктор класу сонг
  Song({
    required this.title,
    required this.artist,
    required this.duration,
    required this.year,
  });
}

//Створюю клас Плейліст
class Playlist with SearchMixin {
  final String name;

  Playlist({
    required this.name,
    List<Song> songs = const [],
  }) {
    this.songs = songs;
  }

  List<Song> search(String query) {
    return songs.where((song) {
      return song.title.toLowerCase().contains(query.toLowerCase()) ||
          song.artist.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}

extension MyExtension on List<Song> {
  Duration totalDuration() {
    double totalSeconds = 0.0;
    
    for (var song in this) {
      totalSeconds += song.duration.inSeconds;
    }
    return Duration(seconds: totalSeconds);
  }
}


void main() {
  //Додаю пісні
  List<Song> songs = [
    Song(
      title: "Song1",
      artist: "Artist1",
      duration: Duration(minutes: 2, seconds: 30),
      year: 2000),
    Song(
      title: "Song2",
      artist: "Artist1",
      duration: Duration(minutes: 2, seconds: 40),
      year: 2001),
    Song(
      title: "Song1",
      artist: "Artist2",
      duration: Duration(minutes: 2, seconds: 50),
      year: 2002),
    Song(
      title: "Song2",
      artist: "Artist2",
      duration: Duration(minutes: 3, seconds: 0),
      year: 2003),
  ];

//Створюю "Плейліст" класу Плейліст
  Playlist playlist = Playlist(name: "Song List", songs: songs);

//Здійснення пошуку за назвою та артистом
  List<Song> results = playlist.search("Song1");
  List<Song> results2 = playlist.search("Artist2");

//Ну і вивід результатів
  for (Song result in results) {
    print(result.title);
  }

  for (Song result in results2) {
    print(result.artist);
  }
}

print(totalDuration);
