import 'package:athl_monitoring/app/modules/home/models/treino_model.dart';

abstract class ITreinoRepository {
  Future save(TreinoModel treinoModel);
}
