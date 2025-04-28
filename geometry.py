import requests
from math import radians, sin, cos, sqrt, atan2

def haversine(lat1, lon1, lat2, lon2):
    R = 6371.0
    dlat = radians(lat2 - lat1)
    dlon = radians(lon2 - lon1)
    a = sin(dlat/2) ** 2 + cos(radians(lat1)) * cos(radians(lat2)) * sin(dlon/2)**2
    c = 2 * atan2(sqrt(a), sqrt(1 - a))
    return R * c

def get_random_image_from_bbox(access_token):
    bbox = [-180.0, -85.0, 180.0, 85.0]

    url = "https://graph.mapillary.com/images"
    params = {
        "fields": "id,geometry,thumb_1024_url",
        "bbox": f"{bbox[0]},{bbox[1]},{bbox[2]},{bbox[3]}",
        "limit": 1,
        "access_token": access_token
    }

    response = requests.get(url, params=params)
    print("URL:", response.url)
    if response.status_code == 200:
        data = response.json()
        if "data" in data and len(data["data"]) > 0:
            image = data["data"][0]
            return {
                "image_id": image["id"],
                "image_url": image.get("thumb_1024_url", None),
                "latitude": image["geometry"]["coordinates"][1],
                "longitude": image["geometry"]["coordinates"][0]
            }
    else:
        print("Error:", response.status_code, response.text)
    return None