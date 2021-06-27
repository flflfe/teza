class Wallet {
  List<String> mnemonic;
  String secret;
  String amount;
  String pkh;
  String password;
  String email;

  Wallet({
    this.mnemonic,
    this.secret,
    this.amount,
    this.pkh,
    this.password,
    this.email,
  });

  Wallet.fromJson(Map<String, dynamic> json) {
    mnemonic = json['mnemonic'].cast<String>();
    secret = json['secret'];
    amount = json['amount'];
    pkh = json['pkh'];
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mnemonic'] = this.mnemonic;
    data['secret'] = this.secret;
    data['amount'] = this.amount;
    data['pkh'] = this.pkh;
    data['password'] = this.password;
    data['email'] = this.email;
    return data;
  }
}
