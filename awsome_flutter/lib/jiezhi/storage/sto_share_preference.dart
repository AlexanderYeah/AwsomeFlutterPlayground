import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceDemoPage extends StatefulWidget {
  const SharePreferenceDemoPage({super.key});

  @override
  State<SharePreferenceDemoPage> createState() =>
      _SharePreferenceDemoPageState();
}

class _SharePreferenceDemoPageState extends State<SharePreferenceDemoPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _username = "";
  String _password = "";
  // 保存密码到本地
  _saveInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("username", _usernameController.text.toString());
    sp.setString("password", _passwordController.text.toString());
    _getInfo();
  }

  // 获取信息
  _getInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (sp.getString("username") != null) {
      _username = sp.getString("username")!;
    } else {
      _username = "";
    }
    if (sp.getString("password") != null) {
      _password = sp.getString("password")!;
    } else {
      _password = "";
    }

    setState(() {});
  }

  // 删除信息
  _deleteInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    // sp.remove("username");
    sp.clear();
    _getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("本地存储"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            // 用户名输入框
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: _usernameController,
                keyboardType: TextInputType.phone,
                autofocus: false,
                decoration: InputDecoration(
                    hintText: "请输入手机号",
                    // 内容的边距
                    contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32))),
              ),
            ),
            // 用户名输入框
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: _passwordController,
                keyboardType: TextInputType.phone,
                autofocus: false,
                decoration: InputDecoration(
                    hintText: "请输入密码",
                    // 内容的边距
                    contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32))),
              ),
            ),

            Row(
              children: [
                //保存按钮
                OutlinedButton(
                  onPressed: _saveInfo,
                  child: Text(
                    "保存",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                ),
                //保存按钮
                OutlinedButton(
                  onPressed: _deleteInfo,
                  child: Text(
                    "删除",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                ),
              ],
            ),
            // 显示本地保存的数据
            Container(
              child: Text("用户名:${_username}" + "\n" + "密码:${_password}"),
            )
          ],
        ),
      ),
    );
  }
}
