import 'package:flutter/material.dart';
import 'pagina_lista_de_chats.dart';

void main() {
  runApp(const TelaLogin());
}

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class Chat {
  final String nome;
  final Map<String, String> mensagens;

  Chat({
    required this.nome,
    required this.mensagens,
  });
}

class _TelaLoginState extends State<TelaLogin> {
  final _chaveForm = GlobalKey<FormState>();
  var _email = '';
  var _senha = '';
  var _nomeUsuario = '';
  var _modoLogin = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 37, 190, 188),
          body: Center(
            child: SingleChildScrollView(
              child: Column( 
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    width: 300,
                    height: 300,
                    child: Image.network(
                      'https://inscricaoweb.unifcv.edu.br/img/LOGO%20UNICV%20COLORIDA.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(20),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Form(
                        key: _chaveForm,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Endereço de Email',
                              ),
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              textCapitalization: TextCapitalization.none,
                              validator: (valor) {
                                if (valor == null ||
                                    valor.trim().isEmpty ||
                                    !valor.contains('@')) {
                                  return 'Por favor, insira um endereço de email válido!';
                                }
                                return null;
                              },
                              onSaved: (valorDigitado) {
                                if (valorDigitado != null) {
                                  _email = valorDigitado;
                                }
                              },
                            ),
                            TextFormField(
                              decoration:
                                  const InputDecoration(labelText: 'Senha'),
                              obscureText: true,
                              validator: (valor) {
                                if (valor == null || valor.trim().length < 6) {
                                  return 'A senha deve ter pelo menos 6 caracteres.';
                                }
                                return null;
                              },
                              onSaved: (valor) {
                                if (valor != null) {
                                  _senha = valor;
                                }
                              },
                            ),
                            if (!_modoLogin)
                              TextFormField(
                                decoration: const InputDecoration(
                                    labelText: 'Nome de Usuário'),
                                validator: (valor) {
                                  if (valor == null ||
                                      valor.trim().length < 4) {
                                    return 'O nome de usuário deve ter pelo menos 4 caracteres.';
                                  }
                                  return null;
                                },
                                onSaved: (valor) {
                                  if (valor != null) {
                                    _nomeUsuario = valor;
                                  }
                                },
                              ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (!_chaveForm.currentState!.validate()) {
                                      return;
                                    }
                                    _chaveForm.currentState!.save();

                                    try {
                                      if (_modoLogin) {
                                        //logar usuário
                                        print(
                                            'Usuário com email $_email e senha $_senha logado!');
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PaginaListaDeChats(),
                                          ),
                                        );
                                      } else {
                                        //criar usuário
                                        print(
                                            'Usuário $_nomeUsuario criado com email $_email e senha $_senha');
                                      }
                                    } catch (error) {
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: _modoLogin
                                              ? const Text('Falha no Login')
                                              : const Text(
                                                  'Falha no Registro de novo Usuário'),
                                        ),
                                      );
                                    }
                                  },
                                  child: _modoLogin
                                      ? const Text('Entrar')
                                      : const Text('Salvar'),
                                ),
                                const SizedBox(width: 12),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _modoLogin = !_modoLogin;
                                    });
                                  },
                                  child: _modoLogin
                                      ? const Text('Criar uma conta')
                                      : const Text('Já tenho uma conta'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
