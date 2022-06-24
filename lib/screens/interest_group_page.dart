import 'package:flutter/material.dart';
import 'package:silverkakis1/reusable_widgets/plus_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

/*class InterestGroupPage extends StatefulWidget {
  const InterestGroupPage({Key? key}) : super(key: key);

  @override
  State<InterestGroupPage> createState() => _InterestGroupPageState();
}

class _InterestGroupPageState extends State<InterestGroupPage> {

  TextEditingController _searchController = TextEditingController();

  //bool click = true;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            padding: EdgeInsets.only(left: 10.0, top: 20.0),
            alignment: Alignment.center,
            color: Colors.deepPurple,
            child: Column(
              children: <Widget>[
                Text("Past trips", style: TextStyle(fontSize: 20)),
                Card(child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(prefixIcon: Icon(Icons.search), hintText: "Search",
                  ),

                ),),
                const SizedBox(height: 20,),
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/mahjong_tile_1.png"),
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                        child: Text(
                      "Mahjong",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 30.0,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    )),
                    const SizedBox(width: 60,),
                    Expanded(
                      child: const PlusButton(),
                    )],
                ),
                //const SizedBox(height: 30,),
                Divider(
                  color: Colors.black,
                  height: 30,
                  thickness: 2,
                ),
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/taichi1.png"),
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(width: 10,),
                    const Expanded(
                        child: Text(
                      "Taichi",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 30.0,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    )),
                    const SizedBox(width: 60,),
                    Expanded(
                      child: const PlusButton(),
                    )],
                ),
                ),
              ],
            )));
  }
}*/



/*class InterestGroupPage extends StatefulWidget {
  const InterestGroupPage({Key? key}) : super(key: key);

  @override
  State<InterestGroupPage> createState() => _InterestGroupPageState();
}

class _InterestGroupPageState extends State<InterestGroupPage> {
  String name = "";
  List<Map<String, dynamic>> data = [
    /*{
      'name': 'John',
      'image':
      'https://i.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
      'email': 'john@gmail.com'
    },
    {
      'name': 'Eric',
      'image':
      'https://i.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI',
      'email': 'eric@gmail.com'
    },
    {
      'name': 'Mark',
      'image':
      'https://i.picsum.photos/id/449/200/300.jpg?grayscale&hmac=GcAk7XLOGeBrqzrEpBjAzBcZFJ9bvyMwvL1QENQ23Zc',
      'email': 'mark@gmail.com'
    },
    {
      'name': 'Ela',
      'image':
      'https://i.picsum.photos/id/3/200/300.jpg?blur=2&hmac=CgtEzNwC4BLEa1z5r0oGOsZPj5wJlqjU615MLuFillY',
      'email': 'ela@gmail.com'
    },
    {
      'name': 'Sue',
      'image':
      'https://i.picsum.photos/id/497/200/300.jpg?hmac=IqTAOsl408FW-5QME1woScOoZJvq246UqZGGR9UkkkY',
      'email': 'sue@gmail.com'
    },
    {
      'name': 'Lothe',
      'image':
      'https://i.picsum.photos/id/450/200/300.jpg?hmac=EAnz3Z3i5qXfaz54l0aegp_-5oN4HTwiZG828ZGD7GM',
      'email': 'lothe@gmail.com'
    },
    {
      'name': 'Alyssa',
      'image':
      'https://i.picsum.photos/id/169/200/200.jpg?hmac=MquoCIcsCP_IxfteFmd8LfVF7NCoRre282nO9gVD0Yc',
      'email': 'Alyssa@gmail.com'
    },
    {
      'name': 'Nichols',
      'image':
      'https://i.picsum.photos/id/921/200/200.jpg?hmac=6pwJUhec4NqIAFxrha-8WXGa8yI1pJXKEYCWMSHroSU',
      'email': 'Nichols@gmail.com'
    },
    {
      'name': 'Welch',
      'image':
      'https://i.picsum.photos/id/845/200/200.jpg?hmac=KMGSD70gM0xozvpzPM3kHIwwA2TRlVQ6d2dLW_b1vDQ',
      'email': 'Welch@gmail.com'
    },
    {
      'name': 'Delacruz',
      'image':
      'https://i.picsum.photos/id/250/200/200.jpg?hmac=23TaEG1txY5qYZ70amm2sUf0GYKo4v7yIbN9ooyqWzs',
      'email': 'Delacruz@gmail.com'
    },
    {
      'name': 'Tania',
      'image':
      'https://i.picsum.photos/id/237/200/200.jpg?hmac=zHUGikXUDyLCCmvyww1izLK3R3k8oRYBRiTizZEdyfI',
      'email': 'Tania@gmail.com'
    },
    {
      'name': 'Jeanie',
      'image':
      'https://i.picsum.photos/id/769/200/200.jpg?hmac=M55kAfuYOrcJ8a49hBRDhWtVLbJo88Y76kUz323SqLU',
      'email': 'Jeanie@gmail.com'
    }*/
    {
      'name': 'Mahjong',
      'image':
          'https://png.pngtree.com/png-clipart/20190916/original/pngtree-cartoon-white-mahjong-illustration-png-image_4598550.jpg'
    },
    {
      'name': 'Cooking',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrTYzgxq7Mj3QvYcEjbYUt7Lp6gud2OuIreAa1Ak_KDlJrf111ZAChfntyWzumz2IbfTk&usqp=CAU'
    },
    {
      'name': 'Gardening',
      'image':
          'https://images-na.ssl-images-amazon.com/images/I/21fXGJqPsQL._SR600%2C315_PIWhiteStrip%2CBottomLeft%2C0%2C35_SCLZZZZZZZ_FMpng_BG255%2C255%2C255.jpg'
    },
    {
      'name': 'Taichi',
      'image':
          'https://mpng.subpng.com/20180608/ss/kisspng-tai-chi-silhouette-taiji-white-lily-5b1b4341313cf7.8405130415285133452017.jpg'
    },
    {
      'name': 'Bird Watching',
      'image':
          'https://www.clipartmax.com/png/small/309-3090278_bird-watching-royalty-free-vector-clip-art-illustration-bird-watching-cartoon-png.png'
    }
  ];

  /*addData() async {
    for (var element in data) {
      FirebaseFirestore.instance.collection('interest groups').add(element);
    }
    print('all data added');
  }*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //addData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
            title: Card(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Search'),
            onChanged: (val) {
              setState(() {
                name = val;
              });
            },
          ),
        )),
        body: Center(
            child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('interest groups')
              .snapshots(), //change back to users
          builder: (context, snapshots) {
            return (snapshots.connectionState == ConnectionState.waiting)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.separated(
                    ///change ListView.builder to ListView.separated for the dividers.
                    itemCount: snapshots.data!.docs.length,
                    itemBuilder: (context, index) {
                      var data = snapshots.data!.docs[index].data()
                          as Map<String, dynamic>;

                      if (name.isEmpty) {
                        return ListTile(
                          title: Text(
                            data['name'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(data['image']),
                            radius: 30,
                          ),
                          trailing: const PlusButton(),
                        );
                      }
                      if (data['name']
                          .toString()
                          .toLowerCase()
                          .startsWith(name.toLowerCase())) {
                        return ListTile(
                          title: Text(
                            data['name'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(data['image']),
                            radius: 30,
                          ),
                        );
                      }
                      return Container();
                    },
                    //use separatorBuilder to get a divider between the items.
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                      color: Colors.black,
                      thickness: 2,
                      height: 10,
                    ),
                  );
          },
        )));
  }
}*/

class InterestGroupPage extends StatefulWidget {
  const InterestGroupPage({Key? key}) : super(key: key);

  @override
  State<InterestGroupPage> createState() => _InterestGroupPageState();
}

class _InterestGroupPageState extends State<InterestGroupPage> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Card(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Search...'),
            onChanged: (val) {
              setState(() {
                name = val;
              });
            },
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: (name != "" && name != null)
            ? FirebaseFirestore.instance
            .collection('interest groups')
            .where("searchKeywords", arrayContains: name)
            .snapshots()
            : FirebaseFirestore.instance.collection("interest groups").snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot data = snapshot.data!.docs[index];
              return Container(
                padding: EdgeInsets.only(top: 16),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(data['name'],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      leading: CircleAvatar(
                        child: Image.network(
                          data['image'],
                          width: 100,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                        radius: 40,
                        backgroundColor: Colors.white70,
                      ),
                      trailing: PlusButton(),
                    ),
                    Divider(
                      thickness: 2,
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}


