import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';

import 'products_module.dart';

class ProductsHomeView extends StatefulWidget {
  const ProductsHomeView({Key? key}) : super(key: key);

  @override
  State<ProductsHomeView> createState() => _ProductsHomeViewState();
}

class _ProductsHomeViewState extends State<ProductsHomeView> {
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllProducts();
  
  }

  @override
  
  
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Flex Mart"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: FutureBuilder(future: getAllProducts(),
        builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(itemBuilder: ((conext, index) {
            return Card(
              child: Column(children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(snapshot.data[].))
                  ),
                )
              ]),
            );
          }));
        }
      })),
    );
  }

  Future<List<ProductsModule>> getAllProducts() async {
    final response =
        await get(Uri.parse("https://api.escuelajs.co/api/v1/products"));
    if (response.statusCode == 200) {
      return productsModuleFromJson(response.body);
    } else {
      throw {Exception("Lost Connection to Server")};
    }
  }
}
