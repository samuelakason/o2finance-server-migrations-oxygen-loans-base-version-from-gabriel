class RealEstateDetailModel {
  RealEstateDetailModel({
    required this.data,
    required this.message,
    required this.status,
  });

  final Data? data;
  final String? message;
  final bool? status;

  factory RealEstateDetailModel.fromJson(Map<String, dynamic> json) {
    return RealEstateDetailModel(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      message: json["message"],
      status: json["status"],
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
        "status": status,
      };
}

class Data {
  Data({
    required this.propertyId,
    required this.propertyType,
    required this.propertyTitle,
    required this.propertyDescription,
    required this.propertyCountry,
    required this.propertyState,
    required this.propertyCity,
    required this.propertyListingType,
    required this.propertyCost,
    required this.propertyLandArea,
    required this.propertyThumbnail,
    required this.propertyImages,
    required this.propertyMapLocation,
    required this.numberOfBedrooms,
    required this.numberOfBathRooms,
    required this.amenities,
    required this.built,
    required this.condition,
    required this.furnished,
  });

  final int? propertyId;
  final String? propertyType;
  final String? propertyTitle;
  final String? propertyDescription;
  final String? propertyCountry;
  final String? propertyState;
  final String? propertyCity;
  final String? propertyListingType;
  final String? propertyCost;
  final dynamic propertyLandArea;
  final String? propertyThumbnail;
  final List<PropertyImage> propertyImages;
  final dynamic propertyMapLocation;
  final int? numberOfBedrooms;
  final int? numberOfBathRooms;
  final String? amenities;
  final String? built;
  final String? condition;
  final String? furnished;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      propertyId: json["propertyId"],
      propertyType: json["propertyType"],
      propertyTitle: json["propertyTitle"],
      propertyDescription: json["propertyDescription"],
      propertyCountry: json["propertyCountry"],
      propertyState: json["propertyState"],
      propertyCity: json["propertyCity"],
      propertyListingType: json["propertyListingType"],
      propertyCost: json["propertyCost"],
      propertyLandArea: json["propertyLandArea"],
      propertyThumbnail: json["propertyThumbnail"],
      propertyImages: json["propertyImages"] == null
          ? []
          : List<PropertyImage>.from(
              json["propertyImages"]!.map((x) => PropertyImage.fromJson(x))),
      propertyMapLocation: json["propertyMapLocation"],
      numberOfBedrooms: json["numberOfBedrooms"],
      numberOfBathRooms: json["numberOfBathRooms"],
      amenities: json["amenities"],
      built: json["built"],
      condition: json["condition"],
      furnished: json["furnished"],
    );
  }

  Map<String, dynamic> toJson() => {
        "propertyId": propertyId,
        "propertyType": propertyType,
        "propertyTitle": propertyTitle,
        "propertyDescription": propertyDescription,
        "propertyCountry": propertyCountry,
        "propertyState": propertyState,
        "propertyCity": propertyCity,
        "propertyListingType": propertyListingType,
        "propertyCost": propertyCost,
        "propertyLandArea": propertyLandArea,
        "propertyThumbnail": propertyThumbnail,
        "propertyImages": propertyImages.map((x) => x?.toJson()).toList(),
        "propertyMapLocation": propertyMapLocation,
        "numberOfBedrooms": numberOfBedrooms,
        "numberOfBathRooms": numberOfBathRooms,
        "amenities": amenities,
        "built": built,
        "condition": condition,
        "furnished": furnished,
      };
}

class PropertyImage {
  PropertyImage({
    required this.imageId,
    required this.imageUrl,
  });

  final int? imageId;
  final String? imageUrl;

  factory PropertyImage.fromJson(Map<String, dynamic> json) {
    return PropertyImage(
      imageId: json["imageId"],
      imageUrl: json["imageUrl"],
    );
  }

  Map<String, dynamic> toJson() => {
        "imageId": imageId,
        "imageUrl": imageUrl,
      };
}
