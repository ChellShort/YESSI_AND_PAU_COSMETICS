import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yessi_pau/widgets/cart.dart';
import 'drawer_header.dart';
import 'package:yessi_pau/utils/drawer_elements.dart';

class DrawerCustom extends StatelessWidget {
  final void Function(int) cIndex; //Funcion que se encarga de cambiar el index del drawer
  const DrawerCustom({super.key, required this.cIndex});

  @override
  Widget build(BuildContext context) {

    List<Items> itemsList = DrawerItems().items;

    return Drawer(
      backgroundColor: const Color.fromARGB(255, 255, 202, 205),
      child: ListView(
        children: <Widget>[
          const Center(child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('YESSI & PAU', style: TextStyle(fontSize: 30),),
          )),
          const DrawerHeaderCustom(),
          ListView(
            //Esto hace que no de el error ese rojo que tanto odio
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            //Esto hace que no de el error ese rojo que tanto odio
            
            children: <Widget>[
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(), //Esto evita que no se pueda hacer sroll en el drawer
                shrinkWrap: true,//No entiendo bien esto, pero es importante
                itemCount: itemsList.length, //Cantidad de veces que reproduce la informacion
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: ImageIcon(AssetImage(itemsList[i].icon), size:40),
                    title: Text(itemsList[i].title),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    subtitle: Text(itemsList[i].subtitle),
                    onTap: () { //Al dar tap en n elemento se cambio al mismo tiempo el valor de la variable index en el landing_page
                      cIndex(i);
                      Navigator.pop(context);
                    },
                  );
                }
              ),      
              
            ],
            
          ),
          const SizedBox(height: 100),
          BottomAppBar(
            child: IconButton(onPressed: (){
                Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => cartScreen(),
                        ),
                      );
              }, icon: const Icon(Icons.shopping_cart)),
          )
        ],
      ),
    );
  }
}
