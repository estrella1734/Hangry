create table brand (id int identity not null, eng_name varchar(255), image varchar(255), name varchar(255), primary key (id))
create table business_pay_method (fk_business_user_id int not null, fk_payment_method_id int not null, primary key (fk_business_user_id, fk_payment_method_id))
create table business_user (fk_brand_id int, id int identity not null, address Nvarchar(50), background_color varchar(255), business_type varchar(255), city Nvarchar(15), describe Nvarchar(100), dist Nvarchar(15), eng_name varchar(255), image_ad varchar(255), image_icon varchar(255), image_index varchar(255), join_date varchar(255), name varchar(255), operation_time varchar(255), password varchar(255), phone varchar(255), text_color varchar(255), primary key (id))
create table category (id int identity not null, category_name Nvarchar(50), primary key (id))
create table coupon (amount int, discount int, id int identity not null, end_date datetime2(6), start_date datetime2(6), primary key (id))
create table coupon_bind (code int, fk_coupon_id int, fk_guest_id int, id int identity not null, used int, primary key (id))
create table credit_card (credit_card_no int, default_card int, fk_guest_id int, id int identity not null, name Nvarchar(30), primary key (id))
create table customize (fk_category_id int, id int identity not null, cust_cate_name varchar(255), primary key (id))
create table customize_option (extra_price int, fk_customize_id int, id int identity not null, cust_option_name varchar(255), primary key (id))
create table guest_address (fk_guest_id int, id int identity not null, address Nvarchar(30), city Nvarchar(30), dist Nvarchar(30), primary key (id))
create table guest_user (gender bit, google_id int, id int identity not null, birthday varchar(255), email varchar(255), image varchar(255), invoice varchar(255), joindate varchar(255), name Nvarchar(30), nickname Nvarchar(30), password varchar(255), phone varchar(255), tax_number varchar(255), primary key (id))
create table likes (fk_business_id int not null, fk_guest_id int not null, primary key (fk_business_id, fk_guest_id))
create table order_detail (amount int, category int, fk_order_id int, fk_product_id int, id int identity not null, price int, product_total int, describe Nvarchar(100), image varchar(255), name varchar(255), primary key (id))
create table order_form (coupon_id int, fk_business_id int, fk_guest_id int, id int identity not null, payment_status int not null, total int not null, time datetime2(6), address Nvarchar(50), payment_type varchar(255) not null, pickup varchar(255) not null, text Nvarchar(50), primary key (id))
create table payment_method (id int identity not null, method varchar(255), primary key (id))
create table product (business_id int, fk_category_id int, id int identity not null, price int, description varchar(255), eng_name varchar(255), image varchar(255), name varchar(255), status nvarchar(100), primary key (id))
create table revenue (id int not null, revenue int, date datetime2(6), primary key (id))
create table sales (fk_category_id int, id int identity not null, end_date datetime2(6) not null, start_date datetime2(6) not null, discount varchar(255) not null, primary key (id))
alter table business_pay_method add constraint FK1xckrp0c4msgp1241d6aolmof foreign key (fk_business_user_id) references business_user
alter table business_pay_method add constraint FKou8ycphpt78f6y999mkkhfo1g foreign key (fk_payment_method_id) references payment_method
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
alter table product add constraint FK19bac6fagsk4im17879r3mskd foreign key (business_id) references business_user
alter table product add constraint FKpxqa5fj6hpcc9mew356eoj68d foreign key (fk_category_id) references category
alter table sales add constraint FKrtu9103f5r7griiri7ir43brr foreign key (fk_category_id) references category