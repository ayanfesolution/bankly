// To parse this JSON data, do
//
//     final transactionsModelData = transactionsModelDataFromJson(jsonString);

import 'dart:convert';

List<TransactionsModelData> transactionsModelDataFromJson(String str) => List<TransactionsModelData>.from(json.decode(str).map((x) => TransactionsModelData.fromJson(x)));

String transactionsModelDataToJson(List<TransactionsModelData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransactionsModelData {
    String? trnAmount;
    String? trnCounterPartyService;
    DateTime? trnDate;
    String? trnCounterpartyBankCode;
    String? trnContractReference;
    String? trnPaymentReference;
    String? trnCounterPartyReference;
    String? logourl;
    TrnDrCr? trnDrCr;
    String? accountNumber;
    String? accountName;
    String? counterPartyAccountNumber;
    String? counterPartyAccountName;
    String? journalNarration;
    String? trnCounterPartyBankName;
    String? ftCounterPartySwitchCode;
    String? trnNarration;
    String? source;
    String? bankCode;
    String? branchCode;
    String? maker;
    String? checker;
    String? bankName;
    String? trnId;

    TransactionsModelData({
        this.trnAmount,
        this.trnCounterPartyService,
        this.trnDate,
        this.trnCounterpartyBankCode,
        this.trnContractReference,
        this.trnPaymentReference,
        this.trnCounterPartyReference,
        this.logourl,
        this.trnDrCr,
        this.accountNumber,
        this.accountName,
        this.counterPartyAccountNumber,
        this.counterPartyAccountName,
        this.journalNarration,
        this.trnCounterPartyBankName,
        this.ftCounterPartySwitchCode,
        this.trnNarration,
        this.source,
        this.bankCode,
        this.branchCode,
        this.maker,
        this.checker,
        this.bankName,
        this.trnId,
    });

    factory TransactionsModelData.fromJson(Map<String, dynamic> json) => TransactionsModelData(
        trnAmount: json["trnAmount"],
        trnCounterPartyService: json["trnCounterPartyService"],
        trnDate: json["trnDate"] == null ? null : DateTime.parse(json["trnDate"]),
        trnCounterpartyBankCode: json["trnCounterpartyBankCode"],
        trnContractReference: json["trnContractReference"],
        trnPaymentReference: json["trnPaymentReference"],
        trnCounterPartyReference: json["trnCounterPartyReference"],
        logourl: json["logourl"],
        trnDrCr: trnDrCrValues.map[json["trnDrCr"]]!,
        accountNumber: json["accountNumber"],
        accountName: json["accountName"],
        counterPartyAccountNumber: json["counterPartyAccountNumber"],
        counterPartyAccountName: json["counterPartyAccountName"],
        journalNarration: json["journalNarration"],
        trnCounterPartyBankName: json["trnCounterPartyBankName"],
        ftCounterPartySwitchCode: json["ftCounterPartySwitchCode"],
        trnNarration: json["trnNarration"],
        source: json["source"],
        bankCode: json["bankCode"],
        branchCode: json["branchCode"],
        maker: json["maker"],
        checker: json["checker"],
        bankName: json["bankName"],
        trnId: json["trnId"],
    );

    Map<String, dynamic> toJson() => {
        "trnAmount": trnAmount,
        "trnCounterPartyService": trnCounterPartyService,
        "trnDate": trnDate?.toIso8601String(),
        "trnCounterpartyBankCode": trnCounterpartyBankCode,
        "trnContractReference": trnContractReference,
        "trnPaymentReference": trnPaymentReference,
        "trnCounterPartyReference": trnCounterPartyReference,
        "logourl": logourl,
        "trnDrCr": trnDrCrValues.reverse[trnDrCr],
        "accountNumber": accountNumber,
        "accountName": accountName,
        "counterPartyAccountNumber": counterPartyAccountNumber,
        "counterPartyAccountName": counterPartyAccountName,
        "journalNarration": journalNarration,
        "trnCounterPartyBankName": trnCounterPartyBankName,
        "ftCounterPartySwitchCode": ftCounterPartySwitchCode,
        "trnNarration": trnNarration,
        "source": source,
        "bankCode": bankCode,
        "branchCode": branchCode,
        "maker": maker,
        "checker": checker,
        "bankName": bankName,
        "trnId": trnId,
    };
}

enum TrnDrCr { INVOICE, DEPOSIT, WITHDRAWAL, PAYMENT }

final trnDrCrValues = EnumValues({
    "deposit": TrnDrCr.DEPOSIT,
    "invoice": TrnDrCr.INVOICE,
    "payment": TrnDrCr.PAYMENT,
    "withdrawal": TrnDrCr.WITHDRAWAL
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
