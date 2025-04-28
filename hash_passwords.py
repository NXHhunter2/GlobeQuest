import os
import hashlib
from main import app, db, Users
with app.app_context():
    users_without_salt = Users.query.filter_by(user_salt=None).all()

    for user in users_without_salt:
        salt = os.urandom(16)
        salt_hex = salt.hex()

        hashed_password = hashlib.pbkdf2_hmac(
            'sha256',
            user.user_password.encode('utf-8'),
            salt,
            100000
        ).hex()

        user.user_password = hashed_password
        user.user_salt = salt_hex

    db.session.commit()

    print(f"Updated {len(users_without_salt)} users.")
