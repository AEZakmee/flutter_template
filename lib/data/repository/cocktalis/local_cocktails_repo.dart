import '../../../domain/model/cocktail/cocktail_list.dart';
import '../../../domain/model/handler/data_response.dart';
import '../../source/assets/cocktails/cocktails_asset_client.dart';
import 'cocktails_repo.dart';
import 'mappers/cocktails_mapper.dart';

class LocalCocktailsRepository implements CocktailsRepository {
  LocalCocktailsRepository({
    required CocktailsAssetClient cocktailsAssetClient,
  }) : _cocktailsAssetClient = cocktailsAssetClient;

  final CocktailsAssetClient _cocktailsAssetClient;

  @override
  Future<DataResponse<CocktailList>> fetchAllCocktails() async {
    final cocktails = await _cocktailsAssetClient.fetchAll();
    return DataResponse(data: cocktails.toDomain());
  }
}
