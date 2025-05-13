import os
import requests
from PIL import Image
from io import BytesIO
from main import app, Coordinates

SAVE_DIR = "/Users/zaharsoldatkin/Projects/coordinates-image-db"
os.makedirs(SAVE_DIR, exist_ok=True)

def download_and_convert_images():
    with app.app_context():
        records = Coordinates.query.all()

        for record in records:
            image_url = record.image_url
            image_id = record.image_id

            try:
                response = requests.get(image_url, timeout=20)
                if response.status_code != 200:
                    print(f"Failed to download {image_url} (code {response.status_code})")
                    continue

                img = Image.open(BytesIO(response.content)).convert("RGB")
                filepath = os.path.join(SAVE_DIR, f"{image_id}.jpg")
                img.save(filepath, "JPEG", quality=95)
                print(f"Downloaded and saved: {image_id}.jpg")

            except Exception as e:
                print(f"Error due downloading {image_url}: {e}")

if __name__ == "__main__":
    download_and_convert_images()
