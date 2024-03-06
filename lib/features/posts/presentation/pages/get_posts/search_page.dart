import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchDelegated extends StatefulWidget {
  const SearchDelegated({super.key});

  @override
  State<SearchDelegated> createState() => _SearchDelegatedState();
}

class _SearchDelegatedState extends State<SearchDelegated> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: const Column(
            children: [

              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                ),
              ),
              SizedBox(height: 10),
              Text('Search'),

            ],
          ),
        ),
      ),
    );
  }
}


