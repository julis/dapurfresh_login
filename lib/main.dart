import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {

  Widget _buildBanner(){
    return Stack(
      children: <Widget>[
        Image(
          image: AssetImage('assets/banner.png'),
          width: ScreenUtil().setWidth(360),
          height: ScreenUtil().setHeight(218),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
        Container(
          margin: EdgeInsets.only(
            top: ScreenUtil().setHeight(40),
            left: ScreenUtil().setWidth(30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Selamat datang di',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(20),
                  color: Colors.white
                ),
              ),
              Text(
                'DapurFresh.Id',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(22),
                  color: Colors.white
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildPhoneTextField(){
    return Container(
      width: ScreenUtil().setWidth(285),
      height: ScreenUtil().setHeight(50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Color.fromARGB(91, 0, 0, 0))
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.grey[300]
          ),
          hintText: 'Nomor Telepon',
          contentPadding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setHeight(15),
            horizontal: ScreenUtil().setWidth(20)
          )
        ),
      ),
    );
  }

  Widget _buildLoginButton(){
    return SizedBox(
      width: ScreenUtil().setWidth(273),
      height: ScreenUtil().setHeight(44),
      child: RaisedButton(
        onPressed: (){},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        color: Color(0xFF6AA434),
        child: Text(
          'Masuk',
          style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(14))
        ),
      ),
    );
  }

  Widget _buildDivider(){
    return SizedBox(
      width: ScreenUtil().setWidth(273),
      height: ScreenUtil().setHeight(30),
      child: Row(
        children: <Widget>[
          Expanded(child: Divider()),
          SizedBox(width: ScreenUtil().setWidth(8)),
          Text('atau'),
          SizedBox(width: ScreenUtil().setWidth(8)),
          Expanded(child: Divider())
        ],
      ),
    );
  }

  Widget _buildLoginFacebookButton(){
    return SizedBox(
      width: ScreenUtil().setWidth(273),
      height: ScreenUtil().setHeight(44),
      child: RaisedButton(
        onPressed: (){},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/fb-icon.png'),
              width: ScreenUtil().setWidth(24),
              height: ScreenUtil().setHeight(24),
            ),
            SizedBox(width: ScreenUtil().setWidth(5)),
            Text('Masuk dengan Facebook')
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm(){
    return Column(
      children: <Widget>[
        SizedBox(height: ScreenUtil().setHeight(20)),
        Text(
          'Masuk',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(20)
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(23)),
        _buildPhoneTextField(),
        SizedBox(height: ScreenUtil().setHeight(21)),
        _buildLoginButton(),
        _buildDivider(),
        _buildLoginFacebookButton()
      ],
    );
  }

  Widget _buildLoginBox(){
    return Container(
      width: ScreenUtil().setWidth(310),
      height: ScreenUtil().setHeight(281),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(51, 0, 0, 0),
            offset: Offset(0, 0),
            blurRadius: 2
          )
        ]
      ),
      child: _buildLoginForm(),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: 360,
      height: 640,
      allowFontScaling: true
    )..init(context);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: GestureDetector(
        onTap: (){ FocusScope.of(context).requestFocus(new FocusNode()); },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildBanner(),
              SizedBox(height: ScreenUtil().setHeight(40)),
              _buildLoginBox()
            ],
          ),
        ),
      ),
    );
  }
}
