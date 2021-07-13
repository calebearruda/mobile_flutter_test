import 'package:Flipper_Teste/datasources/flipper_api_datasource.dart';
import 'package:Flipper_Teste/models/models.dart';

abstract class IFlipperApiRepository {
  Future<WealthSummary?> findGreatherTotal();
}

class FlipperApiRepository implements IFlipperApiRepository {
  FlipperApiRepository(this.dataSource);

  final IFlipperApiDataSource dataSource;

  @override
  Future<WealthSummary?> findGreatherTotal() async {
    return await dataSource.findGreatherTotal();
  }
}
