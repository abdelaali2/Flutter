import 'package:flutter/material.dart';

class NetworkError extends StatefulWidget {
  @override
  _NetworkErrorState createState() => _NetworkErrorState();
}

class _NetworkErrorState extends State<NetworkError> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 64.0,
            ),
            SizedBox(height: 16.0),
            Text(
              'Network Error',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
