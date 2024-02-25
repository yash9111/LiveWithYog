import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SongsApp extends StatefulWidget {
  @override
  State<SongsApp> createState() => _SongsAppState();
}

class _SongsAppState extends State<SongsApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // SizedBox(height: 50),
          CustomSearchBar(),
          Expanded(
            child: SongsList(),
          ),
        ],
      ),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color.fromARGB(255, 255, 254, 254),
          boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 6)]),

      padding: EdgeInsets.symmetric(
        horizontal: 10,
        // vertical: 5,
      ),
      // margin: EdgeInsets.only(top: 40),
      child: Row(
        children: [
          IconButton(
            icon: SvgPicture.asset(
              "assets/Icons/search_icon.svg",
              color: Colors.black26,
            ),
            onPressed: () {
              // Handle search button press
            },
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w100,
                  )),
              onChanged: (value) {
                // Handle search text change
              },
            ),
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/Light/Filter.svg",
              color: Colors.black26,
            ),
            onPressed: () {
              // Handle menu button press
            },
          ),
        ],
      ),
    );
  }
}

class SongsList extends StatelessWidget {
  List<String> songName = [
    "Mind's Eye",
    "Morganite",
    "Bright Eyes",
    "Winding Down",
    "Long Nap",
    "White Lies",
    "All i Ever wanted",
    "Someone Misses you ",
    "Mandala",
    "Explore your soul",
    "Dharma",
    "Lilac Clouds",
    "Eucalyptus"
  ];
  List<String> artistName = [
    "Break of Dawn",
    "Invisible Colors",
    "Midnight skyline",
    "Under Water",
    "Blanket",
    "Open Mind",
    "Shallow Water",
    "Reflect the Day",
    "Blanket",
    "Feel the wind",
    "Escape into the world",
    "Under Water",
    "Summer Breeze"
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: songName.length, // Replace with your actual song count
      itemBuilder: (context, index) {
        return ListTile(
          trailing: IconButton(
            icon: SvgPicture.asset(
              'assets/Light/More_Square.svg',
              color: Colors.black,
            ),
            onPressed: () {
              // Handle menu button press for a song
              _showSongOptions(context, songName[index], artistName[index]);
            },
          ),
          title: Text(
            songName[index],
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(artistName[index],
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 11,
                fontWeight: FontWeight.w100,
              )),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image(
              image: AssetImage("assets/Images/musicPng.png"),
            ),
          ),
          onTap: () {
            // Handle song tap
            showModalBottomSheet(
              useSafeArea: true,
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return MusicPlayerBottomSheet();
              },
            );
          },
        );
      },
    );
  }

  void _showSongOptions(
      BuildContext context, String songName, String artistName) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            image: DecorationImage(
              image: AssetImage('assets/Vectors/menu_back.png'),
              fit: BoxFit
                  .cover, // You can adjust the fit based on your requirements
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                songName,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold),
              ),
              Text(
                artistName,
                style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.playlist_add),
                title: Text(
                  'Add to Playlist',
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
                onTap: () {
                  // Handle Add to Playlist
                },
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text(
                  'Share',
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
                onTap: () {
                  // Handle Share
                },
              ),
              ListTile(
                leading: Icon(Icons.thumb_up),
                title:
                    Text('Like Song', style: TextStyle(fontFamily: 'Poppins')),
                onTap: () {
                  // Handle Like Song
                },
              ),
              ListTile(
                leading: Icon(Icons.save),
                title: Text('Save', style: TextStyle(fontFamily: 'Poppins')),
                onTap: () {
                  // Handle Save
                },
              ),
              ListTile(
                leading: Icon(Icons.playlist_play),
                title: Text('View Playlist',
                    style: TextStyle(fontFamily: 'Poppins')),
                onTap: () {
                  // Handle View Playlist
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class MusicPlayerBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // height: double.infinity,
      // height: MediaQuery.of(context).size.height * 1,
      appBar: musiAppBar(),
      body: Expanded(
        // height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 20),
            // Thumbnail of song
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/thumbnail.jpg'),
            ),
            SizedBox(height: 20),
            // Song title and artist name
            ListTile(
              title: Text('Song Title'),
              subtitle: Text('Artist Name'),
              trailing: IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {
                  // Handle like button tap
                },
              ),
            ),
            SizedBox(height: 20),
            // Song progress bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: LinearProgressIndicator(
                value: 0.5, // Example value, should be dynamic
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
            SizedBox(height: 20),
            // Music player controls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.shuffle),
                  onPressed: () {
                    // Handle shuffle button tap
                  },
                ),
                IconButton(
                  icon: Icon(Icons.skip_previous),
                  onPressed: () {
                    // Handle previous song button tap
                  },
                ),
                IconButton(
                  icon: Icon(Icons.play_arrow),
                  onPressed: () {
                    // Handle play/pause button tap
                  },
                ),
                IconButton(
                  icon: Icon(Icons.skip_next),
                  onPressed: () {
                    // Handle next song button tap
                  },
                ),
                IconButton(
                  icon: Icon(Icons.repeat),
                  onPressed: () {
                    // Handle repeat button tap
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

musiAppBar() {
  return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 32,
          height: 32,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 10,
                child: Container(
                  width: 32,
                  height: 32,
                  child: Icon(Icons.arrow_back),
                  decoration: ShapeDecoration(
                    color: Color(0xFFF7F8F8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 32,
            height: 32,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: ShapeDecoration(
                      color: Color(0xFFF7F8F8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
                Positioned(
                  left: 11,
                  top: 14,
                  child: Container(
                    width: 10,
                    height: 4,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 4,
                            height: 4,
                            decoration: ShapeDecoration(
                              color: Color(0xFF1D1517),
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 6,
                          top: -0,
                          child: Container(
                            width: 4,
                            height: 4,
                            decoration: ShapeDecoration(
                              color: Color(0xFF1D1517),
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
      title: Center(
        child: Text(
          "Profile",
          style: TextStyle(
            color: Color(0xFF1D1517),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            height: 0.09,
          ),
        ),
      ));
}
