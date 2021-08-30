import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliverAppBarPage extends StatefulWidget {
  const SliverAppBarPage({Key? key}) : super(key: key);

  @override
  _SliverAppBarPageState createState() => _SliverAppBarPageState();
}

class _SliverAppBarPageState extends State<SliverAppBarPage> {
  double _textScale = 1;
  bool _isLarge = false;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: _textScale),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.blueAccent.withOpacity(0.3),
              floating: true,
              pinned: true,
              snap: false,
              expandedHeight: 180,
              toolbarHeight: 60,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('記事カテゴリー'),
                background: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Image.network(
                        'https://images.pexels.com/photos/267392/pexels-photo-267392.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              stops: [
                            0.5,
                            1
                          ],
                              colors: [
                            Colors.grey.withOpacity(0),
                            Colors.black38
                          ])),
                    )
                  ],
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                color: Colors.grey[200],
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '文字を大きく',
                            style: GoogleFonts.lato(),
                          ),
                          Switch(value: _isLarge, onChanged: _toggleLargeFont)
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Text(
                            'Sep. 29 2020',
                            style: GoogleFonts.lato(),
                          )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.share,
                                color: Colors.blueAccent,
                              ))
                        ],
                      ),
                      Text(
                        '記事タイトル記事タイトル記事タイトル記事タイトル記事タイトル',
                        style: GoogleFonts.kosugiMaru(),
                      ),
                      Divider(
                        height: 30,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://images.pexels.com/photos/736716/pexels-photo-736716.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                            ),
                            radius: 26,
                            backgroundColor: Colors.grey[200],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('山田　太郎', style: GoogleFonts.kosugiMaru()),
                              Text('ITジャーナリスト', style: GoogleFonts.kosugiMaru())
                            ],
                          ),
                          Expanded(child: SizedBox()),
                          Icon(
                            Icons.favorite_border,
                            color: Colors.blueAccent,
                          ),
                          SizedBox(width: 5),
                          Text('350'),
                          SizedBox(
                            width: 16,
                          ),
                          Icon(
                            Icons.comment,
                            color: Colors.blueAccent,
                          ),
                          SizedBox(width: 5),
                          Text('25')
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          'それは事実ざっとそうした誤解院というものの時にぶつかったた。どうも毎号を意味打は何だかその乱暴んますなどになっといるべきをは講演換えるたですので、わざわざには濁したないでませ。がたの使うた気はいよいよ多数をとやかくあるたらた。まあ張君に相当書実際発展をしん作物その個性ここか観念へとしてご発展なうなましば、その生涯も私か学校上面でさて、大森さんのものを程度のどこともしお妨害と与えて私権力にお参考をしように単にご講演に云えなくらしくて、はたしてはなはだ存在に困るだろばならだっもののなさですでしょ。またはまたご人から当て事ももともと立派と読まませば、いわゆる生徒がは掘りたでについて諸君をさてならうた。',
                          style: GoogleFonts.sawarabiGothic())
                    ],
                  ),
                ),
              )
            ]))
          ],
        ),
      ),
    );
  }

  void _toggleLargeFont(bool isLarge) {
    isLarge ? _textScale = 1.2 : _textScale = 1.0;
    setState(() {
      _isLarge = isLarge;
    });
  }
}
