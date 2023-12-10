import 'package:flutter/material.dart';
import 'package:gaming_review/viewmodel/firestore_service.dart';
import 'package:gaming_review/widgets/custom_tag.dart';
import 'package:gaming_review/widgets/image_container.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  static const routeName = '/article';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;

    return FutureBuilder<Map<String, dynamic>?>(
      future: FirestoreService().getArticleById(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading article'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text('Article not found'));
        } else {
          final data = snapshot.data!;
          return ImageContainer(
            width: double.infinity,
            imageUrl: data['imageUrl'],
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.white),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              extendBodyBehindAppBar: true,
              body: ListView(
                children: [
                  _ReviewHeadline(
                    data: data,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTag(
                              backgroundColor: Colors.black,
                              children: [
                                Text(
                                  data['developer'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            CustomTag(
                              backgroundColor: Colors.black,
                              children: [
                                Text(
                                  data['rating'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.white),
                                ),
                                SizedBox(width: 8,),
                                Icon(Icons.star,color: Colors.white,size: 18,)
                              ],
                            ),
                            SizedBox(width: 10,),
                             CustomTag(
                              backgroundColor: Colors.black,
                              children: [
                                Text(
                                  data['good'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.white),
                                ),
                                SizedBox(width: 10,),
                                Icon(Icons.thumb_up,color: Colors.white,size: 18,)
                              ],
                            ),
                            SizedBox(width: 10,),
                             CustomTag(
                              backgroundColor: Colors.black,
                              children: [
                                Text(
                                  data['bad'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.white),
                                ),
                                SizedBox(width: 10,),
                                Icon(Icons.thumb_down,color: Colors.white,size: 18,)
                              ],
                            ),
                          ],
                          
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          data['judul'],
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          data['detail'],
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(height: 1.5),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

class _ReviewHeadline extends StatelessWidget {
  const _ReviewHeadline({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          CustomTag(
            backgroundColor: Colors.grey.withAlpha(150),
            children: [
              Text(
                data['category'],
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          Text(
            data['release'],
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  height: 1.25,
                  color: Colors.white,
                ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

