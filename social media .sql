Create DataBase SocialMedia ;
Use SocialMedia;
Create Table UserS 
(
UserID INT IDentity Primary Key,
UserName NVARCHAR(50) NOT NULL,
DOB DATETIME DEFAULT GETUTCDATE(),
EMAIL  VARCHAR(100) UNIQUE,
GENDER  NVARCHAR(10) ,
JOINDATE DATETIME DEFAULT GETUTCDATE()
)
INSERT INTO UserS (UserName, DOB, EMAIL, GENDER, JOINDATE) VALUES
('Ahmed Ali', '1995-05-12', 'ahmed@example.com', 'Male', GETUTCDATE()),
('Sara Mohamed', '1998-07-22', 'sara@example.com', 'Female', GETUTCDATE()),
('Omar Hassan', '1992-09-30', 'omar@example.com', 'Male', GETUTCDATE());
CREATE TABLE POST 
(
POSTID INT IDENTITY PRIMARY KEY ,
USERid INT NOT NULL,
CONTENT NVARCHAR(100) NOT NULL ,
POSTDATE DATETIME DEFAULT GETUTCDATE(),
VISIBILTY NVARCHAR(10) DEFAULT 'public' CHECK (VISIBILTY IN ('public', 'private'))
FOREIGN KEY (USERid) REFERENCES UserS(UserID)
)
INSERT INTO POST (USERid, CONTENT, POSTDATE, VISIBILTY) VALUES
(1, 'Hello, this is my first post!', GETUTCDATE(), 'public'),
(2, 'Loving the weather today!', GETUTCDATE(), 'private'),
(3, 'Good morning everyone!', GETUTCDATE(), 'public');
CREATE TABLE COMMENT 
(
COMMENTID INT IDENTITY PRIMARY KEY ,
userID  INT NOT NULL ,
POST_ID INT  NOT NULL,
COMMENTDATE  DATETIME DEFAULT GETUTCDATE(),
CONTENT NVARCHAR(100)  ,
FOREIGN KEY (userID) REFERENCES UserS(UserID),
FOREIGN KEY (POST_ID) REFERENCES POST(POSTID)
)
INSERT INTO COMMENT (userID, POST_ID, COMMENTDATE, CONTENT) VALUES
(2, 1, GETUTCDATE(), 'Nice post!'),
(3, 1, GETUTCDATE(), 'Great content!'),
(1, 2, GETUTCDATE(), 'Totally agree!');
CREATE TABLE INTERACTION 
(
INTERACTIONID INT IDENTITY PRIMARY KEY,
TYPE NVARCHAR(20),
 INTERACTIONDATE  DATETIME DEFAULT GETUTCDATE(),
)
INSERT INTO INTERACTION (TYPE, INTERACTIONDATE) VALUES
('like', GETUTCDATE()),
('love', GETUTCDATE()),
('haha', GETUTCDATE());
CREATE TABLE INTERACTE
(
userid INT NOT NULL ,
postid INT NOT NULL,
interactionid INT NOT NULL,
FOREIGN KEY (userid) REFERENCES UserS(UserID),
FOREIGN KEY (postid) REFERENCES POST(POSTID),
FOREIGN KEY (interactionid) REFERENCES INTERACTION (INTERACTIONID)

)
INSERT INTO INTERACTE (userid, postid, interactionid) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);
