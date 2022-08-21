DROP TYPE IF EXISTS file_types_enum CASCADE;
CREATE TYPE file_types_enum AS ENUM ('unknown', 'image', 'sound', 'msoffice_document', 'acrobat_document'); 

DROP TYPE IF EXISTS chat_types_enum CASCADE;
CREATE TYPE chat_types_enum AS ENUM ('personal_chat', 'group_chat', 'channel'); 

DROP TYPE IF EXISTS message_status CASCADE;
CREATE TYPE message_status AS ENUM ('read', 'unread', 'sent', 'delivered', 'deleted', 'edited'); 

--	DROP TABLE IF EXISTS chat;
CREATE TABLE chat (chat_id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
			chat_type VARCHAR(255), 
                        description VARCHAR(255),  
                        name VARCHAR(255));

--	DROP TABLE IF EXISTS chat_member;
CREATE TABLE chat_member (id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
                        chat_id BIGINT NOT NULL, 
                        member_id BIGINT NOT NULL, 

--	DROP TABLE IF EXISTS chatmembers_table;
CREATE TABLE chatmembers_table (id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
                        chatid BIGINT NOT NULL, 
                        userid BIGINT NOT NULL, 

--	DROP TABLE IF EXISTS file_table;
CREATE TABLE file_table (id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
			file VARCHAR(255),
			file_type VARCHAR(255));

--	DROP TABLE IF EXISTS messages_table;
CREATE TABLE messages_table (id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
                            chat_id BIGINT, 
                            user_id BIGINT, 
                            message_text VARCHAR(255), 
                            file_id BIGINT, 
                            date_time TIMESTAMP); 

--	DROP TABLE IF EXISTS status_links;
CREATE TABLE status_links (id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
                            status_type VARCHAR(255), 
                            user_id BIGINT, 
                            message_id BIGINT); 

--	DROP TABLE IF EXISTS users_table;
CREATE TABLE users_table (id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
			age INTEGER, 
			login VARCHAR(30),
			name VARCHAR(255),
			password VARCHAR(30),
			photo_id BIGINT);
