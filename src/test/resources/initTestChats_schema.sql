DROP TYPE IF EXISTS file_types_enum CASCADE;
CREATE TYPE file_types_enum AS ENUM ('UNKNOWN', 'IMAGE', 'SOUND', 'MSOFFICE_DOCUMENT', 'ACROBAT_DOCUMENT'); 

DROP TYPE IF EXISTS chat_types_enum CASCADE;
CREATE TYPE chat_types_enum AS ENUM ('PERSONAL_CHAT', 'GROUP_CHAT', 'CHANNEL'); 

DROP TYPE IF EXISTS message_status CASCADE;
CREATE TYPE message_status AS ENUM ('READ', 'UNREAD', 'SENT', 'DELIVERED', 'DELETED', 'EDITED'); 

DROP TABLE IF EXISTS chats CASCADE;
CREATE TABLE chats (id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
			chat_type VARCHAR(255), 
                        description VARCHAR(255),  
                        name VARCHAR(255));

DROP TABLE IF EXISTS chats_users;
CREATE TABLE chats_users (id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
                        chat_id BIGINT NOT NULL, 
                        user_id BIGINT NOT NULL,
			join_date TIMESTAMP NOT NULL,
			view_date TIMESTAMP); 

DROP TABLE IF EXISTS files;
CREATE TABLE files (id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
			file_name VARCHAR(255),
			file_type VARCHAR(255));

DROP TABLE IF EXISTS messages CASCADE;
CREATE TABLE messages (id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
                            chat_id BIGINT, 
                            user_id BIGINT, 
                            message_text VARCHAR(255), 
                            file_id BIGINT, 
                            date_time TIMESTAMP); 

DROP TABLE IF EXISTS status_links;
CREATE TABLE status_links (id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
                            status_type VARCHAR(255), 
                            user_id BIGINT, 
                            message_id BIGINT); 

DROP TABLE IF EXISTS users;
CREATE TABLE users (id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
			age INTEGER, 
			login VARCHAR(30),
			name VARCHAR(255),
			password VARCHAR(30),
			photo_id BIGINT);
