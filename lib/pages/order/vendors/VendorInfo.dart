class VendorInfo {
  String id;
  String name;
  String location;
  String serviceTime;
  String status;
  String perKG;

  VendorInfo({
    required this.id,
    required this.name,
    required this.location,
    required this.serviceTime,
    required this.status,
    required this.perKG
  }); // constructor

  VendorInfo.fromJson(Map<String, dynamic> json):
        id = json['id'],
        name = json['name'],
        location = json['location'],
        serviceTime = json['serviceTime'],
        status = json['status'],
        perKG = json['perKG'];


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['location'] = this.location;
    data['serviceTime'] = this.serviceTime;
    data['status'] = this.status;
    data['perKG'] = this.perKG;
    return data;
  }
}