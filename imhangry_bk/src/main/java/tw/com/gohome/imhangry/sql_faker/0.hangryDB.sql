-- 建立資料庫指令
-- 如果資料庫由Hibernate產生，無需執行
--CREATE DATABASE hangryDB COLLATE Chinese_Taiwan_Stroke_CI_AS;--

Use hangryDB
GO



--1.Brand
/*==========================================================================*/
INSERT INTO [dbo].[brand] (eng_name, image, name) VALUES ('McDownWang', 'their_image.jpg', '麥當王');
INSERT INTO [dbo].[brand] (eng_name, image, name) VALUES ('MabuMa', 'another_image.jpg', '麻不麻');
INSERT INTO [dbo].[brand] (eng_name, image, name) VALUES ('JinJin', 'affect_image.jpg', '津津麵館');
INSERT INTO [dbo].[brand] (eng_name, image, name) VALUES ('shunshun', 'bill_image.jpg', '香香炒飯');
INSERT INTO [dbo].[brand] (eng_name, image, name) VALUES ('Brand Travis Bistro', 'weight_image.jpg', 'Brand Travis 義大利');
INSERT INTO [dbo].[brand] (eng_name, image, name) VALUES ('Le Park Cafe', 'issue_image.jpg', '公園咖啡');
INSERT INTO [dbo].[brand] (eng_name, image, name) VALUES ('Folks', 'stage_image.jpg', 'Folks');
INSERT INTO [dbo].[brand] (eng_name, image, name) VALUES ('StupidBucks', 'issue_image.jpg', '傻巴克');
INSERT INTO [dbo].[brand] (eng_name, image, name) VALUES ('Luke Carlson', 'east_image.jpg', 'Brand 路客卡森');
INSERT INTO [dbo].[brand] (eng_name, image, name) VALUES ('HungDongFan', 'child_image.jpg', '黃記冬粉');
INSERT INTO [dbo].[brand] (eng_name, image, name) VALUES ('Miller eat', 'large_image.jpg', '米勒小食');
INSERT INTO [dbo].[brand] (eng_name, image, name) VALUES ('PuLu', 'ground_image.jpg', '普魯素心園');

--2.Business_User
/*==========================================================================*/
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (3, '30127 Rodriguez Loaf', '#d44c26', 'financial', 'Sandrafort', 'Strong above member make baby cost.', 'against', 'pressure', 'parent_ad_image.jpg', 'research_icon_image.jpg', 'fine_index_image.jpg', '2023-12-24', 'Thomas, Spears and Sutton', '7:00-22:00', 'RCPY9wzm(9', '778-361-4354x66034', '#82999f');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (5, '248 James Brook', '#c2d636', 'near', 'Lake Jessica', 'Three attention woman school herself teacher.', 'reveal', 'ever', 'choice_ad_image.jpg', 'choice_icon_image.jpg', 'phone_index_image.jpg', '2024-01-03', 'Cox LLC', '9:00-22:00', 'J46PzDjoQ#', '443.741.6588', '#244bd3');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (12, '7993 Martinez Circles', '#76fa06', 'growth', 'Georgeville', 'Beautiful serve especially air mother manage.', 'world', 'food', 'herself_ad_image.jpg', 'wrong_icon_image.jpg', 'stand_index_image.jpg', '2023-12-14', 'Simpson, Reynolds and Reed', '8:00-17:00', '_3WxA8EarP', '(829)537-9000', '#2a444a');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (6, '2989 Mccoy Plains Apt. 327', '#fceb83', 'Democrat', 'Port Lauraside', 'Support remember laugh study represent.', 'that', 'source', 'affect_ad_image.jpg', 'church_icon_image.jpg', 'training_index_image.jpg', '2024-01-11', 'Adams, Sanchez and Lopez', '9:00-23:00', '^31lkf_bBq', '3306982469', '#cd01e1');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (5, '6116 Jenny Camp', '#56f3fc', 'hand', 'West Dominiquev', 'Share safe let energy table speech.', 'follow', 'identify', 'itself_ad_image.jpg', 'citizen_icon_image.jpg', 'likely_index_image.jpg', '2024-01-07', 'Jones Ltd', '10:00-17:00', '$65XWnOvm3', '443-285-4850x211', '#76a32e');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (15, '7640 Molly Wall', '#17bed5', 'tend', 'East Jennifermo', 'Summer choose minute price difference trouble shake.', 'feel', 'guy', 'wait_ad_image.jpg', 'talk_icon_image.jpg', 'still_index_image.jpg', '2024-01-12', 'Levy-Schmidt', '6:00-19:00', '5nIA2mQd%5', '(792)316-8523x501', '#71c352');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (6, '76743 Allen Island Apt. 142', '#1303a7', 'purpose', 'Melissahaven', 'Military move particular think factor.', 'take', 'reveal', 'respond_ad_image.jpg', 'order_icon_image.jpg', 'card_index_image.jpg', '2023-12-14', 'Perez-Warren', '6:00-20:00', 'g*tItVoJ@2', '+1-776-857-9859x2983', '#4bd3a6');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (4, '866 Jones Junction Suite 235', '#4990f1', 'deal', 'Morafort', 'Scene professional reach sea thing town month.', 'real', 'score', 'including_ad_image.jpg', 'anyone_icon_image.jpg', 'serve_index_image.jpg', '2023-12-19', 'Price-Bradshaw', '7:00-18:00', '00EGq3a_%$', '4938320104', '#b7dec2');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (14, '41249 Timothy Springs Suite 150', '#993e48', 'huge', 'Fergusonfurt', 'Born protect challenge.', 'baby', 'thousand', 'stand_ad_image.jpg', 'maybe_icon_image.jpg', 'care_index_image.jpg', '2023-12-23', 'Arnold and Sons', '7:00-20:00', ')M1WBirTa)', '5745483175', '#d8645f');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (6, '83955 Michael Estates', '#72b2eb', 'center', 'Charlesbury', 'Customer know life style.', 'why', 'resource', 'money_ad_image.jpg', 'range_icon_image.jpg', 'doctor_index_image.jpg', '2023-12-28', 'Lawson-Williams', '8:00-17:00', 'e$7s&Zj_%a', '997-634-2108x608', '#a5089c');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (7, '641 Montoya Islands', '#40d5e7', 'water', 'South Dylanfort', 'Name serious teach hotel.', 'special', 'direction', 'always_ad_image.jpg', 'still_icon_image.jpg', 'pattern_index_image.jpg', '2024-01-05', 'Morse LLC', '10:00-22:00', 'o!jXk8rD(3', '001-272-346-5365', '#3312f3');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (9, '05374 Meagan Harbor', '#9132db', 'still', 'Grahammouth', 'Them entire unit remain garden high.', 'later', 'throw', 'agreement_ad_image.jpg', 'movement_icon_image.jpg', 'particularly_index_image.jpg', '2023-12-19', 'Watson, Baxter and Vaughan', '10:00-19:00', 'JAg+4ZSjj#', '437-487-4364x0952', '#0a8e28');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (13, '2130 Samantha Village', '#f47943', 'region', 'East Heathermou', 'Yeah put hotel.', 'task', 'religious', 'stay_ad_image.jpg', 'administration_icon_image.jpg', 'become_index_image.jpg', '2023-12-30', 'Ponce-Brennan', '7:00-17:00', ')dm*GdHH7E', '+1-954-302-1882x44918', '#c3519f');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (6, '0506 Brewer Rue Apt. 593', '#b8de42', 'push', 'Chaneyton', 'Art house mouth tough item finish smile campaign.', 'despite', 'well', 'above_ad_image.jpg', 'develop_icon_image.jpg', 'ok_index_image.jpg', '2023-12-24', 'Long-Banks', '9:00-23:00', 'q%eDS3XxFa', '642.702.7200x770', '#bd59b1');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (13, '7783 Stafford Harbor Suite 287', '#395501', 'box', 'Robinsonhaven', 'Reduce small information read party.', 'white', 'risk', 'area_ad_image.jpg', 'administration_icon_image.jpg', 'manage_index_image.jpg', '2023-12-19', 'Phillips PLC', '6:00-20:00', 'hXpM#vhp&2', '3362455631', '#d489ba');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (6, '68217 Wilson Heights', '#6a50b0', 'somebody', 'West Jason', 'Current capital dark perform.', 'ball', 'head', 'company_ad_image.jpg', 'loss_icon_image.jpg', 'mother_index_image.jpg', '2024-01-05', 'Farmer-Ryan', '10:00-23:00', '!yJmqUUU5X', '(555)440-1144', '#b250de');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (4, '9403 Spears Route Apt. 389', '#30a13c', 'small', 'New Michaelberg', 'Wait quality store.', 'despite', 'compare', 'next_ad_image.jpg', 'pass_icon_image.jpg', 'major_index_image.jpg', '2024-01-02', 'Sims-Fischer', '8:00-18:00', '40rij5VmM)', '(277)716-8743x500', '#28be3a');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (8, '0592 Turner Walk', '#042ce3', 'expect', 'Adambury', 'Clear we reduce color.', 'sing', 'gas', 'over_ad_image.jpg', 'way_icon_image.jpg', 'hold_index_image.jpg', '2023-12-30', 'Hart Group', '9:00-18:00', 'm(2LxHpUce', '(215)717-4423x471', '#eef0c4');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (15, '5041 Long Forge', '#632d0a', 'six', 'North Howard', 'Whether anything baby glass name could lead.', 'camera', 'identify', 'outside_ad_image.jpg', 'beyond_icon_image.jpg', 'floor_index_image.jpg', '2024-01-02', 'Avila, Guerrero and Wolf', '9:00-22:00', 'ox(6ozEng)', '880.235.6266x505', '#d96f97');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (4, '01909 Wilson Neck', '#218de0', 'suggest', 'North Robinches', 'Indeed just technology art six less end.', 'must', 'into', 'another_ad_image.jpg', 'decade_icon_image.jpg', 'any_index_image.jpg', '2023-12-28', 'Wilson and Sons', '7:00-23:00', '(0wHEJcmoh', '307-978-2393', '#f6633c');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (2, '1366 Timothy Coves', '#45787f', 'simply', 'South Brandonst', 'Rule yet charge that over.', 'his', 'agreement', 'training_ad_image.jpg', 'indicate_icon_image.jpg', 'international_index_image.jpg', '2023-12-27', 'Medina Group', '10:00-17:00', '9rhXdDE%#@', '870.949.4901', '#1bf9fa');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (8, '0925 Troy Wells', '#3cc7fc', 'thank', 'North Henryland', 'Study own owner decade technology scene.', 'rise', 'and', 'learn_ad_image.jpg', 'range_icon_image.jpg', 'activity_index_image.jpg', '2024-01-01', 'Perry LLC', '9:00-22:00', '%zvxET%2P9', '847-473-9677x9484', '#df1215');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (16, '15037 Smith Parks Suite 736', '#9c452b', 'good', 'Tarashire', 'Professional until ok decade trial control.', 'but', 'many', 'guy_ad_image.jpg', 'mean_icon_image.jpg', 'beat_index_image.jpg', '2023-12-28', 'Nelson PLC', '8:00-21:00', 'N$2vC1^q0N', '(584)547-1706', '#ccab60');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (16, '61931 Grimes Squares Suite 869', '#96c432', 'worry', 'New Bryanberg', 'Data article listen speak program affect.', 'lot', 'will', 'least_ad_image.jpg', 'her_icon_image.jpg', 'point_index_image.jpg', '2024-01-06', 'Frey Ltd', '8:00-22:00', '_pDu0*XR19', '953-867-2722', '#9f4b45');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (7, '57443 James Knolls', '#dbea09', 'game', 'Justinfurt', 'Yourself some begin gun amount enough hospital.', 'whose', 'measure', 'ask_ad_image.jpg', 'be_icon_image.jpg', 'out_index_image.jpg', '2024-01-04', 'Cannon, Smith and Flynn', '8:00-20:00', 'QQ4f7NDuL_', '+1-244-482-5493x414', '#d9a36f');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (4, '2080 Williams Way Apt. 840', '#341f67', 'medical', 'Pearsonburgh', 'Fire player good be truth decade one.', 'our', 'can', 'behavior_ad_image.jpg', 'go_icon_image.jpg', 'ground_index_image.jpg', '2023-12-24', 'Hayes, Shaw and Bird', '8:00-17:00', '%&y7NGNi_U', '(773)869-4722x87360', '#a607a9');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (14, '85808 Eric Club', '#8e02ca', 'his', 'South Meagan', 'Happen prepare law.', 'wear', 'such', 'current_ad_image.jpg', 'general_icon_image.jpg', 'box_index_image.jpg', '2023-12-18', 'Smith-Miller', '7:00-23:00', 'PrN_7XD6@)', '886-982-0877x9110', '#f96baf');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (5, '01720 Renee Rapid', '#f1b4dd', 'admit', 'East Mark', 'Continue piece turn out sometimes science.', 'piece', 'say', 'year_ad_image.jpg', 'bit_icon_image.jpg', 'simply_index_image.jpg', '2023-12-14', 'Higgins, Johnson and Bradley', '9:00-23:00', '9Oa%rcJL!h', '(926)736-0073', '#b063a7');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (1, '144 Lisa Hill', '#560c6e', 'low', 'Ericmouth', 'Expect student do far remember accept later.', 'street', 'defense', 'fire_ad_image.jpg', 'prepare_icon_image.jpg', 'over_index_image.jpg', '2023-12-27', 'Payne Group', '6:00-18:00', '(a3fpOu325', '(349)786-4745', '#4e095c');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (16, '354 Ortega Squares Suite 275', '#bb45f8', 'evening', 'Paulhaven', 'Edge yes into lot member she central.', 'role', 'choose', 'their_ad_image.jpg', 'smile_icon_image.jpg', 'great_index_image.jpg', '2024-01-07', 'Morgan Inc', '10:00-21:00', 'hK@YDhMw@1', '+1-498-756-0740x70672', '#8cb784');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (15, '917 Patrick Extensions', '#21882d', 'seem', 'East Kristinhav', 'Hotel affect already discussion wall young.', 'hundred', 'soon', 'person_ad_image.jpg', 'board_icon_image.jpg', 'kitchen_index_image.jpg', '2023-12-19', 'Whitehead Group', '7:00-18:00', 'lnE33Ik_t*', '874-357-6542', '#4a6cf8');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (1, '3954 Phillips Views Apt. 818', '#45d303', 'later', 'North Brianstad', 'Factor feel trouble close friend avoid appear.', 'book', 'lot', 'keep_ad_image.jpg', 'third_icon_image.jpg', 'building_index_image.jpg', '2023-12-16', 'Lopez-Curtis', '8:00-20:00', 'z+7XZKmyZ7', '+1-284-404-2107x527', '#4db25b');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (6, '37848 Dorsey Gardens', '#f5c5be', 'when', 'Fordburgh', 'Every power chance off if something.', 'design', 'participant', 'account_ad_image.jpg', 'radio_icon_image.jpg', 'boy_index_image.jpg', '2023-12-29', 'Hughes-Adkins', '8:00-20:00', '$C6eUu39Cd', '443-570-1683x34037', '#32ae09');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (15, '39854 Brett Springs', '#14e4b0', 'attention', 'Lake Margaret', 'Book democratic thus begin site table.', 'specific', 'majority', 'shoulder_ad_image.jpg', 'through_icon_image.jpg', 'move_index_image.jpg', '2024-01-08', 'Santiago Group', '10:00-17:00', '$uWY(y3DW4', '466-372-6124', '#e4c341');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (4, '311 Danielle Drive', '#bd8492', 'term', 'Annaside', 'Few yourself foreign available full change give.', 'daughter', 'especially', 'newspaper_ad_image.jpg', 'hair_icon_image.jpg', 'then_index_image.jpg', '2024-01-09', 'Frazier LLC', '9:00-23:00', '*u!XFita2A', '596-252-1115x23433', '#c4ea3a');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (16, '54190 Sarah Ramp', '#709986', 'example', 'Melissaside', 'President art hour remain mission.', 'watch', 'inside', 'office_ad_image.jpg', 'tend_icon_image.jpg', 'various_index_image.jpg', '2023-12-16', 'Boyer-Weaver', '7:00-22:00', '!+Sc&Ah22K', '+1-399-478-7368', '#204244');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (15, '0959 Joseph Mount Suite 757', '#fba4d1', 'less', 'Singletonfort', 'Black high leave total style.', 'discover', 'form', 'time_ad_image.jpg', 'research_icon_image.jpg', 'gun_index_image.jpg', '2023-12-24', 'Hendricks-Phelps', '7:00-17:00', 'O@G68rZs(w', '650-765-2331', '#d6567b');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (1, '2520 Matthew Canyon Apt. 326', '#8a6f5a', 'remember', 'Arroyostad', 'Major everybody us happen see whatever common.', 'bill', 'themselves', 'country_ad_image.jpg', 'Congress_icon_image.jpg', 'local_index_image.jpg', '2023-12-16', 'Flores Ltd', '8:00-21:00', 'm2CPiLyk$0', '001-792-610-1453x854', '#c72370');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (9, '73162 Herrera Loop', '#f17115', 'conference', 'Pricestad', 'Scene charge continue improve.', 'agree', 'group', 'son_ad_image.jpg', 'anything_icon_image.jpg', 'scientist_index_image.jpg', '2024-01-02', 'Perry-Washington', '9:00-22:00', 'wab$TYeM$9', '225-274-9428x79278', '#bba516');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (8, '17149 Erik Mountains', '#c11603', 'brother', 'Port Blakestad', 'Likely expert he raise rather opportunity.', 'quite', 'generation', 'than_ad_image.jpg', 'college_icon_image.jpg', 'three_index_image.jpg', '2023-12-15', 'Shaw-Michael', '10:00-23:00', '1eFAa7Hy_c', '541.442.6789x5317', '#622ec8');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (15, '57018 Roberts Underpass Suite 742', '#6687a8', 'likely', 'Lake Amanda', 'So success everybody watch blood there.', 'consumer', 'international', 'upon_ad_image.jpg', 'produce_icon_image.jpg', 'first_index_image.jpg', '2024-01-01', 'Taylor, Serrano and Murphy', '10:00-19:00', 't7fKUZ(e)i', '690-608-8909', '#3e0a5c');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (4, '108 Stein Drives Suite 030', '#403732', 'black', 'Rodriguezview', 'Final add commercial view upon she.', 'rock', 'cell', 'rock_ad_image.jpg', 'source_icon_image.jpg', 'every_index_image.jpg', '2023-12-21', 'White PLC', '8:00-22:00', '@K+c4W*k3y', '700-928-4404', '#f25553');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (6, '412 Frank Meadows', '#5f2cfa', 'yet', 'Lake Shannon', 'Politics poor natural kid explain why bag.', 'office', 'exist', 'water_ad_image.jpg', 'senior_icon_image.jpg', 'happen_index_image.jpg', '2023-12-28', 'Ramos, Silva and Contreras', '6:00-20:00', 'q5xKgUs(!u', '(666)996-5511', '#052c0f');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (15, '4789 Victoria Pass', '#fbbe21', 'bring', 'Kristinahaven', 'Light scientist office those.', 'interest', 'religious', 'body_ad_image.jpg', 'evidence_icon_image.jpg', 'here_index_image.jpg', '2023-12-24', 'Williams PLC', '6:00-22:00', '*65XhjuQ)m', '995-253-2800x573', '#6bf607');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (13, '043 Stevenson Lights Suite 140', '#ca45c6', 'big', 'West David', 'Four threat message team do affect.', 'include', 'test', 'south_ad_image.jpg', 'outside_icon_image.jpg', 'need_index_image.jpg', '2023-12-28', 'Watts and Sons', '7:00-20:00', '@ZuEYSai2T', '871.831.6908', '#4a07dd');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (16, '690 Wendy Fort Apt. 624', '#227de7', 'concern', 'Emilyview', 'Soldier analysis myself.', 'send', 'room', 'artist_ad_image.jpg', 'buy_icon_image.jpg', 'simple_index_image.jpg', '2023-12-23', 'Kim-Gates', '9:00-21:00', 'C5ZrlgWk)Q', '992-539-8919x729', '#f49544');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (3, '34500 Bailey River Suite 307', '#1c82a5', 'factor', 'Port Raymondpor', 'Pay them street.', 'east', 'attorney', 'process_ad_image.jpg', 'one_icon_image.jpg', 'need_index_image.jpg', '2024-01-05', 'Thomas, Snyder and Harvey', '6:00-23:00', 'h$4LGoRzu6', '(408)940-6106x604', '#48ee63');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (3, '6743 Dougherty Tunnel', '#1c1336', 'theory', 'South Susanport', 'Page white thank.', 'rule', 'relationship', 'politics_ad_image.jpg', 'final_icon_image.jpg', 'remain_index_image.jpg', '2023-12-25', 'Bradley-Walters', '6:00-17:00', 'H@ME9@uHRM', '470-521-1180', '#94338d');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (3, '17042 Hughes Forge Suite 821', '#6c932d', 'design', 'Kevinmouth', 'Indeed impact politics manage age.', 'also', 'once', 'into_ad_image.jpg', 'firm_icon_image.jpg', 'above_index_image.jpg', '2023-12-17', 'Patrick Inc', '10:00-22:00', 'Br6YP9xp8)', '908-406-4036x60888', '#649e38');
INSERT INTO [dbo].[business_user] ([fk_brand_id], [address], [background_color], [business_type], [city], [describe], [dist], [eng_name], [image_ad], [image_icon], [image_index], [join_date], [name], [operation_time], [password], [phone], [text_color]) VALUES (6, '75705 Darryl Mills Apt. 833', '#942b71', 'cause', 'Port Charles', 'Respond already war stock notice rate economic.', 'across', 'onto', 'last_ad_image.jpg', 'education_icon_image.jpg', 'accept_index_image.jpg', '2023-12-23', 'Green Ltd', '6:00-19:00', '5bCfxaZz$$', '695-693-5332x738', '#927562');

--3.Category
/*==========================================================================*/
INSERT INTO [hangryDB].[dbo].[category] ([category_name]) VALUES ('Main Course');
INSERT INTO [hangryDB].[dbo].[category] ([category_name]) VALUES ('Drink');
INSERT INTO [hangryDB].[dbo].[category] ([category_name]) VALUES ('Dessert');
INSERT INTO [hangryDB].[dbo].[category] ([category_name]) VALUES ('Salad');
INSERT INTO [hangryDB].[dbo].[category] ([category_name]) VALUES ('Hot Pot');
INSERT INTO [hangryDB].[dbo].[category] ([category_name]) VALUES ('American Cuisine');
INSERT INTO [hangryDB].[dbo].[category] ([category_name]) VALUES ('Italin');
INSERT INTO [hangryDB].[dbo].[category] ([category_name]) VALUES ('Coffee');
INSERT INTO [hangryDB].[dbo].[category] ([category_name]) VALUES ('Fast Food');
INSERT INTO [hangryDB].[dbo].[category] ([category_name]) VALUES ('Grilled');

--4.Coupon
/*==========================================================================*/
INSERT INTO coupon VALUES (100, 25, '2024-02-28', '2024-01-01') 

--5.Coupon_Bind
/*==========================================================================*/
INSERT INTO [dbo].[coupon_bind] ([code], [fk_coupon_id], [fk_guest_id], [used]) VALUES (26258544, 1, 10, 1);
INSERT INTO [dbo].[coupon_bind] ([code], [fk_coupon_id], [fk_guest_id], [used]) VALUES (49141553, 1, 13, 0);
INSERT INTO [dbo].[coupon_bind] ([code], [fk_coupon_id], [fk_guest_id], [used]) VALUES (2936609, 1, 3, 1);
INSERT INTO [dbo].[coupon_bind] ([code], [fk_coupon_id], [fk_guest_id], [used]) VALUES (45297578, 1, 5, 0);
INSERT INTO [dbo].[coupon_bind] ([code], [fk_coupon_id], [fk_guest_id], [used]) VALUES (25018501, 1, 2, 0);
INSERT INTO [dbo].[coupon_bind] ([code], [fk_coupon_id], [fk_guest_id], [used]) VALUES (71838796, 1, 14, 1);
INSERT INTO [dbo].[coupon_bind] ([code], [fk_coupon_id], [fk_guest_id], [used]) VALUES (19464344, 1, 4, 1);
INSERT INTO [dbo].[coupon_bind] ([code], [fk_coupon_id], [fk_guest_id], [used]) VALUES (60312928, 1, 16, 1);
INSERT INTO [dbo].[coupon_bind] ([code], [fk_coupon_id], [fk_guest_id], [used]) VALUES (83078107, 1, 7, 1);
INSERT INTO [dbo].[coupon_bind] ([code], [fk_coupon_id], [fk_guest_id], [used]) VALUES (46437407, 1, 8, 1);

--6.Credit_Card
/*==========================================================================*/
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (2381939390431967, 1, 6, 'Janice Benson');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (1889546415494227, 1, 15, 'Mark Wilson');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (2783335864833251, 1, 15, 'Miss Daisy Rosario');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (2256187346830173, 0, 6, 'Miss Tina Harrell');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (4671938373091717, 1, 19, 'Rhonda Zuniga');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (4421721789398987, 0, 9, 'Jacob Wilson');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (4356821650720594, 0, 4, 'Michael Patrick');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (1322934526024435, 1, 8, 'Sharon Schultz');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (3401739491423690, 1, 9, 'Tina Ho');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (8793091014268082, 1, 4, 'Carol Richard');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (2123412125571202, 0, 20, 'Dawn Long');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (1403408159497650, 0, 2, 'Rebecca Wade');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (9055129464815312, 0, 11, 'Ashley Meadows');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (4313636530315324, 1, 18, 'Amanda Woods');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (7014745277736373, 1, 10, 'Christopher Brown');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (7802182911537666, 0, 16, 'Bobby Grant');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (3536256644103234, 1, 10, 'Rachel Johnson');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (2299036504442045, 0, 4, 'Eric Kim');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (4244813343466374, 1, 20, 'Patrick Cervantes');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (7496182605755661, 1, 7, 'Christopher Moore');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (1324720378126540, 0, 18, 'Susan Maxwell');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (5000814891789663, 1, 20, 'Gina Brown');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (4574016140864636, 1, 15, 'Patrick Foster');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (9808672137355922, 0, 20, 'Jaime Stephenson');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (4024460194073681, 0, 10, 'Roy Davis');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (9102055007756320, 0, 16, 'Jerry Strickland');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (9907848520360971, 1, 15, 'Christopher Thompson');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (7029139053973533, 1, 15, 'Stacey Turner');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (8964770834973315, 1, 9, 'Rachel Kelly');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (8224570019384323, 0, 8, 'Steven Miller');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (9234295771193151, 1, 13, 'Lynn Smith');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (8679229300959250, 0, 5, 'Matthew Frank');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (8384398723997738, 0, 15, 'Dale Horton');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (7627000890762698, 0, 6, 'Roberta Cross');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (3659140976551331, 1, 20, 'Maria Clark');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (4512517883522313, 1, 9, 'Jared Medina');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (1385965312828153, 0, 14, 'Mrs. Danielle Thomas');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (2072793936545906, 1, 18, 'Gregory Shields');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (4444171309729184, 1, 8, 'Jonathan Thompson');
INSERT INTO [dbo].[credit_card] ([credit_card_no], [default_card], [fk_guest_id], [name]) VALUES (1867540485066315, 1, 12, 'Lori Garza');

--7.Customize
/*==========================================================================*/
INSERT INTO [hangryDB].[dbo].[customize] ([fk_category_id],[cust_cate_name]) VALUES ('1', 'no ice');
INSERT INTO [hangryDB].[dbo].[customize] ([fk_category_id],[cust_cate_name]) VALUES ('3', 'full ice');
INSERT INTO [hangryDB].[dbo].[customize] ([fk_category_id],[cust_cate_name]) VALUES ('5', 'no orion');
INSERT INTO [hangryDB].[dbo].[customize] ([fk_category_id],[cust_cate_name]) VALUES ('7', 'no drink');
INSERT INTO [hangryDB].[dbo].[customize] ([fk_category_id],[cust_cate_name]) VALUES ('9', 'no tomato');
INSERT INTO [hangryDB].[dbo].[customize] ([fk_category_id],[cust_cate_name]) VALUES ('8', 'more spicy');
INSERT INTO [hangryDB].[dbo].[customize] ([fk_category_id],[cust_cate_name]) VALUES ('7', 'more body');
INSERT INTO [hangryDB].[dbo].[customize] ([fk_category_id],[cust_cate_name]) VALUES ('6', 'more acid');
INSERT INTO [hangryDB].[dbo].[customize] ([fk_category_id],[cust_cate_name]) VALUES ('4', 'more sweet');
INSERT INTO [hangryDB].[dbo].[customize] ([fk_category_id],[cust_cate_name]) VALUES ('3', 'more ice');

--8.Customize_Option
/*==========================================================================*/
INSERT INTO [dbo].[customize_option] ([extra_price], [fk_customize_id], [cust_option_name]) VALUES (48, 3, 'set');
INSERT INTO [dbo].[customize_option] ([extra_price], [fk_customize_id], [cust_option_name]) VALUES (29, 2, 'response');
INSERT INTO [dbo].[customize_option] ([extra_price], [fk_customize_id], [cust_option_name]) VALUES (38, 6, 'way');
INSERT INTO [dbo].[customize_option] ([extra_price], [fk_customize_id], [cust_option_name]) VALUES (41, 18, 'tonight');
INSERT INTO [dbo].[customize_option] ([extra_price], [fk_customize_id], [cust_option_name]) VALUES (33, 16, 'grow');
INSERT INTO [dbo].[customize_option] ([extra_price], [fk_customize_id], [cust_option_name]) VALUES (29, 2, 'little');
INSERT INTO [dbo].[customize_option] ([extra_price], [fk_customize_id], [cust_option_name]) VALUES (24, 4, 'accept');
INSERT INTO [dbo].[customize_option] ([extra_price], [fk_customize_id], [cust_option_name]) VALUES (29, 13, 'store');
INSERT INTO [dbo].[customize_option] ([extra_price], [fk_customize_id], [cust_option_name]) VALUES (45, 8, 'blue');
INSERT INTO [dbo].[customize_option] ([extra_price], [fk_customize_id], [cust_option_name]) VALUES (50, 17, 'lead');

--9.guest_address
/*==========================================================================*/
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (4, N'4289 Jay Courts', N'Loveville', N'look');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (10, N'4740 Prince Prairie', N'North Christopherfurt', N'ability');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (1, N'6002 Briggs Causeway', N'West William', N'court');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (4, N'83977 Park Orchard Suite 639', N'South Matthewbury', N'plan');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (13, N'6810 Greene Summit', N'Frytown', N'maintain');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (5, N'338 Joseph Route Apt. 340', N'East Ralphport', N'gun');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (1, N'2285 Fuller Lakes Suite 243', N'West Annette', N'hot');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (13, N'2330 Allison Village Suite 463', N'New Mark', N'leave');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (12, N'31443 Amy Parks Suite 428', N'East Michelletown', N'particularly');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (2, N'839 Benjamin Corners', N'South Adam', N'close');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (12, N'85480 Nicole Ramp', N'West Christineport', N'throw');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (7, N'037 Brown Loaf Apt. 813', N'Lake Charleschester', N'beyond');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (1, N'9771 Brandon View', N'Catherineland', N'under');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (20, N'7323 Barry Knolls Apt. 587', N'South Amberfort', N'attention');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (17, N'98699 Wendy Extensions', N'West Lori', N'above');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (13, N'56312 David Groves Apt. 126', N'Port Lisa', N'produce');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (8, N'6267 Susan Mountains', N'Melissatown', N'chance');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (19, N'3569 Sherri Fords', N'Lake Janet', N'opportunity');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (12, N'18629 Baker Park Suite 104', N'Lindaberg', N'require');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (1, N'04240 Coleman Plains Suite 446', N'Port Jenniferstad', N'find');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (3, N'35359 John Spring', N'Lake Patriciafurt', N'wide');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (2, N'7814 Andrew Greens', N'Wesleyland', N'feel');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (8, N'992 Graham Keys Apt. 470', N'Blackview', N'consider');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (5, N'5428 Jackson Parkways Suite 21', N'South Pamela', N'detail');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (5, N'5690 Taylor Plaza Suite 908', N'Lindseyshire', N'leave');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (12, N'2642 Bradford Row', N'South Kirk', N'character');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (8, N'899 Robert Green', N'Kristinaton', N'visit');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (4, N'016 Christina Estate', N'New Kimberlyshire', N'dream');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (9, N'158 Harper Field Suite 381', N'Jasmineland', N'herself');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (1, N'2009 Jonathan Falls', N'Jeffreytown', N'item');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (5, N'93737 Navarro View', N'West Timothy', N'often');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (2, N'42110 Savage Islands', N'Johnsonton', N'blood');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (9, N'57492 Boone Plaza', N'Carrieberg', N'maintain');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (11, N'98564 Jerome Drive', N'Anthonyton', N'represent');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (11, N'444 Herrera Vista Suite 955', N'North Christina', N'your');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (8, N'517 Burns Turnpike', N'Davisburgh', N'artist');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (17, N'447 Kevin Villages Apt. 798', N'Stewartside', N'American');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (6, N'6580 Ochoa Light Apt. 178', N'Walkerton', N'program');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (18, N'077 Jeffrey Loaf Apt. 351', N'Lake Shawnland', N'especially');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (15, N'5463 Davidson Center', N'North Lucasmouth', N'kid');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (10, N'9871 Kevin Cliffs', N'Lake Andrewtown', N'develop');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (17, N'47180 Brian Burg', N'Paceland', N'student');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (1, N'64186 Steven Mountains', N'Taylorton', N'financial');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (7, N'789 Michael Forge', N'New Erica', N'reduce');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (9, N'0860 Stephens Isle Apt. 116', N'Leehaven', N'benefit');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (9, N'40108 Melissa Manor Suite 388', N'Trevinobury', N'keep');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (12, N'6220 Shannon Harbor', N'New Allison', N'door');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (5, N'52444 Best Stravenue', N'Buchananport', N'exist');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (16, N'6002 Levy Center', N'Danielleborough', N'remain');
INSERT INTO [dbo].[guest_address] ([fk_guest_id], [address], [city], [dist]) VALUES (1, N'2760 Stafford Islands', N'Ericaside', N'feeling');

--10.Guest_User
/*==========================================================================*/
INSERT INTO [dbo].[guest_user] ([gender], [google_id], [birthday], [email], [image], [invoice], [join_date], [name], [nickname], [password], [phone], [tax_number]) VALUES (1, 578, '1996-07-26', 'april12@example.net', 'section_image.jpg', '0106cb17-07fc-49c1-b939-4b9baae4e707', '2023-02-08', N'Casey Cook', N'kevin97', 'vK4A(nHd#9', '+1-975-287-7629x671', '30730034');
INSERT INTO [dbo].[guest_user] ([gender], [google_id], [birthday], [email], [image], [invoice], [join_date], [name], [nickname], [password], [phone], [tax_number]) VALUES (0, 408, '1997-08-21', 'karenanderson@example.net', 'protect_image.jpg', '65aaac07-484f-4008-90f8-ffc5e4998341', '2023-05-27', N'Gina Kelly', N'paul58', '%6VQM!My7A', '001-327-812-6899', '28376773');
INSERT INTO [dbo].[guest_user] ([gender], [google_id], [birthday], [email], [image], [invoice], [join_date], [name], [nickname], [password], [phone], [tax_number]) VALUES (0, 770, '1908-12-18', 'robingonzales@example.com', 'north_image.jpg', 'b64a5a6d-983a-40a5-8462-e3f6c6a8a4cc', '2024-01-04', N'Melissa Barnett', N'ezimmerman', '*K47MTNz6f', '+1-469-710-6503', '66542557');
INSERT INTO [dbo].[guest_user] ([gender], [google_id], [birthday], [email], [image], [invoice], [join_date], [name], [nickname], [password], [phone], [tax_number]) VALUES (0, 378, '1988-11-28', 'kklein@example.org', 'network_image.jpg', '5be78329-c020-43ec-8426-35a3a7c65ba6', '2023-06-22', N'Sara Wallace', N'michaeljohnson', '@A)G8AzPkT', '559.748.1659', '29784763');
INSERT INTO [dbo].[guest_user] ([gender], [google_id], [birthday], [email], [image], [invoice], [join_date], [name], [nickname], [password], [phone], [tax_number]) VALUES (0, 371, '1917-07-26', 'jeremiahespinoza@example.net', 'size_image.jpg', '5c24ab22-1aac-453c-b776-65f1d29967c9', '2023-12-02', N'Robert Miranda', N'wellssarah', 'bANNjkYx(2', '513.461.3851x68851', '54981791');
INSERT INTO [dbo].[guest_user] ([gender], [google_id], [birthday], [email], [image], [invoice], [join_date], [name], [nickname], [password], [phone], [tax_number]) VALUES (0, 144, '1913-09-15', 'johnathanbrown@example.net', 'situation_image.jpg', 'd67d7e96-a7f6-41e9-a55b-e312159be9c4', '2023-12-13', N'Tina West', N'james24', '@0YNUwmq9)', '748.804.0206x508', '45968379');
INSERT INTO [dbo].[guest_user] ([gender], [google_id], [birthday], [email], [image], [invoice], [join_date], [name], [nickname], [password], [phone], [tax_number]) VALUES (1, 487, '1931-06-10', 'charlesharrington@example.net', 'board_image.jpg', '1797a817-08ca-4e9d-8e85-a5fcc10277f8', '2023-05-28', N'Ashlee Johnson', N'nicoleblake', 'Lb9oFw!H#o', '922.514.9811x9907', '68461473');
INSERT INTO [dbo].[guest_user] ([gender], [google_id], [birthday], [email], [image], [invoice], [join_date], [name], [nickname], [password], [phone], [tax_number]) VALUES (1, 247, '1998-10-28', 'allison54@example.com', 'history_image.jpg', '4db5096b-2456-434f-925d-60bf20293150', '2023-02-18', N'Katherine Miller', N'tmartin', 'x#3YKjLu(z', '930-481-6981x6335', '71693563');
INSERT INTO [dbo].[guest_user] ([gender], [google_id], [birthday], [email], [image], [invoice], [join_date], [name], [nickname], [password], [phone], [tax_number]) VALUES (1, 767, '1976-01-14', 'joseph65@example.org', 'himself_image.jpg', 'b72e74ad-9634-49ec-966a-22adef4f4848', '2023-02-10', N'Harry Larson', N'campbellrobert', '0McJP*+f*T', '001-725-884-3567x46812', '53373918');
INSERT INTO [dbo].[guest_user] ([gender], [google_id], [birthday], [email], [image], [invoice], [join_date], [name], [nickname], [password], [phone], [tax_number]) VALUES (0, 252, '1918-05-28', 'hhernandez@example.com', 'son_image.jpg', 'f06a8c81-7396-4201-8763-4d0e1cb7009f', '2023-05-16', N'Keith Powell', N'franklinmichelle', 'M6hAVOr+)8', '210.843.9775', '11092017');
INSERT INTO [dbo].[guest_user] ([gender], [google_id], [birthday], [email], [image], [invoice], [join_date], [name], [nickname], [password], [phone], [tax_number]) VALUES (0, 136, '1946-08-06', 'imartin@example.com', 'example_image.jpg', 'd50750ce-fb7a-4341-b0f7-a638f3f34323', '2023-05-11', N'Cynthia Prince', N'bthompson', 'D4DHB68q^H', '982-465-3036x5608', '28551013');
INSERT INTO [dbo].[guest_user] ([gender], [google_id], [birthday], [email], [image], [invoice], [join_date], [name], [nickname], [password], [phone], [tax_number]) VALUES (1, 632, '1932-06-28', 'emilyjones@example.net', 'a_image.jpg', 'da231f55-1174-416a-a5f3-785d9b0cfe90', '2023-05-23', N'Sara Booker', N'fday', '2$X2Uh)d#&', '944.892.8782x709', '33757704');
INSERT INTO [dbo].[guest_user] ([gender], [google_id], [birthday], [email], [image], [invoice], [join_date], [name], [nickname], [password], [phone], [tax_number]) VALUES (1, 913, '1973-04-13', 'tjackson@example.net', 'speak_image.jpg', 'd68c4773-f60a-4881-a143-992d3e8f8791', '2023-08-28', N'Stacy Foster', N'matthew76', '0E(4&$Ty3&', '5482799088', '35321191');
INSERT INTO [dbo].[guest_user] ([gender], [google_id], [birthday], [email], [image], [invoice], [join_date], [name], [nickname], [password], [phone], [tax_number]) VALUES (1, 862, '1958-11-13', 'boonerita@example.com', 'author_image.jpg', 'bc30f7e0-6fca-4d7d-b6f3-34b76f2f8071', '2023-06-13', N'David Williams', N'james28', '6ndIK9qS)u', '001-834-530-1958x60104', '27769752');
INSERT INTO [dbo].[guest_user] ([gender], [google_id], [birthday], [email], [image], [invoice], [join_date], [name], [nickname], [password], [phone], [tax_number]) VALUES (0, 634, '1977-09-11', 'susansmith@example.com', 'already_image.jpg', 'ad74f5da-848e-4f2e-8e07-5ff5ed3c2098', '2023-02-25', N'Jeffrey Little II', N'linda60', '2C3_GWUp$k', '(926)404-3578', '23549995');
INSERT INTO [dbo].[guest_user] ([gender], [google_id], [birthday], [email], [image], [invoice], [join_date], [name], [nickname], [password], [phone], [tax_number]) VALUES (0, 595, '1912-11-22', 'amy98@example.net', 'home_image.jpg', 'cd5948e5-6cae-40b2-b7a2-646ce27fb86f', '2023-07-06', N'Colin White', N'sheathomas', '*8gS7i9NBh', '(585)433-4948', '07638776');
INSERT INTO [dbo].[guest_user] ([gender], [google_id], [birthday], [email], [image], [invoice], [join_date], [name], [nickname], [password], [phone], [tax_number]) VALUES (0, 813, '2008-04-01', 'karenbradford@example.org', 'mention_image.jpg', '9358394e-f298-4f48-a30d-2e715b448eb5', '2023-03-28', N'Michelle Morris', N'deborahwilliams', 'VgT5sD6cF)', '001-655-901-8400', '37918453');
INSERT INTO [dbo].[guest_user] ([gender], [google_id], [birthday], [email], [image], [invoice], [join_date], [name], [nickname], [password], [phone], [tax_number]) VALUES (1, 249, '2018-10-24', 'daviswilliam@example.net', 'affect_image.jpg', '5cc43e0f-9346-402e-964f-49bf2915be57', '2023-08-12', N'Alexander Walker', N'jhaas', 'GW4IXg58&y', '(652)757-7114', '75839125');
INSERT INTO [dbo].[guest_user] ([gender], [google_id], [birthday], [email], [image], [invoice], [join_date], [name], [nickname], [password], [phone], [tax_number]) VALUES (1, 372, '1927-12-17', 'martinjohn@example.org', 'have_image.jpg', '3e2af517-c7d5-48cf-afa6-5436d041b4c7', '2023-12-25', N'Kyle Perez', N'michaelchen', '&E2+RaK3ZM', '(600)520-1213', '11083290');
INSERT INTO [dbo].[guest_user] ([gender], [google_id], [birthday], [email], [image], [invoice], [join_date], [name], [nickname], [password], [phone], [tax_number]) VALUES (1, 450, '2009-01-01', 'ujackson@example.com', 'and_image.jpg', '8e4a037f-ee99-4a39-ac43-de63c8714cdd', '2023-02-27', N'Hayley Bailey', N'jcollins', '0DzroXRo&1', '807-596-8035', '28868113');

--11.Like
/*==========================================================================*/
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (40, 17);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (31, 12);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (50, 17);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (28, 9);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (20, 10);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (25, 14);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (37, 12);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (5, 18);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (47, 1);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (36, 8);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (6, 12);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (39, 2);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (33, 5);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (45, 4);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (3, 14);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (15, 7);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (18, 9);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (2, 5);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (31, 11);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (4, 13);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (50, 7);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (26, 16);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (32, 4);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (11, 14);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (2, 13);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (20, 3);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (31, 6);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (49, 8);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (23, 4);
INSERT INTO [dbo].[likes] ([fk_business_id], [fk_guest_id]) VALUES (48, 17);

--13.Order_Detail
/*==========================================================================*/
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (4, 2, 78, 106, 168, 672, 'Plan environmental fine coach. Beat whole still sport.', 'try_image.jpg', 'Product whose');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (2, 4, 78, 113, 374, 748, 'Tree just tree woman. Song need line decade answer night despite.', 'provide_image.jpg', 'Product sea');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (3, 3, 14, 134, 299, 897, 'School begin control build cause create. May sea reality perhaps order.', 'president_image.jpg', 'Product happy');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (9, 5, 27, 123, 917, 8253, 'Have drug concern result hard product pressure food. Garden somebody under early.', 'per_image.jpg', 'Product week');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (2, 4, 16, 122, 941, 1882, 'Federal begin treatment professor. War third alone image.', 'all_image.jpg', 'Product evening');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (3, 1, 4, 73, 440, 1320, 'School individual painting society ball just. Floor visit network entire quickly.', 'put_image.jpg', 'Product as');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (8, 4, 30, 104, 349, 2792, 'Wait nature physical determine try recognize issue. Again yes defense same short unit yet.', 'work_image.jpg', 'Product past');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (8, 4, 87, 72, 998, 7984, 'Face land like letter measure education compare. Deal forget fast old exist. Kitchen current admit.', 'television_image.jpg', 'Product picture');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (9, 3, 6, 118, 463, 4167, 'Never fly usually value camera. Tax friend get owner. Magazine by decide operation know plant.', 'either_image.jpg', 'Product floor');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (10, 3, 90, 37, 818, 8180, 'Himself will player special. Later including guy possible.', 'necessary_image.jpg', 'Product student');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (3, 1, 28, 40, 570, 1710, 'Range agree majority direction thought truth. Site meeting floor behind.', 'performance_image.jpg', 'Product that');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (7, 2, 90, 46, 958, 6706, 'Draw different stock industry she summer medical kitchen.', 'line_image.jpg', 'Product fear');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (8, 5, 43, 129, 104, 832, 'Sister old build decade ever. Develop ball large talk. Just half audience specific day.', 'expect_image.jpg', 'Product pick');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (8, 2, 14, 21, 698, 5584, 'Democrat impact minute. Foreign remember good still audience. Consider technology per bad air.', 'agree_image.jpg', 'Product ten');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (9, 5, 83, 57, 89, 801, 'Drive black notice about beyond too expect.', 'project_image.jpg', 'Product writer');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (4, 5, 52, 4, 574, 2296, 'Leave all receive forward we. Rock past sister offer four spend partner blue.', 'once_image.jpg', 'Product yes');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (1, 2, 82, 139, 565, 565, 'Data beat today he. Set identify than.', 'camera_image.jpg', 'Product that');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (2, 5, 94, 48, 692, 1384, 'Loss left personal choice your hold. Toward student draw employee order note. Upon positive where.', 'keep_image.jpg', 'Product real');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (6, 4, 68, 38, 517, 3102, 'As attention system hard green including. Believe another line million theory model.', 'themselves_image.jpg', 'Product citizen');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (5, 2, 73, 2, 66, 330, 'Too system mother least set onto. Action hard sea feeling ten tell. People final town seven hot.', 'room_image.jpg', 'Product against');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (4, 2, 33, 135, 214, 856, 'Which life ever play agreement by. Campaign practice travel often opportunity break.', 'lay_image.jpg', 'Product listen');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (3, 1, 81, 76, 320, 960, 'Piece eight factor study start scientist.', 'us_image.jpg', 'Product low');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (8, 2, 44, 141, 274, 2192, 'Trip add determine threat now agency seat. List fall believe.', 'quite_image.jpg', 'Product side');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (1, 1, 50, 137, 584, 584, 'Mention child defense although under about. Garden traditional view also sea plant standard.', 'whom_image.jpg', 'Product wind');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (1, 5, 31, 30, 883, 883, 'Offer heavy become win. Hour consumer house. Dinner together board positive report year claim.', 'education_image.jpg', 'Product individual');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (5, 4, 36, 95, 840, 4200, 'Institution rest memory star. Rate hand situation everybody them suddenly.', 'among_image.jpg', 'Product almost');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (5, 3, 73, 62, 813, 4065, 'Result lot order available me.', 'soldier_image.jpg', 'Product natural');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (10, 4, 18, 76, 427, 4270, 'Question card community federal term. Likely professor way many. Energy office learn.', 'bring_image.jpg', 'Product have');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (2, 4, 82, 53, 504, 1008, 'Six show field describe public subject audience.
Direction sound program quality establish.', 'owner_image.jpg', 'Product at');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (4, 4, 82, 104, 895, 3580, 'Think national course particular meet finally. Order any really way girl that what purpose.', 'opportunity_image.jpg', 'Product pay');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (8, 2, 51, 48, 500, 4000, 'Second capital business bar. Start fine person real.', 'get_image.jpg', 'Product civil');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (3, 4, 26, 119, 851, 2553, 'Receive center energy dog back ball. Attorney deep friend particular seat do.', 'garden_image.jpg', 'Product cell');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (4, 4, 44, 91, 278, 1112, 'Continue bring life various. Someone source collection community. Actually common wish.', 'require_image.jpg', 'Product long');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (1, 1, 7, 75, 140, 140, 'Position people within us subject record could body. Write machine effect money news win.', 'character_image.jpg', 'Product moment');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (9, 2, 24, 47, 890, 8010, 'Work choose young family ability current anything. Stuff level specific list life citizen.', 'part_image.jpg', 'Product provide');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (5, 2, 70, 41, 776, 3880, 'Change study network religious cause. Determine sort determine difficult if. Fine social contain.', 'rather_image.jpg', 'Product station');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (3, 4, 23, 108, 889, 2667, 'Top less require during. Listen set next. Rate president team far address nearly.', 'respond_image.jpg', 'Product work');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (6, 2, 9, 19, 884, 5304, 'Whole friend doctor take. Medical hair until suffer. Budget movie popular catch often lead power.', 'also_image.jpg', 'Product run');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (7, 4, 80, 133, 332, 2324, 'Or executive degree industry conference right. Rest different too will scientist resource paper.', 'black_image.jpg', 'Product west');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (7, 5, 62, 69, 850, 5950, 'Positive decide morning contain security. Hold check might imagine that move dinner.', 'general_image.jpg', 'Product loss');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (5, 2, 58, 65, 94, 470, 'Everyone hope outside at physical allow best. Now because energy away hit friend.', 'president_image.jpg', 'Product left');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (10, 1, 34, 13, 224, 2240, 'She program night ability cover. Miss although tonight understand economic.', 'behind_image.jpg', 'Product appear');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (5, 5, 35, 24, 164, 820, 'North wife think. Do main strong step avoid boy.', 'attack_image.jpg', 'Product however');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (7, 5, 12, 116, 527, 3689, 'Pattern style special herself low security. Wall something leave end north artist again.', 'enough_image.jpg', 'Product condition');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (9, 5, 81, 122, 657, 5913, 'Authority little word than. General method culture establish. Program still image society model.', 'wind_image.jpg', 'Product perform');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (6, 4, 4, 147, 648, 3888, 'Hard yet far turn. Stage Mr then position he drug.', 'west_image.jpg', 'Product especially');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (4, 4, 41, 17, 40, 160, 'Back news past find meet until left newspaper. Good town stop reason upon mother down.', 'see_image.jpg', 'Product different');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (4, 1, 13, 28, 515, 2060, 'Easy beat very bag. See must behind book. Local material put religious hotel reality west focus.', 'point_image.jpg', 'Product yourself');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (1, 1, 36, 147, 215, 215, 'Space ability red media western daughter spring. Industry wrong campaign people laugh marriage.', 'my_image.jpg', 'Product a');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (9, 1, 10, 79, 746, 6714, 'Player establish early only modern southern. Including play develop few well sure know sometimes.', 'something_image.jpg', 'Product perhaps');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (8, 1, 24, 117, 511, 4088, 'Capital second account rate. Always nearly production upon local choose century.', 'why_image.jpg', 'Product hair');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (3, 2, 6, 12, 540, 1620, 'Yard probably she would skill position relationship. Pick car top everyone degree low.', 'need_image.jpg', 'Product senior');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (1, 1, 42, 17, 513, 513, 'Form skill stock the. Exist voice any between.
Official product author left win line start.', 'leg_image.jpg', 'Product need');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (5, 3, 43, 70, 184, 920, 'Him nearly candidate court series always our I.', 'black_image.jpg', 'Product high');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (4, 4, 69, 45, 965, 3860, 'Figure best coach significant. Reduce add rest look or magazine. Rate stock here fact tree.', 'character_image.jpg', 'Product draw');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (10, 5, 65, 17, 321, 3210, 'Movement form protect produce local. Assume mouth parent same.', 'thought_image.jpg', 'Product season');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (6, 3, 33, 105, 312, 1872, 'Laugh Mrs over against discuss. Name soon itself hot environment.', 'economy_image.jpg', 'Product radio');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (1, 5, 10, 24, 958, 958, 'Time traditional bed huge if out standard could. Sport west technology end age.', 'always_image.jpg', 'Product culture');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (7, 3, 91, 95, 765, 5355, 'Mission within first design service. Care hair more place learn part next.', 'after_image.jpg', 'Product character');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (8, 1, 95, 24, 902, 7216, 'Pressure age agency take kid box. Security first then area source.', 'care_image.jpg', 'Product dinner');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (1, 2, 27, 86, 776, 776, 'Hand arm about each.
Your indicate force stock.
West investment not else. Daughter per direction.', 'myself_image.jpg', 'Product his');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (9, 1, 97, 114, 92, 828, 'Ground outside tax drop. Sit represent interesting home buy top thousand.', 'relate_image.jpg', 'Product gun');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (6, 4, 79, 132, 792, 4752, 'Role international brother hold find.', 'scene_image.jpg', 'Product eight');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (9, 5, 26, 108, 55, 495, 'Friend person have election so century around mind.', 'allow_image.jpg', 'Product religious');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (2, 5, 83, 65, 685, 1370, 'Contain because hour. However but speech teacher yard affect vote. However entire ten sound first.', 'social_image.jpg', 'Product speak');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (9, 1, 1, 30, 477, 4293, 'Citizen city kind news. Resource fund set statement.', 'agency_image.jpg', 'Product can');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (7, 4, 85, 86, 217, 1519, 'Because both clearly left save piece. Audience positive main finally north born light gun.', 'party_image.jpg', 'Product include');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (7, 2, 5, 27, 677, 4739, 'Side some couple three fine make voice. Rest model gun environmental. Call bar past just.', 'job_image.jpg', 'Product near');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (9, 2, 95, 124, 692, 6228, 'Kind to wait area country woman. Discuss mind day more might.', 'grow_image.jpg', 'Product wonder');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (3, 4, 89, 52, 839, 2517, 'Else Mrs future miss national language brother. None increase life house few modern wish.', 'avoid_image.jpg', 'Product everybody');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (8, 2, 19, 121, 601, 4808, 'Specific by beyond bad shoulder. Play no take free particularly improve front.', 'recognize_image.jpg', 'Product name');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (3, 4, 11, 18, 588, 1764, 'Common southern system respond rest.', 'possible_image.jpg', 'Product west');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (3, 3, 52, 93, 80, 240, 'Quality pretty number green. Form television easy message.', 'head_image.jpg', 'Product follow');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (6, 1, 75, 35, 116, 696, 'More edge know study us success. Central news everyone career always. Clear word man.', 'beat_image.jpg', 'Product beautiful');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (1, 5, 87, 114, 504, 504, 'North many spring serious security also read head. Data our shoulder worry behind lay main.', 'area_image.jpg', 'Product to');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (4, 2, 23, 8, 513, 2052, 'Economic phone big walk. Forward sense no well rest project six.', 'each_image.jpg', 'Product author');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (6, 2, 23, 20, 722, 4332, 'So maybe bed however executive. Together southern ok.', 'skin_image.jpg', 'Product television');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (5, 4, 15, 143, 617, 3085, 'Generation mention gas know.
Page usually art the foreign. Yourself throw possible school soon PM.', 'natural_image.jpg', 'Product item');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (1, 5, 71, 128, 668, 668, 'Site turn institution team capital. Write cup price begin character. Start worry energy.', 'exist_image.jpg', 'Product wall');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (1, 3, 67, 118, 609, 609, 'Price central former cup then light. Stand partner grow.', 'outside_image.jpg', 'Product vote');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (7, 5, 31, 96, 134, 938, 'Ball stock point eat glass parent him. Produce agreement challenge.', 'various_image.jpg', 'Product manage');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (3, 5, 64, 6, 244, 732, 'Source soon trade read production affect. Factor discover surface war somebody reduce worry.', 'store_image.jpg', 'Product blood');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (8, 3, 88, 129, 132, 1056, 'Simple girl war real. Need industry plan practice must answer. Easy chance fight east piece.', 'character_image.jpg', 'Product herself');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (10, 5, 44, 126, 560, 5600, 'In avoid last most produce. Issue foreign machine quality him fire when.', 'none_image.jpg', 'Product determine');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (2, 1, 63, 90, 37, 74, 'Require law perhaps outside leader science drop. Else mind six.', 'century_image.jpg', 'Product thought');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (6, 5, 48, 56, 480, 2880, 'Teach condition serious involve. Red explain data every word long able.', 'she_image.jpg', 'Product deal');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (8, 3, 30, 141, 178, 1424, 'Artist good this quality live improve his. Down special over maybe.', 'effort_image.jpg', 'Product side');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (10, 3, 50, 67, 52, 520, 'Main few box bag they. Thousand yet prove foreign avoid own move.', 'few_image.jpg', 'Product every');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (6, 5, 78, 117, 455, 2730, 'Not past study fill road. Relate least happy test. Single cultural order president ten.', 'carry_image.jpg', 'Product media');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (10, 4, 73, 70, 749, 7490, 'Head sit account race close. Kind write role successful.', 'study_image.jpg', 'Product politics');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (2, 1, 38, 81, 337, 674, 'Wish measure measure consider visit group.', 'week_image.jpg', 'Product health');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (9, 3, 2, 123, 973, 8757, 'Daughter each company require. Probably explain police attack head face.', 'energy_image.jpg', 'Product much');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (4, 5, 26, 122, 252, 1008, 'Board do accept personal from. Trade page current choice. Democrat in cover government.', 'experience_image.jpg', 'Product agency');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (4, 5, 63, 107, 445, 1780, 'Approach compare news their never personal between. Budget dark human popular me.', 'air_image.jpg', 'Product plant');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (8, 3, 74, 131, 175, 1400, 'Expert it seek hold. Bill than know clearly.', 'seem_image.jpg', 'Product sure');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (9, 4, 73, 54, 424, 3816, 'Prepare education better section. And finish wonder sign. Water arm generation per fine.', 'whole_image.jpg', 'Product free');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (8, 4, 73, 11, 778, 6224, 'Speech agent create artist. Imagine best treatment successful these position into.', 'present_image.jpg', 'Product bit');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (8, 1, 87, 79, 512, 4096, 'Perform rate gas laugh drug measure. Bring front deep when be. Program him finish central of.', 'reflect_image.jpg', 'Product whole');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (9, 4, 82, 131, 406, 3654, 'Employee region thank movie. Have lot a later work reduce beyond.', 'perform_image.jpg', 'Product idea');
INSERT INTO [dbo].[order_detail] ([amount], [category], [fk_order_id], [fk_product_id], [price], [product_total], [describe], [image], [name]) VALUES (6, 4, 13, 37, 712, 4272, 'Government event realize. Pay move law staff language him court. Top spring page into site region.', 'data_image.jpg', 'Product customer');

--14.Order_Form
/*==========================================================================*/
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 19, 1, 1, 9964, '2024-02-16 04:25:12', '81183 Abigail Ways
Morganton, PR 51022', 'Cash', 'In Store', 'Movement dinner prove hundred manage across.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 42, 11, 1, 8035, '2023-11-22 16:59:06', '81330 Francis Circles
Stevenland, RI 19186', 'Credit Card', 'In Store', 'Investment guy wind run.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 11, 18, 0, 1618, '2023-09-08 09:04:11', '716 Johnson Ferry Apt. 935
Englishhaven, IL 93364', 'Credit Card', 'In Store', 'Force place however wear TV per.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 19, 19, 0, 6744, '2023-10-28 17:59:12', '22167 Steele Inlet Suite 846
West Luke, OK 32894', 'Mobile Payment', 'In Store', 'Prepare hold appear hot risk expert morning day.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 28, 6, 1, 9153, '2023-10-07 22:06:08', '904 Huber Light
Lake Amber, MN 61800', 'Credit Card', 'In Store', 'Radio degree others despite.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 19, 7, 1, 3226, '2023-09-16 04:52:46', '729 Shelton Locks Suite 372
New Roberttown, KS 833', 'Credit Card', 'In Store', 'Month security environment accept third.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 43, 11, 1, 2964, '2024-02-04 03:48:13', '6289 Davis Inlet Apt. 809
Brandonfort, HI 09159', 'Cash', 'Delivery', 'Take side operation yet.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 9, 19, 1, 7377, '2023-12-05 13:33:15', 'PSC 6209, Box 6643
APO AA 04774', 'Credit Card', 'In Store', 'True between between for.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 50, 2, 0, 662, '2023-10-21 02:43:58', '434 David Overpass
Port Audrey, NJ 63573', 'Credit Card', 'Delivery', 'Voice responsibility role next deal.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 33, 11, 0, 2205, '2023-12-06 07:33:27', '78281 Scott Radial Apt. 816
Juliafurt, PW 68593', 'Cash', 'In Store', 'Course loss them offer buy.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 27, 3, 1, 2731, '2024-02-05 17:13:45', '9696 Michael Rest Apt. 973
Lake Alicia, NY 69604', 'Mobile Payment', 'Delivery', 'Cost any war some strong.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 8, 20, 0, 1604, '2024-01-23 05:00:53', '188 Lori Harbor Suite 443
Sharonside, ID 86207', 'Cash', 'Delivery', 'Our source goal strategy education method.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 3, 12, 0, 1290, '2024-01-09 10:37:50', '8957 Tamara Ford
Hansonbury, LA 50412', 'Mobile Payment', 'Delivery', 'New baby than about Republican soldier camera.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 19, 20, 1, 9192, '2023-11-30 22:07:45', 'Unit 0194 Box 1576
DPO AE 57553', 'Cash', 'In Store', 'Another protect mean.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 2, 16, 1, 592, '2023-10-09 14:16:00', '8734 Dustin Motorway
Davidstad, MD 58765', 'Mobile Payment', 'Delivery', 'See six draw minute vote charge investment card.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 45, 14, 1, 3771, '2023-09-10 11:37:59', '2162 Cooper Orchard
West Julie, OH 28283', 'Cash', 'In Store', 'Dark total apply understand.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 20, 14, 0, 6170, '2024-02-22 21:16:17', '72024 Christopher Corners Suite 831
Elizabethport,', 'Mobile Payment', 'In Store', 'Husband long break write thus might.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 25, 7, 1, 1536, '2023-12-01 21:39:13', '4978 Richards Parkways
Lake Angela, NC 93916', 'Mobile Payment', 'In Store', 'Cup year series wrong media seem civil.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 17, 1, 1, 3398, '2023-12-19 15:07:45', '3552 Kimberly Manor Apt. 767
North Derektown, RI 7', 'Credit Card', 'In Store', 'Growth among chair exist set catch interview you.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 41, 8, 0, 5498, '2024-02-23 14:53:49', '218 Mary Mountains Apt. 757
South Margaret, HI 880', 'Credit Card', 'In Store', 'Hot shoulder light.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 4, 14, 0, 9954, '2023-10-07 22:17:39', '3930 Barry View Apt. 388
Johnsonton, NE 88192', 'Mobile Payment', 'Delivery', 'Figure page scientist bring together.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 7, 7, 0, 8612, '2023-10-11 21:09:34', '872 Paul Loop Apt. 667
South Leonardton, KS 65175', 'Mobile Payment', 'Delivery', 'Task indeed coach it outside type every.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 14, 10, 1, 9445, '2023-10-10 05:42:53', '9323 Nicole Plain Apt. 743
Craigmouth, DC 52810', 'Mobile Payment', 'In Store', 'Event enter apply scene education seven now.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 14, 1, 0, 5976, '2024-01-14 15:06:38', '73263 Sellers Plains
South Susan, OR 54943', 'Cash', 'Delivery', 'Part talk bring including record until.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 43, 6, 1, 3527, '2024-02-15 09:22:56', 'USCGC Guerrero
FPO AE 50568', 'Cash', 'In Store', 'Adult way answer traditional.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 44, 19, 0, 4272, '2023-08-24 14:37:09', '5804 Burns Burgs Apt. 890
Blackburnburgh, MD 32994', 'Cash', 'Delivery', 'Be paper idea response reach heart authority.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 28, 8, 1, 7732, '2023-07-04 03:14:59', '8713 Martinez Key
Mariahland, WY 90884', 'Mobile Payment', 'In Store', 'Those training real media hit item.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 33, 5, 0, 9956, '2023-09-22 00:40:19', '609 Schwartz Mountains Suite 869
Wrightport, MH 35', 'Mobile Payment', 'Delivery', 'Name technology each evening action.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 7, 10, 1, 9164, '2023-09-27 08:46:30', '871 Lee Dam
South Laurie, TX 82467', 'Cash', 'In Store', 'Director avoid economic nature.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 46, 7, 1, 7065, '2023-10-23 05:43:39', '371 Michael Fall
Lake Michelle, MA 56570', 'Cash', 'In Store', 'More seek line south quite director happy.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 43, 12, 1, 7710, '2023-08-04 22:47:31', '844 Zachary Island Suite 577
Lake Ryanmouth, CA 89', 'Mobile Payment', 'Delivery', 'Nothing bar key capital.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 45, 7, 1, 3043, '2023-12-21 05:30:08', '498 Andrew Isle
Douglasside, VT 29149', 'Cash', 'Delivery', 'Ten want begin discover care treatment forget.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 10, 9, 0, 8450, '2023-11-22 04:26:43', '700 Ronald Unions Suite 972
Kimberlyburgh, NE 4214', 'Credit Card', 'Delivery', 'Play fire dark walk official difficult.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 28, 5, 1, 3698, '2024-01-13 11:41:27', '46415 Megan Spring Apt. 681
Bethmouth, SC 91396', 'Cash', 'In Store', 'Book evidence through measure budget.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 8, 4, 0, 693, '2023-08-01 22:08:32', '589 James Views Apt. 488
Lake Javierview, KS 21631', 'Mobile Payment', 'Delivery', 'Reflect agent with or two girl.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 8, 13, 1, 5435, '2023-07-18 22:13:48', '23351 Michael Ways
Dennismouth, WY 90680', 'Credit Card', 'In Store', 'Free bank or sort read green space.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 28, 4, 0, 5898, '2023-12-22 10:19:58', '606 Christopher Trafficway
Davisville, GU 92234', 'Mobile Payment', 'In Store', 'Close live public out.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 2, 15, 1, 6741, '2023-07-09 16:54:35', '6938 Erika Drive
North Christophershire, NM 39088', 'Credit Card', 'In Store', 'Computer then base table ahead current could.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 44, 13, 1, 5634, '2023-12-23 23:54:01', 'PSC 8679, Box 5540
APO AE 67615', 'Mobile Payment', 'In Store', 'Clearly song away speech poor.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 24, 11, 1, 3084, '2023-12-07 20:33:32', '5298 Laura Orchard Suite 978
Lake Briannaburgh, ND', 'Credit Card', 'In Store', 'The single treat exactly prove.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 34, 7, 0, 3049, '2023-12-22 11:26:11', '140 Aaron Valleys Apt. 719
North Michelletown, FM ', 'Cash', 'In Store', 'Economic central although simple mention.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 6, 2, 1, 3181, '2023-08-02 02:52:32', '25999 Phillip Green
East Williamfurt, AR 92426', 'Credit Card', 'Delivery', 'Soldier common former argue with.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 41, 17, 1, 7240, '2023-08-21 20:42:23', '9244 Eric Trail Suite 386
New Richardbury, HI 5128', 'Mobile Payment', 'In Store', 'Million relationship animal agree section.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 10, 17, 0, 479, '2023-12-05 21:09:52', '618 Jackson Valley
Davidstad, GA 91389', 'Mobile Payment', 'Delivery', 'Financial majority water series positive care.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 31, 12, 0, 7495, '2023-07-29 19:27:10', '012 Alexandria Fields Suite 912
West Katie, LA 165', 'Mobile Payment', 'In Store', 'Suddenly light drop.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 38, 16, 1, 3650, '2023-08-30 01:37:04', '55309 Conner Avenue
Port Jacobland, HI 44463', 'Cash', 'Delivery', 'His method cell fear likely sister middle.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 23, 15, 1, 1768, '2024-02-03 13:31:50', 'Unit 0332 Box 9825
DPO AP 02287', 'Cash', 'Delivery', 'Carry quite month draw common those.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 46, 7, 0, 9675, '2024-01-02 00:13:14', '2068 Misty Expressway
Lake Ashleyburgh, WA 82513', 'Cash', 'Delivery', 'Rate glass which card.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 44, 15, 0, 5408, '2023-10-18 21:58:40', '7674 Thomas Points
South Jaclyn, GA 30373', 'Credit Card', 'In Store', 'Apply impact case push.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 3, 12, 0, 5964, '2024-02-05 04:47:40', '600 Nguyen Field Suite 821
South Jenniferberg, IA ', 'Cash', 'In Store', 'Miss with seem live sense property.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 43, 10, 1, 9317, '2023-08-18 14:36:20', 'PSC 1282, Box 3352
APO AA 36286', 'Credit Card', 'Delivery', 'Generation near baby none spring wear notice.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 4, 1, 1, 5967, '2023-08-01 05:33:28', '5606 Johnson Trafficway Suite 834
Benjaminview, NE', 'Credit Card', 'Delivery', 'Understand seem suddenly we beautiful down.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 17, 3, 1, 498, '2023-12-08 01:26:12', '02979 Leslie Passage
New Olivia, VI 03014', 'Mobile Payment', 'Delivery', 'Cold environmental loss save think us PM.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 46, 20, 1, 5702, '2023-09-09 06:27:17', '308 Walters Lights Apt. 794
Thomastown, VT 19471', 'Cash', 'In Store', 'Discuss ability fine adult.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 29, 10, 1, 842, '2023-10-28 06:39:26', '8847 Cheryl Prairie
Jessicaview, OK 35150', 'Mobile Payment', 'In Store', 'Phone husband figure magazine positive.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 31, 1, 0, 9725, '2023-07-06 22:58:12', '5441 Baker Fork Apt. 386
Lake Brian, MD 84948', 'Cash', 'Delivery', 'Cut any live forget.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 2, 8, 1, 3745, '2023-08-25 00:04:25', 'PSC 2542, Box 6213
APO AA 10849', 'Credit Card', 'In Store', 'Quality describe prevent that take ten.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 46, 5, 0, 2639, '2023-09-08 04:05:40', 'Unit 5627 Box 3340
DPO AP 65166', 'Mobile Payment', 'In Store', 'Series rise each agent.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 41, 2, 1, 8099, '2023-07-30 15:49:06', '644 Thomas Point Apt. 482
Jonesfort, MT 04651', 'Credit Card', 'In Store', 'Region hard give thus follow tough member.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 39, 1, 0, 9171, '2023-12-22 07:24:42', 'USS Smith
FPO AP 59310', 'Cash', 'Delivery', 'Would specific population able bag whole benefit.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 31, 16, 1, 509, '2023-10-24 06:48:43', 'PSC 1086, Box 1124
APO AP 49592', 'Cash', 'In Store', 'Stand mention wind.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 24, 17, 0, 3269, '2023-09-17 16:54:27', '43901 Phillip Mount Suite 013
North Richard, CO 24', 'Cash', 'Delivery', 'General require hand not.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 50, 14, 0, 827, '2023-08-09 16:25:25', '3044 Patterson Mountain Apt. 217
Melissamouth, AZ ', 'Mobile Payment', 'Delivery', 'Approach seek feel serve fund well.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 23, 8, 1, 5271, '2023-07-26 18:39:50', '6142 Nicole Via
East Robert, WV 83199', 'Cash', 'In Store', 'Phone political base need pull.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 1, 10, 1, 6235, '2023-11-12 03:24:06', '81983 Samuel Islands Apt. 724
East Carolyn, PR 033', 'Credit Card', 'Delivery', 'Often generation him employee hit.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 28, 1, 0, 5542, '2024-01-25 11:39:39', 'PSC 5882, Box 3367
APO AA 83291', 'Credit Card', 'Delivery', 'Born tree whose society question back.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 42, 8, 1, 1980, '2023-08-07 09:10:29', '1907 Davis Lakes Suite 658
Davidtown, CT 51241', 'Credit Card', 'Delivery', 'Network treat dream sell.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 27, 2, 1, 6777, '2023-10-31 07:27:54', '88393 Wallace Plains Apt. 926
Paulfort, VT 85942', 'Credit Card', 'In Store', 'Mean let town others discover positive authority.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 1, 8, 0, 7035, '2023-09-16 01:43:16', '5169 Elizabeth Plains Suite 206
Jorgeshire, FM 897', 'Credit Card', 'Delivery', 'Number trouble teacher fall.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 30, 13, 0, 4074, '2023-07-06 22:23:44', '741 Jeremy Crescent Apt. 535
North Christopher, NE', 'Credit Card', 'In Store', 'Little government prevent dream perform speak so.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 2, 14, 1, 6413, '2024-01-27 05:54:30', '40481 Kathleen Ridge
Port Benjamin, GU 62605', 'Cash', 'In Store', 'Cost one themselves serve.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 40, 16, 0, 9622, '2023-08-06 18:09:02', '01033 William Estate
North Jessica, NC 07068', 'Cash', 'In Store', 'Join think choice.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 1, 5, 0, 4506, '2023-10-28 22:37:17', '2417 Susan Rest
Maryfurt, IA 65084', 'Credit Card', 'Delivery', 'Record list development. Best yourself whether.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 8, 19, 1, 8625, '2023-11-18 13:40:11', '4991 Davis Pass Apt. 711
Shannonview, AR 43193', 'Credit Card', 'In Store', 'Each realize wall about.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 16, 18, 1, 1443, '2024-02-18 00:53:07', '5289 Baxter Mount
North Ericaberg, FL 82133', 'Credit Card', 'Delivery', 'Name word ball author blood make.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 14, 3, 1, 2332, '2024-02-09 03:54:03', '8809 Brown Lake
Mariemouth, CT 25456', 'Credit Card', 'In Store', 'Ball statement or meeting. Take detail career.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 14, 15, 1, 9347, '2023-11-09 01:59:15', '3439 Jackson Manors
Rogersbury, NJ 61592', 'Mobile Payment', 'Delivery', 'Mr far wonder human difference.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 46, 9, 0, 567, '2023-12-25 01:54:57', '97818 Andrea Trace
Fernandezborough, VT 27598', 'Mobile Payment', 'In Store', 'Simple recent recent serve exist.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 40, 3, 0, 2508, '2023-09-22 18:57:41', '10377 Arellano Parks Suite 372
Reynoldsport, OK 04', 'Cash', 'In Store', 'Boy audience keep hair.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 48, 3, 0, 7934, '2023-11-29 14:08:36', '10652 Smith Dale Apt. 993
North Amanda, WV 68230', 'Credit Card', 'Delivery', 'Yourself spend son.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 41, 7, 1, 6573, '2024-02-07 07:58:46', '9789 Dawn Stravenue
Port Justin, NV 01191', 'Cash', 'In Store', 'Lot town stuff notice.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 50, 13, 1, 3415, '2023-12-28 06:43:17', '23364 Sabrina Ranch
Port Danielburgh, MD 91295', 'Cash', 'In Store', 'Join traditional current wide.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 18, 19, 1, 7801, '2023-10-26 16:12:32', '2748 Christine Summit
New Benjamin, LA 59359', 'Cash', 'Delivery', 'Sister television form for red.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 34, 13, 1, 9031, '2024-01-13 20:04:51', '190 Stephen Corners
Cunninghamtown, MT 33710', 'Mobile Payment', 'Delivery', 'Society forward strong all.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 38, 14, 0, 957, '2024-01-07 00:02:26', 'Unit 6934 Box 2443
DPO AE 16596', 'Mobile Payment', 'In Store', 'Quite benefit best clear increase.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 7, 5, 1, 6548, '2023-07-08 16:28:45', '1236 Scott Island Suite 268
Port Wendyport, IN 247', 'Credit Card', 'In Store', 'Debate evidence degree.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 38, 19, 0, 6885, '2023-09-12 20:51:12', '686 Kristin Centers Suite 034
East Kevin, NH 42787', 'Mobile Payment', 'Delivery', 'Instead follow recently key end time minute.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 21, 12, 0, 6618, '2023-08-06 21:09:10', '26575 Hannah Unions
Johnbury, MN 07390', 'Cash', 'Delivery', 'Image on character investment during matter.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 28, 20, 1, 8314, '2024-02-24 23:38:01', '22488 Taylor Locks Suite 490
Huberhaven, DC 22916', 'Mobile Payment', 'In Store', 'Member campaign arm marriage cup art surface.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 34, 10, 0, 7336, '2024-02-12 03:37:22', '9310 Ryan River Apt. 160
Kathleenmouth, WY 96281', 'Cash', 'Delivery', 'Leg compare another write.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 29, 15, 0, 6984, '2023-08-02 22:30:14', '227 Ferrell Drive Suite 401
Serranoside, VA 53477', 'Cash', 'In Store', 'Sure author attention huge defense live.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 36, 11, 0, 4765, '2023-10-07 06:06:19', '02145 Short Fork Suite 081
South David, LA 76685', 'Cash', 'In Store', 'Between better onto mention American number.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 49, 14, 0, 6001, '2023-11-04 16:33:48', 'PSC 6467, Box 5808
APO AP 99807', 'Mobile Payment', 'In Store', 'Value employee second ready support gas past.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 35, 11, 0, 7799, '2023-07-24 13:39:02', '7391 Brian Forest Suite 817
West Frank, WV 58281', 'Mobile Payment', 'Delivery', 'Policy whose bar thousand stage form.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 20, 9, 0, 5752, '2023-07-30 12:27:21', '160 Renee Wells Apt. 069
Caitlynmouth, RI 30252', 'Cash', 'Delivery', 'Environmental ground smile student office.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 17, 4, 0, 8165, '2024-01-30 11:59:17', '4177 Hayes Stravenue
Hensonmouth, WI 93118', 'Mobile Payment', 'Delivery', 'Level wife significant big woman.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 12, 3, 1, 9872, '2023-07-12 13:43:33', '62708 Jennings Brooks
Tylerfort, MH 45933', 'Mobile Payment', 'In Store', 'Suggest car lot civil think physical military.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 24, 7, 0, 1094, '2023-09-16 03:55:17', 'Unit 8532 Box 6666
DPO AP 43213', 'Mobile Payment', 'Delivery', 'Current set reason low choose.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 47, 9, 1, 7938, '2023-08-15 11:43:39', '995 Morris Mount Suite 856
Carolburgh, IL 17904', 'Mobile Payment', 'Delivery', 'Provide color water debate.');
INSERT INTO [dbo].[order_form] ([coupon_id], [fk_business_id], [fk_guest_id], [payment_status], [total], [time], [address], [payment_type], [pickup], [text]) VALUES (1, 7, 7, 0, 9588, '2024-02-13 07:31:07', '7273 Denise Courts
North Brianna, NM 01158', 'Cash', 'In Store', 'Anyone road against opportunity provide off.');

--15.PaymentMethod
/*==========================================================================*/
INSERT INTO [hangryDB].[dbo].[payment_method] ([method])
VALUES ('cash');
INSERT INTO [hangryDB].[dbo].[payment_method] ([method])
VALUES ('credit card');
INSERT INTO [hangryDB].[dbo].[payment_method] ([method])
VALUES ('cash on delivery');
INSERT INTO [hangryDB].[dbo].[payment_method] ([method])
VALUES ('ec pay');
--16.Product
/*==========================================================================*/
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (37, 2, 811, 'Outside instead difficult help eight example base environmental. Not recently morning way.', 'ahead', 'ahead_image.jpg', 'ahead Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (48, 2, 229, 'Story both sort especially myself blue. Camera say someone.', 'financial', 'financial_image.jpg', 'financial Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (25, 2, 788, 'Baby start score. Seem heavy force responsibility every floor more.', 'big', 'big_image.jpg', 'big Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (47, 9, 712, 'Theory view close hand check trade federal speech. Best despite garden discover star country learn.', 'conference', 'conference_image.jpg', 'conference Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (36, 2, 118, 'Develop recently where letter great late. Treat center road word moment control.', 'bad', 'bad_image.jpg', 'bad Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (10, 8, 13, 'Walk trade head western community try. As evidence growth argue cultural seem.', 'specific', 'specific_image.jpg', 'specific Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (8, 9, 331, 'Bit between short them stock since. Anything benefit cold soon tend. Claim onto seven people.', 'action', 'action_image.jpg', 'action Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (26, 7, 320, 'Under moment democratic sort. Discover same if.', 'system', 'system_image.jpg', 'system Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (2, 7, 769, 'Economy stop heart exactly. Indeed capital commercial none rather.', 'have', 'have_image.jpg', 'have Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (18, 4, 390, 'Must ahead ever design. Board reason page oil article.', 'hold', 'hold_image.jpg', 'hold Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (3, 1, 988, 'Mention three gun budget per value. Bad place away man.', 'he', 'he_image.jpg', 'he Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (48, 9, 99, 'Development rich he trip. Manage likely wide official need role both house.', 'indicate', 'indicate_image.jpg', 'indicate Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (35, 10, 825, 'Ball range hope bill about anyone.', 'difficult', 'difficult_image.jpg', 'difficult Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (50, 2, 935, 'Affect participant huge. Participant by where employee professional coach. Skin age mention.', 'food', 'food_image.jpg', 'food Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (2, 5, 205, 'Break true throughout clearly. Administration body American such.
Community cut since not wind.', 'play', 'play_image.jpg', 'play Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (18, 9, 673, 'Pressure attack boy. Institution late suffer effort use sit.', 'laugh', 'laugh_image.jpg', 'laugh Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (1, 10, 261, 'Open risk red. Available teacher rest draw represent. Create mean certain station politics light.', 'operation', 'operation_image.jpg', 'operation Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (2, 1, 674, 'Pay through quickly military foot fly who.', 'under', 'under_image.jpg', 'under Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (3, 10, 176, 'Wind paper be watch recognize reveal. Though grow thus travel red. Almost then member person.', 'page', 'page_image.jpg', 'page Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (14, 4, 382, 'Answer lead than organization exist.
Fear drive beat bad fact race office.', 'general', 'general_image.jpg', 'general Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (11, 10, 757, 'Store statement growth nearly. Watch quality chair always stop room agent.', 'star', 'star_image.jpg', 'star Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (20, 4, 112, 'Perhaps company week recently simply land final somebody.
Note include special only.', 'camera', 'camera_image.jpg', 'camera Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (18, 1, 735, 'Growth bad perform right interest class fight save.', 'this', 'this_image.jpg', 'this Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (1, 3, 815, 'Something offer economic these term. Today detail water customer worry mouth.', 'quality', 'quality_image.jpg', 'quality Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (44, 1, 368, 'Reach woman receive want natural pretty yes. Join direction bag by check large at.', 'window', 'window_image.jpg', 'window Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (34, 7, 345, 'Loss law turn plan professional significant. Dream scientist computer well assume.', 'such', 'such_image.jpg', 'such Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (4, 5, 353, 'Enter leg knowledge interview cover hear hear cultural.', 'until', 'until_image.jpg', 'until Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (12, 2, 838, 'West education catch protect day government. He realize whom continue not.', 'home', 'home_image.jpg', 'home Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (2, 4, 864, 'Include meet their lawyer. Civil discussion modern rise. Instead cultural movement upon body.', 'answer', 'answer_image.jpg', 'answer Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (3, 4, 676, 'Job body relate name. Card left movement front respond action.', 'or', 'or_image.jpg', 'or Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (17, 5, 640, 'Democrat tree could trip air hard. North ball from guy.', 'organization', 'organization_image.jpg', 'organization Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (34, 4, 954, 'Plant night move. Score leave key Mrs heavy.', 'southern', 'southern_image.jpg', 'southern Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (14, 9, 416, 'Serious open state bring. Bank issue hard peace according maybe word.', 'indicate', 'indicate_image.jpg', 'indicate Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (42, 2, 55, 'Matter machine friend song. Whether put story ten director.', 'level', 'level_image.jpg', 'level Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (14, 9, 775, 'Consider TV contain town. Visit conference activity Congress field second.', 'we', 'we_image.jpg', 'we Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (14, 10, 740, 'Interest party former wall marriage serve. Care evening drug ability upon.', 'mother', 'mother_image.jpg', 'mother Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (26, 4, 661, 'Rather none born check young western. Indeed politics southern.', 'change', 'change_image.jpg', 'change Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (37, 7, 983, 'Since real bad at human.
Party fine even prepare reduce her.', 'section', 'section_image.jpg', 'section Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (48, 9, 944, 'Watch worker on movie price travel red. Against their difference check thus suggest report.', 'rise', 'rise_image.jpg', 'rise Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (3, 1, 555, 'Young scene account around former oil southern. Respond continue establish establish.', 'learn', 'learn_image.jpg', 'learn Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (6, 8, 751, 'Language budget chance in.', 'choice', 'choice_image.jpg', 'choice Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (10, 5, 155, 'Rock expect mention argue see. Provide commercial rise music us order heart.', 'difficult', 'difficult_image.jpg', 'difficult Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (49, 10, 638, 'Policy a arrive third represent when tend. Marriage account hand word more.', 'trade', 'trade_image.jpg', 'trade Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (50, 5, 810, 'Decision data level cut as computer beat. Write grow fire summer.', 'I', 'I_image.jpg', 'I Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (4, 10, 925, 'Morning relate lot appear key whatever attention. Community late cold tax.', 'which', 'which_image.jpg', 'which Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (49, 1, 628, 'Particular factor know mention.
Wife machine best what improve.', 'night', 'night_image.jpg', 'night Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (19, 2, 367, 'Animal brother standard number increase simple fly.', 'ok', 'ok_image.jpg', 'ok Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (33, 8, 153, 'Cause area plan institution. Stuff level challenge second surface political board society.', 'grow', 'grow_image.jpg', 'grow Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (34, 9, 667, 'Public including analysis worry art herself. Others within bad recent research case.', 'education', 'education_image.jpg', 'education Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (7, 9, 76, 'Art move indeed similar suffer somebody which. Election act society bed street.', 'staff', 'staff_image.jpg', 'staff Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (41, 4, 783, 'Perform meet term focus know line rather discover. Talk although race me everyone evidence better.', 'vote', 'vote_image.jpg', 'vote Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (31, 2, 78, 'Author air question nor force mind. Month field may arm.', 'might', 'might_image.jpg', 'might Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (34, 1, 928, 'Until worry only politics more. Town join director at need raise large.', 'read', 'read_image.jpg', 'read Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (21, 4, 455, 'Follow standard step effect. Economy current six image attack court. Ten middle huge amount fill.', 'sense', 'sense_image.jpg', 'sense Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (10, 10, 457, 'Institution run attack first. Four chair station democratic.', 'take', 'take_image.jpg', 'take Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (42, 4, 105, 'Newspaper much create camera. North fall result wonder improve company.', 'until', 'until_image.jpg', 'until Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (37, 5, 526, 'Late us somebody protect friend do. American hard follow.', 'decade', 'decade_image.jpg', 'decade Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (11, 3, 703, 'Suffer all meet other. Say dark special generation learn popular.', 'cover', 'cover_image.jpg', 'cover Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (47, 10, 23, 'Make democratic though safe bed either. Visit among analysis option land relationship her I.', 'own', 'own_image.jpg', 'own Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (2, 2, 343, 'Condition morning upon order beat newspaper fill.', 'fight', 'fight_image.jpg', 'fight Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (31, 6, 353, 'Too fly friend on smile. Avoid within sit trial act.', 'hold', 'hold_image.jpg', 'hold Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (5, 2, 697, 'Major yet change party as work. Enjoy majority author area. Show in build plant year agency.', 'reduce', 'reduce_image.jpg', 'reduce Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (13, 9, 823, 'Tree let although. Which task available group method baby.', 'crime', 'crime_image.jpg', 'crime Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (48, 7, 671, 'Few soon wait cover through could. Over word court. Perhaps how inside war.', 'reason', 'reason_image.jpg', 'reason Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (45, 6, 70, 'Nearly success trip discover. Rock subject study baby standard place agree.', 'act', 'act_image.jpg', 'act Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (39, 2, 837, 'Different report phone look. Fund main necessary compare onto. Sell out society experience fish.', 'push', 'push_image.jpg', 'push Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (34, 8, 395, 'Build single big over. Party smile country little. Loss environment fill note standard.', 'cause', 'cause_image.jpg', 'cause Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (23, 3, 403, 'Nation site decision soldier figure. Gas public continue especially wear admit purpose mother.', 'check', 'check_image.jpg', 'check Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (15, 8, 579, 'Mission form all always. Loss music factor his type article throw.', 'customer', 'customer_image.jpg', 'customer Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (44, 5, 984, 'Social example soldier. Would current final wind interest thing.', 'successful', 'successful_image.jpg', 'successful Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (50, 3, 501, 'Local third significant big. Song once minute never its class.', 'information', 'information_image.jpg', 'information Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (41, 7, 295, 'Indeed sea important discuss adult. Even above care civil present yet. Make collection wish police.', 'water', 'water_image.jpg', 'water Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (50, 5, 246, 'Thus administration you ago piece across. Even analysis she big her whether.', 'commercial', 'commercial_image.jpg', 'commercial Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (41, 2, 881, 'Identify treatment strong.', 'pay', 'pay_image.jpg', 'pay Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (32, 10, 525, 'Card drug heart. Range wall suffer about recently. While girl attorney nice student.', 'subject', 'subject_image.jpg', 'subject Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (37, 2, 272, 'Natural throw notice coach likely program explain.
However safe do. Happen receive finish deep ten.', 'some', 'some_image.jpg', 'some Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (50, 5, 746, 'Movie event significant as. Watch school travel ago decide probably until.', 'experience', 'experience_image.jpg', 'experience Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (10, 2, 224, 'Lay left data mission option. Situation hand article ask success.', 'speak', 'speak_image.jpg', 'speak Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (49, 7, 922, 'But very analysis take you nothing heavy. Give where chair with health model for.', 'all', 'all_image.jpg', 'all Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (45, 9, 493, 'Sister appear wall fish.', 'so', 'so_image.jpg', 'so Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (25, 8, 149, 'Bar need method benefit drive might. Left shoulder turn summer.', 'baby', 'baby_image.jpg', 'baby Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (39, 1, 787, 'Look thousand shoulder begin another themselves. College debate choice.', 'indicate', 'indicate_image.jpg', 'indicate Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (33, 6, 814, 'Group blood however. Play already this. Two message tonight food.', 'name', 'name_image.jpg', 'name Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (46, 10, 532, 'Protect food summer court business name.', 'major', 'major_image.jpg', 'major Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (46, 9, 791, 'Shake though past call song. Health difference partner peace.', 'lead', 'lead_image.jpg', 'lead Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (5, 8, 929, 'Thing gas camera maybe catch worry shake. Age factor reveal book color. Value health task likely.', 'remember', 'remember_image.jpg', 'remember Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (2, 7, 308, 'Million itself might.
Program real lot board certainly. While tax wife fire crime health.', 'participant', 'participant_image.jpg', 'participant Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (17, 4, 532, 'About force act. You resource something offer air impact sense.', 'enter', 'enter_image.jpg', 'enter Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (8, 2, 637, 'Method whom real. Weight player poor what order option. Win expert you easy property change.', 'it', 'it_image.jpg', 'it Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (24, 3, 120, 'Box campaign tough if able how. Long determine skill morning form health fear.', 'provide', 'provide_image.jpg', 'provide Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (24, 2, 31, 'Bag well born smile side blue check. Country he be view cup.', 'cost', 'cost_image.jpg', 'cost Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (21, 10, 180, 'Man until leave year carry add. Couple give door serve. Sound beyond question fast.', 'international', 'international_image.jpg', 'international Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (22, 1, 519, 'Wall wrong remember gun southern process commercial.', 'including', 'including_image.jpg', 'including Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (10, 7, 444, 'Two tend authority city small beautiful. Himself third federal in.', 'charge', 'charge_image.jpg', 'charge Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (22, 4, 821, 'Fact left feeling radio six. Any style apply nature itself move. Real old another.', 'leg', 'leg_image.jpg', 'leg Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (19, 6, 458, 'What then plan report decision really per. Fly and home each yourself.', 'top', 'top_image.jpg', 'top Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (24, 1, 411, 'Shoulder notice still because contain two baby. Away car market explain stop store.', 'serious', 'serious_image.jpg', 'serious Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (25, 5, 574, 'Room whatever question card follow. Approach amount interesting run central. Try quite future move.', 'through', 'through_image.jpg', 'through Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (18, 6, 187, 'Soldier catch civil all natural outside very. Scene baby structure interesting green leader world.', 'scene', 'scene_image.jpg', 'scene Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (1, 7, 190, 'You yard seem whose although maintain. Feeling other between should situation win.', 'over', 'over_image.jpg', 'over Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (34, 4, 554, 'Level reason maybe list piece. Guy suddenly center him quite sort realize.', 'cost', 'cost_image.jpg', 'cost Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (23, 5, 619, 'Responsibility best save strong. Pull majority just theory.', 'operation', 'operation_image.jpg', 'operation Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (18, 4, 766, 'Media either public fast through south. Young computer although building hope. Indeed sign green.', 'court', 'court_image.jpg', 'court Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (47, 2, 906, 'Big compare soldier feel try. Example result off central think dark. To great question ahead.', 'coach', 'coach_image.jpg', 'coach Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (36, 2, 805, 'Parent project west most during car see. Watch artist catch industry artist score.', 'college', 'college_image.jpg', 'college Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (32, 1, 939, 'Drug able allow onto write charge. Water that until student. Direction toward almost notice during.', 'actually', 'actually_image.jpg', 'actually Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (38, 7, 11, 'Into result north relationship our treatment society.', 'decade', 'decade_image.jpg', 'decade Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (27, 7, 882, 'Nice cup view industry. Long southern song detail election join follow.', 'tax', 'tax_image.jpg', 'tax Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (42, 3, 727, 'Doctor since seat can senior box fire.', 'east', 'east_image.jpg', 'east Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (29, 6, 269, 'Face I tell mission usually author kid. Speak attorney majority.', 'always', 'always_image.jpg', 'always Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (14, 4, 575, 'Everything poor well individual specific ago price. Garden environment hope Republican.', 'wall', 'wall_image.jpg', 'wall Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (11, 6, 766, 'President call along condition. Party section remain prepare.', 'above', 'above_image.jpg', 'above Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (11, 4, 984, 'Girl protect pick I into direction. Ahead different father again light. But career sing event.', 'describe', 'describe_image.jpg', 'describe Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (15, 9, 771, 'Page Democrat tend piece. Wind cost catch really save. Wrong center way industry.', 'it', 'it_image.jpg', 'it Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (4, 6, 507, 'Stuff room base board often. Term everything walk.', 'authority', 'authority_image.jpg', 'authority Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (20, 10, 293, 'Huge now increase end bill bank. Ball give want table wear school lot. War seem make.', 'issue', 'issue_image.jpg', 'issue Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (3, 5, 312, 'Feel magazine body tell middle heavy. Act treat hand. Most modern follow science poor the.', 'page', 'page_image.jpg', 'page Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (30, 8, 486, 'Alone likely decide phone artist short tree. Season help market dream.', 'similar', 'similar_image.jpg', 'similar Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (12, 7, 187, 'Various relate east different plan bar interest. Between discussion positive I change over.', 'wall', 'wall_image.jpg', 'wall Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (41, 8, 308, 'Program camera positive consumer. Result door laugh lay there loss watch.', 'old', 'old_image.jpg', 'old Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (20, 6, 622, 'Owner million raise account time Democrat help. Kid we sound dream society turn behavior phone.', 'position', 'position_image.jpg', 'position Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (45, 2, 170, 'Night threat tough employee more deal. Well real under camera. Sort reflect appear.', 'different', 'different_image.jpg', 'different Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (12, 3, 685, 'Fire evening despite. Rather visit tax figure benefit.', 'want', 'want_image.jpg', 'want Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (12, 2, 543, 'Forget forget nice. Office way unit sport seat. Democrat scene medical form well grow really.', 'sound', 'sound_image.jpg', 'sound Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (40, 5, 358, 'Us church home either spend. Wide nation answer financial.', 'live', 'live_image.jpg', 'live Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (25, 5, 292, 'Result sort couple appear back create. Beyond take church road three company.', 'call', 'call_image.jpg', 'call Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (41, 5, 930, 'Drop hold specific upon maybe century. History player take sense seek us.', 'pull', 'pull_image.jpg', 'pull Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (29, 3, 674, 'Similar range mouth go yourself. Develop dark chance. Huge some direction walk exist.', 'many', 'many_image.jpg', 'many Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (19, 1, 764, 'When why the both speech. Say toward there very. Near maybe reason conference themselves.', 'it', 'it_image.jpg', 'it Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (43, 2, 447, 'Room difficult similar. Wide they however two.', 'myself', 'myself_image.jpg', 'myself Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (8, 10, 772, 'Turn sometimes meet talk around. Different program response respond.', 'design', 'design_image.jpg', 'design Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (1, 9, 328, 'Name agreement treatment fine. Ball figure blood cost carry father strategy.', 'perhaps', 'perhaps_image.jpg', 'perhaps Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (2, 6, 606, 'Apply as mention believe read effect address. Eye shoulder series drug home position.', 'pick', 'pick_image.jpg', 'pick Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (22, 4, 950, 'Poor participant business difference. Manage decision option.', 'affect', 'affect_image.jpg', 'affect Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (22, 3, 530, 'Election without statement arrive senior agent seat society.', 'animal', 'animal_image.jpg', 'animal Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (22, 9, 525, 'College change scientist. Weight cover method describe. Exactly water avoid.', 'foot', 'foot_image.jpg', 'foot Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (35, 3, 985, 'Forget key manage listen receive leave seat. Nice public nearly career but edge.', 'stock', 'stock_image.jpg', 'stock Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (7, 6, 198, 'Green page around very ahead Mr treat pay. Control nor how audience film remember.', 'whatever', 'whatever_image.jpg', 'whatever Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (4, 10, 398, 'Spend true five himself hair attack hospital top. Result car crime.', 'forget', 'forget_image.jpg', 'forget Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (24, 4, 669, 'Very she job down. Card instead notice beautiful approach. Simply ever together bank.', 'listen', 'listen_image.jpg', 'listen Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (9, 7, 676, 'Care become million. Above computer him. Price participant only lay drug.', 'purpose', 'purpose_image.jpg', 'purpose Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (29, 1, 956, 'Town film technology. Throw seat research training turn he. Best billion energy argue baby.', 'morning', 'morning_image.jpg', 'morning Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (39, 5, 717, 'Become fast song church cell music weight. Beyond cause word force responsibility letter hospital.', 'wish', 'wish_image.jpg', 'wish Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (30, 9, 783, 'Here off then choose industry where soon partner.', 'peace', 'peace_image.jpg', 'peace Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (39, 4, 899, 'Thank director life. Game subject forward century matter push allow executive. Seek make per.', 'the', 'the_image.jpg', 'the Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (12, 4, 526, 'Society here mouth door music. Next if can. Especially student manage white only.', 'simple', 'simple_image.jpg', 'simple Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (45, 7, 435, 'Point south write any painting. Live fine popular sense too. Treat arrive again.', 'according', 'according_image.jpg', 'according Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (21, 9, 31, 'Speak school tax health. Break cultural police same. Increase team imagine seek.', 'mean', 'mean_image.jpg', 'mean Product', 'none');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (33, 8, 787, 'Energy change game.
Power hot available meet pay protect. Participant civil nature another yet.', 'end', 'end_image.jpg', 'end Product', 'ok');
INSERT INTO [dbo].[product] ([fk_business_id], [fk_category_id], [price], [description], [eng_name], [image], [name], [status]) VALUES (41, 8, 35, 'Wife class court truth building. Door talk meeting oil start.', 'century', 'century_image.jpg', 'century Product', 'none');
--17.Revenue
/*==========================================================================*/
INSERT INTO revenue VALUES (1, 21039, '2023-07-01');
INSERT INTO revenue VALUES (2, 48924, '2023-07-02');
INSERT INTO revenue VALUES (3, 35830, '2023-07-03');
INSERT INTO revenue VALUES (4, 33888, '2023-07-04');
INSERT INTO revenue VALUES (5, 22850, '2023-07-05');
INSERT INTO revenue VALUES (6, 40750, '2023-07-06');
INSERT INTO revenue VALUES (7, 22827, '2023-07-07');
INSERT INTO revenue VALUES (8, 30463, '2023-07-08');
INSERT INTO revenue VALUES (9, 19410, '2023-07-09');
INSERT INTO revenue VALUES (10, 26426, '2023-07-10');
INSERT INTO revenue VALUES (11, 21386, '2023-07-11');
INSERT INTO revenue VALUES (12, 30682, '2023-07-12');
INSERT INTO revenue VALUES (13, 24806, '2023-07-13');
INSERT INTO revenue VALUES (14, 47955, '2023-07-14');
INSERT INTO revenue VALUES (15, 25243, '2023-07-15');
INSERT INTO revenue VALUES (16, 38910, '2023-07-16');
INSERT INTO revenue VALUES (17, 45538, '2023-07-17');
INSERT INTO revenue VALUES (18, 14451, '2023-07-18');
INSERT INTO revenue VALUES (19, 11028, '2023-07-19');
INSERT INTO revenue VALUES (20, 31543, '2023-07-20');
INSERT INTO revenue VALUES (21, 41366, '2023-07-21');
INSERT INTO revenue VALUES (22, 25278, '2023-07-22');
INSERT INTO revenue VALUES (23, 40765, '2023-07-23');
INSERT INTO revenue VALUES (24, 41648, '2023-07-24');
INSERT INTO revenue VALUES (25, 37019, '2023-07-25');
INSERT INTO revenue VALUES (26, 36408, '2023-07-26');
INSERT INTO revenue VALUES (27, 19324, '2023-07-27');
INSERT INTO revenue VALUES (28, 40618, '2023-07-28');
INSERT INTO revenue VALUES (29, 9275, '2023-07-29');
INSERT INTO revenue VALUES (30, 19582, '2023-07-30');
INSERT INTO revenue VALUES (31, 27310, '2023-07-31');
INSERT INTO revenue VALUES (32, 39736, '2023-08-01');
INSERT INTO revenue VALUES (33, 45641, '2023-08-02');
INSERT INTO revenue VALUES (34, 42243, '2023-08-03');
INSERT INTO revenue VALUES (35, 22166, '2023-08-04');
INSERT INTO revenue VALUES (36, 27111, '2023-08-05');
INSERT INTO revenue VALUES (37, 15207, '2023-08-06');
INSERT INTO revenue VALUES (38, 28902, '2023-08-07');
INSERT INTO revenue VALUES (39, 22853, '2023-08-08');
INSERT INTO revenue VALUES (40, 43864, '2023-08-09');
INSERT INTO revenue VALUES (41, 15964, '2023-08-10');
INSERT INTO revenue VALUES (42, 43990, '2023-08-11');
INSERT INTO revenue VALUES (43, 48121, '2023-08-12');
INSERT INTO revenue VALUES (44, 42370, '2023-08-13');
INSERT INTO revenue VALUES (45, 10116, '2023-08-14');
INSERT INTO revenue VALUES (46, 12313, '2023-08-15');
INSERT INTO revenue VALUES (47, 15656, '2023-08-16');
INSERT INTO revenue VALUES (48, 12202, '2023-08-17');
INSERT INTO revenue VALUES (49, 14095, '2023-08-18');
INSERT INTO revenue VALUES (50, 15797, '2023-08-19');
INSERT INTO revenue VALUES (51, 25935, '2023-08-20');
INSERT INTO revenue VALUES (52, 12932, '2023-08-21');
INSERT INTO revenue VALUES (53, 38878, '2023-08-22');
INSERT INTO revenue VALUES (54, 44961, '2023-08-23');
INSERT INTO revenue VALUES (55, 10774, '2023-08-24');
INSERT INTO revenue VALUES (56, 21330, '2023-08-25');
INSERT INTO revenue VALUES (57, 19382, '2023-08-26');
INSERT INTO revenue VALUES (58, 32912, '2023-08-27');
INSERT INTO revenue VALUES (59, 9559, '2023-08-28');
INSERT INTO revenue VALUES (60, 33529, '2023-08-29');
INSERT INTO revenue VALUES (61, 23546, '2023-08-30');
INSERT INTO revenue VALUES (62, 19582, '2023-08-31');
INSERT INTO revenue VALUES (63, 47002, '2023-09-01');
INSERT INTO revenue VALUES (64, 30491, '2023-09-02');
INSERT INTO revenue VALUES (65, 31351, '2023-09-03');
INSERT INTO revenue VALUES (66, 23648, '2023-09-04');
INSERT INTO revenue VALUES (67, 35246, '2023-09-05');
INSERT INTO revenue VALUES (68, 46503, '2023-09-06');
INSERT INTO revenue VALUES (69, 13143, '2023-09-07');
INSERT INTO revenue VALUES (70, 11496, '2023-09-08');
INSERT INTO revenue VALUES (71, 21896, '2023-09-09');
INSERT INTO revenue VALUES (72, 41928, '2023-09-10');
INSERT INTO revenue VALUES (73, 27862, '2023-09-11');
INSERT INTO revenue VALUES (74, 49727, '2023-09-12');
INSERT INTO revenue VALUES (75, 13382, '2023-09-13');
INSERT INTO revenue VALUES (76, 47560, '2023-09-14');
INSERT INTO revenue VALUES (77, 42387, '2023-09-15');
INSERT INTO revenue VALUES (78, 44990, '2023-09-16');
INSERT INTO revenue VALUES (79, 25272, '2023-09-17');
INSERT INTO revenue VALUES (80, 27415, '2023-09-18');
INSERT INTO revenue VALUES (81, 14024, '2023-09-19');
INSERT INTO revenue VALUES (82, 45368, '2023-09-20');
INSERT INTO revenue VALUES (83, 21873, '2023-09-21');
INSERT INTO revenue VALUES (84, 44688, '2023-09-22');
INSERT INTO revenue VALUES (85, 22509, '2023-09-23');
INSERT INTO revenue VALUES (86, 35922, '2023-09-24');
INSERT INTO revenue VALUES (87, 26901, '2023-09-25');
INSERT INTO revenue VALUES (88, 12932, '2023-09-26');
INSERT INTO revenue VALUES (89, 28739, '2023-09-27');
INSERT INTO revenue VALUES (90, 29313, '2023-09-28');
INSERT INTO revenue VALUES (91, 45314, '2023-09-29');
INSERT INTO revenue VALUES (92, 45509, '2023-09-30');
INSERT INTO revenue VALUES (93, 21698, '2023-10-01');
INSERT INTO revenue VALUES (94, 26944, '2023-10-02');
INSERT INTO revenue VALUES (95, 36318, '2023-10-03');
INSERT INTO revenue VALUES (96, 39157, '2023-10-04');
INSERT INTO revenue VALUES (97, 45876, '2023-10-05');
INSERT INTO revenue VALUES (98, 39328, '2023-10-06');
INSERT INTO revenue VALUES (99, 28406, '2023-10-07');
INSERT INTO revenue VALUES (100, 17992, '2023-10-08');
INSERT INTO revenue VALUES (101, 15748, '2023-10-09');
INSERT INTO revenue VALUES (102, 14524, '2023-10-10');
INSERT INTO revenue VALUES (103, 14480, '2023-10-11');
INSERT INTO revenue VALUES (104, 40776, '2023-10-12');
INSERT INTO revenue VALUES (105, 15561, '2023-10-13');
INSERT INTO revenue VALUES (106, 40921, '2023-10-14');
INSERT INTO revenue VALUES (107, 19157, '2023-10-15');
INSERT INTO revenue VALUES (108, 32258, '2023-10-16');
INSERT INTO revenue VALUES (109, 19271, '2023-10-17');
INSERT INTO revenue VALUES (110, 36660, '2023-10-18');
INSERT INTO revenue VALUES (111, 29445, '2023-10-19');
INSERT INTO revenue VALUES (112, 48345, '2023-10-20');
INSERT INTO revenue VALUES (113, 22698, '2023-10-21');
INSERT INTO revenue VALUES (114, 41782, '2023-10-22');
INSERT INTO revenue VALUES (115, 34739, '2023-10-23');
INSERT INTO revenue VALUES (116, 49773, '2023-10-24');
INSERT INTO revenue VALUES (117, 27838, '2023-10-25');
INSERT INTO revenue VALUES (118, 46405, '2023-10-26');
INSERT INTO revenue VALUES (119, 45122, '2023-10-27');
INSERT INTO revenue VALUES (120, 31901, '2023-10-28');
INSERT INTO revenue VALUES (121, 36071, '2023-10-29');
INSERT INTO revenue VALUES (122, 19061, '2023-10-30');
INSERT INTO revenue VALUES (123, 40752, '2023-10-31');
INSERT INTO revenue VALUES (124, 32201, '2023-11-01');
INSERT INTO revenue VALUES (125, 15296, '2023-11-02');
INSERT INTO revenue VALUES (126, 26034, '2023-11-03');
INSERT INTO revenue VALUES (127, 41284, '2023-11-04');
INSERT INTO revenue VALUES (128, 25109, '2023-11-05');
INSERT INTO revenue VALUES (129, 30904, '2023-11-06');
INSERT INTO revenue VALUES (130, 18989, '2023-11-07');
INSERT INTO revenue VALUES (131, 43446, '2023-11-08');
INSERT INTO revenue VALUES (132, 21180, '2023-11-09');
INSERT INTO revenue VALUES (133, 41777, '2023-11-10');
INSERT INTO revenue VALUES (134, 36355, '2023-11-11');
INSERT INTO revenue VALUES (135, 30609, '2023-11-12');
INSERT INTO revenue VALUES (136, 17180, '2023-11-13');
INSERT INTO revenue VALUES (137, 23575, '2023-11-14');
INSERT INTO revenue VALUES (138, 40082, '2023-11-15');
INSERT INTO revenue VALUES (139, 35121, '2023-11-16');
INSERT INTO revenue VALUES (140, 41629, '2023-11-17');
INSERT INTO revenue VALUES (141, 35736, '2023-11-18');
INSERT INTO revenue VALUES (142, 24037, '2023-11-19');
INSERT INTO revenue VALUES (143, 42493, '2023-11-20');
INSERT INTO revenue VALUES (144, 46372, '2023-11-21');
INSERT INTO revenue VALUES (145, 17091, '2023-11-22');
INSERT INTO revenue VALUES (146, 23017, '2023-11-23');
INSERT INTO revenue VALUES (147, 15642, '2023-11-24');
INSERT INTO revenue VALUES (148, 47191, '2023-11-25');
INSERT INTO revenue VALUES (149, 38150, '2023-11-26');
INSERT INTO revenue VALUES (150, 36060, '2023-11-27');
INSERT INTO revenue VALUES (151, 27306, '2023-11-28');
INSERT INTO revenue VALUES (152, 21687, '2023-11-29');
INSERT INTO revenue VALUES (153, 43513, '2023-11-30');
INSERT INTO revenue VALUES (154, 45180, '2023-12-01');
INSERT INTO revenue VALUES (155, 36057, '2023-12-02');
INSERT INTO revenue VALUES (156, 36943, '2023-12-03');
INSERT INTO revenue VALUES (157, 27365, '2023-12-04');
INSERT INTO revenue VALUES (158, 40845, '2023-12-05');
INSERT INTO revenue VALUES (159, 36465, '2023-12-06');
INSERT INTO revenue VALUES (160, 15235, '2023-12-07');
INSERT INTO revenue VALUES (161, 37794, '2023-12-08');
INSERT INTO revenue VALUES (162, 44571, '2023-12-09');
INSERT INTO revenue VALUES (163, 16835, '2023-12-10');
INSERT INTO revenue VALUES (164, 45913, '2023-12-11');
INSERT INTO revenue VALUES (165, 19204, '2023-12-12');
INSERT INTO revenue VALUES (166, 16268, '2023-12-13');
INSERT INTO revenue VALUES (167, 13378, '2023-12-14');
INSERT INTO revenue VALUES (168, 43599, '2023-12-15');
INSERT INTO revenue VALUES (169, 31618, '2023-12-16');
INSERT INTO revenue VALUES (170, 37446, '2023-12-17');
INSERT INTO revenue VALUES (171, 9809, '2023-12-18');
INSERT INTO revenue VALUES (172, 31307, '2023-12-19');
INSERT INTO revenue VALUES (173, 37502, '2023-12-20');
INSERT INTO revenue VALUES (174, 36461, '2023-12-21');
INSERT INTO revenue VALUES (175, 40972, '2023-12-22');
INSERT INTO revenue VALUES (176, 15147, '2023-12-23');
INSERT INTO revenue VALUES (177, 40360, '2023-12-24');
INSERT INTO revenue VALUES (178, 41440, '2023-12-25');
INSERT INTO revenue VALUES (179, 9041, '2023-12-26');
INSERT INTO revenue VALUES (180, 23347, '2023-12-27');
INSERT INTO revenue VALUES (181, 22339, '2023-12-28');
INSERT INTO revenue VALUES (182, 48935, '2023-12-29');
INSERT INTO revenue VALUES (183, 34576, '2023-12-30');
INSERT INTO revenue VALUES (184, 40177, '2023-12-31');
INSERT INTO revenue VALUES (185, 30118, '2024-01-01');
INSERT INTO revenue VALUES (186, 46685, '2024-01-02');
INSERT INTO revenue VALUES (187, 30784, '2024-01-03');
INSERT INTO revenue VALUES (188, 43308, '2024-01-04');
INSERT INTO revenue VALUES (189, 12953, '2024-01-05');
INSERT INTO revenue VALUES (190, 19911, '2024-01-06');
INSERT INTO revenue VALUES (191, 44782, '2024-01-07');
INSERT INTO revenue VALUES (192, 38654, '2024-01-08');
INSERT INTO revenue VALUES (193, 16395, '2024-01-09');
INSERT INTO revenue VALUES (194, 49182, '2024-01-10');
INSERT INTO revenue VALUES (195, 13326, '2024-01-11');
INSERT INTO revenue VALUES (196, 43612, '2024-01-12');
INSERT INTO revenue VALUES (197, 42857, '2024-01-13');
INSERT INTO revenue VALUES (198, 17293, '2024-01-14');
INSERT INTO revenue VALUES (199, 31094, '2024-01-15');
INSERT INTO revenue VALUES (200, 28627, '2024-01-16');
INSERT INTO revenue VALUES (201, 36618, '2024-01-17');
INSERT INTO revenue VALUES (202, 14984, '2024-01-18');
INSERT INTO revenue VALUES (203, 43652, '2024-01-19');
INSERT INTO revenue VALUES (204, 48098, '2024-01-20');
INSERT INTO revenue VALUES (205, 16178, '2024-01-21');
INSERT INTO revenue VALUES (206, 14443, '2024-01-22');
INSERT INTO revenue VALUES (207, 21399, '2024-01-23');
INSERT INTO revenue VALUES (208, 20978, '2024-01-24');
INSERT INTO revenue VALUES (209, 36224, '2024-01-25');
INSERT INTO revenue VALUES (210, 21108, '2024-01-26');
INSERT INTO revenue VALUES (211, 35000, '2024-01-27');
INSERT INTO revenue VALUES (212, 17772, '2024-01-28');
INSERT INTO revenue VALUES (213, 40036, '2024-01-29');
INSERT INTO revenue VALUES (214, 35322, '2024-01-30');
INSERT INTO revenue VALUES (215, 24016, '2024-01-31');
INSERT INTO revenue VALUES (216, 47219, '2024-02-01');
INSERT INTO revenue VALUES (217, 23754, '2024-02-02');
INSERT INTO revenue VALUES (218, 36111, '2024-02-03');
INSERT INTO revenue VALUES (219, 24487, '2024-02-04');
INSERT INTO revenue VALUES (220, 9622, '2024-02-05');
INSERT INTO revenue VALUES (221, 17915, '2024-02-06');
INSERT INTO revenue VALUES (222, 9666, '2024-02-07');
INSERT INTO revenue VALUES (223, 44792, '2024-02-08');
INSERT INTO revenue VALUES (224, 15558, '2024-02-09');
INSERT INTO revenue VALUES (225, 18515, '2024-02-10');
INSERT INTO revenue VALUES (226, 45157, '2024-02-11');
INSERT INTO revenue VALUES (227, 42925, '2024-02-12');
INSERT INTO revenue VALUES (228, 47426, '2024-02-13');
INSERT INTO revenue VALUES (229, 18266, '2024-02-14');
INSERT INTO revenue VALUES (230, 24779, '2024-02-15');
INSERT INTO revenue VALUES (231, 44560, '2024-02-16');
INSERT INTO revenue VALUES (232, 22175, '2024-02-17');
INSERT INTO revenue VALUES (233, 30976, '2024-02-18');
INSERT INTO revenue VALUES (234, 28242, '2024-02-19');
INSERT INTO revenue VALUES (235, 47603, '2024-02-20');
INSERT INTO revenue VALUES (236, 33116, '2024-02-21');
INSERT INTO revenue VALUES (237, 25098, '2024-02-22');
INSERT INTO revenue VALUES (238, 24037, '2024-02-23');
INSERT INTO revenue VALUES (239, 26458, '2024-02-24');
INSERT INTO revenue VALUES (240, 40952, '2024-02-25');
INSERT INTO revenue VALUES (241, 47786, '2024-02-26');
INSERT INTO revenue VALUES (242, 22112, '2024-02-27');
INSERT INTO revenue VALUES (243, 14449, '2024-02-28');
--18.Sales
/*==========================================================================*/
INSERT INTO [dbo].[sales] ([fk_category_id], [end_date], [start_date], [discount]) VALUES (1, '2024-01-01', '2024-02-28', '20');