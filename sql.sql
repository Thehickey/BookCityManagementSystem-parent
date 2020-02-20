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
values ('����'),('�Ƽ�'),('��������'),('������'),('����');

insert into book_info(book_name, book_category_id, book_descript, book_author, book_press, book_pic_url, book_date, book_price)
values ('����ѧ',1,'��������ѧ����','�ܸ��M���������','�й������ѧ������','/static/images/book/jingjixue.jpg','2018-09-01',73.90),
       ('����ѧ',1,'����������ѧרҵ�Ļ����ν̲ģ�Ҳ�����רҵ������ѧ�����ߵ����Ž̲ģ����ǲ��ָ�У��������ѧ����˶ʿ�о�������Ҫ�ο��̲�','������','����ʦ����ѧ������','/static/images/book/xinglixue.jpg','2019-01-01',58.30),
       ('��������ѧ',1,'21���;���ѧϵ�н̲�','�ߺ�ҵ','�й������ѧ������','/static/images/book/xifangjingjixue.jpg','2008-01-01',33.50),
       ('����ѧԭ��',1,'������ѧԭ����һ������ȫ��ľ���ѧ����̿���','[��]����','������ѧ������','/static/images/book/jingjixueyuanli.jpg','2015-05-01',272.80),
       ('�㷨����',1,'MIT�Ĵ���ʦ�������ͣ�����Ϊ ������㷨��ʥ�� ��ȫ��1000������ѧ��Ϊ�̲Ļ��ѧ�ο���ʹ��','�ƶ���','��е��ҵ������','/static/images/book/suanfadaolun.jpg','2013-01-01',93.40),
       ('�ߵ���ѧ',1,'�ߵ���ѧ�γ̰���΢���֡�΢�ַ��̡�����������ռ�������Ρ������������','ͬ�ô�ѧ��ѧϵ','�ߵȽ���������','/static/images/book/gaodengshuxue.jpg','2014-07-01',33.20),
       ('����ѧ',1,'ʮ���屾�ƹ滮�̲��ٴ�ҽѧ�ھ���������','��ͥ��','��������������','/static/images/book/shenglixue.jpg','2018-08-21',63.80),
       ('�������ѧ',1,'һ�����Զ�͸������ѧ','����','������ѧ������','/static/images/book/shehuixinglixue.jpg','2018-08-02',39.10),
       ('ƽ������',2,'��ѧ����������:�����Ȿ�飬�˽��������������ս�ض� ','��������','���������','/static/images/book/pingxingyuzhou.jpg','2014-05-05',34.60),
       ('ʱ���ʷ',2,'ʱ��ֻ����ʷ �������޻��� ','ʷ�ٷҡ�����','���ϿƼ�������','/static/images/book/shijianjianshi.jpg','2014-06-09',32.40),
       ('У�����������8',2,'һ������8','���˶���8','�������������8',null,'2008-09-09',56.00),
       ('У�����������9',3,'һ������9','���˶���9','�������������9',null,'2009-09-09',324.00),
       ('У�����������10',4,'һ������10','���˶���10','�������������10',null,'2010-09-09',24.00),
       ('У�����������11',4,'һ������11','���˶���11','�������������11',null,'2011-09-09',234.00),
       ('У�����������12',4,'һ������12','���˶���12','�������������12',null,'2012-09-09',56.00),
       ('Ը������������ǡ��',5,'���鸽����������ǩ��һ�ж���*�õİ��ţ������ģ���Ȼ���������ģ��ս����������粻��','DTT','�㽭���ճ�����','/static/images/book/yuansuoyouxiangyudouqiafeng.jpg','2017-10-09',19.90),
       ('��ë���ȫ��',5,'����ʮ�Ĳ��������� ��ʮ��д���ɹ�ȫ�³���','��ë','����ʮ�����ճ�����','/static/images/book/sanmaodiancangquanji.jpg','2017-04-09',240.00),
       ('Ƥ��',5,'���»��������������ɸж��Ƽ���2019ȫ�������������þ��м����ʸе�SKINSֽ��������һ����������Ľ�ɫ���������Ǳ˴�������ж��Ƥ�ң������ཻ�������Ʒ','�̳��','������������','/static/images/book/pinang.jpg','2019-05-09',46.30),
       ('�˿̵�����',5,'������ȫ��ɢ�ļ��������󼶳����顶�ֿ����С�����ϰһ���ˡ�����һ�ذ����������������������η����ξ��������������Żᶮ�ã���Թ���ڣ��������ɣ�Ҳ�����Ǹ����Լ�������','������','�㽭���ճ�����','/static/images/book/cikedewenrou.jpg','2019-08-09',49.80);

insert into customer_info(customer_username, customer_name, customer_password, customer_gender, customer_phone, customer_idcard, customer_adress, customer_email)
values ('�嵭����','�ܱ�','123','��','12388746637','22938744857784','����ʡ������','928937487@qq.com'),
       ('�Ƶ�����','����','666','��','12388742337','22939987857784','�㶫ʡ�麣��','998764338@qq.com'),
       ('�¹�ϣ','��','444','Ů','12309876637','22999805623784','����ʡ������','338474663@qq.com'),
        ('test','����','777','��','12309876337','22999009157784','��������','330092663@qq.com'),
       ('test1','����','888','Ů','12398234637','22999981857784','����ʡ������','338873663@qq.com');