import 'package:weather_app/domain/entity/condition/condition_dto.dart';

import '../models/condition.dart';

//Маппер (конверт состояния из слоя data в объект domain )
class ConditionToConditionDtoMapper {
  static ConditionDto mapToDto(Condition model) {
    return ConditionDto(text: model.text, icon: model.icon);
  }
}
