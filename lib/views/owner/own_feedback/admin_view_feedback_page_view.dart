import 'package:medisan/styles/color_palette.dart';
import 'package:medisan/views/owner/own_feedback/admin_view_feedback_page_bloc.dart';
import 'package:medisan/views/owner/own_feedback/admin_view_feedback_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminViewFeedBackPageView extends StatefulWidget {
  const AdminViewFeedBackPageView({Key? key}) : super(key: key);

  @override
  _AdminViewFeedBackPageViewState createState() =>
      _AdminViewFeedBackPageViewState();
}

class _AdminViewFeedBackPageViewState extends State<AdminViewFeedBackPageView> {
  @override
  Widget build(BuildContext context) {
    AdminViewFeedBackPageBloc bloc =
        BlocProvider.of<AdminViewFeedBackPageBloc>(context);
    return Scaffold(
      backgroundColor: CustomColors.SCAFFOLD,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 40.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                  Image.asset(
                    'assets/icons/logo_icon.png',
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: CustomColors.SECONDARY,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Feedbacks',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: CustomColors.SECONDARY,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<AdminViewFeedBackPageBloc, AdminViewFeedBackPageState>(
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return ListView.builder(
            itemCount: state.feedbacks.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 10.0,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: CustomColors.BACKGROUND,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            state.feedbacks[index].msg,
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      color: CustomColors.SECONDARY,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
