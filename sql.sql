create table admin_info
(
    admin_id int primary key auto_increment,
    admin_username varchar(50) not null,
    admin_password varchar(20) not null,
    admin_idcard varchar(20) not null
);

create table customer_info
(
    customer_id int primary key auto_increment,
    customer_username varchar(50) not null,
    customer_name varchar(50) not null ,
    customer_password varchar(50) not null ,
    customer_gender char(1) not null ,
    customer_phone varchar(20) not null ,
    customer_idcard varchar(50) not null ,
    customer_adress varchar(200) null ,
    customer_email varchar(20) null
);

create table book_category
(
    category_id int primary key auto_increment,
    category_name varchar(50) not null
);

create table book_info
(
    book_id int primary key auto_increment,
    book_name varchar(50) not null ,
    book_category_id int not null ,
    book_descript varchar(200) not null ,
    book_author varchar(20) not null ,
    book_press varchar(50) not null ,
    book_pic_url varchar(200) ,
    book_date datetime ,
    book_price decimal not null,
    foreign key(book_category_id) references book_category (category_id)
);

create table order_master
(
    order_id int primary key auto_increment,
    order_sn varchar(200) not null ,
    order_customer_id int not null ,
    order_customer_name varchar(20) not null ,
    order_customer_phone varchar(20) not null ,
    order_customer_address varchar(20) not null ,
    order_money decimal not null ,
    order_payment_money decimal not null ,
    order_create_time datetime not null ,
    order_status int not null ,
    order_modified_time datetime not null ,
    foreign key(order_customer_id) references customer_info(customer_id)
);

create table order_detail
(
    detail_id int primary key auto_increment,
    detail_order_id int not null ,
    detail_book_name varchar(20) not null ,
    detail_book_cnt int not null ,
    detail_book_price decimal not null ,
    detail_book_totail decimal not null,
    foreign key(detail_order_id) references order_master (order_id)
);

create table cart
(
    cart_id int primary key auto_increment,
    cart_customer_id int not null ,
    cart_book_name varchar(20),
    cart_book_cnt int,
    cart_book_price decimal,
    cart_create_time datetime,
    cart_modified_time datetime,
    foreign key(cart_customer_id) references customer_info(customer_id)
);

insert into book_category(category_name)
values ('教育'),('科技'),('都市言情'),('工具书'),('文艺');

insert into book_info(book_name, book_category_id, book_descript, book_author, book_press, book_pic_url, book_date, book_price)
values ('经济学',1,'计量经济学导论','杰弗里·M·伍德里奇','中国人民大学出版社','/static/images/book/jingjixue.jpg','2018-09-01',73.90),
       ('心理学',1,'它既是心理学专业的基础课教材，也是相关专业和心理学爱好者的入门教材，还是部分高校招收心理学博、硕士研究生的重要参考教材','彭聃龄','北京师范大学出版社','/static/images/book/xinglixue.jpg','2019-01-01',58.30),
       ('西方经济学',1,'21世纪经济学系列教材','高鸿业','中国人民大学出版社','/static/images/book/xifangjingjixue.jpg','2008-01-01',33.50),
       ('经济学原理',1,'《经济学原理》是一套享誉全球的经济学经典教科书','[美]曼昆','北京大学出版社','/static/images/book/jingjixueyuanli.jpg','2015-05-01',272.80),
       ('算法导论',1,'MIT四大名师联手铸就，被誉为 计算机算法的圣经 ！全球1000余所大学作为教材或教学参考书使用','科尔曼','机械工业出版社','/static/images/book/suanfadaolun.jpg','2013-01-01',93.40),
       ('高等数学',1,'高等数学课程包括微积分、微分方程、向量代数与空间解析几何、无穷级数等内容','同济大学数学系','高等教育出版社','/static/images/book/gaodengshuxue.jpg','2014-07-01',33.20),
       ('生理学',1,'十三五本科规划教材临床医学第九轮五年制','王庭愧','人民卫生出版社','/static/images/book/shenglixue.jpg','2018-08-21',63.80),
       ('社会心理学',1,'一本可以读透的心里学','候玉波','北京大学出版社','/static/images/book/shehuixinglixue.jpg','2018-08-02',39.10),
       ('平行宇宙',2,'科学可以这样看:读懂这本书，了解引力波，星球大战必读 ','加来道雄','重庆出版社','/static/images/book/pingxingyuzhou.jpg','2014-05-05',34.60),
       ('时间简史',2,'时间只留简史 世间再无霍金 ','史蒂芬·霍金','湖南科技出版社','/static/images/book/shijianjianshi.jpg','2014-06-09',32.40),
       ('校花的贴身高手8',2,'一本好书8','鱼人二代8','人民教育出版社8',null,'2008-09-09',56.00),
       ('校花的贴身高手9',3,'一本好书9','鱼人二代9','人民教育出版社9',null,'2009-09-09',324.00),
       ('校花的贴身高手10',4,'一本好书10','鱼人二代10','人民教育出版社10',null,'2010-09-09',24.00),
       ('校花的贴身高手11',4,'一本好书11','鱼人二代11','人民教育出版社11',null,'2011-09-09',234.00),
       ('校花的贴身高手12',4,'一本好书12','鱼人二代12','人民教育出版社12',null,'2012-09-09',56.00),
       ('愿所有相遇，都恰逢',5,'随书附赠：精美书签。一切都是*好的安排，结束的，已然结束；相逢的，终将遇见，不早不晚','DTT','浙江文艺出版社','/static/images/book/yuansuoyouxiangyudouqiafeng.jpg','2017-10-09',19.90),
       ('三毛典藏全集',5,'集结十四部传世经典 三十年写作成果全新呈现','三毛','北京十月文艺出版社','/static/images/book/sanmaodiancangquanji.jpg','2017-04-09',240.00),
       ('皮囊',5,'刘德华、韩寒、白岩松感动推荐。2019全新升级，书封采用具有肌肤质感的SKINS纸。命运是一条闪闪发光的金色河流，我们彼此相遇，卸下皮囊，以心相交。果麦出品','蔡崇达','天津人民出版社','/static/images/book/pinang.jpg','2019-05-09',46.30),
       ('此刻的温柔',5,'陶立夏全新散文集，继现象级畅销书《分开旅行》《练习一个人》后又一重磅力作。当你明白无论身处何方做何决定皆有桎梏，才会懂得：不怨不悔，就是自由，也是我们给予自己的温柔','陶立夏','浙江文艺出版社','/static/images/book/cikedewenrou.jpg','2019-08-09',49.80);

insert into customer_info(customer_username, customer_name, customer_password, customer_gender, customer_phone, customer_idcard, customer_adress, customer_email)
values ('清淡欢颜','杰宝','123','男','12388746637','22938744857784','江西省吉安市','928937487@qq.com'),
       ('云淡风轻','肥龙','666','男','12388742337','22939987857784','广东省珠海市','998764338@qq.com'),
       ('陈冠希','曹','444','女','12309876637','22999805623784','湖南省耒阳市','338474663@qq.com'),
        ('test','张三','777','男','12309876337','22999009157784','北京东城','330092663@qq.com'),
       ('test1','李四','888','女','12398234637','22999981857784','湖南省耒阳市','338873663@qq.com');