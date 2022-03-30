import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  // const DetailPage({Key? key}) : super(key: key);

  var menuItem = [
    {'gambar': 'apot.jpg', 'bahan': 'Ayam Potong', 'ukuran': '10 Potong'},
    {
      'gambar': 'kerut.jpg',
      'bahan': 'Kelapa Parut, Sangrai lalu tumbuk sampai halus',
      'ukuran': '100 Gram'
    },
    {'gambar': 'asam-kandis.jpeg', 'bahan': 'Asam Kandis', 'ukuran': '2 Butir'},
    {'gambar': 'serai.jpg', 'bahan': 'Serai', 'ukuran': '3 Batang'},
    {'gambar': 'lengkuas.jpg', 'bahan': 'Lengkuas, memarkan', 'ukuran': '3 cm'},
    {'gambar': 'daun-salam.jpeg', 'bahan': 'Daun Salam', 'ukuran': '5 Lembar'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          "Rendang",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              CupertinoIcons.ellipsis,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 38, top: 15, right: 38),
          child: Column(
            children: [
              Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('img/homePage/rendang.jpg'),
                          fit: BoxFit.cover),
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.7),
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                    ),
                  )),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Ingredients (20)',
                    style: TextStyle(
                        fontFamily: 'Arial', fontSize: 25, color: Colors.black),
                  ),
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "1 Serving",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Arial',
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: menuItem.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Container(
                            height: 75,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(15)),
                            child: ListTile(
                              leading: Image(
                                height: 50,
                                image: AssetImage(
                                  'img/homePage/${menuItem[index]["gambar"]}',
                                ),
                                width: 75,
                              ),
                              title: Text('${menuItem[index]["bahan"]}'),
                              subtitle: Text('${menuItem[index]["ukuran"]}'),
                            ),
                          ),
                        );
                      })),
              Padding(
                padding: const EdgeInsets.only(left: 50, bottom: 20, right: 50),
                child: MaterialButton(
                    height: 60,
                    // minWidth: 150,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.black,
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Mulai Memasak!!",
                          style: TextStyle(fontSize: 17),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.arrow_forward)
                      ],
                    ),
                    onPressed: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*class InggredientsItem extends StatelessWidget {
  final String img;
  final String title;
  final String subtitle;

  InggredientsItem(this.img, this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        height: 75,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          leading: Image(
            height: 50,
            image: AssetImage(
              img,
            ),
            width: 75,
          ),
          title: Text(title),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}*/
