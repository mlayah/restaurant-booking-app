import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_booking/styles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: customAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildHeroContainer(),
            SizedBox(height: 24),
            Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text('Booking Details', style: heading)),
            buildBookingDetail(),
            buildBookingEndStrip(),
            Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text('Saved Cards', style: heading)),
            buildCreditCard(),
            buildBookingButton(),
          ],
        ),
      ),
    );
  }

  Widget buildCreditCard() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [raisedBoxShadow],
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage('assets/cardbg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('1243 5234 1245 6543', style: creditCardNo),
              Image.asset('assets/mastercard.png',
                  width: 45, fit: BoxFit.fitWidth),
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset('assets/chip.png', width: 30, fit: BoxFit.fitWidth),
              Text('  VALID FROM : 12/20', style: creditNormal),
              Text('  VALID TO : 12/22', style: creditNormal),
            ],
          ),
          SizedBox(height: 6),
          Text('DAN MLAYAH T', style: creditCardNo),
        ],
      ),
    );
  }

  Widget buildBookingButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 44),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          //TODO
        },
        color: Colors.orange[900],
        textColor: Colors.white,
        elevation: 2,
        child: Text('Book Now'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
      ),
    );
  }

  Widget buildBookingEndStrip() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(flex: 2, child: buildMarkerIcon()),
          Flexible(
            flex: 8,
            fit: FlexFit.loose,
            child: Container(
              margin: EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [raisedBoxShadow],
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                title: Padding(
                    padding: EdgeInsets.only(bottom: 6),
                    child: Text('Booking Date & Time', style: heading2)),
                subtitle: Text('March 21, 03:30 PM', style: heading1),
                trailing: RaisedButton(
                  onPressed: () {
                    print('object');
                  },
                  color: mainColor,
                  textColor: Colors.white,
                  elevation: 1,
                  child: Text('Book Now'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBookingDetail() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: buildLeftFlex(),
              flex: 2,
            ),
            Flexible(
              child: buildRightFlex(),
              flex: 8,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRightFlex() {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 24),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [raisedBoxShadow],
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          buildTablePicture(),
          Flexible(
            fit: FlexFit.tight,
            child: buildTableDescriptions(),
          )
        ],
      ),
    );
  }

  Widget buildTableDescriptions() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Text('Family', style: inverseHeading1),
        ),
        SizedBox(height: 2),
        Text('Restaurant Name', style: heading1),
        SizedBox(height: 2),
        Text('Chinese', style: heading2),
        SizedBox(height: 2),
        Text('4 Members', style: heading1),
        SizedBox(height: 2),
        RatingBar(
          onRatingUpdate: null,
          itemSize: 20,
          initialRating: 5,
          minRating: 5,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
          itemBuilder: (context, _) =>
              Icon(Icons.star, color: Colors.orange[900]),
        ),
        SizedBox(height: 2),
        Text('1256 users review', style: heading2),
      ],
    );
  }

  Widget buildTablePicture() {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.loose,
      children: <Widget>[
        Container(width: 120),
        Image.asset('assets/table.png', width: 100, fit: BoxFit.fitWidth),
        Positioned(
          left: 0,
          bottom: 0,
          child: Container(
            height: 36,
            width: 36,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: mainColor,
              shape: BoxShape.circle,
              boxShadow: [raisedBoxShadow],
            ),
            child: Center(
              child: Icon(Icons.done_all, color: Colors.white, size: 24),
            ),
          ),
        )
      ],
    );
  }

  Widget buildLeftFlex() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buildMarkerIcon(),
        Flexible(
          fit: FlexFit.loose,
          child: VerticalDivider(
            color: Colors.blueGrey,
            thickness: 1.5,
          ),
        ),
      ],
    );
  }

  Widget buildMarkerIcon() {
    return Container(
      height: 56,
      width: 56,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [raisedBoxShadow],
        shape: BoxShape.circle,
      ),
      child: Image.asset('assets/target.png', width: 40, fit: BoxFit.contain),
    );
  }

  Widget buildHeroContainer() {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(boxShadow: [raisedBoxShadow]),
      height: 220,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/hotel.jpg',
                fit: BoxFit.cover,
              )),
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.8),
                borderRadius: BorderRadius.circular(36),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              margin: EdgeInsets.all(8),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('From \$ 43.00', style: heading1),
                    SizedBox(width: 24),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        color: mainColor,
                      ),
                      child: Center(
                          child: Text('Nairobi', style: inverseHeading1)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(70),
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(
          left: 24,
          bottom: 12,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [mainColor, Colors.deepOrange[600]],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.restaurant_menu, size: 42, color: Colors.white),
            SizedBox(width: 16),
            Text(
              'Booking Details',
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
