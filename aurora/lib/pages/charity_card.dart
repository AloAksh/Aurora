import 'package:flutter/material.dart';

class Details{
  String? desc='',cooked='', expiry='', quan='';

  Details({required this.desc, required this.quan, required this.cooked, required this.expiry});
}

 List<Details> dets = [
    Details(desc: "Idly, Vada, Sambar", quan:'50', cooked: '7:00am', expiry:'4:00pm'),
    Details(desc: "Idly, Vada, Sambar", quan:'40', cooked: '5:00am', expiry: '12:00pm'),
  ];
// ignore: must_be_immutable
class CharityCard extends StatelessWidget {
 CharityCard({super.key, required this.myDetails});
 final Details myDetails;

  var descr = TextEditingController();
  var quant = TextEditingController();
  var cook = TextEditingController();
  var exp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
              child: TextFormField(
                controller: quant,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Server Quantity',
                ),
              ),
            ),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
              child: TextFormField(
                controller: cook,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Cooked Time',
                ),
              ),
            ),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
              child: TextFormField(
                controller: exp,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Consume-by Time',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
              child: TextFormField(
                controller: descr,
                decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Food Description',
                hintText: 'Rice, Dal, Sambar, Carrot Sidedish',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: (){
                    myDetails.desc = descr.toString();
                    myDetails.quan = quant.toString();
                    myDetails.cooked = cook.toString();
                    myDetails.expiry = exp.toString();
                    dets.add(myDetails);
                    Navigator.pushNamed(context, '/done');
                    },  
                    child: const Text("Submit"),
                ),
            ),
          ],
        ),
      ),
    );
  }
}


class CardList extends StatefulWidget {
  const CardList({super.key});

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  const Text('Enter Food Details',),
        actions: const[],
        backgroundColor:const Color.fromARGB(255, 110, 212, 159),
      ),
      body: Column(
        children: dets.map((quot) => CharityCard(
          myDetails: quot, 
        )).toList(),
      ),
    );
  }
}