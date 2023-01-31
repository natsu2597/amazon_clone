import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/address/services/address_services.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pay/pay.dart';
import '../../../constants/global_variables.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = "/address";
  final String totalAmount;
  const AddressScreen({super.key, required this.totalAmount});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final GlobalKey<FormState> _addKey = GlobalKey<FormState>();
  final houseController = TextEditingController();
  final areaController = TextEditingController();
  final pincodeController = TextEditingController();
  final cityController = TextEditingController();

  String addressToBeUsed = "";

  List<PaymentItem> paymentItems = [];
  final AddressServices addServices = AddressServices();

  @override
  void initState() {
    super.initState();
    paymentItems.add(
      PaymentItem(
        amount: widget.totalAmount,
        label: 'TotalAmount',
        status: PaymentItemStatus.final_price,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    houseController.dispose();
    areaController.dispose();
    pincodeController.dispose();
    cityController.dispose();
  }

  void onGooglePaymentResult(res) {
    if(Provider.of<UserProvider>(context,listen: false).user.address.isEmpty)
    {
      addServices.saveUserAdd(context: context, address: addressToBeUsed);
    }
    addServices.placeOrder(context: context, address: addressToBeUsed, totalAmount: double.parse(widget.totalAmount));
  }

  void payPressed(String addressProvider) {
    addressToBeUsed = "";

    bool isForm = houseController.text.isNotEmpty ||
        areaController.text.isNotEmpty ||
        pincodeController.text.isNotEmpty ||
        cityController.text.isNotEmpty;

    if (isForm) {
      if (_addKey.currentState!.validate()) {
        addressToBeUsed =
            '${houseController.text}, ${areaController.text}, ${cityController.text} - ${pincodeController.text}';
      }
      else
      {
        throw Exception('Please enter all the values');
      }
      
    }
    else if(addressProvider.isNotEmpty)
      {
        addressToBeUsed = addressProvider;
      }
      else{
        showSnackBar(context, 'ERROR');
      }
  }

  @override
  Widget build(BuildContext context) {
    var address = context.watch<UserProvider>().user.address;
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (address.isNotEmpty)
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26, width: 1)),
                    child: Text(
                      address,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: const Expanded(
                        child: Text(
                      "OR",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    )),
                  )
                ],
              ),
            Form(
              key: _addKey,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(7),
                    child: CustomTextField(
                        controller: houseController,
                        hintText: "Flat, House no.,Building"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(7),
                    child: CustomTextField(
                        controller: areaController, hintText: "Area, Street"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(7),
                    child: CustomTextField(
                        controller: pincodeController, hintText: "Pincode"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(7),
                    child: CustomTextField(
                        controller: houseController, hintText: "Town/City"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GooglePayButton(
                    onPressed: () => payPressed(address),
                    width: double.infinity,
                    type: GooglePayButtonType.buy,
                    margin: const EdgeInsets.all(10),
                    height: 50,
                    // ignore: deprecated_member_use
                    paymentConfigurationAsset: 'gpay.json',
                    onPaymentResult: onGooglePaymentResult,
                    paymentItems: paymentItems,
                    loadingIndicator: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildAppBar() => PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariable.appBarGradient),
          ),
        ),
      );
}
