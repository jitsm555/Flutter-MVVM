import 'package:flutter/material.dart';
import 'package:mvvm_flutter_app/model/media.dart';
import 'package:mvvm_flutter_app/view_model/media_view_model.dart';
import 'package:provider/provider.dart';

class PlayerListWidget extends StatefulWidget {
  final List<Media> _mediaList;
  final Function _function;

  PlayerListWidget(this._mediaList, this._function);

  @override
  _PlayerListWidgetState createState() => _PlayerListWidgetState();
}

class _PlayerListWidgetState extends State<PlayerListWidget> {
  Widget _buildSongItem(Media media) {
    Media? _selectedMedia = Provider.of<MediaViewModel>(context).media;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Container(
              width: 50,
              height: 50,
              child: Image.network(media.artworkUrl ?? ''),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    media.trackName ?? '',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    media.artistName ?? '',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    media.collectionName ?? '',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.grey,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ]),
          ),
          if (_selectedMedia != null &&
              _selectedMedia.trackName == media.trackName)
            Icon(
              Icons.play_circle_outline,
              color: Theme.of(context).primaryColor,
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: widget._mediaList.length,
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemBuilder: (BuildContext context, int index) {
            Media data = widget._mediaList[index];
            return InkWell(
              onTap: () {
                if (null != data.artistName) {
                  widget._function(data);
                }
              },
              child: _buildSongItem(data),
            );
          },
        ),
      ]),
    );
  }
}
