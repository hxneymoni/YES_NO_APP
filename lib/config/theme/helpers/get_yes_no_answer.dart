import 'package:dio/dio.dart';
import 'package:yes_no_app/config/theme/infraestructure/yes_no_model.dart';
import 'package:yes_no_app/domain/entitities/message.dart';

class GetYesNoAnswer {
  final _dio = Dio();
  Future<Message> getAnswer() async {
    final response = await _dio.get('http://yesno.wtf/api');
    final yesNoModel = YesNoModel.fromJson(response.data);
    return yesNoModel.toMessageEntity();
  }
}
