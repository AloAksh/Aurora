import "package:flutter/material.dart";

class ChooseOption extends StatelessWidget {
 
  const ChooseOption ({super.key});
  
  @override
  Widget build(BuildContext context) {
      return  Scaffold(
        backgroundColor: const Color.fromARGB(255, 110, 212, 159),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                child: const Text(
                  'How would you like to continue',
                  style: TextStyle(fontSize: 25,),
                )
                ),
                const SizedBox(),
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(47, 155, 142, 1)),
                ),
                onPressed: ()
                {
                   Navigator.pushNamed(context, '/res_profile');
                },
                child: const Padding(
                    padding: EdgeInsets.all(15),
                    child:Text(
                    'RESTAURANT',
                    style: TextStyle(fontSize: 20),
                    
                    ),
                )
                
              ),
              ),
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(47, 155, 142, 1)),
                  ),
                onPressed: ()
                {
                   Navigator.pushNamed(context, '/char_profile');
                },
                child: const Padding(
                    padding: EdgeInsets.all(15),
                    child:Text(
                    'NGO / CHARITY',
                    style: TextStyle(fontSize: 20),
                    
                    ),
                )
                
              ),
              ),
          ],
           
         
        ),
    );
  }

  
  
  
}






