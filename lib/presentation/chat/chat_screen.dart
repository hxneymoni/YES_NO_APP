import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entitities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        leading: const Padding(
          padding: EdgeInsets.all(3.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/originals/ec/66/fb/ec66fbbc190ba200de624963f3fd9761.jpg'),
          ),
        ),
        title: const Text('EMO esponja'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    //Agregamos para impirmir en consola
    print('cantidad de mensajes ${chatProvider.messageList.length}');
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        //controller es un control de usuario
                        controller: chatProvider.chatScrollController,
                        //se pone la longitud de la lista que se encuentra en chatprovider
                        itemCount: chatProvider.messageList
                            .length, //cuantos elementos tiene la lista
                        itemBuilder: (context, index) {
                          //el constructor que va a tener  "como"
                          //instancia del message que sabra de quien es el mensaje
                          final message = chatProvider.messageList[index];
                          return (message.fromWho == FromWho.hers)
                              ? HerMessageBubble(
                                  message: message,
                                )
                              : MyMessageBubble(message: message);
                        })),
                //Caja de Texto de mensaje
                MessageFieldBox(onValue: chatProvider.sendMessage),
              ],
            )));
  }
}
