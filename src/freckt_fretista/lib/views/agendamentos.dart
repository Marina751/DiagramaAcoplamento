import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:freckt_fretista/utils/consts.dart';
import 'package:freckt_fretista/utils/templates/submenu_scaffold_template.dart';

class Agendamentos extends StatelessWidget {
  static const String _title = 'Agendamentos';

  Text textWithColorTheme(String string) {
    return new Text(
      string,
      style: TextStyle(
        color: Consts.frecktThemeColor,
        fontSize: 30.0,
      ),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SubmenuScaffoldTemplate(
      title: _title,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child:
                    textWithColorTheme('Você não possui nenhum agendamento\n:(')

                /*Text(
                'Você não possui nenhum agendamento\n:(',
                style: TextStyle(
                  //color: Colors.black,
                  fontSize: 30.0,
                  //backgroundColor: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),*/
                ),
          ],
        ),
      ),
    );
  }
}
