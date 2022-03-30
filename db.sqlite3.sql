BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "myapp_category" (
	"id"	integer NOT NULL,
	"name"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "myapp_contact" (
	"id"	integer NOT NULL,
	"name"	varchar(100) NOT NULL,
	"email"	varchar(100) NOT NULL,
	"subject"	varchar(100) NOT NULL,
	"remarks"	text NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "myapp_book" (
	"id"	integer NOT NULL,
	"book_name"	varchar(100) NOT NULL,
	"book_price"	integer NOT NULL,
	"book_description"	text NOT NULL,
	"book_image"	varchar(100),
	"address"	text NOT NULL,
	"country"	varchar(100) NOT NULL,
	"state"	varchar(100) NOT NULL,
	"city"	varchar(100) NOT NULL,
	"book_sellr_id"	bigint NOT NULL,
	"category_id"	bigint NOT NULL,
	"active"	bool NOT NULL,
	"date"	date NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("book_sellr_id") REFERENCES "myapp_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("category_id") REFERENCES "myapp_category"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "myapp_user" (
	"id"	integer NOT NULL,
	"fname"	varchar(100) NOT NULL,
	"lname"	varchar(100) NOT NULL,
	"email"	varchar(100) NOT NULL,
	"mobile"	varchar(100) NOT NULL,
	"password"	varchar(100) NOT NULL,
	"cpassword"	varchar(100) NOT NULL,
	"user_img"	varchar(100),
	"date"	date NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2022-03-28 19:12:01.429671');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2022-03-28 19:12:01.448687');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2022-03-28 19:12:01.464702');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2022-03-28 19:12:01.477715');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2022-03-28 19:12:01.492728');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2022-03-28 19:12:01.509743');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2022-03-28 19:12:01.523757');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2022-03-28 19:12:01.537769');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2022-03-28 19:12:01.545775');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2022-03-28 19:12:01.558788');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2022-03-28 19:12:01.566795');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2022-03-28 19:12:01.575803');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2022-03-28 19:12:01.588815');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2022-03-28 19:12:01.599825');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2022-03-28 19:12:01.610835');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2022-03-28 19:12:01.619844');
INSERT INTO "django_migrations" VALUES (17,'auth','0012_alter_user_first_name_max_length','2022-03-28 19:12:01.631854');
INSERT INTO "django_migrations" VALUES (18,'myapp','0001_initial','2022-03-28 19:12:01.644866');
INSERT INTO "django_migrations" VALUES (19,'myapp','0002_book_active','2022-03-28 19:12:01.654875');
INSERT INTO "django_migrations" VALUES (20,'sessions','0001_initial','2022-03-28 19:12:01.664884');
INSERT INTO "django_migrations" VALUES (21,'myapp','0003_book_date','2022-03-28 19:14:19.533934');
INSERT INTO "django_migrations" VALUES (22,'myapp','0004_alter_book_date','2022-03-28 19:16:09.342797');
INSERT INTO "django_migrations" VALUES (23,'myapp','0005_alter_book_date','2022-03-28 19:16:09.353807');
INSERT INTO "django_migrations" VALUES (24,'myapp','0006_user_date','2022-03-28 19:26:10.505185');
INSERT INTO "django_admin_log" VALUES (1,'2022-03-28 19:17:17.857209','1','Commerce','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (2,'2022-03-28 19:17:26.314343','2','Physics','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (3,'2022-03-28 19:17:35.931261','3','Chemistry','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (4,'2022-03-28 19:17:44.463574','4','Biology','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (5,'2022-03-28 19:17:50.748922','5','Computer','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (6,'2022-03-28 19:17:57.523716','6','Mathematics','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (7,'2022-03-28 19:18:03.619390','7','Fiction','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (8,'2022-03-28 19:18:09.919130','8','Adventure/Sports','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (9,'2022-03-28 19:18:16.048822','9','Biography','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (10,'2022-03-28 19:18:22.182770','10','Finance','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (11,'2022-03-28 19:18:27.704149','11','Business','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (12,'2022-03-28 19:18:33.354833','12','Motivational','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (13,'2022-03-28 19:18:38.347173','13','Poetry/Story','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (14,'2022-03-28 19:18:43.153764','14','Arts/Crafts','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (15,'2022-03-28 19:18:48.916708','15','Diploma Courses','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (16,'2022-03-28 19:18:55.328475','16','Other Books','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (17,'2022-03-28 19:22:37.642203','1','Manav - manvendras2608@gmail.com','',9,1,3);
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'myapp','category');
INSERT INTO "django_content_type" VALUES (8,'myapp','contact');
INSERT INTO "django_content_type" VALUES (9,'myapp','user');
INSERT INTO "django_content_type" VALUES (10,'myapp','book');
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_category','Can add category');
INSERT INTO "auth_permission" VALUES (26,7,'change_category','Can change category');
INSERT INTO "auth_permission" VALUES (27,7,'delete_category','Can delete category');
INSERT INTO "auth_permission" VALUES (28,7,'view_category','Can view category');
INSERT INTO "auth_permission" VALUES (29,8,'add_contact','Can add contact');
INSERT INTO "auth_permission" VALUES (30,8,'change_contact','Can change contact');
INSERT INTO "auth_permission" VALUES (31,8,'delete_contact','Can delete contact');
INSERT INTO "auth_permission" VALUES (32,8,'view_contact','Can view contact');
INSERT INTO "auth_permission" VALUES (33,9,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (34,9,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (35,9,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (36,9,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (37,10,'add_book','Can add book');
INSERT INTO "auth_permission" VALUES (38,10,'change_book','Can change book');
INSERT INTO "auth_permission" VALUES (39,10,'delete_book','Can delete book');
INSERT INTO "auth_permission" VALUES (40,10,'view_book','Can view book');
INSERT INTO "auth_user" VALUES (1,'pbkdf2_sha256$320000$DuNLPRY9gtXV5C6lmb8Mal$WypIB1o26hL4CCdVPD3/j3pk7BGP1MSthoOHtGWVmhM=','2022-03-29 16:33:25.013442',1,'singh','','',1,1,'2022-03-28 19:12:34.459113','');
INSERT INTO "auth_user" VALUES (2,'pbkdf2_sha256$260000$uS2tryUylo60yBGDQIhI6O$BXgZFjKqb56MeMkYfEoCbRDVqLiKGVjta3sDUUUUy9A=','2022-03-29 09:08:28.443310',1,'kirit','','',1,1,'2022-03-29 09:08:13.672436','');
INSERT INTO "myapp_category" VALUES (1,'Commerce');
INSERT INTO "myapp_category" VALUES (2,'Physics');
INSERT INTO "myapp_category" VALUES (3,'Chemistry');
INSERT INTO "myapp_category" VALUES (4,'Biology');
INSERT INTO "myapp_category" VALUES (5,'Computer');
INSERT INTO "myapp_category" VALUES (6,'Mathematics');
INSERT INTO "myapp_category" VALUES (7,'Fiction');
INSERT INTO "myapp_category" VALUES (8,'Adventure/Sports');
INSERT INTO "myapp_category" VALUES (9,'Biography');
INSERT INTO "myapp_category" VALUES (10,'Finance');
INSERT INTO "myapp_category" VALUES (11,'Business');
INSERT INTO "myapp_category" VALUES (12,'Motivational');
INSERT INTO "myapp_category" VALUES (13,'Poetry/Story');
INSERT INTO "myapp_category" VALUES (14,'Arts/Crafts');
INSERT INTO "myapp_category" VALUES (15,'Diploma Courses');
INSERT INTO "myapp_category" VALUES (16,'Other Books');
INSERT INTO "django_session" VALUES ('31mnwh0313m0u15xwr8qwqu1sexngn5j','.eJxVj81uwyAQhN-Fc4v_MJCcqtz9DNYubDBpwJWJc4ny7lnUHNrjzHyanX2IGfbbMu-Ftjl6cRSd-PjrIbhvyjXwF8hhlW7Nty2irIh8p0VOq6fr6c3-K1igLLV2xAOi0wMo12o_tKzQ9xqRuoN1RltUajRetarrh7OyxhNoM1qjrB2p59JzhkRcNUGGO2tKEK-sE-Q7n92g9Lq1X6HaPDMx8vtWCkw1iXyEJiYIVJq6b90-O3n5CeL5AuhLVb0:1nYv0j:LbFaz7qIUolfWhnV0oJZYUSnfZBL8PefKbfsgxbBL_0','2022-04-11 19:26:41.098108');
INSERT INTO "django_session" VALUES ('p0k5mjcd80oumw4qnzgsc9753wjnqr51','.eJyrVkrLS8xNVbJSys4syixR0lFKzU3MzIHxHdJBPL3k_FygTGlxalF8Zm46UFI_NzUlM1E_MzcxPbVYP7G0JCO_SNdQL6sgXakWAJpkHGE:1nZ7VW:O03o51sNMMiiT-QC3S8ihj89QMOfRVSQviQTEYdTVRY','2022-04-12 08:47:18.906145');
INSERT INTO "django_session" VALUES ('h4p5c02bpusogorxo0nkkbh6890slzbq','.eJxVjM0OwiAQhN-Fs6Gla1E8Ge8-Q7OwK0ULmP7Eg_HdpVEPHme-b-YpLgkji4O4hTHMYiM4Yhh--ejXJF2OhSwTj12IvsAqMgWsQkTPU0X5kYaM1Cl5T76YHS5z3318Knrz31l0N04roCsmn8t_msdg5arIL53kORMPp6_7d9Dj1Jc1E6DSF2zYYA21IWMACJzTaJxq61aDJc1glbWs9rZp2enWuR0CcQNb8XoDxzRVDQ:1nZ7q0:D4JLAR8GGzLRY8Gmx8EmG-mhm_O2ZkEOkWRRer6loU0','2022-04-12 09:08:28.593805');
INSERT INTO "django_session" VALUES ('az6tgvpth4jyhg404fqjf65e29rlmfk4','.eJxVzU1ywjAMBeC7eE2dP8c2rJjuOUNGsoRjih0mBjad3r3KwIble_rm6VedC2RWB3WCAk-1U5whXSVnKE8utELtbeuPcat1WLKQR-V1SjmKajJTgiZliFwbeNznZf3q9OUWxU1bnl6aBHefHUL4kQ9yoAuUuMh6ua8J9Ub0-1r1aSG-fr_tx8AMdd5mR9wjBjuACa2loZWE1FtE7vY-OOvRmNGRaU3XD2fjHTFYN3pnvB-5V3__jkpVvQ:1nZEmb:5nbCGpmhVJK1McGz7rvoOmH8OBQzb7SIKU6A56Q3scA','2022-04-12 16:33:25.019448');
INSERT INTO "myapp_book" VALUES (2,'Anything',123,'dsgafgag','images/Screenshot_34_tZQ3oNt.png','Afgsaf','India','Gujarat','Ahmedabad',1,1,1,'2022-03-29');
INSERT INTO "myapp_book" VALUES (4,'Pshychology of money',123,'asfaf','images/Screenshot_35_FaTsXGf.png','afsfa','India','Gujarat','Ahmedabad',1,5,1,'2022-03-29');
INSERT INTO "myapp_book" VALUES (5,'Chemi',111,'safaf','images/Screenshot_33_uiAWsrq.png','sfaf','India','Gujarat','Ahmedabad',1,5,1,'2022-03-29');
INSERT INTO "myapp_user" VALUES (1,'Manav','Singh','manvendras2608@gmail.com','12314','test','test','images/author-1.jpg','2022-03-29');
INSERT INTO "myapp_user" VALUES (2,'kirit','suthar','kirit@gmail.com','kirit@gmail.com','123','123','images/download_1.png','2022-03-29');
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "myapp_book_book_sellr_id_7aad36a5" ON "myapp_book" (
	"book_sellr_id"
);
CREATE INDEX IF NOT EXISTS "myapp_book_category_id_05e259cc" ON "myapp_book" (
	"category_id"
);
COMMIT;
