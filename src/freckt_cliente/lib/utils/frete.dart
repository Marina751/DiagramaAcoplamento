import 'package:flutter/widgets.dart';
import 'package:freckt_cliente/utils/address.dart';
import 'package:freckt_cliente/utils/status_frete.dart';

class Frete {
  Address origem;
  Address destino;
  String descricao;

  /// usar classe [StatusFrete]
  int status;

  Frete({
    @required this.origem,
    @required this.destino,
    @required this.descricao,
    this.status = StatusFrete.ESPERANDO_RESPOSTA,
  });

  set setStatus(int value) => status = value;
}
