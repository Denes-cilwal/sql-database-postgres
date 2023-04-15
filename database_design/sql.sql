-- postgresql engine --- sql might be different
-- 1-1 relation b/w profile and youtube_account
CREATE TABLE IF NOT EXISTS user_profile (
     id BIGSERIAL PRIMARY KEY,
     first_name TEXT NOT NULL,
     last_name TEXT NOT NULL,
     email TEXT UNIQUE NOT NULL,
     gender TEXT CHECK(gender IN ('MALE', 'FEMALE')) NOT NULL,
     created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL
);

-- references is foreign key relation
CREATE TABLE IF NOT EXISTS youtube_account(
    id BIGINT PRIMARY KEY REFERENCES user_profile(id), 
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL
)


-- 1-M relation blw 
-- pK cannot be null but unique can be null
CREATE TABLE IF NOT EXISTS youtube_channel(
    id BIGSERIAL PRIMARY KEY,
    youtube_account_id BIGINT NOT NULL REFERENCES youtube_account(id), 
    channel_name TEXT NOT NULL UNIQUE,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
)


CREATE TABLE IF NOT EXISTS channel_subscriber(
    --    id BIGSERIAL PRIMARY KEY, would be able to subscribe > 1
    youtube_account_id BIGINT references youtube_account(id),
    youtube_channel_id BIGINT references youtube_channel(id),
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL

    -- when a youtube account subscribe to a channel it can only happens once
    PRIMARY KEY(youtube_account_id, youtube_channel_id)

)




