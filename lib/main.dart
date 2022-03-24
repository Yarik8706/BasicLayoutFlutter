import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const InformationActivity()
    );
  }
}

class InformationActivity extends StatelessWidget {
  const InformationActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Shiba Inu')
      ),
      body: const Center(
        child: InformationWidget(),
      ),
    );
  }
}


class LikeIconWidget extends StatefulWidget {
  const LikeIconWidget({Key? key}) : super(key: key);

  @override
  State<LikeIconWidget> createState() => _LikeIconWidgetState();
}

class _LikeIconWidgetState extends State<LikeIconWidget> {

  bool _isFavorited = false;
  int _favoriteCount = 32324;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          children: [
            IconButton(
                onPressed: _toggleFavorite,
                icon: (_isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
                color: Colors.red[500],
            ),
            SizedBox(
              width: 40,
              child: Text('$_favoriteCount'),
            )
          ],
        ));
  }

  void _toggleFavorite(){
    setState(() {
      if(_isFavorited){
        _favoriteCount--;
        _isFavorited = false;
      } else{
        _favoriteCount++;
        _isFavorited = true;
      }
    });
  }
}



class InformationWidget extends StatelessWidget {
  const InformationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: ListView(
        children: [
          _buildImage(),
          Center(
            child: Card(
              elevation: 5,
              margin: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    ListTile(
                        title: const Text(
                          'Shiba Inu',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Regular',
                              fontWeight: FontWeight.w600),
                        ),
                        subtitle: const Text(
                            'The Shiba Inu is a breed of hunting dog from Japan.'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            LikeIconWidget()
                          ],
                        )
                    ),
                    Container(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: _buildButtons(),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: _buildDescription(),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildImage() =>
      Card(
        elevation: 10,
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Container(
            padding: const EdgeInsets.all(5),
            child: Image.asset(
                'assets/images/shibu.png', fit: BoxFit.cover)
        ),
      );

  Widget _buildButtons() =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildButton(
              'Маленькая', Icons.align_vertical_top_rounded, Colors.black),
          _buildButton('Бдительная', Icons.star, Colors.deepOrange),
          _buildButton('Подвижная', Icons.align_vertical_bottom_rounded,
              Colors.lightBlue),
        ],
      );

  Widget _buildButton(String label, IconData icon, Color color) =>
      Column(
        children: [
          Icon(icon, color: color),
          Text(
            label,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: color
            ),
          )
        ],
      );

  Widget _buildDescription() =>
      Container(
        padding: const EdgeInsets.all(5),
        child: const Text(
           'The Shiba Inu is a breed of hunting dog from Japan. '
           'A small-to-medium breed, it is the smallest of the six original and distinct spitz breeds of dog native to Japan. '
           'A small, alert, and agile dog that copes very well with mountainous terrain and hiking trails, the Shiba Inu was originally bred for hunting. '
           'It looks similar to and is often mistaken for other Japanese dog breeds such as the Akita Inu or Hokkaido, '
           'but the Shiba Inu is a different breed with a distinct blood line, temperament, and smaller size than other Japanese dog breeds.',
          softWrap: true,
          style: TextStyle(
            fontSize: 16.0,
            fontFamily: 'Regular'
          ),
        ),
      );
}

