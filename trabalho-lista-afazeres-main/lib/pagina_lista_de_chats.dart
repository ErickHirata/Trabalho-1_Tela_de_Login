import 'package:flutter/material.dart';
import 'paginachat.dart'; // Importe a tela de chat

class PaginaListaDeChats extends StatefulWidget {
  const PaginaListaDeChats({Key? key}) : super(key: key);

  @override
  State<PaginaListaDeChats> createState() => _PaginaListaDeChatsState();
}

class _PaginaListaDeChatsState extends State<PaginaListaDeChats> {
  final List<Chat> listaChats = [];

  @override
  void initState() {
    super.initState();
    adicionaNovoChat();
  }

  void adicionaNovoChat() {
    listaChats.add(
      Chat(
        nome: '5º Engenharia de Software',
        professor: 'Prof. Steve Jobs',
        materia: 'Estatística e Probabilidade',
        mensagens: {'conteudo': 'Estatística e Probabilidade'},
      ),
    );
    listaChats.add(
      Chat(
        nome: '5º Análise e Desenvolvimento de Sistemas',
        professor: 'Prof. Charlotte EverGreen',
        materia: 'Física Quântica',
        mensagens: {'conteudo': 'Física Quântica'},
      ),
    );
    listaChats.add(
      Chat(
        nome: '5º Engenharia De Pesca',
        professor: 'Prof. Odair Vandimiru Alencar',
        materia: 'Flutter e seus Paranaues',
        mensagens: {'conteudo': 'Flutter e seus Paranaues'},
      ),
    );
    listaChats.add(
      Chat(
        nome: '5º Gastronomia Molecular',
        professor: 'Soma Yukihira',
        materia: 'Como Explodir Um Ovo com Nitrogênio',
        mensagens: {'conteudo': 'Como Explodir Um Ovo com Nitrogênio'},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 43, 193, 143),
      appBar: AppBar(
        title: Text(
          'Turmas',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Image.network(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDsHjW7r30EC1tGrLCMUiYTfLbq89PifOztgMLrox5uA&s',
          width: 40, // Tamanho da imagem
          height: 40,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context); // Voltar para a página anterior
            },
            icon: Icon(Icons.logout), // Ícone para o botão
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 40),
          itemCount: listaChats.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  // Redirecionar o usuário para tela de chat quando uma turma for clicada
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaginaChat(chat: listaChats[index]),
                    ),
                  );
                },
                onHover: (value) {
                  setState(() {
                    listaChats[index].isHovered = value;
                  });
                },
                child: ListTile(
                  contentPadding: const EdgeInsets.all(8),
                  title: Text(
                    listaChats[index].nome,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: listaChats[index].isHovered ? Colors.blue : Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    'Prof: ${listaChats[index].professor}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: listaChats[index].isHovered ? Colors.blue : Colors.black,
                    ),
                  ),
                  leading: SizedBox(
                    width: 40, // Tamanho da imagem
                    height: 40,
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDsHjW7r30EC1tGrLCMUiYTfLbq89PifOztgMLrox5uA&s',
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Chat {
  final String nome;
  final String professor;
  final String materia;
  final Map<String, String> mensagens;
  bool isHovered;

  Chat({
    required this.nome,
    required this.professor,
    required this.materia,
    required this.mensagens,
    this.isHovered = false,
  });
}
