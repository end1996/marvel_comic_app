import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ComicDetailPage extends StatelessWidget {
  const ComicDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    size: 30.0,
                  )),
              const Positioned(
                bottom: 10,
                left: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  maxRadius: 7.0,
                  child: Text('1',
                      style: TextStyle(fontSize: 12.0, color: Colors.white)),
                ),
              )
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          _comicDetailCard(),
          const SizedBox(height: 10.0,),
          _textContentCard(),
          const SizedBox(height: 30.0,),
          _rowButtons(),
        ],
      )
    );
  }

  Widget _comicDetailCard(){
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child:
                SizedBox(height: 250.0, child: Image.asset('assets/venom.jpg')),
          ),
          const SizedBox(height: 10.0),
          const Text('Venom',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('4.5',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
            ],
          ),
        ],
      );
  }

  Widget _textContentCard(){
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Occaecat Lorem id exercitation commodo consequat excepteur dolor. Eiusmod deserunt in tempor id adipisicing consectetur. Enim in id anim incididunt mollit aute. Commodo ipsum veniam velit dolor irure Lorem sit.',
                style: TextStyle(color: Colors.grey,fontSize: 16.0),
              ),
              TextSpan(
                text: '''   See variant covers 👉''',style: const TextStyle(color: Colors.indigoAccent,fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()
                // ignore: avoid_print
                ..onTap =() => print('Click')
              ),
            ],
          )
          ),
      ),
    );
  }

  Widget _rowButtons() {

    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton( 
            child: const Text('Cancel',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 18.0)),
            onPressed: (){}
            ),
          SizedBox(
            height: 40.0,
            width: 230.0,
            child: ElevatedButton(
              style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(6.0),
                shadowColor: const MaterialStatePropertyAll(Colors.red),
                backgroundColor: const MaterialStatePropertyAll(Colors.red),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Buy Full Version',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
                  Icon(Icons.shopping_bag_outlined),
                ],
                          ),
              ),
            onPressed: (){}
            ),
          )
        ],
      ),
    );
  }
}
