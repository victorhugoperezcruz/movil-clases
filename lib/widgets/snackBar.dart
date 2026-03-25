import 'package:flutter/material.dart';

ShowSnackBar(BuildContext _context, String text, int duration){
  ScaffoldMessenger.of(_context).showSnackBar(
      SnackBar(
        content: Text(text),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: duration),
      )
  );
}