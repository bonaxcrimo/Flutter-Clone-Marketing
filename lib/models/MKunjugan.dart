class MKunjungan {
  String fNShipper;
  String fJabatan;
  String fLokasi;
  String fRangeWaktu;
  String fMemo;
  String fTTD;
  int fAktif;
  String fUserID;
  FTglInput fTglInput;
  String fLongitude;
  String fLatitude;
  String total;
  String pic;

  MKunjungan(
      {this.fNShipper,
      this.fJabatan,
      this.fLokasi,
      this.fRangeWaktu,
      this.fMemo,
      this.fTTD,
      this.fAktif,
      this.fUserID,
      this.fTglInput,
      this.fLongitude,
      this.fLatitude,
      this.total,
      this.pic});

  MKunjungan.fromJson(Map<String, dynamic> json) {
    fNShipper = json['FNShipper'];
    fJabatan = json['FJabatan'];
    fLokasi = json['FLokasi'];
    fRangeWaktu = json['FRangeWaktu'];
    fMemo = json['FMemo'];
    fTTD = json['FTTD'];
    fAktif = json['FAktif'];
    fUserID = json['FUserID'];
    fTglInput = json['FTglInput'] != null
        ? new FTglInput.fromJson(json['FTglInput'])
        : null;
    fLongitude = json['FLongitude'];
    fLatitude = json['FLatitude'];
    total = json['Total'];
    pic = json['Pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FNShipper'] = this.fNShipper;
    data['FJabatan'] = this.fJabatan;
    data['FLokasi'] = this.fLokasi;
    data['FRangeWaktu'] = this.fRangeWaktu;
    data['FMemo'] = this.fMemo;
    data['FTTD'] = this.fTTD;
    data['FAktif'] = this.fAktif;
    data['FUserID'] = this.fUserID;
    if (this.fTglInput != null) {
      data['FTglInput'] = this.fTglInput.toJson();
    }
    data['FLongitude'] = this.fLongitude;
    data['FLatitude'] = this.fLatitude;
    data['Total'] = this.total;
    data['Pic'] = this.pic;
    return data;
  }
}

class FTglInput {
  String date;
  int timezoneType;
  String timezone;

  FTglInput({this.date, this.timezoneType, this.timezone});

  FTglInput.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    timezoneType = json['timezone_type'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['timezone_type'] = this.timezoneType;
    data['timezone'] = this.timezone;
    return data;
  }
}
