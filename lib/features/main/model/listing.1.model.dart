class Listing1Model {
  List<Products> products;
  List<Regions> regions;
  List<Coverages> coverages;
  List<CovCompr> covCompr;
  List<CovTlo> covTlo;
  List<ManufactureYears> manufactureYears;

  Listing1Model({
    this.products,
    this.regions,
    this.coverages,
    this.covCompr,
    this.covTlo,
    this.manufactureYears,
  });

  Listing1Model.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      // ignore: deprecated_member_use
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
    if (json['regions'] != null) {
      // ignore: deprecated_member_use
      regions = new List<Regions>();
      json['regions'].forEach((v) {
        regions.add(new Regions.fromJson(v));
      });
    }
    if (json['coverages'] != null) {
      // ignore: deprecated_member_use
      coverages = new List<Coverages>();
      json['coverages'].forEach((v) {
        coverages.add(new Coverages.fromJson(v));
      });
    }
    if (json['cov_compr'] != null) {
      // ignore: deprecated_member_use
      covCompr = new List<CovCompr>();
      json['cov_compr'].forEach((v) {
        covCompr.add(new CovCompr.fromJson(v));
      });
    }
    if (json['cov_tlo'] != null) {
      // ignore: deprecated_member_use
      covTlo = new List<CovTlo>();
      json['cov_tlo'].forEach((v) {
        covTlo.add(new CovTlo.fromJson(v));
      });
    }
    if (json['manufacture_years'] != null) {
      // ignore: deprecated_member_use
      manufactureYears = new List<ManufactureYears>();
      json['manufacture_years'].forEach((v) {
        manufactureYears.add(new ManufactureYears.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    if (this.regions != null) {
      data['regions'] = this.regions.map((v) => v.toJson()).toList();
    }
    if (this.coverages != null) {
      data['coverages'] = this.coverages.map((v) => v.toJson()).toList();
    }
    if (this.covCompr != null) {
      data['cov_compr'] = this.covCompr.map((v) => v.toJson()).toList();
    }
    if (this.covTlo != null) {
      data['cov_tlo'] = this.covTlo.map((v) => v.toJson()).toList();
    }
    if (this.manufactureYears != null) {
      data['manufacture_years'] =
          this.manufactureYears.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String description;
  String id;

  Products({this.description, this.id});

  Products.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['id'] = this.id;
    return data;
  }
}

class Regions {
  String description;
  String id;
  String descriptionLong;

  Regions({this.description, this.id, this.descriptionLong});

  Regions.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    descriptionLong = json['description_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['id'] = this.id;
    data['description_long'] = this.descriptionLong;
    return data;
  }
}

class Coverages {
  String description;
  String id;
  String productId;

  Coverages({this.description, this.id, this.productId});

  Coverages.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['id'] = this.id;
    data['product_id'] = this.productId;
    return data;
  }
}

class CovCompr {
  String code;
  String coverageId;
  String description;

  CovCompr({this.code, this.coverageId, this.description});

  CovCompr.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    coverageId = json['coverage_id'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['coverage_id'] = this.coverageId;
    data['description'] = this.description;
    return data;
  }
}

class CovTlo {
  String code;
  String coverageId;
  String description;

  CovTlo({this.code, this.coverageId, this.description});

  CovTlo.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    coverageId = json['coverage_id'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['coverage_id'] = this.coverageId;
    data['description'] = this.description;
    return data;
  }
}

class ManufactureYears {
  String description;
  String id;

  ManufactureYears({this.description, this.id});

  ManufactureYears.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['id'] = this.id;
    return data;
  }
}
