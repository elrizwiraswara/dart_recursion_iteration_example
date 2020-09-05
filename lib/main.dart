import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challange Ekoji  •  STMIK Dumai Team',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Challange Ekoji  •  STMIK Dumai Team'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController hrgSatuan = TextEditingController();
  TextEditingController sBks = TextEditingController();
  TextEditingController bns = TextEditingController();
  TextEditingController uang = TextEditingController();

  double jpb = 0;
  double byd = 0;
  double pyd = 0;
  int sp = 0;

  bool inputError = false;

  resetState() {
    setState(() {
      jpb = 0;
      byd = 0;
      pyd = 0;
      sp = 0;
    });
  }

  valReset() {
    setState(() {
      hrgSatuan.clear();
      sBks.clear();
      bns.clear();
      uang.clear();
    });
  }

  void initVal() {
    pyd = int.parse(uang.text) / int.parse(hrgSatuan.text);
    print('jumlah permen : $pyd');

    jpb = pyd / int.parse(sBks.text);
    print('jml bonus yg didapat permen : ${jpb.floor()}');
  }

  void calbyd(a) {
    pyd = int.parse(uang.text) / int.parse(hrgSatuan.text) + a;
    print('jumlah permen akhir : $pyd');
    return calMod();
  }

  void calMod() {
    sp = pyd.toInt() % int.parse(sBks.text);
    print('sisa permen : $sp');
  }

  void calculate() {
    initVal();

    for (int i = 1; i <= jpb.floor(); i++) {
      setState(() {
        byd += int.parse(bns.text);
        print('bonus permen awal : $byd');
      });
      calbyd(byd);
    }

    if (byd >= int.parse(sBks.text)) {
      for (int i = 1; i <= int.parse(sBks.text); i++) {
        if (i == int.parse(sBks.text)) {
          setState(() {
            byd += int.parse(bns.text);
            print('bonus permen akhir: $byd');
          });
          return calbyd(byd);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Card(
                  margin: EdgeInsets.all(28),
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                          child: Text(
                            'Recursion and Iteration Example in Dart',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: TextSpan(
                              text:
                                  'Halaman web ini dibuat untuk memenuhi challange yang dibuat oleh Prof. Ekoji di ',
                              children: [
                                TextSpan(
                                  text: 'Ekoji Channel',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: hrgSatuan,
                            decoration: InputDecoration(
                                labelText: 'Masukkan harga permen'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: sBks,
                            decoration:
                                InputDecoration(labelText: 'Setiap .. bungkus'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: bns,
                            decoration: InputDecoration(
                                labelText: 'Dapat ditukarkan dengan'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: uang,
                            decoration:
                                InputDecoration(labelText: 'Uang jajan'),
                          ),
                        ),
                        Visibility(
                          visible: inputError,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 8.0,
                                    top: 8.0,
                                  ),
                                  child: Text(
                                    'Masukan tidak benar!',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                Text(
                                  '• Uang jajan harus lebih besar dari harga permen\n• Field 2 harus lebih besar dari field 3',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: pyd != 0 ? true : false,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12.0, right: 8.0, bottom: 8.0),
                                  child: Text(
                                    'Jumlah Total Permen yang dinikmati : $pyd',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, right: 8.0, bottom: 8.0),
                                  child: Text(
                                    'Sisa bungkus yang disimpan karena tidak bisa ditukar lagi : $sp',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            margin: EdgeInsets.only(top: 8.0),
                            width: double.infinity,
                            height: 52,
                            child: RaisedButton(
                              color: Colors.blue,
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                resetState();
                                if (sBks.text.isEmpty ||
                                    bns.text.isEmpty ||
                                    sBks.text.isEmpty ||
                                    uang.text.isEmpty ||
                                    int.parse(sBks.text) <= 0 ||
                                    int.parse(bns.text) <= 0 ||
                                    int.parse(sBks.text) <=
                                        int.parse(bns.text)) {
                                  resetState();
                                  valReset();
                                  setState(() {
                                    inputError = true;
                                  });
                                } else if (sBks.text.isNotEmpty &&
                                    bns.text.isNotEmpty &&
                                    sBks.text.isNotEmpty &&
                                    uang.text.isNotEmpty &&
                                    int.parse(sBks.text) > 0 &&
                                    int.parse(bns.text) > 0 &&
                                    int.parse(sBks.text) >
                                        int.parse(bns.text)) {
                                  setState(() {
                                    inputError = false;
                                  });
                                  calculate();
                                }
                              },
                              child: Text(
                                'Hitung',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 32.0),
                  child: Column(
                    children: [
                      Text(
                        'Elriz Wiraswara • Didit Abdianto • Ranny Nirmala',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Get the source code : github.com/elrizwiraswara',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
