//El modelo define qué datos debe contener la aplicación

import 'package:yes_no_app/domain/entitities/message.dart';

class YesNoModel {
  //Atributos de la clase
  final String answer;
  final bool forced;
  final String image;

//Constructor con los atributos
  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

//El factory  sirve para crea una nueva instancia
  factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  //Crear uan isntancia de "Message" desde el modelo
  Message toMessageEntity() =>
      //Condicional para darle el valor al mensaje
      Message(
          text: answer == 'yes'
              ? 'Sí'
              : answer == 'no'
                  ? 'No'
                  : 'Quizá',
          fromWho: FromWho.hers,
          imageUrl: image,
          sentTime: DateTime.now());
}
