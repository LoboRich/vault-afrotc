class Vehicle < ApplicationRecord
    belongs_to :authorize_route, optional: true
    belongs_to :franchise, optional: true
    has_many :attachments

    enum make: {
        'DAEWOO': 'DAEWOO',
        'FORD': 'FORD',
        'FOTON': 'FOTON',
        'FUSO': 'FUSO',
        'GOLDEN DRAGON': 'GOLDEN DRAGON',
        'HIGER': 'HIGER',
        'HINO': 'HINO',
        'HONDA': 'HONDA',
        'ISUZU': 'ISUZU',
        'KAWASAKI': 'KAWASAKI',
        'KIA': 'KIA',
        'KINGLONG': 'KINGLONG',
        'LEXUS': 'LEXUS',
        'MERCEDEZ BENZ': 'MERCEDEZ BENZ',
        'MITSUBISHI': 'MITSUBISHI',
        'NISSAN': 'NISSAN',
        'RANGE ROVER': 'RANGE ROVER',
        'SUZUKI': 'SUZUKI',
        'TOYOTA': 'TOYOTA',
        'YUTONG': 'YUTONG',
        'ZHONGTONG': 'ZHONGTONG'
    }
    enum classification: {'Private': 'Private', 'For Hire': 'For Hire', 'Logistic': 'Logistic'}
    enum status: {
        'VACANT' => 'VACANT',
        'OPERATING' => 'OPERATING',
        'UNDER REPAIR' => 'UNDER REPAIR',
        'BRANDNEW/TEBBAP' => 'BRANDNEW/TEBBAP',
        'DEMOLISHED' => 'DEMOLISHED',
        'DOWN ENGINE' => 'DOWN ENGINE',
        'DROP' => 'DROP',
        'ENGINE REPAIR' => 'ENGINE REPAIR',
        'RETIRED' => 'RETIRED'
    }
    enum quality_type: {'AIRCON': 'AIRCON', 'NON-AIRCON': 'NON-AIRCON'}
    enum body_type: {
        'ALUMINUM TANKER': 'ALUMINUM TANKER',
        'ALUMINUM VAN': 'ALUMINUM VAN',
        'VAN TRACK': 'VAN TRACK',
        'ALUMINUM WING VAN': 'ALUMINUM WING VAN',
        'BOOM TRUCK': 'BOOM TRUCK',
        'CAB PICK UP': 'CAB PICK UP',
        'CARGO TRUCK DROPSIDE': 'CARGO TRUCK DROPSIDE',
        'CARGO WING VAN TRUCK': 'CARGO WING VAN TRUCK',
        'CARRIER TRUCK': 'CARRIER TRUCK',
        'CLOSED VAN': 'CLOSED VAN',
        'CRAIN': 'CRAIN',
        'PICK UP': 'PICK UP',
        'DROPSIDE TRUCK': 'DROPSIDE TRUCK',
        'DROPSIDE TRUCK WITH BOOM': 'DROPSIDE TRUCK WITH BOOM',
        'DROPSIDE TRUCK WITH CRAIN': 'DROPSIDE TRUCK WITH CRAIN',
        'FLAT BED': 'FLAT BED',
        'FUEL TANKER': 'FUEL TANKER',
        'HATCHBACK': 'HATCHBACK',
        'HEAD': 'HEAD',
        'HIGH SIDE DUMP TRUCK': 'HIGH SIDE DUMP TRUCK',
        'JEEP': 'JEEP',
        'LAND CRUISER': 'LAND CRUISER',
        'MOTORCYCLE': 'MOTORCYCLE',
        'MULTI PURPOSE VAN': 'MULTI PURPOSE VAN',
        'PRIME MOVER': 'PRIME MOVER',
        'SEDAN': 'SEDAN',
        'SELF LOADER TRUCK': 'SELF LOADER TRUCK',
        'SELF LOADER TRUCK WITH BOOM': 'SELF LOADER TRUCK WITH BOOM',
        'STEEL TANKER': 'STEEL TANKER',
        'SUV': 'SUV',
        'TRAILER': 'TRAILER',
        'WAGON': 'WAGON',
        'WATER TRUCK': 'WATER TRUCK',
        'WRECKER': 'WRECKER',
        'WRECKER TRUCK': 'WRECKER TRUCK',
        'BUS': 'BUS',
        'TANK LORRY': 'TANK LORRY'
    }
end
