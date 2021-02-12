import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:freckt_cliente/models/cliente.model.dart';
import 'package:freckt_cliente/utils/consts.dart';
import 'package:freckt_cliente/utils/status_frete.dart';
import 'package:freckt_cliente/utils/templates/avatar_template.dart';
import 'package:freckt_cliente/views/chat.dart';
import 'package:freckt_cliente/views/loading.dart';
import 'package:freckt_cliente/views/solicitar_frete.dart';
import 'package:freckt_cliente/views/something_went_wrong.dart';

class Fretes extends StatefulWidget {
  @override
  _FretesState createState() => _FretesState();
}

class _FretesState extends State<Fretes> {
  final model = ClienteModel();
  final ScrollController listScrollController = ScrollController();

  Widget formatAddress({
    @required String rua,
    @required String numero,
    @required String bairro,
    @required String municipio,
    @required String uf,
    @required String cep,
    @required bool isPartida,
  }) {
    return Container(
      //padding: EdgeInsets.all(20.0),
      child: ListTile(
        leading: isPartida
            ? Icon(Icons.radio_button_unchecked_rounded)
            : Icon(Icons.location_on_outlined),
        title: Text(isPartida ? 'Local de partida' : 'Destino'),
        subtitle: Text(
          '$rua, n° $numero - $bairro, $municipio - $uf, $cep.',
        ),
      ),
    );
  }

  Widget formatDescricao({@required String descricao}) {
    return Container(
      //padding: EdgeInsets.all(20.0),
      child: ListTile(
        leading: Icon(Icons.description),
        title: Text('Descrição da carga'),
        subtitle: Text(descricao),
      ),
    );
  }

  Future<void> _showDialog(Map<String, dynamic> data, bool canCancel) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: Text('Detalhes do frete', textAlign: TextAlign.center),
          content: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  formatAddress(
                    rua: data['origemRua'],
                    numero: data['origemNumero'],
                    bairro: data['origemBairro'],
                    municipio: data['origemMunicipio'],
                    uf: data['origemUf'],
                    cep: data['origemCep'],
                    isPartida: true,
                  ),
                  formatAddress(
                    rua: data['destinoRua'],
                    numero: data['destinoNumero'],
                    bairro: data['destinoBairro'],
                    municipio: data['destinoMunicipio'],
                    uf: data['destinoUf'],
                    cep: data['destinoCep'],
                    isPartida: false,
                  ),
                  Divider(),
                  formatDescricao(descricao: data['descricao']),
                  Divider(),
                  canCancel
                      ? ElevatedButton(
                          onPressed: () {},
                          child: Text('Cancelar frete'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                        )
                      : data['status'] == StatusFrete.REJEITADO
                          ? Text(
                              'Segundo o fretista, o motivo de não ter aceitado sua solicitação foi:\n\n"${data['motivo']}"',
                            )
                          : Container(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Ok'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget noRequests() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('Você ainda não fez solicitações de frete.'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SolicitarFrete(),
                  ),
                );
              },
              child: Text('Solicitar frete'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xff13786C),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _twoDigits(int n) => (n < 10 ? '0$n' : '$n');

  bool _isToday({
    @required int day,
    @required int month,
    @required int year,
  }) {
    final today = DateTime.now();

    return (day == today.day && month == today.month && year == today.year);
  }

  String formatDateTime(DateTime dateTime) {
    int y = dateTime.year;
    int m = dateTime.month;
    int d = dateTime.day;
    String h = _twoDigits(dateTime.hour);
    String min = _twoDigits(dateTime.minute);

    String date = _isToday(day: d, month: m, year: y)
        ? 'Hoje'
        : '${_twoDigits(d)}-${_twoDigits(m)}-$y';

    return '$date $h:$min';
  }

  Text statusFrete(int status) {
    Color textColor = Colors.black;
    String text = 'Situação do frete';

    switch (status) {
      case StatusFrete.REJEITADO:
        textColor = Colors.red;
        text = 'Frete rejeitado';
        break;
      case StatusFrete.CANCELADO:
        textColor = Colors.red;
        text = 'Frete cancelado';
        break;
      case StatusFrete.ESPERANDO_RESPOSTA:
        textColor = Colors.orange;
        text = 'Esperando resposta do fretista';
        break;
      case StatusFrete.EM_ANDAMENTO:
        textColor = Colors.green;
        text = 'Frete em andamento';
        break;
      case StatusFrete.CONCLUIDO:
        textColor = Colors.green;
        text = 'Frete concluído';
        break;
      default:
        break;
    }

    return Text(text, style: TextStyle(color: textColor));
  }

  Widget freteAceito({
    @required String fretistaId,
    @required String fretistaPhotoUrl,
    @required String fretistaName,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Entre em contato com o fretista para prosseguir.',
            //textAlign: TextAlign.center,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Chat(
                    fretistaId: fretistaId,
                    fretistaPhotoUrl: fretistaPhotoUrl,
                    fretistaName: fretistaName),
              ),
            );
          },
          child: Text('Enviar mensagem'),
          style: ElevatedButton.styleFrom(
            primary: Color(0xff13786C),
          ),
        ),
      ],
    );
  }

  Widget bottomItem(Map<String, dynamic> data) {
    int status = data['status'];
    bool canCancel = (status == StatusFrete.ESPERANDO_RESPOSTA ||
        status == StatusFrete.EM_ANDAMENTO);

    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            status == StatusFrete.EM_ANDAMENTO
                ? freteAceito(
                    fretistaId: data['fretistaId'],
                    fretistaName: data['fretistaName'],
                    fretistaPhotoUrl: data['fretistaPhotoUrl'],
                  )
                : Container(),
            TextButton(
              onPressed: () async {
                await _showDialog(data, canCancel);
              },
              child: Text('Mais detalhes'),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemFrete(Map<String, dynamic> data) {
    Timestamp timestamp = data['timestamp'];
    String dateTime = formatDateTime(timestamp.toDate());

    return Container(
      child: Column(
        children: [
          Row(
            children: <Widget>[
              AvatarTemplate(url: data['fretistaPhotoUrl']),
              Flexible(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          data['fretistaName'],
                          //style: TextStyle(color: Consts.frecktThemeColor),
                        ),
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                      ),
                      Container(
                        child: Text(
                          dateTime,
                          //style: TextStyle(color: primaryColor),
                        ),
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                      ),
                      Container(
                        child: statusFrete(data['status']),
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(left: 20.0),
                ),
              ),
            ],
          ),
          bottomItem(data),
        ],
      ),
      //onPressed: () {},
      //),
      padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
      decoration: BoxDecoration(
        color: Consts.greyColor2,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        //RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      margin: EdgeInsets.all(5.0),
    );
  }

  Widget loadFretes() {
    final solicitacoes = FirebaseFirestore.instance.collection('solicitacoes');

    return StreamBuilder(
      stream: solicitacoes
          .where('clienteId', isEqualTo: model.getUserId)
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return SomethingWentWrong(snapshot.error.toString());
        }

        if (!snapshot.hasData) {
          return Loading();
        } else {
          if (snapshot.data.docs.isEmpty) {
            return noRequests();
          }
          return ListView.builder(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 50.0),
            itemBuilder: (context, index) =>
                itemFrete(snapshot.data.docs[index].data()),
            itemCount: snapshot.data.docs.length,
            controller: listScrollController,
          );
        }
      },
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
        title: Text('Seus fretes'),
      ),
      body: loadFretes(),
    );
  }
}
