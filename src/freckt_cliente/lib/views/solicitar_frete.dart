import 'package:flutter/material.dart';
import 'package:freckt_cliente/utils/address.dart';
import 'package:freckt_cliente/utils/frete.dart';
import 'package:freckt_cliente/views/load_fretistas.dart';

class SolicitarFrete extends StatefulWidget {
  @override
  _SolicitarFreteState createState() => _SolicitarFreteState();
}

class _SolicitarFreteState extends State<SolicitarFrete> {
  void makeFrete() {
    Frete frete = new Frete(
      origem: new Address(
        municipio: 'Fortaleza',
        uf: 'CE',
        bairro: 'Benfica',
        rua: 'Av. 13 de maio',
        numero: '2013',
        cep: '99999999',
      ),
      destino: new Address(
        municipio: 'Maracanaú',
        uf: 'CE',
        bairro: 'Centro',
        rua: 'Rua x',
        numero: '12',
        cep: '88888888',
      ),
      descricao: 'Descrição da carga',
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoadFretistas(frete: frete),
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
        title: Text('Solicitando frete'),
      ),
      body: Container(
        color: Colors.black12,
        child: Center(
          child: ElevatedButton(
            onPressed: makeFrete,
            child: Text('Selecionar fretistas'),
          ),
        ),
      ),
    );
  }
}
