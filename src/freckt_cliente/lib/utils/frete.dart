import 'package:flutter/widgets.dart';
import 'package:freckt_cliente/utils/address.dart';
import 'package:freckt_cliente/utils/enums/status_frete.dart';

class Frete {
  Address origem;
  Address destino;
  String descricao;
  StatusFrete status;

  Frete({
    @required this.origem,
    @required this.destino,
    @required this.descricao,
  });

  set setStatus(StatusFrete value) => status = value;
}
