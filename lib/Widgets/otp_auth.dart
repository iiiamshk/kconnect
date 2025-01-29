import 'package:flutter/material.dart';
import 'package:kconnect/Providers/auth_provider.dart';
import 'package:kconnect/Screens/main_page.dart';
import 'package:provider/provider.dart';

class OtpAuth extends StatefulWidget {
  final String email;
  final String password;

  OtpAuth({required this.email, required this.password});

  @override
  _OtpAuthState createState() => _OtpAuthState();
}

class _OtpAuthState extends State<OtpAuth> {
  final _otpController = TextEditingController();
  bool _isLoading = false;

  Future<void> verifyOtp(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    try {
      setState(() => _isLoading = true);
      await authProvider.verifyOtp(widget.email, _otpController.text.trim());

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
        (route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // void _verifyOtp() {
  //   if (_otpController.text.length == 6) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     // Simulate OTP verification delay
  //     Future.delayed(Duration(seconds: 2), () {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //           title: Text("Verification Successful"),
  //           content: Text("Welcome to KConnect! "),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.pop(context);
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: (context) => MainPage(),
  //                   ),
  //                 ); // Return to the main page
  //               },
  //               child: Text("OK"),
  //             ),
  //           ],
  //         ),
  //       );
  //     });
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("Please enter a valid 6-digit OTP")),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Verify OTP",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                "Enter the OTP sent to ${widget.email}",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              TextField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "OTP",
                  border: OutlineInputBorder(),
                ),
                maxLength: 6,
              ),
              SizedBox(height: 20),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () => verifyOtp(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        textStyle: TextStyle(fontSize: 16),
                      ),
                      child: Text(
                        "Verify",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
}
