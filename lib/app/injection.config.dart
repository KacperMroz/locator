// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../page/locator/cubit/locator_cubit.dart' as _i6;
import '../page/locator/usecase/post_location_usecase.dart' as _i5;
import '../services/location_service/location_service.dart' as _i4;
import '../services/location_service/location_service_base.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.LocationService>(() => _i4.LocationServiceImpl());
  gh.factory<_i5.PostLocationUseCase>(
      () => _i5.PostLocationUseCase(get<_i3.LocationService>()));
  gh.lazySingleton<_i6.LocatorCubit>(
      () => _i6.LocatorCubit(get<_i5.PostLocationUseCase>()));
  return get;
}
