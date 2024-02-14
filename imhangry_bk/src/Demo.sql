
USE [master];
GO

-- 創建資料庫
CREATE DATABASE [hangryDB] COLLATE Chinese_Taiwan_Stroke_CI_AS;
GO


WAITFOR DELAY '00:00:01';


USE [hangryDB];
GO

DROP TABLE if exists brand;
DROP TABLE if exists  business_payment_method;
DROP TABLE if exists  business_user;
DROP TABLE if exists  category;
DROP TABLE if exists  coupon;
DROP TABLE if exists  coupon_bind;
DROP TABLE if exists  credit_card;
DROP TABLE if exists  customize;
DROP TABLE if exists  customize_option;
DROP TABLE if exists  guest_address;
DROP TABLE if exists  guest_user;
DROP TABLE if exists  likes;
DROP TABLE if exists  order_detail;
DROP TABLE if exists  order_form;
DROP TABLE if exists  payment_method;
DROP TABLE if exists  product;
DROP TABLE if exists  revenue;
DROP TABLE if exists  sales;

create table brand
(
   id int identity not null,
   eng_name Nvarchar(max),
   image Nvarchar(max),
   name Nvarchar(max),
   primary key (id)
)
create table business_payment_method
(
   fk_business_id int not null,
   fk_payment_method int not null,
   primary key (fk_business_id, fk_payment_method)
)
create table business_user
(
   fk_brand_id int,
   id int identity not null,
   rate float(53),
   address Nvarchar(50),
   background_color Nvarchar(50),
   business_type Nvarchar(50),
   city Nvarchar(15),
   describe Nvarchar(100),
   dist Nvarchar(15),
   eng_name Nvarchar(50),
   image_ad Nvarchar(max),
   image_icon Nvarchar(max),
   image_index Nvarchar(max),
   join_date varchar(255),
   name Nvarchar(max),
   operation_time Nvarchar(50),
   password Nvarchar(max),
   phone Nvarchar(max),
   text_color Nvarchar(50),
   primary key (id)
)
create table category
(
   id int identity not null,
   category_name Nvarchar(50),
   primary key (id)
)
create table coupon
(
   amount int,
   discount int,
   id int identity not null,
   threshold int,
   create_date datetime2,
   end_date datetime2,
   start_date datetime2,
   description nvarchar(100),
   title nvarchar(30),
   primary key (id)
)
create table coupon_bind
(
   fk_coupon_id int,
   fk_guest_id int,
   id int identity not null,
   used int,
   create_date datetime2,
   used_date datetime2,
   code varchar(255),
   primary key (id)
)
create table credit_card
(
   default_card int,
   fk_guest_id int,
   id int identity not null,
   credit_card_no bigint,
   name Nvarchar(30),
   primary key (id)
)
create table customize
(
   fk_category_id int,
   id int identity not null,
   cust_cate_name Nvarchar(max),
   primary key (id)
)
create table customize_option
(
   extra_price int,
   fk_customize_id int,
   id int identity not null,
   cust_option_name Nvarchar(max),
   primary key (id)
)
create table guest_address
(
   fk_guest_id int,
   id int identity not null,
   address Nvarchar(100),
   city Nvarchar(30),
   dist Nvarchar(30),
   primary key (id)
)
create table guest_user
(
   gender bit,
   google_id int,
   id int identity not null,
   birthday Nvarchar(max),
   email Nvarchar(max),
   image Nvarchar(max),
   invoice Nvarchar(max),
   join_date Nvarchar(max),
   name Nvarchar(30),
   nickname Nvarchar(30),
   password Nvarchar(max),
   phone varchar(255),
   tax_number Nvarchar(max),
   primary key (id)
)
create table likes
(
   fk_business_id int not null,
   fk_guest_id int not null,
   primary key (fk_business_id, fk_guest_id)
)
create table order_detail
(
   amount int,
   category int,
   fk_order_id int,
   fk_product_id int,
   id int identity not null,
   price int,
   product_total int,
   describe Nvarchar(100),
   image Nvarchar(max),
   name Nvarchar(max),
   primary key (id)
)
create table order_form
(
   coupon_id int,
   fk_business_id int,
   fk_guest_id int,
   id int identity not null,
   payment_status int,
   total int,
   time datetime2(6),
   address Nvarchar(100),
   payment_type Nvarchar(max),
   pickup Nvarchar(max),
   text Nvarchar(50),
   primary key (id)
)
create table payment_method
(
   id int identity not null,
   method Nvarchar(max),
   primary key (id)
)
create table product
(
   fk_business_id int,
   fk_category_id int,
   id int identity not null,
   price int,
   status int,
   description nvarchar(100),
   eng_name nvarchar(30),
   image Nvarchar(max),
   name nvarchar(30),
   primary key (id)
)
create table revenue
(
   id int not null,
   revenue int,
   date datetime2(6),
   primary key (id)
)
create table sales
(
   fk_category_id int,
   id int identity not null,
   end_date datetime2(6),
   start_date datetime2(6),
   discount Nvarchar(max),
   primary key (id)
)
alter table business_payment_method add constraint FK1xckrp0c4msgp1241d6aolmof foreign key (fk_business_id) references business_user
alter table business_payment_method add constraint FKou8ycphpt78f6y999mkkhfo1g foreign key (fk_payment_method) references payment_method
alter table business_user add constraint FK8ysegve9sps2kmdqsgklus2cg foreign key (fk_brand_id) references brand
alter table coupon_bind add constraint FKsywpidi33frhjoiilgl25d65v foreign key (fk_coupon_id) references coupon
alter table coupon_bind add constraint FKkvlvaan56otqi2rn5w7ws61ce foreign key (fk_guest_id) references guest_user
alter table credit_card add constraint FKe6fim52ng1nbktourwsqh6q3t foreign key (fk_guest_id) references guest_user
alter table customize add constraint FKd0ayhsd55b62y58q7es2nim9p foreign key (fk_category_id) references category
alter table customize_option add constraint FKhcv4nsb9q8ps3mjex168hffkd foreign key (fk_customize_id) references customize
alter table guest_address add constraint FKmcqfihqbwxms1sld25n702s7b foreign key (fk_guest_id) references guest_user
alter table likes add constraint FK80hlo0bj4c6qtcuvtns8owerl foreign key (fk_business_id) references business_user
alter table likes add constraint FKkv4como0p1xmdh1x4tj9gg3s2 foreign key (fk_guest_id) references guest_user
alter table order_detail add constraint FK81hpi5pdnq7pgtihf24b3xooe foreign key (fk_order_id) references order_form
alter table order_detail add constraint FKl68hdl31k6xtbvkibr5wcdf5h foreign key (fk_product_id) references product
alter table order_form add constraint FK931dqw61qbaildx80t04g5vdl foreign key (fk_business_id) references business_user
alter table order_form add constraint FKsqg8e3yfxinbke7ag37eftnxy foreign key (fk_guest_id) references guest_user
alter table product add constraint FK19bac6fagsk4im17879r3mskd foreign key (fk_business_id) references business_user
alter table product add constraint FKpxqa5fj6hpcc9mew356eoj68d foreign key (fk_category_id) references category
alter table sales add constraint FKrtu9103f5r7griiri7ir43brr foreign key (fk_category_id) references category


INSERT INTO [dbo].[category]
   ([category_name])
VALUES
   ('紅茶'),
   ('綠茶'),
   ('鮮奶'),
   ('冬露'),
   ('果茶'),
   ('冬季限定'),
   --ys
   ('QQ珍珠'),
   ('花花草草'),
   ('健康水果')

INSERT INTO [dbo].[customize]
   ([fk_category_id],cust_cate_name)
VALUES(1, '溫度'),
   (1, '甜度'),
   (1, '加料'),
   (2, '溫度'),
   (2, '甜度'),
   (2, '加料'),
   (3, '溫度'),
   (3, '甜度'),
   (4, '溫度'),
   (4, '甜度'),
   (4, '加料'),
   (5, '溫度'),
   (5, '甜度'),
   (5, '加料'),
   (6, '溫度'),
   (6, '甜度'),
   (7, '溫度'),
   (7, '甜度'),
   (7, '加料'),
   (8, '溫度'),
   (8, '甜度'),
   (8, '加料'),
   (9, '溫度'),
   (9, '甜度'),
   (9, '加料')


INSERT INTO [dbo].[customize_option]
   (fk_customize_id,cust_option_name,extra_price)
VALUES(1, '正常冰', 0),
   --紅茶
   (1, '少冰', 0),
   (1, '微冰', 0),
   (1, '去冰', 0),
   (1, '常溫', 0),
   (2, '無糖', 0),
   (2, '一分糖', 0),
   (2, '微糖', 0),
   (2, '半糖', 0),
   (2, '少糖', 0),
   (2, '全糖', 0),
   (3, '珍珠', 10),
   (3, '椰果', 10),
   (3, '寒天', 10),
   (4, '正常冰', 0),
   --綠茶
   (4, '少冰', 0),
   (4, '微冰', 0),
   (4, '去冰', 0),
   (4, '常溫', 0),
   (5, '無糖', 0),
   (5, '一分糖', 0),
   (5, '微糖', 0),
   (5, '半糖', 0),
   (5, '少糖', 0),
   (5, '全糖', 0),
   (6, '珍珠', 10),
   (6, '椰果', 10),
   (6, '寒天', 10),
   (7, '少冰', 0),
   --鮮奶
   (7, '微冰', 0),
   (7, '去冰', 0),
   (7, '常溫', 0),
   (7, '溫熱', 0),
   (8, '無糖', 0),
   (8, '一分糖', 0),
   (8, '微糖', 0),
   (8, '半糖', 0),
   (8, '少糖', 0),
   (8, '全糖', 0),
   (9, '正常冰', 0),
   --冬露
   (9, '少冰', 0),
   (9, '微冰', 0),
   (9, '去冰', 0),
   (9, '常溫', 0),
   (10, '少糖', 0),
   (10, '全糖', 0),
   (11, '珍珠', 10),
   (11, '椰果', 10),
   (11, '寒天', 10),
   (12, '正常冰', 0),
   --果茶
   (12, '少冰', 0),
   (12, '微冰', 0),
   (12, '去冰', 0),
   (13, '無糖', 0),
   (13, '一分糖', 0),
   (13, '微糖', 0),
   (13, '半糖', 0),
   (13, '少糖', 0),
   (13, '全糖', 0),
   (14, '珍珠', 10),
   (14, '椰果', 10),
   (14, '寒天', 10),
   (15, '溫熱', 0),
   --冬季限定
   (16, '固定甜度', 0)


INSERT INTO brand
   (eng_name,image,name)
VALUES('Hangry', 'orderPageImage/HangryBanner.png', '亨格理')

INSERT INTO [dbo].[business_user]
   ([fk_brand_id]
   ,[rate]
   ,[address]
   ,[background_color]
   ,[business_type]
   ,[city]
   ,[describe]
   ,[dist]
   ,[eng_name]
   ,[image_ad]
   ,[image_icon]
   ,[image_index]
   ,[join_date]
   ,[name]
   ,[operation_time]
   ,[password]
   ,[phone]
   ,[text_color])
VALUES
   (1, 4.9, '復興南路一段390號2樓', '#ff5e7d', 'drink', '台北市', 'describe',
      '大安區', 'Hangry', 'image_ad', 'image_icon', 'image_index', '2024-01-01', '大安復興店',
      '09:00-16:30', 'aaaaaa', '02-12345678', '#ff5e7d'),
   --ys
   (1, 4.9, '復興南路一段390號3樓', '#ff5e7d', 'drink', '台北市', '最好喝的飲料店',
      '大安區', 'Hangry2', 'image_ad', 'image_icon', 'image_index', '2024-01-01', '大安復興二店',
      '09:00-16:30', 'bbbbbbbb', '0900000000', '#ff5e7d')



INSERT INTO [dbo].[product]
   ([fk_business_id]
   ,[fk_category_id]
   ,[price]
   ,[description]
   ,[eng_name]
   ,[image]
   ,[name]
   ,[status])
VALUES
   (1, 1, --紅茶
      35, --<price, int,>
      'description', 'Hangry_Black_Tea1', 'orderPageImage/blackTea.png',
      '亨格里紅茶', 1),
   (1, 1, --紅茶
      35, --<price, int,>
      'description', 'Hangry_Black_Tea2', 'orderPageImage/blackTea.png',
      '金萱紅茶', 1),
   (1, 1, --紅茶
      40, --<price, int,>
      'description', 'Hangry_Black_Tea3', 'orderPageImage/blackTea.png',
      '錫蘭紅茶', 1),
   (1, 1, --紅茶
      45, --<price, int,>
      'description', 'Hangry_Black_Tea4', 'orderPageImage/blackTea.png',
      '阿薩姆紅茶', 1),
   (1, 1, --紅茶
      45, --<price, int,>
      'description', 'Hangry_Black_Tea5', 'orderPageImage/blackTea.png',
      '伯爵紅茶', 1),
   (1, 1, --紅茶
      55, --<price, int,>
      'description', 'Hangry_Black_Te6', 'orderPageImage/blackTea.png',
      '紅玉紅茶', 1),
   (1, 2, --綠茶
      35, --<price, int,>
      'description', 'Hangry_Green_Tea', 'orderPageImage/greenTea.png',
      '亨格里綠茶', 1),
   (1, 2, --綠茶
      35, --<price, int,>
      'description', 'Hangry_Green_Tea1', 'orderPageImage/greenTea.png',
      '玉露煎茶', 1),
   (1, 2, --綠茶
      35, --<price, int,>
      'description', 'Hangry_Green_Tea2', 'orderPageImage/greenTea.png',
      '烏龍綠茶', 1),
   (1, 2, --綠茶
      35, --<price, int,>
      'description', 'Hangry_Green_Tea3', 'orderPageImage/greenTea.png',
      '茉莉綠茶', 1),
   (1, 2, --綠茶
      40, --<price, int,>
      'description', 'Hangry_Green_Tea4', 'orderPageImage/plumGreenTea.png',
      '梅子綠茶', 1),
   (1, 3, --鮮奶
      50, --<price, int,>
      'description', 'Hangry_Milk_Tea', 'orderPageImage/blackTeaLatte.png',
      '亨格里拿鐵', 1),
   (1, 3, --鮮奶
      50, --<price, int,>
      'description', 'Hangry_Milk_Tea1', 'orderPageImage/greenTeaLatte.png',
      '烏龍拿鐵', 1),
   (1, 3, --鮮奶
      55, --<price, int,>
      'description', 'Hangry_Milk_Tea2', 'orderPageImage/blackTeaLatte.png',
      '錫蘭拿鐵', 1),
   (1, 3, --鮮奶
      60, --<price, int,>
      'description', 'Hangry_Milk_Tea3', 'orderPageImage/blackTeaLatte.png',
      '阿薩姆拿鐵', 1),
   (1, 3, --鮮奶
      60, --<price, int,>
      'description', 'Hangry_Milk_Tea4', 'orderPageImage/blackTeaLatte.png',
      '伯爵拿鐵', 1),
   (1, 4, --冬露
      35, --<price, int,>
      'description', 'Hangry_Milk_Tea', 'orderPageImage/lemonWhiteGourd.png',
      '亨格里冬露', 1),
   (1, 4, --冬露
      45, --<price, int,>
      'description', 'Hangry_Milk_Tea', 'orderPageImage/lemonWhiteGourd.png',
      '檸檬冬露', 1),
   (1, 4, --冬露
      55, --<price, int,>
      'description', 'Hangry_Milk_Tea', 'orderPageImage/greenTeaLatte.png',
      '冬露鮮奶', 1),
   (1, 5, --果茶
      55, --<price, int,>
      'description', 'Hangry_Milk_Tea', 'orderPageImage/orangeYakult.png',
      '柳橙綠茶', 1),
   (1, 5, --果茶
      60, --<price, int,>
      'description', 'Hangry_Milk_Tea', 'orderPageImage/grapefruitYakult.png',
      '鮮柚綠茶', 1),
   (1, 5, --果茶
      65, --<price, int,>
      'description', 'Hangry_Milk_Tea', 'orderPageImage/orangeYakult.png',
      '柳橙多多', 1),
   (1, 5, --果茶
      70, --<price, int,>
      'description', 'Hangry_Milk_Tea', 'orderPageImage/grapefruitYakult.png',
      '鮮柚多多', 1),
   (1, 5, --果茶
      70, --<price, int,>
      'description', 'Hangry_Milk_Tea', 'orderPageImage/lemonWhiteGourd.png',
      '檸檬冬瓜', 1),
   (1, 6, --冬季限定
      60, --<price, int,>
      'description', 'Hangry_Milk_Tea', 'orderPageImage/GingerRedDate.png',
      '薑汁桂圓', 1),
   (1, 6, --冬季限定
      60, --<price, int,>
      'description', 'Hangry_Milk_Tea', 'orderPageImage/LonganRedDateTea.png',
      '桂圓紅棗', 1),
   (1, 6, --冬季限定
      60, --<price, int,>
      'description', 'Hangry_Milk_Tea', 'orderPageImage/GingerRedDate.png',
      '黑糖薑母', 1),
   --ys
   (2, 7, --QQ珍珠
      80,
      '不哭不哭眼淚是珍珠', 'QQ yogurt', 'bubble yogurt.jpg',
      'QQ珍珠優格', 1),
   (2, 7, --QQ珍珠
      70,
      '不哭不哭眼淚是珍珠', 'QQ pure', 'bubble tea.jpg',
      'QQ珍珠奶茶', 1),
   (2, 7, --QQ珍珠
      70,
      '不哭不哭眼淚是珍珠', 'QQ green tea', 'bubble green tea.jpg',
      'QQ珍珠綠奶茶', 1),
   (2, 7, --QQ珍珠
      100,
      '沒有珍珠 還會讓你QQ', 'QQ', 'ice.jpg',
      'QQ 心好痛', 1),
   (2, 8, --花花草草
      60,
      '拈花惹草', 'herbal tea', 'herbal tea.jpg',
      '招牌花草茶', 1),
   (2, 8, --花花草草
      70,
      '拈花惹草', 'matcha', 'matcha.jpg',
      '香濃抹茶', 1),
   (2, 8, --花花草草
      70,
      '拈花惹草', 'hawaii', 'hawaii.jpg',
      '來去夏威夷', 1),
   (2, 9, --健康水果
      70,
      '喝了保證水嫩嫩', 'pear tea', 'pear.jpg',
      '水梨汁', 1),
   (2, 9, --健康水果
      60,
      '可可也是水果啊', 'cocoa', 'cocoa.jpg',
      '可可揪4讚', 1),
   (2, 9, --健康水果
      99,
      '羊來了 草莓了', 'strawberry tea', 'strawberry.jpg',
      '草莓特調', 1),
   (2, 9, --健康水果
      66,
      '想當貴妃嗎?', 'lychee tea', 'lychee.jpg',
      '荔枝特調', 1),
   (2, 9, --健康水果
      66,
      '沒有酸 怎麼甜', 'lemon juice', 'lemon juice.jpg',
      '檸檬特調', 1),
   (2, 9, --健康水果
      66,
      '好人一生蘋安', 'apple tea', 'apple juice.jpg',
      '蘋果特調', 1)

INSERT INTO [dbo].[guest_user]
   ([gender]
   ,[google_id]
   ,[birthday]
   ,[email]
   ,[image]
   ,[invoice]
   ,[join_date]
   ,[name]
   ,[nickname]
   ,[password]
   ,[phone]
   ,[tax_number])
VALUES
   (1
		   , 99999
           , '1990-01-22'
           , 'aaa@aaa.com'
           , 'image'
           , 'invoice'
           , '2024-01-22'
           , '哇哈哈'
           , '阿哈哈'
           , 'aaaaaa'
           , '0987654321'
           , 'tax_number'),
   --ys
   (2
		   , 000000
           , '1990-01-22'
           , 'bbb@bbb.com'
           , 'image'
           , 'invoice'
           , '2024-01-22'
           , '艾喝罪'
           , '乂乂'
           , 'bbbbbbbb'
           , '0900000000'
           , 'tax_number')

INSERT INTO [dbo].[guest_address]
   ([fk_guest_id]
   ,[address]
   ,[city]
   ,[dist])
VALUES
   (1
           , '仁愛路9999號'
           , '台北市'
           , '大安區'),
   (1
           , '杭州南路9999號'
           , '台北市'
           , '大安區'),
   (2
           , '杭州南路100號'
           , '台北市'
           , '大安區')


INSERT INTO [dbo].[coupon]
   ([amount]
   ,[discount]
   ,[threshold]
   ,[create_date]
   ,[end_date]
   ,[start_date]
   ,[description]
   ,[title])
VALUES
   (1000
           , 15
           , 200
           , '2024-01-20'
           , '2024-03-10'
           , '2024-01-25'
		   , 'Party time!'
           , '開趴踢'),
   (1000
           , 5
           , 100
           , '2024-01-20'
           , '2024-03-10'
           , '2024-01-25'
		   , 'Yo Yo Cyndi baby!'
           , '跳舞會口渴'),
   --ys
   (2000
           , 5
           , 100
           , '2024-01-20'
           , '2024-02-29'
           , '2024-02-20'
           , '龍龍龍龍 引擎發動'
           , '龍好呷'),
   (2000
           , 5
           , 100
           , '2024-01-20'
           , '2024-02-29'
           , '2024-02-20'
           , '龍龍龍龍 引擎發動'
           , '龍厚哩'),
   (2000
           , 10
           , 200
           , '2024-01-20'
           , '2024-02-29'
           , '2024-02-20'
           , '龍龍龍龍 引擎發動'
           , '龍喜哩'),
   (2000
           , 10
           , 200
           , '2024-01-20'
           , '2024-02-29'
           , '2024-02-20'
           , '龍龍龍龍 引擎發動'
           , '錢龍來'),
   (2000
           , 10
           , 200
           , '2024-01-20'
           , '2024-02-29'
           , '2024-02-20'
           , '龍龍龍龍 引擎發動'
           , '龍順利'),
   (2000
           , 30
           , 1314
           , '2024-02-01'
           , '2024-03-14'
           , '2024-02-14'
           , '來杯巧克力吧'
           , '每天都4情人節'),
   (2000
           , 10
           , 111
           , '2024-02-01'
           , '2024-03-14'
           , '2024-02-14'
           , '來份獨享餐吧'
           , '單身也可以過情人節'),
   (1000
           , 15
           , 299
           , '2024-01-31'
           , '2024-02-29'
           , '2024-02-01'
           , '2月多一天 開心嗎'
           , '2月優惠'),
   (1000
           , 20
           , 399
           , '2024-02-20'
           , '2024-03-31'
           , '2024-03-01'
           , '3月沒有連假'
           , '3月安慰獎'),
   (1000
           , 20
           , 399
           , '2024-02-20'
           , '2024-03-31'
           , '2024-03-01'
           , '3月吃爆吧'
           , '3月吃個麥當勞')

INSERT INTO [dbo].[coupon_bind]
   ([fk_coupon_id]
   ,[fk_guest_id]
   ,[used]
   ,[code])
VALUES
   (1
           , 1
           , 0
           , '999999'),
   (2
           , 1
           , 0
           , '999999'),
   (2
           , 1
           , 0
           , '999999')