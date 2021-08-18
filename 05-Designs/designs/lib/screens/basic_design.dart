import 'package:flutter/material.dart';


class BasicDesignScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image(
            image: AssetImage('assets/landscape.jpg'),
          ),
          Title(),

          //Button section
          ButtonSection(),

          //Description
          Description()
        ],
      )
   );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric( horizontal: 30, vertical: 10 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Oeschinen Lake Campground', style: TextStyle( fontWeight: FontWeight.bold )),
              Text('Kandarsteg, Switzerland', style: TextStyle( color: Colors.black45 )),
            ],
          ),
          Expanded(
            child: Container(

            ),
          ),
          Icon(Icons.star, color: Colors.red,),
          Text('41')
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButton(icon: Icons.phone, text: 'CALL'),
          CustomButton(icon: Icons.alt_route, text: 'ROUTE'),
          CustomButton(icon: Icons.share, text: 'SHARE'),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const CustomButton({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon( this.icon , color: Colors.blue),
        Text(this.text, style: TextStyle( color: Colors.blue))
      ],
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
      child: Text(
        'Minim ipsum duis reprehenderit pariatur. Eiusmod veniam irure exercitation labore ipsum quis do qui sint sit ipsum proident sint quis. Aliqua irure commodo anim velit id magna occaecat mollit velit in commodo. Aute veniam irure eu cupidatat minim incididunt eu laborum incididunt cupidatat duis amet sunt est. Aliquip aute excepteur anim ipsum consectetur magna nostrud anim officia anim exercitation voluptate dolor.',
        textAlign: TextAlign.justify,
      ));
  }
}