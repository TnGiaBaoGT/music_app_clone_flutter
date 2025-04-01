import 'package:flutter/material.dart';
import 'package:musicapp_clone/assets/app_url_covers/app_url.dart';
import 'package:musicapp_clone/domain/entities/songs/song.dart';
import 'package:musicapp_clone/domain/usescases/song/search_song.dart';
import 'package:musicapp_clone/pages/music/music_screen.dart';
import 'package:musicapp_clone/ui_components/fav_button.dart';
import '../../service_locator.dart';
import '../../ui_components/appbar_arrow.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<SongEntity> searchResults = [];
  bool isLoading = false;

  Future<void> searchSongs(String keyword) async {
    if (keyword.isEmpty) return;

    setState(() {
      isLoading = true;
    });

    print("🔍 Searching for: $keyword");
    var result = await sl<SearchSongUseCase>().call(params: keyword);

    result.fold(
          (l) {
        print("Error fetching songs: ${l.toString()}");
        setState(() {
          searchResults = [];
          isLoading = false;
        });
      },
          (r) {
        print("Found ${r.length} songs");
        setState(() {
          searchResults = r;
          isLoading = false;
        });
      },
    );
  }
  String formatDuration(double duration) {
    int minutes = duration.floor(); // Lấy phần nguyên làm phút
    int seconds = ((duration - minutes) * 100).round(); // Giữ nguyên phần thập phân làm giây

    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: size.height * 0.12),
              TextField(
                onChanged: (value) {
                  searchSongs(value);
                },
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search songs...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : searchResults.isEmpty
                    ? const Center(child: Text("Search for songs"))
                    : ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    final dataSong = searchResults[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder:
                        (context) => MusicScreen(songEntity: dataSong)));
                      },
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            '${AppUrl.firestorage}${dataSong.artist} - ${dataSong.title}.jpg?${AppUrl.format}'
                          ),
                        ),
                        title: Text(dataSong.title,style: const TextStyle(fontWeight: FontWeight.bold),),
                        subtitle: Text(dataSong.artist,style: const TextStyle(fontWeight: FontWeight.w500),),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min, // Để tránh lỗi bố cục , thu nhỏ lại chỉ vừa đủ để chứa các phần tử bên trong.
                          children: [
                            Text(formatDuration(dataSong.duration.toDouble()),
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),),
                            const SizedBox(width: 15),
                            FavButton(data: dataSong),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: BaiscAppbar(title: "Search"),
          ),
        ],
      ),
    );
  }
}
