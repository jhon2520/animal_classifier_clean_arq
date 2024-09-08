
import 'package:cindy/data/datasource/gemini/index.dart';
import 'package:cindy/data/repository/index.dart';
import 'package:cindy/domain/usecase/index.dart';
import 'package:cindy/presentation/state/index.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initServices() {

  getIt.registerFactory(() => HomeScreenBloc(ResponseUsecase(ResponseRespositoryImpl(ResponseDataSourceGemini()))));
}