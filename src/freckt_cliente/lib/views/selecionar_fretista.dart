import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:freckt_cliente/utils/enums/tipo_frete.dart';
import 'package:freckt_cliente/utils/frete.dart';
import 'package:freckt_cliente/utils/fretista.dart';
import 'package:freckt_cliente/utils/templates/avatar_template.dart';
import 'package:freckt_cliente/views/resumo_solicitacao.dart';

class ItemFretista {
  final Fretista fretista;
  bool isExpanded;

  ItemFretista({@required this.fretista, this.isExpanded = false});
}

class SelecionarFretista extends StatefulWidget {
  final Frete frete;
  final List<Fretista> fretistas;

  SelecionarFretista({@required this.frete, @required this.fretistas});

  @override
  _SelecionarFretistaState createState() => _SelecionarFretistaState(
        fretistas.map(
          (Fretista fretista) {
            return ItemFretista(fretista: fretista);
          },
        ).toList(),
      );
}

class _SelecionarFretistaState extends State<SelecionarFretista> {
  List<ItemFretista> data;

  _SelecionarFretistaState(this.data);

  Widget itemHeader(Fretista fretista, bool isExpanded) {
    return Container(
      child: Row(
        children: <Widget>[
          AvatarTemplate(url: fretista.photoUrl),
          Flexible(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(fretista.name),
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                  ),
                  Container(
                    child: Text(fretista.municipio),
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                  ),
                  Container(
                    child: RatingBarIndicator(
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                      ),
                      itemSize: 20.0,
                      rating: fretista.rating,
                    ),
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 10.0),
                  ),
                  Container(
                    child: Text(
                      '${fretista.marca} ${fretista.cor}\nCapacidade para ${fretista.capacidade}kg',
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5.0),
                  ),
                  Container(
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResumoSolicitacao(
                                frete: widget.frete,
                                fretista: fretista,
                                tipoFrete: TipoFrete.SOLICITACAO,
                              ),
                            ),
                          );
                        },
                        child: Text('Selecionar este'),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff13786C),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.all(5.0),
    );
  }

  Widget itemBody(Fretista fretista) {
    return Container(
      child: Container(
              child: Column(
                children: <Widget>[ 
                ],
              ),
              //margin: EdgeInsets.only(left: 10.0),
              padding: EdgeInsets.all(10.0),
            ),
    );
  }
//coloco as informaçoes do fretista ali na linha do body: SingleChildScrollView ou é pra mudar aqui na _buildListFretistas. 
// help, please TT ?
  Widget _buildListFretistas() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          data[index].isExpanded = !isExpanded;
        });
      },
      children: data.map<ExpansionPanel>((ItemFretista item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return itemHeader(item.fretista, isExpanded);
          },
          body: itemBody(item.fretista),
          isExpanded: false,
        );
      }).toList(),
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
        title: Text('Selecionar fretista'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: _buildListFretistas(),
        ),
      ),
    );
  }
}
