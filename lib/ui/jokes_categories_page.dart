import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes/blocs/bloc/categories_bloc.dart';
import 'package:jokes/models/jokes_categories.dart';
import 'package:jokes/ui/widgets/loading.dart';
import 'package:jokes/ui/widgets/error.dart';

import 'jokes_page.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _GetChuckyState createState() => _GetChuckyState();
}

class _GetChuckyState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    final categoriesBloc = BlocProvider.of<CategoriesBloc>(context);
    categoriesBloc.add(GetCategories());
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Text('Chucky Categories',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          backgroundColor: Color(0xFF333333),
        ),
        backgroundColor: Color(0xFF333333),
        body: BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesLoading)
              return Loading(loadingMessage: state.message);
            else if (state is CategoriesLoaded)
              return CategoryList(categoryList: state.categoriesList);
            else if (state is CategoriesError)
              return Error(
                errorMessage: state.message,
              );
            return Container();
          },
        )
        // RefreshIndicator(
        //   onRefresh: () => _bloc.fetchCategories(),
        //   child: StreamBuilder<Response<chuckCategories>>(
        //     stream: _bloc.chuckListStream,
        //     builder: (context, snapshot) {
        //       if (snapshot.hasData) {
        //         switch (snapshot.data.status) {
        //           case Status.LOADING:
        //             return Loading(loadingMessage: snapshot.data.message);
        //             break;
        //           case Status.COMPLETED:
        //             return CategoryList(categoryList: snapshot.data.data);
        //             break;
        //           case Status.ERROR:
        //             return Error(
        //               errorMessage: snapshot.data.message,
        //               onRetryPressed: () => _bloc.fetchCategories(),
        //             );
        //             break;
        //         }
        //       }
        //       return Container();
        //     },
        //   ),
        // ),
        );
  }
}

class CategoryList extends StatelessWidget {
  final JokesCategories categoryList;

  const CategoryList({Key? key, required this.categoryList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF202020),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0.0,
                vertical: 1.0,
              ),
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ShowChuckyJoke(categoryList.categories[index])));
                  },
                  child: SizedBox(
                    height: 65,
                    child: Container(
                      color: Color(0xFF333333),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                        child: Text(
                          categoryList.categories[index],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w100,
                              fontFamily: 'Roboto'),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  )));
        },
        itemCount: categoryList.categories.length,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
      ),
    );
  }
}
