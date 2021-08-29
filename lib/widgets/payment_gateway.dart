import 'package:flutter/material.dart';

class PaymentGateway extends StatelessWidget {
  static const routeName = '/payment-gateway';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment Gateway',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('48'),
              Text('mins'),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/map.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Stepper(
                controlsBuilder: (BuildContext context,
                    {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                  return Row(
                    children: <Widget>[
                      TextButton(
                        onPressed: onStepContinue,
                        child: const Text(''),
                      ),
                    ],
                  );
                },
                steps: [
                  Step(
                    isActive: true,
                    title: Text(
                      'Order Recieved',
                      style: TextStyle(fontSize: 15),
                    ),
                    content: SizedBox(
                      width: 0,
                      height: 0,
                    ),
                    state: StepState.complete,
                  ),
                  Step(
                    isActive: true,
                    title: Text(
                      'Preparing Order',
                      style: TextStyle(fontSize: 15),
                    ),
                    content: Text('Content'),
                    state: StepState.complete,
                  ),
                  Step(
                    title: Text(
                      'Out for delivery',
                      style: TextStyle(fontSize: 15),
                    ),
                    content: Text('Content'),
                  ),
                ],
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(bottom: 20, right: 60),
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.6,
                child: RaisedButton(
                  color: Color(0xff00001a),
                  onPressed: () {
                    Navigator.of(context).popUntil(
                      ModalRoute.withName(
                        '/MainWidget',
                      ),
                    );
                  },
                  child: Text(
                    'Back to Cart Page',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
