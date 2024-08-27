-- Deploy dvdrental:data/address-data-load-into-json_imports to pg
-- requires: dsaschema
-- requires: tables/json_imports

BEGIN;

TRUNCATE TABLE dsa.json_imports;
INSERT INTO dsa.json_imports (val) VALUES
    ('{
        "city_name": "London",
        "house_number": "221B",
        "street_name": "Baker Street",
        "suburb_name": "Marylebone",
        "county_name": "Greater London",
        "postal_code": "NW1 6XE"
    }'),
    ('{
        "city_name": "London",
        "house_number": "10",
        "street_name": "Downing Street",
        "suburb_name": "Westminster",
        "county_name": "Greater London",
        "postal_code": "SW1A 2AA"
    }'),
    ('{
        "city_name": "Manchester",
        "house_number": "15",
        "street_name": "Deansgate",
        "suburb_name": "Castlefield",
        "county_name": "Greater Manchester",
        "postal_code": "M3 4FN"
    }'),
    ('{
        "city_name": "Manchester",
        "house_number": "20",
        "street_name": "Oldham Street",
        "suburb_name": "Northern Quarter",
        "county_name": "Greater Manchester",
        "postal_code": "M1 1JQ"
    }'),
    ('{
        "city_name": "Birmingham",
        "house_number": "42",
        "street_name": "Broad Street",
        "suburb_name": "Five Ways",
        "county_name": "West Midlands",
        "postal_code": "B1 2HP"
    }'),
    ('{
        "city_name": "Birmingham",
        "house_number": "18",
        "street_name": "Corporation Street",
        "suburb_name": "City Centre",
        "county_name": "West Midlands",
        "postal_code": "B2 4LS"
    }'),
    ('{
        "city_name": "Liverpool",
        "house_number": "9",
        "street_name": "Albert Dock",
        "suburb_name": "Riverside",
        "county_name": "Merseyside",
        "postal_code": "L3 4AF"
    }'),
    ('{
        "city_name": "Liverpool",
        "house_number": "30",
        "street_name": "Bold Street",
        "suburb_name": "City Centre",
        "county_name": "Merseyside",
        "postal_code": "L1 4DS"
    }'),
    ('{
        "city_name": "Glasgow",
        "house_number": "12",
        "street_name": "Argyle Street",
        "suburb_name": "Merchant City",
        "county_name": "Glasgow City",
        "postal_code": "G2 8AA"
    }'),
    ('{
        "city_name": "Glasgow",
        "house_number": "50",
        "street_name": "Sauchiehall Street",
        "suburb_name": "City Centre",
        "county_name": "Glasgow City",
        "postal_code": "G2 3LG"
    }'),
    ('{
        "city_name": "Edinburgh",
        "house_number": "18",
        "street_name": "Princes Street",
        "suburb_name": "New Town",
        "county_name": "City of Edinburgh",
        "postal_code": "EH2 2AN"
    }'),
    ('{
        "city_name": "Edinburgh",
        "house_number": "7",
        "street_name": "Royal Mile",
        "suburb_name": "Old Town",
        "county_name": "City of Edinburgh",
        "postal_code": "EH1 1RE"
    }'),
    ('{
        "city_name": "Bristol",
        "house_number": "28",
        "street_name": "Queen Square",
        "suburb_name": "Harbourside",
        "county_name": "Bristol",
        "postal_code": "BS1 4ND"
    }'),
    ('{
        "city_name": "Bristol",
        "house_number": "16",
        "street_name": "Clifton Down",
        "suburb_name": "Clifton",
        "county_name": "Bristol",
        "postal_code": "BS8 3LG"
    }'),
    ('{
        "city_name": "Leeds",
        "house_number": "7",
        "street_name": "Park Row",
        "suburb_name": "City Centre",
        "county_name": "West Yorkshire",
        "postal_code": "LS1 5HD"
    }'),
    ('{
        "city_name": "Leeds",
        "house_number": "25",
        "street_name": "Briggate",
        "suburb_name": "City Centre",
        "county_name": "West Yorkshire",
        "postal_code": "LS1 6LY"
    }'),
    ('{
        "city_name": "Sheffield",
        "house_number": "33",
        "street_name": "Ecclesall Road",
        "suburb_name": "Sharrow",
        "county_name": "South Yorkshire",
        "postal_code": "S11 8PE"
    }'),
    ('{
        "city_name": "Sheffield",
        "house_number": "45",
        "street_name": "Fargate",
        "suburb_name": "City Centre",
        "county_name": "South Yorkshire",
        "postal_code": "S1 2HD"
    }'),
    ('{
        "city_name": "Newcastle",
        "house_number": "45",
        "street_name": "Grey Street",
        "suburb_name": "Grainger Town",
        "county_name": "Tyne and Wear",
        "postal_code": "NE1 6EE"
    }'),
    ('{
        "city_name": "Newcastle",
        "house_number": "55",
        "street_name": "Quayside",
        "suburb_name": "Ouseburn",
        "county_name": "Tyne and Wear",
        "postal_code": "NE1 3DE"
    }'),
    ('{
        "city_name": "London",
        "house_number": "73",
        "street_name": "King''s Road",
        "suburb_name": "Chelsea",
        "county_name": "Greater London",
        "postal_code": "SW3 4NT"
    }'),
    ('{
        "city_name": "London",
        "house_number": "4",
        "street_name": "Pall Mall",
        "suburb_name": "St James''s",
        "county_name": "Greater London",
        "postal_code": "SW1Y 5ER"
    }'),
    ('{
        "city_name": "Manchester",
        "house_number": "50",
        "street_name": "Oxford Road",
        "suburb_name": "City Centre",
        "county_name": "Greater Manchester",
        "postal_code": "M1 5QS"
    }'),
    ('{
        "city_name": "Manchester",
        "house_number": "100",
        "street_name": "Portland Street",
        "suburb_name": "City Centre",
        "county_name": "Greater Manchester",
        "postal_code": "M1 4WB"
    }'),
    ('{
        "city_name": "Birmingham",
        "house_number": "29",
        "street_name": "New Street",
        "suburb_name": "City Centre",
        "county_name": "West Midlands",
        "postal_code": "B2 4RQ"
    }'),
    ('{
        "city_name": "Birmingham",
        "house_number": "3",
        "street_name": "Colmore Row",
        "suburb_name": "City Centre",
        "county_name": "West Midlands",
        "postal_code": "B3 2BJ"
    }'),
    ('{
        "city_name": "Liverpool",
        "house_number": "60",
        "street_name": "Dale Street",
        "suburb_name": "City Centre",
        "county_name": "Merseyside",
        "postal_code": "L2 2JD"
    }'),
    ('{
        "city_name": "Liverpool",
        "house_number": "8",
        "street_name": "Water Street",
        "suburb_name": "Business District",
        "county_name": "Merseyside",
        "postal_code": "L2 0RD"
    }'),
    ('{
        "city_name": "Glasgow",
        "house_number": "15",
        "street_name": "Buchanan Street",
        "suburb_name": "City Centre",
        "county_name": "Glasgow City",
        "postal_code": "G1 3HL"
    }'),
    ('{
        "city_name": "Glasgow",
        "house_number": "2",
        "street_name": "Queen Street",
        "suburb_name": "City Centre",
        "county_name": "Glasgow City",
        "postal_code": "G1 3BX"
    }'),
    ('{
        "city_name": "Edinburgh",
        "house_number": "12",
        "street_name": "George Street",
        "suburb_name": "New Town",
        "county_name": "City of Edinburgh",
        "postal_code": "EH2 4YN"
    }'),
    ('{
        "city_name": "Edinburgh",
        "house_number": "5",
        "street_name": "Victoria Street",
        "suburb_name": "Old Town",
        "county_name": "City of Edinburgh",
        "postal_code": "EH1 2HE"
    }'),
    ('{
        "city_name": "Bristol",
        "house_number": "22",
        "street_name": "Park Street",
        "suburb_name": "City Centre",
        "county_name": "Bristol",
        "postal_code": "BS1 5JA"
    }'),
    ('{
        "city_name": "Bristol",
        "house_number": "11",
        "street_name": "Whiteladies Road",
        "suburb_name": "Clifton",
        "county_name": "Bristol",
        "postal_code": "BS8 2NA"
    }'),
    ('{
        "city_name": "Leeds",
        "house_number": "85",
        "street_name": "The Headrow",
        "suburb_name": "City Centre",
        "county_name": "West Yorkshire",
        "postal_code": "LS1 5JW"
    }'),
    ('{
        "city_name": "Leeds",
        "house_number": "3",
        "street_name": "Albion Street",
        "suburb_name": "City Centre",
        "county_name": "West Yorkshire",
        "postal_code": "LS1 5AT"
    }'),
    ('{
        "city_name": "Sheffield",
        "house_number": "12",
        "street_name": "Pinstone Street",
        "suburb_name": "City Centre",
        "county_name": "South Yorkshire",
        "postal_code": "S1 2HN"
    }'),
    ('{
        "city_name": "Sheffield",
        "house_number": "36",
        "street_name": "West Street",
        "suburb_name": "City Centre",
        "county_name": "South Yorkshire",
        "postal_code": "S1 4EX"
    }'),
    ('{
        "city_name": "Newcastle",
        "house_number": "18",
        "street_name": "St James'' Boulevard",
        "suburb_name": "City Centre",
        "county_name": "Tyne and Wear",
        "postal_code": "NE1 4EP"
    }'),
    ('{
        "city_name": "Newcastle",
        "house_number": "6",
        "street_name": "Mosley Street",
        "suburb_name": "City Centre",
        "county_name": "Tyne and Wear",
        "postal_code": "NE1 1DE"
    }'),
    ('{
        "city_name": "London",
        "house_number": "1",
        "street_name": "Regent Street",
        "suburb_name": "West End",
        "county_name": "Greater London",
        "postal_code": "W1B 2EL"
    }'),
    ('{
        "city_name": "London",
        "house_number": "10",
        "street_name": "Savile Row",
        "suburb_name": "Mayfair",
        "county_name": "Greater London",
        "postal_code": "W1S 3PF"
    }'),
    ('{
        "city_name": "Manchester",
        "house_number": "40",
        "street_name": "Deansgate",
        "suburb_name": "City Centre",
        "county_name": "Greater Manchester",
        "postal_code": "M3 2EG"
    }'),
    ('{
        "city_name": "Manchester",
        "house_number": "60",
        "street_name": "King Street",
        "suburb_name": "City Centre",
        "county_name": "Greater Manchester",
        "postal_code": "M2 4LZ"
    }'),
    ('{
        "city_name": "Birmingham",
        "house_number": "22",
        "street_name": "Holloway Circus",
        "suburb_name": "City Centre",
        "county_name": "West Midlands",
        "postal_code": "B1 1BT"
    }'),
    ('{
        "city_name": "Birmingham",
        "house_number": "5",
        "street_name": "St Philip''s Place",
        "suburb_name": "City Centre",
        "county_name": "West Midlands",
        "postal_code": "B3 2PP"
    }'),
    ('{
        "city_name": "Liverpool",
        "house_number": "40",
        "street_name": "Castle Street",
        "suburb_name": "City Centre",
        "county_name": "Merseyside",
        "postal_code": "L2 7LA"
    }'),
    ('{
        "city_name": "Liverpool",
        "house_number": "10",
        "street_name": "Hope Street",
        "suburb_name": "Georgian Quarter",
        "county_name": "Merseyside",
        "postal_code": "L1 9DA"
    }'),
    ('{
        "city_name": "New York",
        "house_number": "350",
        "street_name": "Fifth Avenue",
        "suburb_name": "Midtown",
        "county_name": "New York County",
        "postal_code": "10018"
    }'),
    ('{
        "city_name": "New York",
        "house_number": "1600",
        "street_name": "Broadway",
        "suburb_name": "Times Square",
        "county_name": "New York County",
        "postal_code": "10019"
    }'),
    ('{
        "city_name": "Los Angeles",
        "house_number": "6801",
        "street_name": "Hollywood Boulevard",
        "suburb_name": "Hollywood",
        "county_name": "Los Angeles County",
        "postal_code": "90028"
    }'),
    ('{
        "city_name": "Los Angeles",
        "house_number": "333",
        "street_name": "South Grand Avenue",
        "suburb_name": "Downtown",
        "county_name": "Los Angeles County",
        "postal_code": "90071"
    }'),
    ('{
        "city_name": "Chicago",
        "house_number": "233",
        "street_name": "South Wacker Drive",
        "suburb_name": "The Loop",
        "county_name": "Cook County",
        "postal_code": "60606"
    }'),
    ('{
        "city_name": "Chicago",
        "house_number": "875",
        "street_name": "North Michigan Avenue",
        "suburb_name": "Magnificent Mile",
        "county_name": "Cook County",
        "postal_code": "60611"
    }'),
    ('{
        "city_name": "Houston",
        "house_number": "910",
        "street_name": "Louisiana Street",
        "suburb_name": "Downtown",
        "county_name": "Harris County",
        "postal_code": "77002"
    }'),
    ('{
        "city_name": "Houston",
        "house_number": "1600",
        "street_name": "Smith Street",
        "suburb_name": "Midtown",
        "county_name": "Harris County",
        "postal_code": "77002"
    }'),
    ('{
        "city_name": "Phoenix",
        "house_number": "401",
        "street_name": "East Jefferson Street",
        "suburb_name": "Downtown",
        "county_name": "Maricopa County",
        "postal_code": "85004"
    }'),
    ('{
        "city_name": "Phoenix",
        "house_number": "3300",
        "street_name": "North Central Avenue",
        "suburb_name": "Midtown",
        "county_name": "Maricopa County",
        "postal_code": "85012"
    }'),
    ('{
        "city_name": "Philadelphia",
        "house_number": "1500",
        "street_name": "Market Street",
        "suburb_name": "Center City",
        "county_name": "Philadelphia County",
        "postal_code": "19102"
    }'),
    ('{
        "city_name": "Philadelphia",
        "house_number": "600",
        "street_name": "Chestnut Street",
        "suburb_name": "Old City",
        "county_name": "Philadelphia County",
        "postal_code": "19106"
    }'),
    ('{
        "city_name": "San Antonio",
        "house_number": "300",
        "street_name": "Alamo Plaza",
        "suburb_name": "Downtown",
        "county_name": "Bexar County",
        "postal_code": "78205"
    }'),
    ('{
        "city_name": "San Antonio",
        "house_number": "600",
        "street_name": "East Market Street",
        "suburb_name": "River Walk",
        "county_name": "Bexar County",
        "postal_code": "78205"
    }'),
    ('{
        "city_name": "San Diego",
        "house_number": "100",
        "street_name": "Park Boulevard",
        "suburb_name": "Downtown",
        "county_name": "San Diego County",
        "postal_code": "92101"
    }'),
    ('{
        "city_name": "San Diego",
        "house_number": "500",
        "street_name": "West Broadway",
        "suburb_name": "Gaslamp Quarter",
        "county_name": "San Diego County",
        "postal_code": "92101"
    }'),
    ('{
        "city_name": "Dallas",
        "house_number": "400",
        "street_name": "South Lamar Street",
        "suburb_name": "Downtown",
        "county_name": "Dallas County",
        "postal_code": "75202"
    }'),
    ('{
        "city_name": "Dallas",
        "house_number": "2323",
        "street_name": "North Field Street",
        "suburb_name": "Arts District",
        "county_name": "Dallas County",
        "postal_code": "75201"
    }'),
    ('{
        "city_name": "San Jose",
        "house_number": "170",
        "street_name": "West San Carlos Street",
        "suburb_name": "Downtown",
        "county_name": "Santa Clara County",
        "postal_code": "95113"
    }'),
    ('{
        "city_name": "San Jose",
        "house_number": "300",
        "street_name": "South First Street",
        "suburb_name": "SoFA District",
        "county_name": "Santa Clara County",
        "postal_code": "95113"
    }'),
    ('{
        "city_name": "New York",
        "house_number": "20",
        "street_name": "West 34th Street",
        "suburb_name": "Herald Square",
        "county_name": "New York County",
        "postal_code": "10118"
    }'),
    ('{
        "city_name": "New York",
        "house_number": "100",
        "street_name": "Wall Street",
        "suburb_name": "Financial District",
        "county_name": "New York County",
        "postal_code": "10005"
    }'),
    ('{
        "city_name": "Los Angeles",
        "house_number": "200",
        "street_name": "South Spring Street",
        "suburb_name": "Downtown",
        "county_name": "Los Angeles County",
        "postal_code": "90012"
    }'),
    ('{
        "city_name": "Los Angeles",
        "house_number": "8401",
        "street_name": "West Sunset Boulevard",
        "suburb_name": "West Hollywood",
        "county_name": "Los Angeles County",
        "postal_code": "90069"
    }'),
    ('{
        "city_name": "Chicago",
        "house_number": "500",
        "street_name": "North Michigan Avenue",
        "suburb_name": "Magnificent Mile",
        "county_name": "Cook County",
        "postal_code": "60611"
    }'),
    ('{
        "city_name": "Chicago",
        "house_number": "600",
        "street_name": "West Chicago Avenue",
        "suburb_name": "River North",
        "county_name": "Cook County",
        "postal_code": "60654"
    }'),
    ('{
        "city_name": "Houston",
        "house_number": "800",
        "street_name": "Bagby Street",
        "suburb_name": "Midtown",
        "county_name": "Harris County",
        "postal_code": "77002"
    }'),
    ('{
        "city_name": "Houston",
        "house_number": "2900",
        "street_name": "West Dallas Street",
        "suburb_name": "Montrose",
        "county_name": "Harris County",
        "postal_code": "77019"
    }'),
    ('{
        "city_name": "Phoenix",
        "house_number": "1000",
        "street_name": "North Central Avenue",
        "suburb_name": "Midtown",
        "county_name": "Maricopa County",
        "postal_code": "85012"
    }'),
    ('{
        "city_name": "Phoenix",
        "house_number": "700",
        "street_name": "East Jefferson Street",
        "suburb_name": "Downtown",
        "county_name": "Maricopa County",
        "postal_code": "85034"
    }'),
    ('{
        "city_name": "Philadelphia",
        "house_number": "200",
        "street_name": "South Broad Street",
        "suburb_name": "Center City",
        "county_name": "Philadelphia County",
        "postal_code": "19107"
    }'),
    ('{
        "city_name": "Philadelphia",
        "house_number": "300",
        "street_name": "North 15th Street",
        "suburb_name": "Logan Square",
        "county_name": "Philadelphia County",
        "postal_code": "19102"
    }'),
    ('{
        "city_name": "San Antonio",
        "house_number": "400",
        "street_name": "East Houston Street",
        "suburb_name": "Downtown",
        "county_name": "Bexar County",
        "postal_code": "78205"
    }'),
    ('{
        "city_name": "San Antonio",
        "house_number": "200",
        "street_name": "South Alamo Street",
        "suburb_name": "La Villita",
        "county_name": "Bexar County",
        "postal_code": "78205"
    }'),
    ('{
        "city_name": "San Diego",
        "house_number": "200",
        "street_name": "Harbor Drive",
        "suburb_name": "Embarcadero",
        "county_name": "San Diego County",
        "postal_code": "92101"
    }'),
    ('{
        "city_name": "San Diego",
        "house_number": "600",
        "street_name": "West G Street",
        "suburb_name": "Little Italy",
        "county_name": "San Diego County",
        "postal_code": "92101"
    }'),
    ('{
        "city_name": "Dallas",
        "house_number": "1100",
        "street_name": "Commerce Street",
        "suburb_name": "Downtown",
        "county_name": "Dallas County",
        "postal_code": "75202"
    }'),
    ('{
        "city_name": "Dallas",
        "house_number": "4000",
        "street_name": "McKinney Avenue",
        "suburb_name": "Uptown",
        "county_name": "Dallas County",
        "postal_code": "75204"
    }'),
    ('{
        "city_name": "San Jose",
        "house_number": "100",
        "street_name": "North Almaden Boulevard",
        "suburb_name": "Downtown",
        "county_name": "Santa Clara County",
        "postal_code": "95110"
    }'),
    ('{
        "city_name": "San Jose",
        "house_number": "250",
        "street_name": "South Market Street",
        "suburb_name": "SoFA District",
        "county_name": "Santa Clara County",
        "postal_code": "95113"
    }'),
    ('{
        "city_name": "New York",
        "house_number": "100",
        "street_name": "Central Park South",
        "suburb_name": "Midtown",
        "county_name": "New York County",
        "postal_code": "10019"
    }'),
    ('{
        "city_name": "New York",
        "house_number": "200",
        "street_name": "Madison Avenue",
        "suburb_name": "Midtown",
        "county_name": "New York County",
        "postal_code": "10016"
    }'),
    ('{
        "city_name": "Los Angeles",
        "house_number": "100",
        "street_name": "North Los Angeles Street",
        "suburb_name": "Chinatown",
        "county_name": "Los Angeles County",
        "postal_code": "90012"
    }'),
    ('{
        "city_name": "Los Angeles",
        "house_number": "200",
        "street_name": "South Grand Avenue",
        "suburb_name": "Downtown",
        "county_name": "Los Angeles County",
        "postal_code": "90012"
    }'),
    ('{
        "city_name": "Chicago",
        "house_number": "100",
        "street_name": "East Randolph Street",
        "suburb_name": "The Loop",
        "county_name": "Cook County",
        "postal_code": "60601"
    }'),
    ('{
        "city_name": "Chicago",
        "house_number": "200",
        "street_name": "North State Street",
        "suburb_name": "River North",
        "county_name": "Cook County",
        "postal_code": "60601"
    }'),
    ('{
        "city_name": "Houston",
        "house_number": "100",
        "street_name": "Louisiana Street",
        "suburb_name": "Downtown",
        "county_name": "Harris County",
        "postal_code": "77002"
    }'),
    ('{
        "city_name": "Houston",
        "house_number": "200",
        "street_name": "Smith Street",
        "suburb_name": "Downtown",
        "county_name": "Harris County",
        "postal_code": "77002"
    }'),
    ('{
        "city_name": "Sydney",
        "house_number": "1",
        "street_name": "Macquarie Street",
        "suburb_name": "Sydney CBD",
        "county_name": "New South Wales",
        "postal_code": "2000"
    }'),
    ('{
        "city_name": "Sydney",
        "house_number": "101",
        "street_name": "George Street",
        "suburb_name": "The Rocks",
        "county_name": "New South Wales",
        "postal_code": "2000"
    }'),
    ('{
        "city_name": "Melbourne",
        "house_number": "350",
        "street_name": "Collins Street",
        "suburb_name": "Melbourne CBD",
        "county_name": "Victoria",
        "postal_code": "3000"
    }'),
    ('{
        "city_name": "Melbourne",
        "house_number": "12",
        "street_name": "Flinders Street",
        "suburb_name": "Melbourne CBD",
        "county_name": "Victoria",
        "postal_code": "3000"
    }'),
    ('{
        "city_name": "Brisbane",
        "house_number": "400",
        "street_name": "George Street",
        "suburb_name": "Brisbane CBD",
        "county_name": "Queensland",
        "postal_code": "4000"
    }'),
    ('{
        "city_name": "Brisbane",
        "house_number": "30",
        "street_name": "Queen Street",
        "suburb_name": "Brisbane CBD",
        "county_name": "Queensland",
        "postal_code": "4000"
    }'),
    ('{
        "city_name": "Perth",
        "house_number": "108",
        "street_name": "St Georges Terrace",
        "suburb_name": "Perth CBD",
        "county_name": "Western Australia",
        "postal_code": "6000"
    }'),
    ('{
        "city_name": "Perth",
        "house_number": "150",
        "street_name": "William Street",
        "suburb_name": "Northbridge",
        "county_name": "Western Australia",
        "postal_code": "6003"
    }'),
    ('{
        "city_name": "Adelaide",
        "house_number": "100",
        "street_name": "King William Street",
        "suburb_name": "Adelaide CBD",
        "county_name": "South Australia",
        "postal_code": "5000"
    }'),
    ('{
        "city_name": "Adelaide",
        "house_number": "50",
        "street_name": "Rundle Mall",
        "suburb_name": "Adelaide CBD",
        "county_name": "South Australia",
        "postal_code": "5000"
    }'),
    ('{
        "city_name": "Gold Coast",
        "house_number": "300",
        "street_name": "Cavill Avenue",
        "suburb_name": "Surfers Paradise",
        "county_name": "Queensland",
        "postal_code": "4217"
    }'),
    ('{
        "city_name": "Gold Coast",
        "house_number": "20",
        "street_name": "Esplanade",
        "suburb_name": "Burleigh Heads",
        "county_name": "Queensland",
        "postal_code": "4220"
    }'),
    ('{
        "city_name": "Canberra",
        "house_number": "120",
        "street_name": "London Circuit",
        "suburb_name": "City",
        "county_name": "Australian Capital Territory",
        "postal_code": "2601"
    }'),
    ('{
        "city_name": "Canberra",
        "house_number": "1",
        "street_name": "Constitution Avenue",
        "suburb_name": "City",
        "county_name": "Australian Capital Territory",
        "postal_code": "2601"
    }'),
    ('{
        "city_name": "Newcastle",
        "house_number": "200",
        "street_name": "Hunter Street",
        "suburb_name": "Newcastle West",
        "county_name": "New South Wales",
        "postal_code": "2302"
    }'),
    ('{
        "city_name": "Newcastle",
        "house_number": "50",
        "street_name": "Darby Street",
        "suburb_name": "Cooks Hill",
        "county_name": "New South Wales",
        "postal_code": "2300"
    }'),
    ('{
        "city_name": "Wollongong",
        "house_number": "80",
        "street_name": "Crown Street",
        "suburb_name": "Wollongong",
        "county_name": "New South Wales",
        "postal_code": "2500"
    }'),
    ('{
        "city_name": "Wollongong",
        "house_number": "25",
        "street_name": "Marine Drive",
        "suburb_name": "North Wollongong",
        "county_name": "New South Wales",
        "postal_code": "2500"
    }'),
    ('{
        "city_name": "Hobart",
        "house_number": "100",
        "street_name": "Elizabeth Street",
        "suburb_name": "Hobart CBD",
        "county_name": "Tasmania",
        "postal_code": "7000"
    }'),
    ('{
        "city_name": "Hobart",
        "house_number": "75",
        "street_name": "Salamanca Place",
        "suburb_name": "Battery Point",
        "county_name": "Tasmania",
        "postal_code": "7004"
    }'),
    ('{
        "city_name": "Sydney",
        "house_number": "200",
        "street_name": "Elizabeth Street",
        "suburb_name": "Sydney CBD",
        "county_name": "New South Wales",
        "postal_code": "2000"
    }'),
    ('{
        "city_name": "Sydney",
        "house_number": "80",
        "street_name": "Oxford Street",
        "suburb_name": "Paddington",
        "county_name": "New South Wales",
        "postal_code": "2021"
    }'),
    ('{
        "city_name": "Melbourne",
        "house_number": "100",
        "street_name": "Bourke Street",
        "suburb_name": "Melbourne CBD",
        "county_name": "Victoria",
        "postal_code": "3000"
    }'),
    ('{
        "city_name": "Melbourne",
        "house_number": "250",
        "street_name": "Lonsdale Street",
        "suburb_name": "Melbourne CBD",
        "county_name": "Victoria",
        "postal_code": "3000"
    }'),
    ('{
        "city_name": "Brisbane",
        "house_number": "60",
        "street_name": "Ann Street",
        "suburb_name": "Fortitude Valley",
        "county_name": "Queensland",
        "postal_code": "4006"
    }'),
    ('{
        "city_name": "Brisbane",
        "house_number": "15",
        "street_name": "James Street",
        "suburb_name": "Fortitude Valley",
        "county_name": "Queensland",
        "postal_code": "4006"
    }'),
    ('{
        "city_name": "Perth",
        "house_number": "5",
        "street_name": "Hay Street",
        "suburb_name": "East Perth",
        "county_name": "Western Australia",
        "postal_code": "6004"
    }'),
    ('{
        "city_name": "Perth",
        "house_number": "99",
        "street_name": "Murray Street",
        "suburb_name": "Perth CBD",
        "county_name": "Western Australia",
        "postal_code": "6000"
    }'),
    ('{
        "city_name": "Adelaide",
        "house_number": "220",
        "street_name": "Grenfell Street",
        "suburb_name": "Adelaide CBD",
        "county_name": "South Australia",
        "postal_code": "5000"
    }'),
    ('{
        "city_name": "Adelaide",
        "house_number": "30",
        "street_name": "O''Connell Street",
        "suburb_name": "North Adelaide",
        "county_name": "South Australia",
        "postal_code": "5006"
    }'),
    ('{
        "city_name": "Gold Coast",
        "house_number": "70",
        "street_name": "Scarborough Street",
        "suburb_name": "Southport",
        "county_name": "Queensland",
        "postal_code": "4215"
    }'),
    ('{
        "city_name": "Gold Coast",
        "house_number": "1",
        "street_name": "Hedges Avenue",
        "suburb_name": "Mermaid Beach",
        "county_name": "Queensland",
        "postal_code": "4218"
    }'),
    ('{
        "city_name": "Canberra",
        "house_number": "35",
        "street_name": "Northbourne Avenue",
        "suburb_name": "Braddon",
        "county_name": "Australian Capital Territory",
        "postal_code": "2612"
    }'),
    ('{
        "city_name": "Canberra",
        "house_number": "90",
        "street_name": "Lonsdale Street",
        "suburb_name": "Braddon",
        "county_name": "Australian Capital Territory",
        "postal_code": "2612"
    }'),
    ('{
        "city_name": "Newcastle",
        "house_number": "125",
        "street_name": "King Street",
        "suburb_name": "Newcastle CBD",
        "county_name": "New South Wales",
        "postal_code": "2300"
    }'),
    ('{
        "city_name": "Newcastle",
        "house_number": "20",
        "street_name": "Nobbys Road",
        "suburb_name": "Newcastle East",
        "county_name": "New South Wales",
        "postal_code": "2300"
    }'),
    ('{
        "city_name": "Wollongong",
        "house_number": "12",
        "street_name": "Keira Street",
        "suburb_name": "Wollongong",
        "county_name": "New South Wales",
        "postal_code": "2500"
    }'),
    ('{
        "city_name": "Wollongong",
        "house_number": "5",
        "street_name": "Bourke Street",
        "suburb_name": "North Wollongong",
        "county_name": "New South Wales",
        "postal_code": "2500"
    }'),
    ('{
        "city_name": "Hobart",
        "house_number": "20",
        "street_name": "Murray Street",
        "suburb_name": "Hobart CBD",
        "county_name": "Tasmania",
        "postal_code": "7000"
    }'),
    ('{
        "city_name": "Hobart",
        "house_number": "150",
        "street_name": "Sandy Bay Road",
        "suburb_name": "Sandy Bay",
        "county_name": "Tasmania",
        "postal_code": "7005"
    }'),
    ('{
        "city_name": "Sydney",
        "house_number": "50",
        "street_name": "King Street",
        "suburb_name": "Newtown",
        "county_name": "New South Wales",
        "postal_code": "2042"
    }'),
    ('{
        "city_name": "Sydney",
        "house_number": "100",
        "street_name": "Enmore Road",
        "suburb_name": "Enmore",
        "county_name": "New South Wales",
        "postal_code": "2042"
    }'),
    ('{
        "city_name": "Melbourne",
        "house_number": "200",
        "street_name": "Brunswick Street",
        "suburb_name": "Fitzroy",
        "county_name": "Victoria",
        "postal_code": "3065"
    }'),
    ('{
        "city_name": "Melbourne",
        "house_number": "100",
        "street_name": "Smith Street",
        "suburb_name": "Collingwood",
        "county_name": "Victoria",
        "postal_code": "3066"
    }'),
    ('{
        "city_name": "Brisbane",
        "house_number": "150",
        "street_name": "Boundary Street",
        "suburb_name": "West End",
        "county_name": "Queensland",
        "postal_code": "4101"
    }'),
    ('{
        "city_name": "Brisbane",
        "house_number": "200",
        "street_name": "Given Terrace",
        "suburb_name": "Paddington",
        "county_name": "Queensland",
        "postal_code": "4064"
    }'),
    ('{
        "city_name": "Perth",
        "house_number": "100",
        "street_name": "Beaufort Street",
        "suburb_name": "Mount Lawley",
        "county_name": "Western Australia",
        "postal_code": "6050"
    }'),
    ('{
        "city_name": "Perth",
        "house_number": "200",
        "street_name": "Oxford Street",
        "suburb_name": "Leederville",
        "county_name": "Western Australia",
        "postal_code": "6007"
    }');

COMMIT;
