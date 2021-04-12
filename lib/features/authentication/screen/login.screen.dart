import 'package:agent/config/flavor.config.dart';
import 'package:agent/core/constant/Consts.dart';
import 'package:agent/core/helper/toast.helper.dart';
import 'package:agent/core/utils/colors.utils.dart';
import 'package:agent/core/utils/sizes.utils.dart';
import 'package:agent/features/authentication/bloc/authentication/authentication_bloc.dart';
import 'package:agent/features/authentication/bloc/login/login_bloc.dart';
import 'package:agent/features/authentication/repository/authentication.repository.dart';
import 'package:agent/features/authentication/repository/user.repository.dart';
import 'package:flutter/material.dart';
import 'package:agent/core/widget/basic.scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key key}) : super(key: key);

  final authenticationRepository = AuthenticationRepository();
  final userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    DateTime backbuttonpressedTime;

    Future<bool> onWillPop() async {
      DateTime currentTime = DateTime.now();

      bool backButton = backbuttonpressedTime == null ||
          currentTime.difference(backbuttonpressedTime) > Duration(seconds: 3);

      if (backButton) {
        backbuttonpressedTime = currentTime;
        toastInfo("Double Click to exit app");
        return false;
      }
      return true;
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: BasicScaffold(
        backgroundColor: ColorsUtils.bg,
        body: SingleChildScrollView(
          child: Column(
            children: [
              LoginOverview(),
              BlocProvider(
                create: (BuildContext context) {
                  return LoginBloc(
                    authenticationBloc:
                        BlocProvider.of<AuthenticationBloc>(context),
                    authenticationRepository: authenticationRepository,
                    userRepository: userRepository,
                  );
                },
                child: LoginForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginOverview extends StatelessWidget {
  LoginOverview({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizesUtils.heightMultiplier * 50,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("${Constanta.IMAGE_ASSET}/bg-header.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.0),
          bottomRight: Radius.circular(16.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.50),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],

        // color: Colors.redAccent,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizesUtils.heightMultiplier * 10,
            ),
            child: Container(
              color: Colors.black,
              height: SizesUtils.imageSizeMultiplier * 12,
              width: SizesUtils.imageSizeMultiplier * 40,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: SizesUtils.heightMultiplier * 3,
            ),
            child: Image.asset(
              "${Constanta.IMAGE_ASSET}/Agent-on-the-go.png",
              height: SizesUtils.imageSizeMultiplier * 8,
              width: SizesUtils.imageSizeMultiplier * 70,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(
              SizesUtils.heightMultiplier * 0.125,
            ),
            child: Text(
              'Together We Make Wolrd',
              style: TextStyle(
                color: ColorsUtils.white,
                fontWeight: FontWeight.normal,
                fontSize: SizesUtils.textMultiplier * 2.5,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: SizesUtils.heightMultiplier * 0.75,
            ),
            child: Text(
              'A Better Place',
              style: TextStyle(
                color: ColorsUtils.white,
                fontWeight: FontWeight.bold,
                fontSize: SizesUtils.textMultiplier * 2.5,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(SizesUtils.heightMultiplier * 0),
            child: Image.asset(
              "${Constanta.IMAGE_ASSET}/Icon-01.png",
              height: SizesUtils.imageSizeMultiplier * 10,
              width: SizesUtils.imageSizeMultiplier * 20,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool isLoginHover;
  bool isPasswordHide;
  TextEditingController usernameController;
  TextEditingController passwordController;
  final FocusNode usernameFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  AutovalidateMode autovalidateMode;

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  void initState() {
    super.initState();
    isLoginHover = false;
    isPasswordHide = true;
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    autovalidateMode = AutovalidateMode.disabled;
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      if (_formKey.currentState.validate()) {
        BlocProvider.of<LoginBloc>(context).add(
          LoginButtonPressed(
            username: usernameController.text,
            password: passwordController.text,
          ),
        );
      } else {
        toastInfo('validate failed, check!');
        setState(() {
          autovalidateMode = AutovalidateMode.always;
        });
      }
    }

    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          toastInfo('${state.error}');
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Form(
              autovalidateMode: autovalidateMode,
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(
                  left: SizesUtils.widthMultiplier * 10.0,
                  right: SizesUtils.widthMultiplier * 10.0,
                  top: SizesUtils.heightMultiplier * 2.5,
                  bottom: SizesUtils.heightMultiplier * 0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        // horizontal: SizesUtils.widthMultiplier * 7.5,
                        top: SizesUtils.heightMultiplier * 2.5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onLongPress: () {
                              bool isDev = FlavorConfig.isDevelopment();
                              if (isDev) {
                                setState(() {
                                  usernameController = TextEditingController(
                                    text: Constanta.LOGIN_USERNAME_DEV,
                                  );
                                  passwordController = TextEditingController(
                                    text: Constanta.LOGIN_PASSWORD_DEV,
                                  );
                                });
                              }
                            },
                            child: Image.asset(
                              "${Constanta.IMAGE_ASSET}/Icon-Agent.png",
                              height: SizesUtils.imageSizeMultiplier * 10,
                              width: SizesUtils.imageSizeMultiplier * 10,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              autofocus: false,
                              controller: usernameController,
                              decoration: InputDecoration(
                                hintText: 'Username',
                                isDense: true,
                                errorText: '',
                                contentPadding: EdgeInsets.all(10),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 0.0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 0.0),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 0.0),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 0.0),
                                ),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              },
                              focusNode: usernameFocus,
                              onFieldSubmitted: (term) {
                                _fieldFocusChange(
                                  context,
                                  usernameFocus,
                                  passwordFocus,
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        bottom: SizesUtils.heightMultiplier * 2.5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => setState(() {
                              isPasswordHide = !isPasswordHide;
                            }),
                            child: Image.asset(
                              "${Constanta.IMAGE_ASSET}/icon-password.png",
                              height: SizesUtils.imageSizeMultiplier * 10,
                              width: SizesUtils.imageSizeMultiplier * 10,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              autofocus: false,
                              obscureText: isPasswordHide,
                              controller: passwordController,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                errorText: '',
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 0.0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 0.0),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 0.0),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 0.0),
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(10),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              },
                              focusNode: passwordFocus,
                              onFieldSubmitted: (value) {
                                passwordFocus.unfocus();
                                _onLoginButtonPressed();
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(SizesUtils.heightMultiplier * 2),
              child: TextButton(
                // style: TextButton.styleFrom(
                //   primary: Colors.black87,
                //   minimumSize: Size(88, 36),
                //   // padding: EdgeInsets.symmetric(horizontal: 16.0),
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.all(Radius.circular(2.0)),
                //   ),
                // ),
                onPressed: () {
                  print('forgot password');
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: ColorsUtils.grayDark,
                    fontWeight: FontWeight.normal,
                    fontSize: SizesUtils.textMultiplier * 1.75,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: SizesUtils.heightMultiplier * 2),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // shadowColor: Colors.blue,
                  // onPrimary: Colors.white,
                  primary: ColorsUtils.primary,
                  // onSurface: Colors.red,
                  minimumSize: Size(88, 36),
                  padding: EdgeInsets.zero,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                ),
                child: SizedBox(
                  height: SizesUtils.textMultiplier * 7,
                  width: SizesUtils.textMultiplier * 25,
                  child: Center(
                    child: state is LoginLoading
                        ? CircularProgressIndicator()
                        : Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: SizesUtils.textMultiplier * 3,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                  ),
                ),
                onPressed: () {
                  _onLoginButtonPressed();
                },
              ),
            )
          ],
        );
      },
    );
  }
}
