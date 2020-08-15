import 'package:athl_monitoring/app/modules/home/models/atleta_model.dart';

abstract class IAtletaRepository {
    Stream<List<AtletaModel>> get();
    Future<AtletaModel> index(AtletaModel model);
    Future save(AtletaModel atletaModel);
    Future delete(AtletaModel atletaModel);
}