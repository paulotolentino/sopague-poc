class UserData {
  bool success;
  User user;

  UserData({this.success, this.user});

  factory UserData.fromJson(Map parsedJson){
    return UserData(
      success: parsedJson['success'],
      user: User.fromJson(parsedJson['user']),
    );
  }
}

class User {
  String name;
  String email;
  String dateBirth;
  String docNumber;
  String code;
  String type;
  bool validate;
  bool typeAccountExpired;
  IsMerchant isMerchant;
  TypeAccount typeAccount;
  Balance balance;
  Info info;
  Document document;
  Security security;
  Login login;
  List<Movement> movement;
  List<MyBanks> myBanks;

  User({
    this.name,
    this.email,
    this.dateBirth,
    this.docNumber,
    this.code,
    this.type,
    this.validate,
    this.typeAccountExpired,
    this.isMerchant,
    this.typeAccount,
    this.balance,
    this.info,
    this.document,
    this.security,
    this.login,
    this.movement,
    this.myBanks
  });

  factory User.fromJson(Map<String, dynamic> parsedJson){
    return User(
      name: parsedJson['name'],
      email: parsedJson['email'],
      dateBirth: parsedJson['date_birth'],
      docNumber: parsedJson['doc_number'],
      code: parsedJson['code'],
      type: parsedJson['type'],
      validate: parsedJson['validate'],
      typeAccountExpired: parsedJson['type_account_expired'],
      isMerchant: IsMerchant.fromJson(parsedJson['is_merchant']),
      typeAccount: TypeAccount.fromJson(parsedJson['type_account']),
      balance: Balance.fromJson(parsedJson['balance']),
      info: Info.fromJson(parsedJson['info']),
      document: Document.fromJson(parsedJson['document']),
      security: Security.fromJson(parsedJson['security']),
      login: Login.fromJson(parsedJson['login']),
      movement: parsedJson['movement'].map((val) => Movement.fromJson(val)).toList().cast<Movement>(),
      myBanks: parsedJson['my_banks'].map((val) => MyBanks.fromJson(val)).toList().cast<MyBanks>(),
    );
  }
}

class IsMerchant {
  bool status;
  IsMerchantData data;

  IsMerchant({this.status, this.data});

  factory IsMerchant.fromJson(Map<String, dynamic> parsedJson){
    return IsMerchant(
      status: parsedJson['status'],
      data: IsMerchantData.fromJson(parsedJson['data']),
    );
  }
}

class IsMerchantData {
  String publicId;
  bool isActive;
  bool isProduction;
  bool isContract;

  IsMerchantData({
    this.publicId,
    this.isActive,
    this.isProduction,
    this.isContract
  });

  factory IsMerchantData.fromJson(Map<String, dynamic> parsedJson){
    return IsMerchantData(
      publicId: parsedJson['public_id'],
      isActive: parsedJson['is_active'],
      isProduction: parsedJson['is_production'],
      isContract: parsedJson['is_contract'],
    );
  }
}

class TypeAccount {
  bool status;
  TypeAccountData data;

  TypeAccount({this.status, this.data});

  factory TypeAccount.fromJson(Map<String, dynamic> parsedJson){
    return TypeAccount(
      status: parsedJson['status'],
      data: TypeAccountData.fromJson(parsedJson['data']),
    );
  }
}

class TypeAccountData {
  int id;
  String name;
  String star;
  String value;
  String transfUser;
  String ted;
  String tedOthers;
  String bolet;
  String depositMoney;
  String depositBtc;
  String cellRecharge;
  String card;
  String monthlyPayment;
  String icon;
  String type;
  String createdAt;
  String updatedAt;

  TypeAccountData({
    this.id,
    this.name,
    this.star,
    this.value,
    this.transfUser,
    this.ted,
    this.tedOthers,
    this.bolet,
    this.depositMoney,
    this.depositBtc,
    this.cellRecharge,
    this.card,
    this.monthlyPayment,
    this.icon,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  factory TypeAccountData.fromJson(Map<String, dynamic> parsedJson){
    return TypeAccountData(
      id: parsedJson['id'],
      name: parsedJson['name'],
      star: parsedJson['star'],
      value: parsedJson['value'],
      transfUser: parsedJson['transf_user'],
      ted: parsedJson['ted'],
      tedOthers: parsedJson['ted_others'],
      bolet: parsedJson['bolet'],
      depositMoney: parsedJson['deposit_money'],
      depositBtc: parsedJson['deposit_btc'],
      cellRecharge: parsedJson['cell_recharge'],
      card: parsedJson['card'],
      monthlyPayment: parsedJson['monthly_payment'],
      icon: parsedJson['icon'],
      type: parsedJson['type'],
      createdAt: parsedJson['created_at'],
      updatedAt: parsedJson['updated_at'],
    );
  }
}

class Balance {
  double real;
  int bitcoin;
  String additional;

  Balance({
    this.real,
    this.bitcoin,
    this.additional,
  });

  factory Balance.fromJson(Map<String, dynamic> parsedJson){
    return Balance(
      real: parsedJson['real'],
      bitcoin: parsedJson['bitcoin'],
      additional: parsedJson['additional'],
    );
  }
}

class Info {
  bool blocked;
  String gender;
  String phone;
  String photo;
  InfoAddress address;
  
  Info({
    this.blocked,
    this.gender,
    this.phone,
    this.photo,
    this.address,
  });

  factory Info.fromJson(Map<String, dynamic> parsedJson){
    return Info(
      blocked: parsedJson['blocked'],
      gender: parsedJson['gender'],
      phone: parsedJson['phone'],
      photo: parsedJson['photo'],
      address: InfoAddress.fromJson(parsedJson['address']),
    );
  }
}

class InfoAddress {
  String country;
  String state;
  String district;
  String number;
  String zipCode;
  String publicPlace;
  String complement;
  String city;
  
  InfoAddress({
    this.country,
    this.state,
    this.district,
    this.number,
    this.zipCode,
    this.publicPlace,
    this.complement,
    this.city,
  });

  factory InfoAddress.fromJson(Map<String, dynamic> parsedJson){
    return InfoAddress(
      country: parsedJson['country'],
      state: parsedJson['state'],
      district: parsedJson['district'],
      number: parsedJson['number'],
      zipCode: parsedJson['zip_code'],
      publicPlace: parsedJson['public_place'],
      complement: parsedJson['complement'],
      city: parsedJson['city'],
    );
  }
}

class Document {
  String type;
  DocumentNotify notify;
  
  Document({
    this.type,
    this.notify,
  });

  factory Document.fromJson(Map<String, dynamic> parsedJson){
    return Document(
      type: parsedJson['type'],
      notify: DocumentNotify.fromJson(parsedJson['notify']),
    );
  }
}

class DocumentNotify {
  bool cnh;
  bool address;
  bool selfie;
  
  DocumentNotify({
    this.cnh,
    this.address,
    this.selfie,
  });

  factory DocumentNotify.fromJson(Map<String, dynamic> parsedJson){
    return DocumentNotify(
      cnh: parsedJson['cnh'],
      address: parsedJson['address'],
      selfie: parsedJson['selfie'],
    );
  }
}

class Security {
  bool googleAuth;
  String secretKey;
  String qrCode;
  
  Security({
    this.googleAuth,
    this.secretKey,
    this.qrCode,
  });

  factory Security.fromJson(Map<String, dynamic> parsedJson){
    return Security(
      googleAuth: parsedJson['google_auth'],
      secretKey: parsedJson['secret_key'],
      qrCode: parsedJson['qr_code'],
    );
  }
}

class Login {
  String lastLog;
  String lastIp;

  Login({
    this.lastLog,
    this.lastIp,
  });

  factory Login.fromJson(Map<String, dynamic> parsedJson){
    return Login(
      lastLog: parsedJson['last_log'],
      lastIp: parsedJson['last_ip'],
    );
  }
}

class Movement {
  String name;
  List<MovementSeries> series;

  Movement({this.name, this.series});

  factory Movement.fromJson(Map<String, dynamic> parsedJson){
    return Movement(
      name: parsedJson['name'],
      series: parsedJson['series'].map((val) => MovementSeries.fromJson(val)).toList().cast<MovementSeries>(),
    );
  }
}

class MovementSeries {
  String name;
  int value;

  MovementSeries({this.name, this.value});

  factory MovementSeries.fromJson(Map<String, dynamic> parsedJson){
    return MovementSeries(
      name: parsedJson['name'],
      value: parsedJson['value'],
    );
  }
}

class MyBanks {
  int main;
  int id;
  String cod;
  String name;
  String agency;
  String account;
  String typeAccount;

  MyBanks({
    this.main,
    this.id,
    this.cod,
    this.name,
    this.agency,
    this.account,
    this.typeAccount,
  });

  factory MyBanks.fromJson(Map<String, dynamic> parsedJson){
    return MyBanks(
      main: parsedJson['main'],
      id: parsedJson['id'],
      cod: parsedJson['cod'],
      name: parsedJson['name'],
      agency: parsedJson['agency'],
      account: parsedJson['account'],
      typeAccount: parsedJson['type_account'],
    );
  }
}