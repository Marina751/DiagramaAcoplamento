import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freckt_cliente/models/cliente.model.dart';
import 'package:freckt_cliente/utils/address.dart';
import 'package:freckt_cliente/utils/enums/tipo_frete.dart';
import 'package:freckt_cliente/utils/frete.dart';
import 'package:freckt_cliente/utils/fretista.dart';
import 'package:freckt_cliente/utils/route_name.dart';
import 'package:freckt_cliente/utils/templates/avatar_template.dart';
import 'package:freckt_cliente/utils/templates/elevated_button_template.dart';
import 'package:freckt_cliente/views/fretes.dart';

class ResumoSolicitacao extends StatefulWidget {
  final TipoFrete tipoFrete;
  final Frete frete;
  final Fretista fretista;

  ResumoSolicitacao({
    @required this.frete,
    @required this.fretista,
    @required this.tipoFrete,
  });

  @override
  _ResumoSolicitacaoState createState() => _ResumoSolicitacaoState();
}

class _ResumoSolicitacaoState extends State<ResumoSolicitacao> {
  final model = ClienteModel();
  bool _isLoading = false;

  Future<void> _showDialog() async {
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Solicitação enviada'),
          content: Text('Agora é só esperar uma resposta do fretista'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Fretes(),
                  ),
                  //ModalRoute.withName('/'),
                  (route) {
                    String routeName = route.settings.name;
                    return (routeName == RouteName.ROOT ||
                        routeName == RouteName.GET_USER_DATA ||
                        routeName == RouteName.HOME);
                  },
                );
              },
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  void enviar() async {
    setState(() {
      _isLoading = true;
    });

    final collection = widget.tipoFrete == TipoFrete.SOLICITACAO
        ? 'solicitacoes'
        : 'agendamentos';
    final aux = DateTime.now().millisecondsSinceEpoch.toString();
    final doc = '${model.getUserId}-$aux';
    final timestamp = FieldValue.serverTimestamp();

    await FirebaseFirestore.instance.collection(collection).doc(doc).set({
      'fretistaId': widget.fretista.id,
      'fretistaPhotoUrl': widget.fretista.photoUrl,
      'fretistaName': widget.fretista.name,
      'preco': '150,00',
      'status': widget.frete.status,
      'origemMunicipio': widget.frete.origem.municipio,
      'origemUf': widget.frete.origem.uf,
      'origemBairro': widget.frete.origem.bairro,
      'origemRua': widget.frete.origem.rua,
      'origemNumero': widget.frete.origem.numero,
      'origemCep': widget.frete.origem.cep,
      'destinoMunicipio': widget.frete.destino.municipio,
      'destinoUf': widget.frete.destino.uf,
      'destinoBairro': widget.frete.destino.bairro,
      'destinoRua': widget.frete.destino.rua,
      'destinoNumero': widget.frete.destino.numero,
      'destinoCep': widget.frete.destino.cep,
      'descricao': widget.frete.descricao,
      'clienteName': model.getUserName,
      'clientePhotoUrl': model.getPhotoUrl,
      'clienteId': model.getUserId,
      'timestamp': timestamp,
    });

    await _showDialog();
  }

  Widget formatFretista() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ListTile(
        leading: AvatarTemplate(url: widget.fretista.photoUrl),
        title: Text('Fretista'),
        subtitle: Text(
          '${widget.fretista.name} - ${widget.fretista.marca} ${widget.fretista.cor} com capacidade para ${widget.fretista.capacidade}kg',
        ),
      ),
    );
  }

  Widget formatAddress(Address address, bool partida) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: ListTile(
        leading: partida
            ? Icon(Icons.radio_button_unchecked_rounded)
            : Icon(Icons.location_on_outlined),
        title: Text(partida ? 'Local de partida' : 'Destino'),
        subtitle: Text(
          '${address.rua}, n° ${address.numero} - ${address.bairro}, ${address.municipio} - ${address.uf}, ${address.cep}.',
        ),
      ),
    );
  }

  Widget formatDescricao() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: ListTile(
        leading: Icon(Icons.description),
        title: Text('Descrição da carga'),
        subtitle: Text(widget.frete.descricao),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff20B8A6),
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Sua solicitação'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              formatFretista(),
              Divider(),
              formatAddress(widget.frete.origem, true),
              formatAddress(widget.frete.destino, false),
              Divider(),
              formatDescricao(),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButtonTemplate(
        onPressed: _isLoading ? null : enviar,
        buttonText: 'Enviar',
        color: Color(0xff13786C),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
