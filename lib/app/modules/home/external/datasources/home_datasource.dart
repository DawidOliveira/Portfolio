import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/app/modules/home/domain/entities/home_entity.dart';
import 'package:portfolio/app/modules/home/infra/datasources/i_home_datasource.dart';
import 'package:portfolio/app/modules/home/infra/models/home_model.dart';

class HomeDatasource implements IHomeDatasource {
  final FirebaseFirestore _firestore;

  HomeDatasource({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Future<HomeEntity> getHome() async {
    final result = await _firestore.collection('content').get();
    final data = result.docs.first.data();

    final home = HomeModel.fromMap(data);

    return home;
  }
}
