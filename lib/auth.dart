import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    final tabTextStyle = TextStyle(
        color: Theme.of(context).colorScheme.onPrimary,
        fontSize: 18,
        fontWeight: FontWeight.bold);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(40),
              child: SvgPicture.asset('assets/img/icons/LOGO.svg'),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  page = 0;
                                });
                              },
                              child: Text('Login'.toUpperCase(),
                                  style: page == 0
                                      ? tabTextStyle.apply(color: Colors.white)
                                      : tabTextStyle.apply(
                                          color: const Color.fromARGB(
                                              50, 255, 255, 255)))),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  page = 1;
                                });
                              },
                              child: Text('Sign Up'.toUpperCase(),
                                  style: page == 1
                                      ? tabTextStyle.apply(color: Colors.white)
                                      : tabTextStyle.apply(
                                          color: const Color.fromARGB(
                                              50, 255, 255, 255)))),
                        ]),
                  ),
                  page == 0 ? const _Login() : const _SignUp()
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(28), topRight: Radius.circular(28))),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Welcome back',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 17,
              ),
              Text(
                'Sign in with your account',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 14),
              ),
              const TextField(
                decoration: InputDecoration(label: Text('Username')),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                    label: Text(
                  'Password',
                )),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                      minimumSize: MaterialStateProperty.all(
                          Size(MediaQuery.of(context).size.width, 60))),
                  onPressed: () {},
                  child: Text('Login'.toUpperCase())),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text('Forgot your password?')),
                  TextButton(onPressed: () {}, child: const Text('Reset here'))
                ],
              ),
              Center(
                child: Text(
                  'OR SIGN IN WITH',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(letterSpacing: 2),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset('assets/img/icons/Google.png',
                    width: 36, height: 36),
                const SizedBox(
                  width: 28,
                ),
                Image.asset('assets/img/icons/Facebook.png',
                    width: 36, height: 36),
                const SizedBox(
                  width: 28,
                ),
                Image.asset(
                  'assets/img/icons/Twitter.png',
                  width: 36,
                  height: 36,
                )
              ]),
            ]),
          ),
        ),
      ),
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(28), topRight: Radius.circular(28))),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Welcome to Blog Club',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 17,
              ),
              Text(
                'Sign up with your informations',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 14),
              ),
              const TextField(
                decoration: InputDecoration(label: Text('Fullname')),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                decoration: InputDecoration(label: Text('Username')),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                    label: Text(
                  'Password',
                )),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                      minimumSize: MaterialStateProperty.all(
                          Size(MediaQuery.of(context).size.width, 60))),
                  onPressed: () {},
                  child: Text('Login'.toUpperCase())),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: () {}, child: const Text('Reset here'))
                ],
              ),
              Center(
                child: Text(
                  'OR SIGN UP WITH',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(letterSpacing: 2),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset('assets/img/icons/Google.png',
                    width: 36, height: 36),
                const SizedBox(
                  width: 28,
                ),
                Image.asset('assets/img/icons/Facebook.png',
                    width: 36, height: 36),
                const SizedBox(
                  width: 28,
                ),
                Image.asset(
                  'assets/img/icons/Twitter.png',
                  width: 36,
                  height: 36,
                )
              ]),
            ]),
          ),
        ),
      ),
    );
  }
}
