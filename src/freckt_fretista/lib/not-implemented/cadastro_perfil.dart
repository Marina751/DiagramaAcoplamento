import 'package:flutter/material.dart';
//import 'package:freckt_fretista/templates/button_template.dart';
import 'package:freckt_fretista/utils/templates/elevated_button_template.dart';
import 'package:freckt_fretista/utils/templates/scaffold_template.dart';
import 'package:freckt_fretista/views/home_fretista.dart';
//import 'package:freckt_fretista/templates/form_field_template.dart';

class CadastroPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplate(
      title: 'Cadastrar Perfil',
      hasAlertTerms: false,
      button: ElevatedButtonTemplate(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomeFretista(),
            ),
            (route) => false,
          );
        },
        buttonText: 'Próximo',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*Expanded(
                    child: FormFieldTemplate(
                      title: 'Cidade',
                      hintText: 'Ex: Fortaleza',
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        return '';
                      },
                      onSaved: (val) {},
                    ),
                  ),
                  Expanded(
                    child: FormFieldTemplate(
                      title: 'Bairro',
                      hintText: 'Ex: Meireles',
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        return '';
                      },
                      onSaved: (val) {},
                    ),
                  ),*/
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 220, 10.0),
              child: Text('Foto de perfil:'),
            ),
            //Padding(
            //padding: EdgeInsets.all(10.0),
            //child:
            Container(
              alignment: Alignment.center,
              width: 210,
              height: 210,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.all(Radius.circular(230)),
              ),
              //child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Expanded(
                  //child:
                  InkWell(
                    child: Text(
                      'Fazer Upload',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () {},
                  ),
                  /*TextButton(
                    onPressed: () {},
                    child: Text.rich(
                      TextSpan(
                        text: 'Tirar Foto',
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  )*/
                  //),
                  //Expanded(
                  //  child: FittedBox(
                  //    fit: BoxFit.contain,
                  //    child:
                  //child:
                  Icon(
                    Icons.image_outlined,
                    size: 70.0,
                  ),
                  //  ),
                  //),
                  //Expanded(
                  //child:
                  InkWell(
                    child: Text(
                      'Fazer Upload',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () {},
                  ),
                  /*TextButton(
                    onPressed: () {},
                    child: 
                    Text.rich(
                      TextSpan(
                        text: 'Fazer Upload',
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),*/
                  //),
                ],
              ),
              //),
            ),
            //),
            SizedBox(
              height: 200,
              width: 200,
              child: Stack(
                children: [
                  //Container(
                  //child:
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text('child'),
                    radius: 100.0,
                  ),
                  //),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      //backgroundColor: Colors.white,
                      child: IconButton(
                        //color: Colors.red,
                        //iconSize: 50.0,
                        icon: Icon(Icons.edit),
                        onPressed: () {},
                      ),
                      radius: 32.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              //child: Expanded(
              child: Text(
                'Requisitos:\n\n1: A foto deve ser em local bem iluminado\n2: A foto deve mostrar seu rosto\n3: A foto não deve conter acessórios cobrindo seu rosto',
                style: TextStyle(),
              ),
            ),
            //),
          ],
        ),
      ),
    );
  }
}
