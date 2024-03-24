import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Property extends Equatable {
  final String id;
  final String description;
  final String propertyType;
  final String roomType;
  final double pricePerNight;
  final String country;
  final String city;
  final int maxGuests;
  final List<String> amenities;
  final String mainPhotoUrl;
  final List<String> photoUrls;

  const Property({
    required this.id,
    required this.description,
    required this.propertyType,
    required this.roomType,
    required this.pricePerNight,
    required this.country,
    required this.city,
    required this.maxGuests,
    required this.amenities,
    required this.mainPhotoUrl,
    required this.photoUrls,
  });

  @override
  List<Object?> get props => [
        id,
        description,
        propertyType,
        roomType,
        pricePerNight,
        country,
        city,
        maxGuests,
        amenities,
        mainPhotoUrl,
        photoUrls
      ];

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'] ?? const Uuid().v4(),
      description: json['description'] ?? '',
      propertyType: json['propertyType'] ?? '',
      roomType: json['roomType'] ?? '',
      pricePerNight: json['pricePerNight'] ?? 0.0,
      country: json['country'] ?? '',
      city: json['city'] ?? '',
      maxGuests: json['maxGuests'] ?? 0,
      amenities:
          json['amenities'] != null ? List<String>.from(json['amenities']) : [],
      mainPhotoUrl: json['mainPhotoUrl'] ??
          'https://source.unsplash.com/random/?property',
      photoUrls:
          json['photoUrls'] != null ? List<String>.from(json['photoUrls']) : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'propertyType': propertyType,
      'roomType': roomType,
      'pricePerNight': pricePerNight,
      'country': country,
      'city': city,
      'maxGuests': maxGuests,
      'amenities': amenities,
      'mainPhotoUrl': mainPhotoUrl,
      'photoUrls': photoUrls,
    };
  }

  static List<Property> sampleData = [
    Property(
      id: const Uuid().v4(),
      description: 'Beautiful villa with private pool',
      propertyType: 'Villa',
      roomType: 'Entire place',
      pricePerNight: 2000.0,
      country: 'maadi',
      city: 'cairo',
      maxGuests: 8,
      amenities: const ['Wi-Fi', 'Kitchen', 'Air conditioning'],
      mainPhotoUrl: 'https://source.unsplash.com/random/?villa',
      photoUrls: const [
        'https://source.unsplash.com/random/?pool',
        'https://source.unsplash.com/random/?bedroom'
      ],
    ),
    Property(
      id: const Uuid().v4(),
      description: 'Beautiful apartment in the heart of the nile',
      propertyType: 'Apartment',
      roomType: 'Entire place',
      pricePerNight: 1000.0,
      country: 'zamalik',
      city: 'cairo',
      maxGuests: 4,
      amenities: const ['Wi-Fi', 'Kitchen', 'Air conditioning'],
      mainPhotoUrl: 'https://source.unsplash.com/random/?apartment',
      photoUrls: const [
        'https://source.unsplash.com/random/?livingroom',
        'https://source.unsplash.com/random/?bedroom'
      ],
    ),
  ];
}

class PropertyCard extends StatelessWidget {
  final Property property;
  final VoidCallback onWishlistPressed;

  const PropertyCard({
    Key? key,
    required this.property,
    required this.onWishlistPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            property.mainPhotoUrl,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  property.description,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  '${property.roomType} - ${property.propertyType}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Price per night: \$${property.pricePerNight.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Max Guests: ${property.maxGuests}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Row(
                  children: property.amenities
                      .map((amenity) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Chip(label: Text(amenity)),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Implement your logic here when the button is clicked
                      },
                      child: const Text('Add to fav'),
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: onWishlistPressed,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
