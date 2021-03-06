
INSERT INTO Category (name, version) VALUES ('Sport', 0);
INSERT INTO Category (name, version) VALUES ('Games', 0);
INSERT INTO Category (name, version) VALUES ('Party', 0);
INSERT INTO Category (name, version) VALUES ('Learning', 0);

INSERT INTO State (name, version) VALUES ('Burgenland', 0);
INSERT INTO State (name, version) VALUES ('K�rnten', 0);
INSERT INTO State (name, version) VALUES ('Niederoesterreeich', 0);
INSERT INTO State (name, version) VALUES ('Oberoesterreich', 0);
INSERT INTO State (name, version) VALUES ('Salzburg', 0);
INSERT INTO State (name, version) VALUES ('Steiermark', 0);
INSERT INTO State (name, version) VALUES ('Tirol', 0);
INSERT INTO State (name, version) VALUES ('Vorarlberg', 0);
INSERT INTO State (name, version) VALUES ('Wien', 0);

INSERT INTO Subcategory (name, version, category_id) VALUES ('Soccer', 0, 1);
INSERT INTO Subcategory (name, version, category_id) VALUES ('Basketball', 0, 1);
INSERT INTO Subcategory (name, version, category_id) VALUES ('Tennis', 0, 1);
INSERT INTO Subcategory (name, version, category_id) VALUES ('Volleyball', 0, 1);
INSERT INTO Subcategory (name, version, category_id) VALUES ('Swimming', 0, 1);
INSERT INTO Subcategory (name, version, category_id) VALUES ('Table Tennis', 0, 1);

INSERT INTO Subcategory (name, version, category_id) VALUES ('Call of Duty 4', 0, 2);
INSERT INTO Subcategory (name, version, category_id) VALUES ('Battlefield 2', 0, 2);
INSERT INTO Subcategory (name, version, category_id) VALUES ('World of Warcraft', 0, 2);
INSERT INTO Subcategory (name, version, category_id) VALUES ('Counter Strike', 0, 2);

INSERT INTO Subcategory (name, version, category_id) VALUES ('Mathematics', 0, 4);
INSERT INTO Subcategory (name, version, category_id) VALUES ('English', 0, 4);
INSERT INTO Subcategory (name, version, category_id) VALUES ('Physic', 0, 4);
INSERT INTO Subcategory (name, version, category_id) VALUES ('Chemistry', 0, 4);
INSERT INTO Subcategory (name, version, category_id) VALUES ('History', 0, 4);
INSERT INTO Subcategory (name, version, category_id) VALUES ('German', 0, 4);
INSERT INTO Subcategory (name, version, category_id) VALUES ('Spanish', 0, 4);

INSERT INTO Subcategory (name, version, category_id) VALUES ('Party', 0, 3);

INSERT INTO users(age, city, enabled, name, password, username, version) VALUES (21, 'Graz', TRUE, 'Admin','$2a$10$2BZh7qw/FSh23ZCbojA.OOoo7vzg7KaqHUp34l8/i9.ktxzcr3vJm', 'admin', 0);
INSERT INTO user_roles (role, user_id) VALUES ('ROLE_USER', 1);
INSERT INTO user_roles (role, user_id) VALUES ('ROLE_ADMIN', 1);
INSERT INTO users(age, city, enabled, name, password, username, version) VALUES (28, 'Wien', TRUE, 'User','$2a$10$2BZh7qw/FSh23ZCbojA.OOoo7vzg7KaqHUp34l8/i9.ktxzcr3vJm', 'user88', 0);
INSERT INTO user_roles (role, user_id) VALUES ('ROLE_USER', 2);
INSERT INTO users(age, city, enabled, name, password, username, version) VALUES (21, 'Graz', TRUE, 'Nitty','$2a$10$2BZh7qw/FSh23ZCbojA.OOoo7vzg7KaqHUp34l8/i9.ktxzcr3vJm', 'nitty94', 0);
INSERT INTO user_roles (role, user_id) VALUES ('ROLE_USER', 3);
INSERT INTO users(age, city, enabled, name, password, username, version) VALUES (21, 'Graz', TRUE, 'Wolfi','$2a$10$2BZh7qw/FSh23ZCbojA.OOoo7vzg7KaqHUp34l8/i9.ktxzcr3vJm', 'wulfcastel', 0);
INSERT INTO user_roles (role, user_id) VALUES ('ROLE_USER', 4);
INSERT INTO users(age, city, enabled, name, password, username, version) VALUES (21, 'Graz', TRUE, 'Steve','$2a$10$2BZh7qw/FSh23ZCbojA.OOoo7vzg7KaqHUp34l8/i9.ktxzcr3vJm', 'steveGee', 0);
INSERT INTO user_roles (role, user_id) VALUES ('ROLE_USER', 5);

-- Test Aktivit�ten
INSERT INTO Activity (closed, date, deprecated, location, restriction, text, title, version, owner_id, state_id, subcategory_id) VALUES (0, "2016-06-22 14:24:00", 0, 'Graz', 4, 'Suche 4 Leute f�r ein Fu�ballspiel in G�sting', 'Fu�ball', 0, 2, 6, 1);
INSERT INTO Activity (closed, date, deprecated, location, restriction, text, title, version, owner_id, state_id, subcategory_id) VALUES (0, "2016-06-25 03:25:00", 0, 'Linz', 1, 'Suche Tenniskollegen :)', 'Lust auf ne Partie Tennis?', 0, 3, 4, 3);
INSERT INTO Activity (closed, date, deprecated, location, restriction, text, title, version, owner_id, state_id, subcategory_id) VALUES (0, "2016-06-27 10:00:00", 0, 'Graz', 4, 'Iwer bock Schwarzl baden schwimmen gehn?', 'Schwarzl', 0, 2, 6, 5);
INSERT INTO Activity (closed, date, deprecated, location, restriction, text, title, version, owner_id, state_id, subcategory_id) VALUES (0, "2016-06-25 03:25:00", 0, 'Linz', 1, 'H�tte zwei Schl�ger und kenne einen guten Platz mit oeffentlichen Tischen', 'Tischtennis', 0, 5, 4, 6);

INSERT INTO Activity (closed, date, deprecated, location, restriction, text, title, version, owner_id, state_id, subcategory_id) VALUES (0, "2016-06-30 08:11:00", 0, 'Skype', 7, 'Bock auf raiden?', 'WoW', 0, 4, 7, 9);
INSERT INTO Activity (closed, date, deprecated, location, restriction, text, title, version, owner_id, state_id, subcategory_id) VALUES (0, "2016-07-01 11:01:00", 0, 'Ts3', 1, '1v1 auf Crossfire', 'Cod!', 0, 5, 3, 7);

INSERT INTO Activity (closed, date, deprecated, location, restriction, text, title, version, owner_id, state_id, subcategory_id) VALUES (0, "2016-07-15 20:00:00", 0, 'Graz', 12, 'Pub-crawl runde durch Graz?', 'Saufen amal!', 0, 4, 6, 18);
INSERT INTO Activity (closed, date, deprecated, location, restriction, text, title, version, owner_id, state_id, subcategory_id) VALUES (0, "2016-12-31 00:00:00", 0, 'Graz', 20, 'Silvester Houseparty bei mir!', 'Silvester!!', 0, 3, 6, 18);
INSERT INTO Activity (closed, date, deprecated, location, restriction, text, title, version, owner_id, state_id, subcategory_id) VALUES (0, "2016-06-25 16:00:00", 0, 'Wien', 4, 'W�rde wer mitfahren Donauinselfest?', 'Donauinselfest', 0, 4, 9, 18);

INSERT INTO Activity (closed, date, deprecated, location, restriction, text, title, version, owner_id, state_id, subcategory_id) VALUES (0, "2016-06-30 08:11:00", 0, 'Bregenz', 3, 'Integralrechnen nochmal durchgehen', 'Lernen f�r zweite Schularbeit', 0, 2, 8, 11);
INSERT INTO Activity (closed, date, deprecated, location, restriction, text, title, version, owner_id, state_id, subcategory_id) VALUES (0, "2016-07-01 11:01:00", 0, 'Innsbruck', 3, 'Deutsch lernen f�r Pr�fung', 'NeinNeinNein!', 0, 5, 7, 16);
