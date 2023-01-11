import 'package:weather_app/domain/entity/location_dto.dart';

import '../models/location/location.dart';

class LocationToLocationDtoMapper {
  static LocationDto mapToDto(Location model) {
    return LocationDto(name: model.name);
  }
}
