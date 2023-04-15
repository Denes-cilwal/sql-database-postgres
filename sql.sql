CREATE TABLE user_profile (
     id BIGSERIAL PRIMARY KEY NOT NULL,
     first_name TEXT NOT NULL,
     last_name TEXT NOT NULL,
     email TEXT UNIQUE NOT NULL,
     gender TEXT CHECK(gender IN ('MALE', 'FEMALE')) NOT NULL,
     created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL
);