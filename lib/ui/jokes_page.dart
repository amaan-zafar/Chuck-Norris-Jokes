import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes/blocs/joke_response_bloc/joke_response_bloc.dart';
import 'package:jokes/models/joke_response.dart';
import 'package:jokes/ui/widgets/loading.dart';
import 'package:jokes/ui/widgets/error.dart';

class ShowChuckyJoke extends StatefulWidget {
  final String selectedCategory;

  const ShowChuckyJoke(this.selectedCategory);

  @override
  _ShowChuckyJokeState createState() => _ShowChuckyJokeState();
}

class _ShowChuckyJokeState extends State<ShowChuckyJoke> {
  @override
  Widget build(BuildContext context) {
    final categoriesBloc = BlocProvider.of<JokeResponseBloc>(context);
    categoriesBloc.add(GetJokeResponse(category: widget.selectedCategory));
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Chucky Joke',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          backgroundColor: Color(0xFF333333),
        ),
        backgroundColor: Color(0xFF333333),
        body: BlocBuilder<JokeResponseBloc, JokeResponseState>(
          builder: (context, state) {
            if (state is JokeResponseLoading)
              return Loading(loadingMessage: state.message);
            else if (state is JokeResponseLoaded)
              return ChuckJoke(displayJoke: state.jokeResponse);
            else if (state is JokeResponseError)
              return Error(
                errorMessage: state.message,
              );
            return Container();
          },
        )
        // RefreshIndicator(
        //   onRefresh: () => _bloc.fetchChuckyJoke(widget.selectedCategory),
        //   child: StreamBuilder<JokesStates<JokeResponse>>(
        //     stream: _bloc.chuckDataStream,
        //     builder: (context, snapshot) {
        //       if (snapshot.hasData) {
        //         switch (snapshot.data.status) {
        //           case Status.LOADING:
        //             return Loading(loadingMessage: snapshot.data.message);
        //             break;
        //           case Status.COMPLETED:
        //             return ChuckJoke(displayJoke: snapshot.data.data);
        //             break;
        //           case Status.ERROR:
        //             return Error(
        //               errorMessage: snapshot.data.message,
        //               onRetryPressed: () =>
        //                   _bloc.fetchChuckyJoke(widget.selectedCategory),
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

class ChuckJoke extends StatelessWidget {
  final JokeResponse displayJoke;

  const ChuckJoke({Key? key, required this.displayJoke}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: new Color(0xFF736AB7),
        child: new Stack(
          children: <Widget>[
            // _getBackground(),
            _getGradient(context),
            _getContent(),
          ],
        ),
      ),
    );
  }

  Container _getBackground() {
    return new Container(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/chuck.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: null /* add child content here */,
      ),
    );
  }

  Container _getGradient(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(top: 90.0),
      height: MediaQuery.of(context).size.height,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: <Color>[new Color(0x00736AB7), new Color(0xFF333333)],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Widget _getContent() {
    return new ListView(
      padding: new EdgeInsets.fromLTRB(0.0, 280, 0.0, 32.0),
      children: <Widget>[
        new Container(
          margin: EdgeInsets.all(70.0),
          decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0))),
          padding: new EdgeInsets.symmetric(horizontal: 32.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                margin: EdgeInsets.fromLTRB(5, 15, 0.0, 0.0),
                child: new Image.network(
                  displayJoke.iconUrl,
                  fit: BoxFit.cover,
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  displayJoke.value,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
