import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freckt_fretista/models/fretista.model.dart';
import 'package:freckt_fretista/utils/consts.dart';
import 'package:freckt_fretista/utils/status_frete.dart';
import 'package:freckt_fretista/utils/templates/avatar_template.dart';
import 'package:freckt_fretista/views/loading.dart';
import 'package:freckt_fretista/views/solicitacao.dart';
import 'package:freckt_fretista/views/something_went_wrong.dart';

class Solicitacoes extends StatefulWidget {
  @override
  _SolicitacoesState createState() => _SolicitacoesState();
}

class _SolicitacoesState extends State<Solicitacoes> {
  final model = FretistaModel();
  final ScrollController listScrollController = ScrollController();
  final solicitacoes = FirebaseFirestore.instance.collection('solicitacoes');

  Widget noRequests() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Bem-vindo ao Freckt.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              TextSpan(
                text:
                    '\nQuando você tiver solicitações de fretes, elas aparecerão aqui.\n\nPara mais detalhes sobre este app, acesse a ',
              ),
              TextSpan(
                text: 'ajuda.',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
          textAlign: TextAlign.center,
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
        text = 'Esperando uma resposta sua';
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

  Widget itemSolicitacao(DocumentSnapshot documentSnapshot) {
    final data = documentSnapshot.data();
    final Timestamp timestamp = data['timestamp'];
    final String dateTime = formatDateTime(timestamp.toDate());

    return Container(
      child: FlatButton(
        child: Row(
          children: <Widget>[
            AvatarTemplate(url: data['clientePhotoUrl']),
            Flexible(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        data['clienteName'],
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Solicitacao(document: documentSnapshot),
            ),
          );
        },
        padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Consts.greyColor2,
      ),
      margin: EdgeInsets.all(5.0),
    );
  }

  Widget loadSolicitacoes() {
    return StreamBuilder(
      stream: solicitacoes
          .where('fretistaId', isEqualTo: model.getUserId)
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
            itemBuilder: (context, index) => itemSolicitacao(
              snapshot.data.docs[index],
            ),
            itemCount: snapshot.data.docs.length,
            controller: listScrollController,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) => loadSolicitacoes();
}
