import 'package:flutter/material.dart';

class SongsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            CustomSearchBar(),
            Expanded(
              child: SongsList(),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.grey[200],
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search button press
            },
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
              ),
              onChanged: (value) {
                // Handle search text change
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.menu),
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
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Replace with your actual song count
      itemBuilder: (context, index) {
        return ListTile(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Handle menu button press for a song
              _showSongOptions(context);
            },
          ),
          title: Text('Song Name $index'),
          subtitle: Text('Artist Name $index'),
          trailing: Icon(Icons.play_circle_filled), // Example icon
          onTap: () {
            // Handle song tap
          },
        );
      },
    );
  }

  void _showSongOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Song Name',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Artist Name',
                style: TextStyle(fontSize: 16),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.playlist_add),
                title: Text('Add to Playlist'),
                onTap: () {
                  // Handle Add to Playlist
                },
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text('Share'),
                onTap: () {
                  // Handle Share
                },
              ),
              ListTile(
                leading: Icon(Icons.thumb_up),
                title: Text('Like Song'),
                onTap: () {
                  // Handle Like Song
                },
              ),
              ListTile(
                leading: Icon(Icons.save),
                title: Text('Save'),
                onTap: () {
                  // Handle Save
                },
              ),
              ListTile(
                leading: Icon(Icons.playlist_play),
                title: Text('View Playlist'),
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
