// class Produk {
//   int? id;
//   String? namaBarang;
//   int? harga;
//   int? stok;
//   Supplier? supplier;

//   Produk({this.id, this.namaBarang, this.harga, this.stok, this.supplier});

//   Produk.fromJson(Map<String, dynamic>? json) {
//     id = json?['id'];
//     namaBarang = json?['namaBarang'];
//     harga = json?['harga'];
//     stok = json?['stok'];
//     supplier =
//         json?['supplier'] != null ? Supplier.fromJson(json?['supplier']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['namaBarang'] = namaBarang;
//     data['harga'] = harga;
//     data['stok'] = stok;
//     if (supplier != null) {
//       data['supplier'] = supplier!.toJson();
//     }
//     return data;
//   }
// }

// class Supplier {
//   int? id;
//   String? namaSupplier;
//   String? noTelp;
//   String? alamat;

//   Supplier({this.id, this.namaSupplier, this.noTelp, this.alamat});

//   Supplier.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     namaSupplier = json['namaSupplier'];
//     noTelp = json['noTelp'];
//     alamat = json['alamat'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['namaSupplier'] = namaSupplier;
//     data['noTelp'] = noTelp;
//     data['alamat'] = alamat;
//     return data;
//   }
// }

// To parse this JSON data, do
//
//     final produk = produkFromJson(jsonString);

import 'dart:convert';

Produk produkFromJson(String str) => Produk.fromJson(json.decode(str));

String produkToJson(Produk data) => json.encode(data.toJson());

class Produk {
  Produk({
    this.id,
    this.namaBarang,
    this.harga,
    this.stok,
    this.supplier,
  });

  int? id;
  String? namaBarang;
  double? harga;
  int? stok;
  Supplier? supplier;

  factory Produk.fromJson(Map<String, dynamic> json) => Produk(
        id: json["id"],
        namaBarang: json["namaBarang"],
        harga: json["harga"],
        stok: json["stok"],
        supplier: Supplier.fromJson(json["supplier"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "namaBarang": namaBarang,
        "harga": harga,
        "stok": stok,
        "supplier": supplier!.toJson(),
      };
}

class Supplier {
  Supplier({
    this.id,
    this.namaSupplier,
    this.noTelp,
    this.alamat,
  });

  int? id;
  String? namaSupplier;
  String? noTelp;
  String? alamat;

  factory Supplier.fromJson(Map<String, dynamic> json) => Supplier(
        id: json["id"],
        namaSupplier: json["namaSupplier"],
        noTelp: json["noTelp"],
        alamat: json["alamat"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "namaSupplier": namaSupplier,
        "noTelp": noTelp,
        "alamat": alamat,
      };
}
