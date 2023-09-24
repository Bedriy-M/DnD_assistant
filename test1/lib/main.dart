
/*class Song{
  String title = "";
  String artist = "";
  Duration duration = Duration(seconds: 0);
  String year = "";
  }*/

class Song with SearchMixin {
}
mixin SearchMixin
  String title = "";
  String artist = "";
  Duration duration = Duration(seconds: 0);
  int year = 0;

  Song (this.title, this.artist, this.duration, this.year);

  @override
  bool matches(String query) {
    return title.contains(query) || age == int.parse(query);
  }
}

void main() {
  Song song1 = Song(
    title: "Song1",
    artist: "Artist1"
    duration: Duration(minutes: 1, seconds: 15)
    year: 2023
  )
}



