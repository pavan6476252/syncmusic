class YTStrings {
  static String baseUrl = "https://python-music-server.vercel.app/";
  static String getPlaylistUrl =
      "get_playlist?suggestionsLimit=100&playlistId=PLMC9KNkIncKvYin_USF1qoJQnIyMAfRxl";
  static String getWatchPlaylists =
      "/get_watch_playlists?playlistId=PLMC9KNkIncKvYin_USF1qoJQnIyMAfRxl";
}

class SaavanStrings {
  static String baseUrl = 'https://saavan-music-api.vercel.app/';

  static String homePageRoute = 'modules?language=hindi,english,telugu';
 //
  static String searchAll = 'all?query=imagine+dragons';
//
  static String searchSongs = 'search/songs?query=kun+faya+kun&limit=20';
  static String searchAlbums = 'search/albums?query=rockstar&limit=20';
  static String searchArtists = 'search/artists?query=imagine+dragons&limit=20';
  static String searchPlaylists = 'search/playlists?query=sia&limit=20';

  //details
  static String songDetails = 'songs?id=';
  static String albumDetails = 'albums?id=';
  static String artistDetails = 'artists?id=';
  static String playlistDetails = 'playlists?id=';

  //lyrics

  static String getLyrics = 'lyrics?id=';
}
