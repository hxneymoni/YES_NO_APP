import 'package:flutter/material.dart';
import 'package:yes_no_app/config/theme/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entitities/message.dart';

class ChatProvider extends ChangeNotifier {
  //controlador para manejar la posicion del scroll
  final ScrollController chatScrollController = ScrollController();
  //Instancia de la clase Get
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'hi', fromWho: FromWho.me, sentTime: DateTime.now()),
    Message(text: 'hola', fromWho: FromWho.me, sentTime: DateTime.now()),
  ];

  //Método para enviar mensaje
  Future<void> sendMessage(String text) async {
    //Evitar el mensaje vacío
    if (text.isEmpty) return;
    // Capturar la hora actual
    final currentTime = DateTime.now();
    //el mensaje siempre va a ser"me" (mio)por que yo
    //el usuario ,siempre sera el que envie el mensaje
    final newMessage = Message(
      text: text,
      fromWho: FromWho.me,
      sentTime: currentTime,
    );
    //Agregar un mensaje a ala lista
    messageList.add(newMessage);
    //Detecta si el usuario hixo una pregunta para desencadenar la respuesta "ella"
    if (text.endsWith('?')) {
      herReply();
    }

    //Notificar si algo de provider cambió para que se guarde en el estADO
    notifyListeners();
    Future<void> moveScrolltoBottom() async {
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

//creara la respuesta de "ella"
  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    //Añadir en la lista de mensajes
    messageList.add(herMessage);
    //notificar si algo cambió para que se guarde en el estado
    notifyListeners();
    //Mueve el scroll hasta el ultimo mensaje recibido
    moveScrollToBottom();
  }

//MaxScrollExtent determina lo maximo que ele Scroll pueda
  moveScrollToBottom() {
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
