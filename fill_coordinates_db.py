from main import app, db, MAPILLARY_TOKEN, Coordinates
import requests
import random

def get_random_image_from_bbox(access_token):
    lat_min = random.uniform(-85, 84)
    lon_min = random.uniform(-180, 179)
    lat_max = lat_min + 1
    lon_max = lon_min + 1

    url = "https://graph.mapillary.com/images"
    params = {
        "fields": "id,geometry,thumb_1024_url",
        "bbox": f"{lon_min},{lat_min},{lon_max},{lat_max}",
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


def save_images_to_db(n=500):
    with app.app_context():
        existing_ids = set(i.image_id for i in Coordinates.query.all())

        while Coordinates.query.count() < n:
            img = get_random_image_from_bbox(MAPILLARY_TOKEN)
            if img and img["image_id"] not in existing_ids:
                new_record = Coordinates(
                    image_id=img["image_id"],
                    image_url=img["image_url"],
                    latitude=img["latitude"],
                    longitude=img["longitude"]
                )
                db.session.add(new_record)
                db.session.commit()
                existing_ids.add(img["image_id"])
                print(f"Added {len(existing_ids)} / {n}")

if __name__ == "__main__":
    save_images_to_db()
