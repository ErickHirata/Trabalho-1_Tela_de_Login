import 'package:flutter/material.dart';
import 'main.dart';
import 'pagina_lista_de_chats.dart' as chats;

class PaginaChat extends StatelessWidget {
  final chats.Chat chat;

  const PaginaChat({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chat.nome),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 43, 193, 143), // Cor de fundo da página anterior
        ),
        child: ListView(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Image.network(
                'https://inscricaoweb.unifcv.edu.br/img/LOGO%20UNICV%20COLORIDA.png',
                width: 100,
                height: 100,
              ),
            ),
            SizedBox(height: 20),
            _buildMessageTile('Olá! Bem-vindo à disciplina de ${chat.materia}!', Icons.info, chat.professor),
            _buildMessageTile('Por favor, leia atentamente o plano de ensino.', Icons.info, chat.professor),
            _buildHighlightedMessageTile('Hoje temos uma prova surpresa. Esteja preparado!', Icons.warning, chat.professor),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageTile(String message, IconData icon, String professor) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon),
              SizedBox(width: 10),
              Text(
                professor,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(message),
        ],
      ),
    );
  }

  Widget _buildHighlightedMessageTile(String message, IconData icon, String professor) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.yellow, // Cor de destaque diferente
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon),
              SizedBox(width: 10),
              Text(
                professor,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(message),
        ],
      ),
    );
  }
}
