import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gaming_review/view/article_screen.dart';
import 'package:gaming_review/viewmodel/firestore_service.dart';
import 'package:gaming_review/widgets/image_container.dart';
import 'package:gaming_review/widgets/bottom_navbar.dart';

class discover extends StatefulWidget {
  const discover({Key? key}) : super(key: key);

  static const routeName = '/search';

  @override
  State<discover> createState() => _discoverState();
}

class _discoverState extends State<discover> {
  @override
  Widget build(BuildContext context) {
    List<String> tabs = ['Action', 'Racing', 'OpenWorld', 'Rpg', 'Tactikal'];

    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavbar(index: 1),
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            const _DiscoverGame(),
            _CategoryGame(tabs: tabs),
          ],
        ),
      ),
    );
  }
}

class _CategoryGame extends StatelessWidget {
  const _CategoryGame({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirestoreService().getGame(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          List<QueryDocumentSnapshot> dataList = snapshot.data!.docs;
          return Column(
            children: [
              TabBar(
                isScrollable: true,
                indicatorColor: Colors.black,
                tabs: tabs
                    .map(
                      (tab) => Tab(
                        icon: Text(
                          tab,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                  children: tabs
                      .map(
                        (tab) => ListView.builder(
                          shrinkWrap: true,
                          itemCount: dataList.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot documentSnapshot = dataList[index];
                            Map<String, dynamic> data =
                                documentSnapshot.data() as Map<String, dynamic>;

                            if (data['category'] == tab) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    ArticleScreen.routeName,
                                    arguments: data['id'],
                                  );
                                },
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 16,
                                    ),
                                    //Gambar
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                        height: 200,
                                        child: Image.network(
                                          data['imageUrl'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 7,),
                                    // Dev & Release Date
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          data['judul'],
                                          maxLines: 2,
                                          overflow: TextOverflow.clip,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          ' ${data['developer']}',
                                          maxLines: 2,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!,
                                        ),
                                        Text(
                                          'Released ${data['release']}',
                                          maxLines: 2,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                // Row(
                                //   children: [
                                //     ImageContainer(
                                //       width: 80,
                                //       height: 80,
                                //       margin: const EdgeInsets.all(10.0),
                                //       borderRadius: 5,
                                //       imageUrl: data['imageUrl'],
                                //     ),
                                //     Expanded(
                                //       child: Column(
                                //         crossAxisAlignment:
                                //             CrossAxisAlignment.start,
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.center,
                                //         children: [
                                //           Text(
                                //             data['judul'],
                                //             maxLines: 2,
                                //             overflow: TextOverflow.clip,
                                //             style: Theme.of(context)
                                //                 .textTheme
                                //                 .bodyLarge!
                                //                 .copyWith(
                                //                     fontWeight:
                                //                         FontWeight.bold),
                                //           ),
                                //           const SizedBox(
                                //             height: 10,
                                //           ),
                                //           Text(
                                //             ' ${data['developer']}',
                                //             maxLines: 2,
                                //             style: Theme.of(context)
                                //                 .textTheme
                                //                 .bodySmall!,
                                //           ),
                                //           const SizedBox(
                                //             height: 10,
                                //           ),
                                //           Text(
                                //             'Released ${data['release']}',
                                //             maxLines: 2,
                                //             style: Theme.of(context)
                                //                 .textTheme
                                //                 .bodySmall!,
                                //           )
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              );
                            } else {
                              // Return an empty container if the category doesn't match
                              return Container();
                            }
                          },
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          );
        }
      },
    );
  }
}

class _DiscoverGame extends StatefulWidget {
  const _DiscoverGame({
    Key? key,
  }) : super(key: key);

  @override
  State<_DiscoverGame> createState() => _DiscoverGameState();
}

class _DiscoverGameState extends State<_DiscoverGame> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'GAMING',
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text('NEWS', style: Theme.of(context).textTheme.bodySmall),
        SizedBox(
          height: 15,
        ),
        TextFormField(
          controller: _searchController,
          onChanged: (value) {
            setState(() {});
          },
          decoration: InputDecoration(
              hintText: 'Search',
              fillColor: Colors.grey.shade200,
              filled: true,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              suffixIcon: const RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  Icons.tune,
                  color: Colors.grey,
                ),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none)),
        ),
        const SizedBox(height: 20),
        _searchController.text.isNotEmpty
            ? StreamBuilder<QuerySnapshot>(
                stream: FirestoreService()
                    .getGameNew(searchQuery: _searchController.text),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else {
                    List<QueryDocumentSnapshot> dataList = snapshot.data!.docs;
                    return Column(
                      children: dataList
                          .where((data) => data['id']
                              .toLowerCase()
                              .contains(_searchController.text.toLowerCase()))
                          .map(
                            (data) => InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  ArticleScreen.routeName,
                                  arguments: data['id'],
                                );
                              },
                              child: Row(
                                children: [
                                  ImageContainer(
                                    width: 80,
                                    height: 80,
                                    margin: const EdgeInsets.all(10.0),
                                    borderRadius: 5,
                                    imageUrl: data['imageUrl'],
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          data['judul'],
                                          maxLines: 2,
                                          overflow: TextOverflow.clip,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    );
                  }
                },
              )
            : const SizedBox(), // Show an empty container when the search query is empty
      ],
    );
  }
}
