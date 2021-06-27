import 'package:flutter/material.dart';
import 'package:tezster_dart/tezster_dart.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String server = 'https://rpcalpha.tzbeta.net';

  initTeza() async {
    String mnemonic = TezsterDart.generateMnemonic();
    print("mnemonic ===> $mnemonic");

    // Note: Test password is used here.
    String password = "hellotest";

    // keys ===> [privateKey, publicKey, publicKeyHash]
    List<String> keys = await TezsterDart.getKeysFromMnemonicAndPassphrase(
      mnemonic: mnemonic,
      passphrase: password,
    );
    print("keys ===> $keys");

    var myKeyStore = KeyStoreModel(
      publicKeyHash: keys[2],
      publicKey: keys[1],
      secretKey: keys[0],
      seed: mnemonic,
      email: "test@example.com",
      password: password,
      secret: '9563915a8845e6f504f4966344607afe23b9757a',
    );

    // var fundraiserKeys = await TezsterDart.unlockFundraiserIdentity(
    //   email: myKeyStore.email,
    //   passphrase: myKeyStore.password,
    //   mnemonic: myKeyStore.seed,
    // );

    var activationOperationSigner = await TezsterDart.createSigner(
      TezsterDart.writeKeyWithHint(myKeyStore.secretKey, 'edsk'),
    );

    var activationOperationResult =
        await TezsterDart.sendIdentityActivationOperation(
      server,
      activationOperationSigner,
      myKeyStore,
      myKeyStore.secret,
    );

    print('$activationOperationResult');

    print('---------------------------------');

    print('${activationOperationResult['operationGroupID']}');
  }

  @override
  void initState() {
    super.initState();
    initTeza();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Test Teza'),
      ),
    );
  }
}
