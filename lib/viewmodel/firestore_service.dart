import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference game =
  FirebaseFirestore.instance.collection('game');

  Stream<QuerySnapshot> getGame() {
    return game.snapshots();
  }

  Stream<QuerySnapshot> getDiscoverGameByCategory(String category) {
    return game
        .where('category', isEqualTo: category)
        .snapshots();
  }

  Future<Map<String, dynamic>?> getArticleById(String id) async {
  try {
    final QuerySnapshot querySnapshot = await game
        .where('id', isEqualTo: id)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final data = querySnapshot.docs.first.data() as Map<String, dynamic>;
      data['id'] = querySnapshot.docs.first.id;
      return data;
    } else {
      return null;
    }
  } catch (e) {
    print('Error getting article by ID: $e');
    return null;
  }
  }
  Stream<QuerySnapshot> getGameNew({String? searchQuery}) {
  Query gameQuery = game;

  if (searchQuery != null && searchQuery.isNotEmpty) {
    gameQuery = gameQuery.where('id', isGreaterThanOrEqualTo: searchQuery);
  }

  final gameStream = gameQuery.snapshots();
  return gameStream;
}

 // Future<void> addusers(String gambar, String genre, String nama, String tahun) async {
 //   users.add({'gambar': gambar, 'genre': genre, 'nama': nama, 'tahun': tahun});
 // }

 // Future<void> updateusers(String id, String genre, String nama) async {
 //   users.doc(id).update({'genre': genre, 'nama': nama});
 // }

 // Future<void> deleteusers(String id) async {
 //   users.doc(id).delete();
 // }

}