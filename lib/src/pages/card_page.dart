import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) { //construimos page Cards
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
        ],
      ),

    );
  }

  Widget _cardTipo1(){
    return Card(
      elevation: 10.0, //sombra atras de la card
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular( 10.0 )), //bordes para tarjetas
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon( Icons.photo_album, color: Colors.blue ),
            title: Text('Soy el titulo de esta atrjeta'),
            subtitle: Text('Soy el titulo de esta atrjeta que quiero mostrarles fdfn dfpg fjgfjnl gfjñjñj'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,//alineacion al final
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: (){},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: (){},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
      
    final card = Container(
      //clipBehavior: Clip.antiAlias,

      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://i.pinimg.com/originals/fa/42/8e/fa428e7aee8d65bbe3ed9f8dd049eb52.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            height: 250.0,
            fit: BoxFit.cover,
          ),
          /*Image(
            image: NetworkImage('https://www.goodfreephotos.com/albums/other-landscapes/landscape-with-large-tree-in-the-middle.jpg'),
          ),*/
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('No tengo idea de que poner'),
          )
          
        ],
      )
    );


    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 3.0,
            offset: Offset(2.0, 2.0),
          )
        ]
      ),
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}