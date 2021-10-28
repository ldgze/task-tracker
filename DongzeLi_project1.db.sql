BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Tag" (
	"tagID"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT,
	PRIMARY KEY("tagID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Tag_Task" (
	"tagID"	INTEGER,
	"taskID"	INTEGER,
	PRIMARY KEY("tagID","taskID"),
	FOREIGN KEY("tagID") REFERENCES "Tag"("tagID"),
	FOREIGN KEY("taskID") REFERENCES "Task"("taskID")
);
CREATE TABLE IF NOT EXISTS "User" (
	"userID"	INTEGER NOT NULL UNIQUE,
	"firstName"	TEXT NOT NULL,
	"lastName"	TEXT NOT NULL,
	"email"	TEXT NOT NULL UNIQUE,
	PRIMARY KEY("userID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Assignment" (
	"userID"	INTEGER,
	"taskID"	INTEGER,
	PRIMARY KEY("userID","taskID"),
	FOREIGN KEY("userID") REFERENCES "User"("userID"),
	FOREIGN KEY("taskID") REFERENCES "Task"("taskID")
);
CREATE TABLE IF NOT EXISTS "List" (
	"listID"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT,
	PRIMARY KEY("listID")
);
CREATE TABLE IF NOT EXISTS "Subtask" (
	"subtaskID"	INTEGER NOT NULL UNIQUE,
	"title"	TEXT,
	"status"	TEXT,
	"taskID"	INTEGER,
	PRIMARY KEY("subtaskID" AUTOINCREMENT),
	FOREIGN KEY("taskID") REFERENCES "Task"("taskID")
);
CREATE TABLE IF NOT EXISTS "Comment" (
	"commentID"	INTEGER NOT NULL UNIQUE,
	"content"	TEXT,
	"updateAt"	NUMERIC,
	"taskID"	INTEGER,
	PRIMARY KEY("commentID" AUTOINCREMENT),
	FOREIGN KEY("taskID") REFERENCES "Task"("taskID")
);
CREATE TABLE IF NOT EXISTS "Creator" (
	"userID"	INTEGER,
	"taskID"	INTEGER,
	PRIMARY KEY("userID","taskID"),
	FOREIGN KEY("userID") REFERENCES "User"("userID"),
	FOREIGN KEY("taskID") REFERENCES "Task"("taskID")
);
CREATE TABLE IF NOT EXISTS "Task" (
	"taskID"	INTEGER NOT NULL UNIQUE,
	"title"	TEXT NOT NULL,
	"dueDate"	TEXT,
	"createDate"	TEXT NOT NULL,
	"URL"	TEXT,
	"priority"	TEXT,
	"status"	TEXT,
	"listID"	INTEGER,
	PRIMARY KEY("taskID" AUTOINCREMENT),
	FOREIGN KEY("listID") REFERENCES "List"("listID")
);
INSERT INTO "Tag" VALUES (1,'personal');
INSERT INTO "Tag" VALUES (2,'design');
INSERT INTO "Tag" VALUES (3,'work');
INSERT INTO "Tag" VALUES (4,'social');
INSERT INTO "Tag" VALUES (5,'errands');
INSERT INTO "Tag" VALUES (6,'dev');
INSERT INTO "Tag" VALUES (7,'design');
INSERT INTO "Tag" VALUES (8,'home');
INSERT INTO "Tag" VALUES (9,'25%');
INSERT INTO "Tag" VALUES (10,'50%');
INSERT INTO "Tag" VALUES (11,'75%');
INSERT INTO "Tag" VALUES (12,'office');
INSERT INTO "Tag" VALUES (13,'house');
INSERT INTO "Tag" VALUES (14,'gym');
INSERT INTO "Tag_Task" VALUES (9,53);
INSERT INTO "Tag_Task" VALUES (10,54);
INSERT INTO "Tag_Task" VALUES (11,55);
INSERT INTO "Tag_Task" VALUES (10,58);
INSERT INTO "Tag_Task" VALUES (1,3);
INSERT INTO "Tag_Task" VALUES (2,4);
INSERT INTO "Tag_Task" VALUES (3,56);
INSERT INTO "Tag_Task" VALUES (4,7);
INSERT INTO "Tag_Task" VALUES (5,8);
INSERT INTO "Tag_Task" VALUES (6,6);
INSERT INTO "Tag_Task" VALUES (7,9);
INSERT INTO "Tag_Task" VALUES (8,5);
INSERT INTO "Tag_Task" VALUES (9,5);
INSERT INTO "Tag_Task" VALUES (1,5);
INSERT INTO "Tag_Task" VALUES (11,5);
INSERT INTO "Tag_Task" VALUES (12,5);
INSERT INTO "Tag_Task" VALUES (13,5);
INSERT INTO "Tag_Task" VALUES (2,7);
INSERT INTO "Tag_Task" VALUES (2,8);
INSERT INTO "Tag_Task" VALUES (6,9);
INSERT INTO "Tag_Task" VALUES (7,10);
INSERT INTO "Tag_Task" VALUES (8,11);
INSERT INTO "Tag_Task" VALUES (9,12);
INSERT INTO "Tag_Task" VALUES (2,3);
INSERT INTO "Tag_Task" VALUES (2,14);
INSERT INTO "Tag_Task" VALUES (2,15);
INSERT INTO "Tag_Task" VALUES (3,16);
INSERT INTO "Tag_Task" VALUES (9,6);
INSERT INTO "Tag_Task" VALUES (11,7);
INSERT INTO "Tag_Task" VALUES (7,8);
INSERT INTO "Tag_Task" VALUES (1,9);
INSERT INTO "Tag_Task" VALUES (1,10);
INSERT INTO "Tag_Task" VALUES (14,11);
INSERT INTO "Tag_Task" VALUES (13,12);
INSERT INTO "Tag_Task" VALUES (12,3);
INSERT INTO "Tag_Task" VALUES (11,14);
INSERT INTO "Tag_Task" VALUES (5,15);
INSERT INTO "Tag_Task" VALUES (4,6);
INSERT INTO "Tag_Task" VALUES (3,17);
INSERT INTO "Tag_Task" VALUES (2,47);
INSERT INTO "Tag_Task" VALUES (1,42);
INSERT INTO "Tag_Task" VALUES (14,43);
INSERT INTO "Tag_Task" VALUES (13,44);
INSERT INTO "Tag_Task" VALUES (12,56);
INSERT INTO "Tag_Task" VALUES (11,57);
INSERT INTO "Tag_Task" VALUES (1,58);
INSERT INTO "Tag_Task" VALUES (9,60);
INSERT INTO "Tag_Task" VALUES (8,59);
INSERT INTO "Tag_Task" VALUES (7,1);
INSERT INTO "Tag_Task" VALUES (6,2);
INSERT INTO "Tag_Task" VALUES (5,25);
INSERT INTO "Tag_Task" VALUES (4,26);
INSERT INTO "Tag_Task" VALUES (3,27);
INSERT INTO "Tag_Task" VALUES (2,28);
INSERT INTO "Tag_Task" VALUES (1,29);
INSERT INTO "Tag_Task" VALUES (3,30);
INSERT INTO "Tag_Task" VALUES (10,41);
INSERT INTO "Tag_Task" VALUES (9,42);
INSERT INTO "Tag_Task" VALUES (8,43);
INSERT INTO "Tag_Task" VALUES (7,44);
INSERT INTO "Tag_Task" VALUES (6,45);
INSERT INTO "Tag_Task" VALUES (5,46);
INSERT INTO "Tag_Task" VALUES (4,47);
INSERT INTO "Tag_Task" VALUES (3,48);
INSERT INTO "Tag_Task" VALUES (2,49);
INSERT INTO "Tag_Task" VALUES (1,50);
INSERT INTO "Tag_Task" VALUES (6,51);
INSERT INTO "Tag_Task" VALUES (5,20);
INSERT INTO "Tag_Task" VALUES (4,16);
INSERT INTO "Tag_Task" VALUES (3,34);
INSERT INTO "User" VALUES (1,'Marrilee','Farnell','mfarnell0@independent.co.uk');
INSERT INTO "User" VALUES (2,'Madelle','Gambell','mgambell1@uiuc.edu');
INSERT INTO "User" VALUES (3,'Brittany','Dinjes','bdinjes2@ask.com');
INSERT INTO "User" VALUES (4,'Carolus','De Ferrari','cdeferrari3@bizjournals.com');
INSERT INTO "User" VALUES (5,'Orel','Brookes','obrookes4@surveymonkey.com');
INSERT INTO "Assignment" VALUES (1,1);
INSERT INTO "Assignment" VALUES (1,2);
INSERT INTO "Assignment" VALUES (1,3);
INSERT INTO "Assignment" VALUES (1,4);
INSERT INTO "Assignment" VALUES (1,5);
INSERT INTO "Assignment" VALUES (2,6);
INSERT INTO "Assignment" VALUES (2,7);
INSERT INTO "Assignment" VALUES (2,8);
INSERT INTO "Assignment" VALUES (2,9);
INSERT INTO "Assignment" VALUES (2,10);
INSERT INTO "Assignment" VALUES (2,11);
INSERT INTO "Assignment" VALUES (2,12);
INSERT INTO "Assignment" VALUES (2,13);
INSERT INTO "Assignment" VALUES (2,14);
INSERT INTO "Assignment" VALUES (2,15);
INSERT INTO "Assignment" VALUES (3,16);
INSERT INTO "Assignment" VALUES (3,17);
INSERT INTO "Assignment" VALUES (3,18);
INSERT INTO "Assignment" VALUES (3,19);
INSERT INTO "Assignment" VALUES (3,20);
INSERT INTO "Assignment" VALUES (4,21);
INSERT INTO "Assignment" VALUES (4,22);
INSERT INTO "Assignment" VALUES (4,23);
INSERT INTO "Assignment" VALUES (4,24);
INSERT INTO "Assignment" VALUES (4,25);
INSERT INTO "Assignment" VALUES (4,26);
INSERT INTO "Assignment" VALUES (4,27);
INSERT INTO "Assignment" VALUES (4,28);
INSERT INTO "Assignment" VALUES (4,29);
INSERT INTO "Assignment" VALUES (4,30);
INSERT INTO "Assignment" VALUES (4,31);
INSERT INTO "Assignment" VALUES (4,32);
INSERT INTO "Assignment" VALUES (4,33);
INSERT INTO "Assignment" VALUES (4,34);
INSERT INTO "Assignment" VALUES (5,35);
INSERT INTO "Assignment" VALUES (5,36);
INSERT INTO "Assignment" VALUES (5,37);
INSERT INTO "Assignment" VALUES (5,38);
INSERT INTO "Assignment" VALUES (5,39);
INSERT INTO "Assignment" VALUES (5,40);
INSERT INTO "Assignment" VALUES (1,41);
INSERT INTO "Assignment" VALUES (1,42);
INSERT INTO "Assignment" VALUES (1,43);
INSERT INTO "Assignment" VALUES (1,44);
INSERT INTO "Assignment" VALUES (1,45);
INSERT INTO "Assignment" VALUES (1,46);
INSERT INTO "Assignment" VALUES (2,47);
INSERT INTO "Assignment" VALUES (2,48);
INSERT INTO "Assignment" VALUES (2,49);
INSERT INTO "Assignment" VALUES (2,50);
INSERT INTO "Assignment" VALUES (4,51);
INSERT INTO "Assignment" VALUES (3,52);
INSERT INTO "Assignment" VALUES (3,53);
INSERT INTO "Assignment" VALUES (4,54);
INSERT INTO "Assignment" VALUES (3,55);
INSERT INTO "Assignment" VALUES (4,56);
INSERT INTO "Assignment" VALUES (3,57);
INSERT INTO "Assignment" VALUES (3,58);
INSERT INTO "Assignment" VALUES (3,59);
INSERT INTO "Assignment" VALUES (3,60);
INSERT INTO "List" VALUES (1,'Project');
INSERT INTO "List" VALUES (2,'Language Learning');
INSERT INTO "List" VALUES (3,'Employee Onboarding');
INSERT INTO "List" VALUES (4,'Fitness');
INSERT INTO "List" VALUES (5,'Video Making');
INSERT INTO "List" VALUES (6,'Book Writing');
INSERT INTO "List" VALUES (7,'Goal Tracker');
INSERT INTO "List" VALUES (8,'Moving House');
INSERT INTO "List" VALUES (9,'Vacation Planning');
INSERT INTO "List" VALUES (10,'Reading List');
INSERT INTO "Subtask" VALUES (1,'Select topic','0',1);
INSERT INTO "Subtask" VALUES (2,'Select presentation style','0',1);
INSERT INTO "Subtask" VALUES (3,'Assign project leader','0',2);
INSERT INTO "Subtask" VALUES (4,'Project description and deliverables','0',2);
INSERT INTO "Subtask" VALUES (5,'Write script','0',3);
INSERT INTO "Subtask" VALUES (6,'Split script into three','0',3);
INSERT INTO "Subtask" VALUES (7,'Create visuals for presentation','0',4);
INSERT INTO "Subtask" VALUES (8,'Practice presentation','0',4);
INSERT INTO "Subtask" VALUES (9,'Submit presentation material','0',5);
INSERT INTO "Subtask" VALUES (10,'Receive grade','0',5);
INSERT INTO "Subtask" VALUES (11,'Research on perferred language and tools','0',6);
INSERT INTO "Subtask" VALUES (12,'Sign up preferred app','0',6);
INSERT INTO "Subtask" VALUES (13,'Practice half hour reading','0',7);
INSERT INTO "Subtask" VALUES (14,'quiz on app','0',7);
INSERT INTO "Subtask" VALUES (15,'Find a conversation partner','0',8);
INSERT INTO "Subtask" VALUES (16,'Record and listen by myself','0',8);
INSERT INTO "Subtask" VALUES (17,'Choose the trip destination','0',9);
INSERT INTO "Subtask" VALUES (18,'Book the trip','0',9);
INSERT INTO "Subtask" VALUES (19,'Take the practice test','0',10);
INSERT INTO "Subtask" VALUES (20,'Take the official test','0',10);
INSERT INTO "Subtask" VALUES (21,'Read the culture guide','0',11);
INSERT INTO "Subtask" VALUES (22,'Sign into the company email and update password','0',11);
INSERT INTO "Subtask" VALUES (23,'Accept the invitations to team''s internal tool','0',11);
INSERT INTO "Subtask" VALUES (24,'Setup 1-on-1 meeting with mentor','0',12);
INSERT INTO "Subtask" VALUES (25,'Plan the first meeting with team','0',12);
INSERT INTO "Subtask" VALUES (26,'Read the important task for role','0',13);
INSERT INTO "Subtask" VALUES (27,'Read benifit on leave','0',14);
INSERT INTO "Subtask" VALUES (28,'Read health insurance covered range','0',14);
INSERT INTO "Subtask" VALUES (29,'Read Start with why','0',15);
INSERT INTO "Subtask" VALUES (30,'Read Deep Work','0',15);
INSERT INTO "Subtask" VALUES (31,'Treadmill at the gym','0',16);
INSERT INTO "Subtask" VALUES (32,'Resistance training at the gym','0',16);
INSERT INTO "Subtask" VALUES (33,'Treadmill at the gym','0',17);
INSERT INTO "Subtask" VALUES (34,'Resistance training at home','0',17);
INSERT INTO "Subtask" VALUES (35,'Resistance training at home','0',18);
INSERT INTO "Subtask" VALUES (36,'Measure bodyfit','0',18);
INSERT INTO "Subtask" VALUES (37,'Resistance training at the gym','0',19);
INSERT INTO "Subtask" VALUES (38,'Treadmill at the gym','0',19);
INSERT INTO "Subtask" VALUES (39,'Treadmill at the gym','0',20);
INSERT INTO "Subtask" VALUES (40,'Resistance training at the gym','0',20);
INSERT INTO "Subtask" VALUES (41,'Select topic and write script','0',21);
INSERT INTO "Subtask" VALUES (42,'Prepare equipment','0',22);
INSERT INTO "Subtask" VALUES (43,'Make casting call','0',22);
INSERT INTO "Subtask" VALUES (44,'Plan shooting schedule','0',22);
INSERT INTO "Subtask" VALUES (45,'Check equipment','0',23);
INSERT INTO "Subtask" VALUES (46,'Shoot','0',23);
INSERT INTO "Subtask" VALUES (47,'Add music','0',24);
INSERT INTO "Subtask" VALUES (48,'Add effect and title','0',24);
INSERT INTO "Subtask" VALUES (49,'Submit to reviewers','0',25);
INSERT INTO "Subtask" VALUES (50,'Post on Youtube','0',25);
INSERT INTO "Subtask" VALUES (51,'Try Microsoft Word','0',60);
INSERT INTO "Subtask" VALUES (52,'Try Scrivener','0',60);
INSERT INTO "Subtask" VALUES (53,'Try Draft','0',60);
INSERT INTO "Subtask" VALUES (54,'Write 750 words','0',26);
INSERT INTO "Subtask" VALUES (55,'Finish your 1st draft with no internal editor','0',26);
INSERT INTO "Subtask" VALUES (56,'Read your previous draft, mark what you like and discard the rest','0',27);
INSERT INTO "Subtask" VALUES (57,'Write your next draft from scratch with your favorite parts as reference points','0',27);
INSERT INTO "Subtask" VALUES (58,'Read your draft and revise it into the final draft','0',27);
INSERT INTO "Subtask" VALUES (59,'event 1','1',31);
INSERT INTO "Subtask" VALUES (60,'event 2','1',31);
INSERT INTO "Subtask" VALUES (61,'event 3','1',31);
INSERT INTO "Subtask" VALUES (62,'event 4','0',31);
INSERT INTO "Subtask" VALUES (63,'bedrooms','1',39);
INSERT INTO "Subtask" VALUES (64,'bathrooms','1',39);
INSERT INTO "Subtask" VALUES (65,'living room','1',39);
INSERT INTO "Subtask" VALUES (66,'kitchen','1',39);
INSERT INTO "Subtask" VALUES (67,'basement','1',39);
INSERT INTO "Subtask" VALUES (68,'home office','1',39);
INSERT INTO "Subtask" VALUES (69,'attic','1',39);
INSERT INTO "Subtask" VALUES (70,'bank','1',40);
INSERT INTO "Subtask" VALUES (71,'general practitioner','1',40);
INSERT INTO "Subtask" VALUES (72,'dentist','1',40);
INSERT INTO "Subtask" VALUES (73,'water provider','1',40);
INSERT INTO "Subtask" VALUES (74,'gas & electricity provider','1',40);
INSERT INTO "Subtask" VALUES (75,'intenet\telecom provider','1',40);
INSERT INTO "Subtask" VALUES (76,'subscriptions','1',40);
INSERT INTO "Subtask" VALUES (77,'bedrooms','1',43);
INSERT INTO "Subtask" VALUES (78,'bathrooms','1',43);
INSERT INTO "Subtask" VALUES (79,'living room','1',43);
INSERT INTO "Subtask" VALUES (80,'kitchen','1',43);
INSERT INTO "Subtask" VALUES (81,'basement','1',43);
INSERT INTO "Subtask" VALUES (82,'home office','1',43);
INSERT INTO "Subtask" VALUES (83,'attic','1',43);
INSERT INTO "Subtask" VALUES (84,'7 unders','1',48);
INSERT INTO "Subtask" VALUES (85,'7 pairs of socks','1',48);
INSERT INTO "Subtask" VALUES (86,'3 shorts','1',48);
INSERT INTO "Subtask" VALUES (87,'6 T-shirts','1',48);
INSERT INTO "Subtask" VALUES (88,'swimming trunks','1',48);
INSERT INTO "Subtask" VALUES (89,'sandals','1',48);
INSERT INTO "Subtask" VALUES (90,'Taqueria Honorio','1',49);
INSERT INTO "Subtask" VALUES (91,'Sabor De Mar','1',49);
INSERT INTO "Subtask" VALUES (92,'Antojitos La Chiapaneca','1',49);
INSERT INTO "Subtask" VALUES (93,'Chichen Itza (Day Trip)','1',50);
INSERT INTO "Subtask" VALUES (94,'Ruins of Tulum','1',50);
INSERT INTO "Subtask" VALUES (95,'Cenotes Labnaha','1',50);
INSERT INTO "Comment" VALUES (1,'several Disney characters or just one','2021-1-31',1);
INSERT INTO "Comment" VALUES (2,'partner name: John','2021-1-18',8);
INSERT INTO "Comment" VALUES (3,'join team number 4','2021-2-13',12);
INSERT INTO "Comment" VALUES (4,'add 2 kilograms','2021-4-1',20);
INSERT INTO "Comment" VALUES (5,'casting Kelly for main character','2021-4-1',22);
INSERT INTO "Comment" VALUES (6,'casting John for main character','2021-4-2',22);
INSERT INTO "Comment" VALUES (7,'​​Looking for inspiration? Check out Good Reads. it''s a great source for finding new books and reviewing them afterwards','2021-1-1',26);
INSERT INTO "Comment" VALUES (8,'For more inspiration and advice: Deliver Career-Changing Mentorship – 25 Tips From the Best Mentors We Know','2021-1-3',32);
INSERT INTO "Comment" VALUES (9,'Try this Language Learning template to get a head start!','2021-2-1',7);
INSERT INTO "Comment" VALUES (10,'Starting a side business is a great goal for anyone who wants to create a new income stream, stretch their professional skills, or both. But it can also be daunting to get started.','2021-1-26',50);
INSERT INTO "Creator" VALUES (1,1);
INSERT INTO "Creator" VALUES (1,2);
INSERT INTO "Creator" VALUES (1,3);
INSERT INTO "Creator" VALUES (1,4);
INSERT INTO "Creator" VALUES (1,5);
INSERT INTO "Creator" VALUES (1,6);
INSERT INTO "Creator" VALUES (1,7);
INSERT INTO "Creator" VALUES (1,8);
INSERT INTO "Creator" VALUES (1,9);
INSERT INTO "Creator" VALUES (1,10);
INSERT INTO "Creator" VALUES (2,11);
INSERT INTO "Creator" VALUES (2,12);
INSERT INTO "Creator" VALUES (2,13);
INSERT INTO "Creator" VALUES (2,14);
INSERT INTO "Creator" VALUES (2,15);
INSERT INTO "Creator" VALUES (2,16);
INSERT INTO "Creator" VALUES (2,17);
INSERT INTO "Creator" VALUES (2,18);
INSERT INTO "Creator" VALUES (2,19);
INSERT INTO "Creator" VALUES (2,20);
INSERT INTO "Creator" VALUES (3,21);
INSERT INTO "Creator" VALUES (3,22);
INSERT INTO "Creator" VALUES (3,23);
INSERT INTO "Creator" VALUES (3,24);
INSERT INTO "Creator" VALUES (3,25);
INSERT INTO "Creator" VALUES (3,26);
INSERT INTO "Creator" VALUES (3,27);
INSERT INTO "Creator" VALUES (3,28);
INSERT INTO "Creator" VALUES (3,29);
INSERT INTO "Creator" VALUES (3,30);
INSERT INTO "Creator" VALUES (4,31);
INSERT INTO "Creator" VALUES (4,32);
INSERT INTO "Creator" VALUES (4,33);
INSERT INTO "Creator" VALUES (4,34);
INSERT INTO "Creator" VALUES (4,35);
INSERT INTO "Creator" VALUES (4,36);
INSERT INTO "Creator" VALUES (4,37);
INSERT INTO "Creator" VALUES (4,38);
INSERT INTO "Creator" VALUES (4,39);
INSERT INTO "Creator" VALUES (4,40);
INSERT INTO "Creator" VALUES (4,41);
INSERT INTO "Creator" VALUES (4,42);
INSERT INTO "Creator" VALUES (4,43);
INSERT INTO "Creator" VALUES (4,44);
INSERT INTO "Creator" VALUES (4,45);
INSERT INTO "Creator" VALUES (5,46);
INSERT INTO "Creator" VALUES (5,47);
INSERT INTO "Creator" VALUES (5,48);
INSERT INTO "Creator" VALUES (5,49);
INSERT INTO "Creator" VALUES (5,50);
INSERT INTO "Creator" VALUES (5,51);
INSERT INTO "Creator" VALUES (5,52);
INSERT INTO "Creator" VALUES (5,53);
INSERT INTO "Creator" VALUES (5,54);
INSERT INTO "Creator" VALUES (5,55);
INSERT INTO "Creator" VALUES (5,56);
INSERT INTO "Creator" VALUES (5,57);
INSERT INTO "Creator" VALUES (5,58);
INSERT INTO "Creator" VALUES (5,59);
INSERT INTO "Creator" VALUES (5,60);
INSERT INTO "Task" VALUES (1,'Brainstorm Meeting','2021-02-11','2021-1-26',NULL,'2','1',1);
INSERT INTO "Task" VALUES (2,'Teammate Assign Work','2021-02-01','2021-1-26',NULL,'1','1',1);
INSERT INTO "Task" VALUES (3,'Writing Planning','2021-03-01','2021-1-26',NULL,'1','1',1);
INSERT INTO "Task" VALUES (4,'Practice Meeting','2021-04-01','2021-1-26',NULL,'2','1',1);
INSERT INTO "Task" VALUES (5,'Final Presentation','2021-04-15','2021-1-26',NULL,'2','1',1);
INSERT INTO "Task" VALUES (6,'Tools Setup','2021-02-11','2021-1-11',NULL,'1','0',2);
INSERT INTO "Task" VALUES (7,'Study','2021-07-10','2021-1-11',NULL,'2','0',2);
INSERT INTO "Task" VALUES (8,'Speaking','2021-07-01','2021-1-11',NULL,'1','0',2);
INSERT INTO "Task" VALUES (9,'Planning Trip','2021-07-10','2021-1-11',NULL,'1','1',2);
INSERT INTO "Task" VALUES (10,'Test','2021-07-15','2021-1-11',NULL,'2','0',2);
INSERT INTO "Task" VALUES (11,'FirstDay Setup','2021-02-21','2021-2-11',NULL,'1','1',3);
INSERT INTO "Task" VALUES (12,'Meet People','2021-02-21','2021-2-11',NULL,'1','1',3);
INSERT INTO "Task" VALUES (13,'Role Task','2021-02-21','2021-2-11',NULL,'2','1',3);
INSERT INTO "Task" VALUES (14,'Benifit Read','2021-02-10','2021-2-11',NULL,'1','0',3);
INSERT INTO "Task" VALUES (15,'Book Recommend',NULL,'2021-2-11',NULL,'0','1',3);
INSERT INTO "Task" VALUES (16,'Week 1','2021-03-07','2021-3-1',NULL,'1','1',4);
INSERT INTO "Task" VALUES (17,'Week 2','2021-3-14','2021-3-1',NULL,'1','1',4);
INSERT INTO "Task" VALUES (18,'Week 3','2021-3-21','2021-3-1',NULL,'1','0',4);
INSERT INTO "Task" VALUES (19,'Week 4','2021-3-28','2021-3-1',NULL,'1','0',4);
INSERT INTO "Task" VALUES (20,'Week 5','2021-4-4','2021-3-1',NULL,'1','0',4);
INSERT INTO "Task" VALUES (21,'Brainstorm Collection','2021-3-1','2021-1-26',NULL,'2','0',5);
INSERT INTO "Task" VALUES (22,'Pre-production','2021-5-1','2021-1-26',NULL,'1','1',5);
INSERT INTO "Task" VALUES (23,'Production','2021-7-1','2021-1-26',NULL,'1','1',5);
INSERT INTO "Task" VALUES (24,'Post-production','2021-8-1','2021-1-26',NULL,'2','1',5);
INSERT INTO "Task" VALUES (25,'Distribution','2021-09-15','2021-1-26',NULL,'2','1',5);
INSERT INTO "Task" VALUES (26,'First draft','2021-11-03','2021-10-26',NULL,'2','1',6);
INSERT INTO "Task" VALUES (27,'Rewrite your next draft','2021-11-05','2021-10-26',NULL,'2','1',6);
INSERT INTO "Task" VALUES (28,'Revise your final draft','2021-11-08','2021-10-26',NULL,'2','0',6);
INSERT INTO "Task" VALUES (29,'Submit to your editor asking for specific feedback','2021-11-10','2021-10-26',NULL,'2','0',6);
INSERT INTO "Task" VALUES (30,'Finalize the book','2021-11-12','2021-10-26',NULL,'2','0',6);
INSERT INTO "Task" VALUES (31,'Speak at at least 4 events this year','2021-12-31','2021-1-1',NULL,'2','0',7);
INSERT INTO "Task" VALUES (32,'Mentor a young person in my field','2021-12-31','2021-1-1',NULL,'2','1',7);
INSERT INTO "Task" VALUES (33,'Start a side business','2021-12-31','2021-1-1',NULL,'1','1',7);
INSERT INTO "Task" VALUES (34,'Remember to send cards for my friends’ and family’s birthdays','2021-12-31','2021-1-1',NULL,'2','0',7);
INSERT INTO "Task" VALUES (35,'Set up and stick with a budget','2021-12-31','2021-1-1',NULL,'2','0',7);
INSERT INTO "Task" VALUES (36,'Read 30 books this year','2021-12-31','2021-1-1',NULL,'2','0',7);
INSERT INTO "Task" VALUES (37,'Learn a new language','2021-12-31','2021-1-1',NULL,'2','1',7);
INSERT INTO "Task" VALUES (38,'Rent a moving van or truck','2021-09-10','2021-8-10',NULL,'2','1',8);
INSERT INTO "Task" VALUES (39,'Box up everything','2021-09-12','2021-8-10',NULL,'2','1',8);
INSERT INTO "Task" VALUES (40,'Update address ','2021-09-13','2021-8-10',NULL,'2','1',8);
INSERT INTO "Task" VALUES (41,'Final clean of the house','2021-9-12','2021-8-10',NULL,'2','1',8);
INSERT INTO "Task" VALUES (42,'Do a final round to make sure you haven''t forgotten anything ','2021-9-12','2021-8-10',NULL,'2','1',8);
INSERT INTO "Task" VALUES (43,'Unpack and put things in place','2021-9-13','2021-8-10',NULL,'2','1',8);
INSERT INTO "Task" VALUES (44,'Treat helping hands to a meal ','2021-9-14','2021-8-10',NULL,'1','1',8);
INSERT INTO "Task" VALUES (45,'Book hotel stay','2021-8-12','2021-8-2',NULL,'1','1',9);
INSERT INTO "Task" VALUES (46,'Rent a car','2021-8-12','2021-8-2',NULL,'1','1',9);
INSERT INTO "Task" VALUES (47,'Get travel insurance','2021-8-12','2021-8-2',NULL,'2','1',9);
INSERT INTO "Task" VALUES (48,'Pack suitcase','2021-8-12','2021-8-2',NULL,'2','1',9);
INSERT INTO "Task" VALUES (49,'Where to eat and drink in Tulum','2021-8-12','2021-8-2',NULL,'1','1',9);
INSERT INTO "Task" VALUES (50,'Signtseeing in Tulum','2021-8-12','2021-8-2',NULL,'1','1',9);
INSERT INTO "Task" VALUES (51,'Let My People Go Surfing: The Education of a Reluctant Businessman','2021-7-3','2021-6-20','https://www.amazon.com/Let-People-Surfing-Education-Businessman-Including/dp/0143109677/ref=sr_1_1?ie=UTF8&qid=1542718258&sr=8-1&keywords=let+my+people+go+surfing+book','0','1',10);
INSERT INTO "Task" VALUES (52,'Quiet: The Power of Introverts in a World That Can''t Stop Talking','2021-6-1','2021-5-25','https://www.amazon.com/dp/B004J4WNL2/ref=dp-kindle-redirect?_encoding=UTF8&btkr=1','0','1',10);
INSERT INTO "Task" VALUES (53,'The Score Takes Care of Itself','2021-5-5','2021-5-1','https://www.amazon.com/The-Score-Takes-Care-Itself/dp/1591843472?tag=viglink124321-20','0','0',10);
INSERT INTO "Task" VALUES (54,'Outliers','2021-5-20','2021-5-15','https://www.amazon.com/Outliers-Story-Success-Malcolm-Gladwell/dp/0316017930?tag=viglink124321-20','0','0',10);
INSERT INTO "Task" VALUES (55,'Bird by Bird: Some Instructions on Writing and Life','2021-4-30','2021-4-1','https://www.amazon.com/Bird-Some-Instructions-Writing-Life-ebook/dp/B000SEGI8Q/ref=sr_1_1?s=digital-text&ie=UTF8&qid=1542318359&sr=1-1&keywords=bird+by+bird+some+instructions+on+writing+and+life','0','0',10);
INSERT INTO "Task" VALUES (56,'Set a final deadline',NULL,'2021-10-26',NULL,'0','0',6);
INSERT INTO "Task" VALUES (57,'Brainstorm a few ideas',NULL,'2021-10-26',NULL,'2','1',6);
INSERT INTO "Task" VALUES (58,'Write a few flash fictions and pick the one you like the most',NULL,'2121-10-26',NULL,'2','0',6);
INSERT INTO "Task" VALUES (59,'Read a few books that inspire your writing',NULL,'2121-10-26',NULL,'2','0',6);
INSERT INTO "Task" VALUES (60,'Decide which tool you’ll use to write the book',NULL,'2121-10-26',NULL,'1','0',6);
COMMIT;
