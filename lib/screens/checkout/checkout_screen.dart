import 'package:emax/blocs/checkout/checkout_bloc.dart';
import 'package:emax/widgets/custom_appbar.dart';
import 'package:emax/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});
  static const String routeName = '/checkout';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => CheckoutScreen(),
        settings: RouteSettings(name: CheckoutScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final nameController = TextEditingController();
    final addressController = TextEditingController();
    final cityController = TextEditingController();
    final countryController = TextEditingController();
    final zipCodeController = TextEditingController();
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Checkout',
        isLeading: true,
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<CheckoutBloc, CheckoutState>(
                  builder: (context, state) {
                    if (state is CheckoutLoading) {
                      return CircularProgressIndicator();
                    }
                    if (state is CheckoutLoaded) {
                      return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder()),
                          onPressed: () {
                            context.read<CheckoutBloc>().add(ConfirmCheckout(checkout: state.checkout));
                            Navigator.pushNamed(context, '/order-confirmation');
                          },
                          child: Text(
                            'Order Now',
                            style: Theme.of(context).textTheme.headline3,
                          ));
                    } else {
                      return Text('Something went wrong');
                    }
                  },
                ),
              ],
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if (state is CheckoutLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CheckoutLoaded) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CUSTOMER INFORMATION',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          _buildTextFormField(context, 'Email', (value) {
                            context
                                .read<CheckoutBloc>()
                                .add(UpdateCheckout(email: value));
                          }),
                          _buildTextFormField(context, 'Name', (value) {
                            context
                                .read<CheckoutBloc>()
                                .add(UpdateCheckout(fullName: value));
                          }),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'DELIVERY INFORMATION',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          _buildTextFormField(context, 'Address', (value) {
                            context
                                .read<CheckoutBloc>()
                                .add(UpdateCheckout(address: value));
                          }),
                          _buildTextFormField(context, 'City', (value) {
                            context
                                .read<CheckoutBloc>()
                                .add(UpdateCheckout(city: value));
                          }),
                          _buildTextFormField(context, 'Country', (value) {
                            context
                                .read<CheckoutBloc>()
                                .add(UpdateCheckout(country: value));
                          }),
                          _buildTextFormField(context, 'ZipCode', (value) {
                            context
                                .read<CheckoutBloc>()
                                .add(UpdateCheckout(zipCode: value));
                          }),
                        ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ORDER SUMMARY',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        OrderSummary(),
                      ],
                    ),
                  ],
                );
              } else {
                return Text('Something went wrong');
              }
            },
          ),
        ),
      ),
    );
  }

  Padding _buildTextFormField(
      BuildContext context, String labelText, Function(String)? onChange) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(children: [
        SizedBox(
          width: 70,
          child: Text(
            labelText,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Expanded(
            child: TextFormField(
          onChanged: onChange,
          decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.only(left: 10),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black))),
        ))
      ]),
    );
  }
}
