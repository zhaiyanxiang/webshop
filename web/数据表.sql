--创建数据表php41_goods商品表
create table php41_goods(
    goods_id mediumint unsigned not null  auto_increment comment '主键',
    goods_name varchar(32) not null comment '商品名称',
    goods_price decimal(10,2) not null default 0 comment '市场价格',
    goods_shop_price decimal(10,2) not null default 0 comment '本店价格',
    goods_number smallint not null default 1 comment '商品数量',
    goods_weight smallint not null default 0 comment '商品重量',
    cat_id mediumint not null default 0 comment '商品分类',
    brand_id mediumint not null default 0 comment '商品品牌',
    goods_big_logo char(100) not null default '' comment '商品大图片',
    goods_small_logo char(100) not null default '' comment '商品缩略图',
    goods_introduce text comment '商品介绍',
    is_sale enum('上架','下架') not null default '上架' comment '上架，下架',
    is_rec enum('推荐','不推荐') not null default '不推荐' comment '推荐与否',
    is_hot enum('热销','不热销') not null default '不热销' comment '热销与否',
    is_new enum('新品','不新品') not null default '不新品' comment '新品与否',
    add_time int not null comment '添加信息时间',
    upd_time int not null comment '修改信息时间',
    is_del enum('删除','不删除') not null default '不删除' comment '删除与否',
    primary key (goods_id),
    unique key (goods_name),
    key (goods_shop_price),
    key (goods_price),
    key (cat_id),
    key (brand_id),
    key (add_time)
)engine=Innodb charset=utf8;

--增加一个type_id字段，用于存储商品对应类型
alter table php41_goods add type_id smallint unsigned not null  default 0  comment '类型id' after brand_id;

--增加一个"抢购"字段，用于网站首页抢购设置
alter table php41_goods add is_qiang enum('不抢','抢') not null default '不抢' comment '是否抢购' after is_sale;

-- "商品-(多对多)-属性"" 中间联系表
create table php41_goods_attr(
    id mediumint unsigned not null auto_increment comment '主键id',
    goods_id mediumint unsigned not null comment '商品id',
    attr_id mediumint unsigned not null comment '属性id',
    attr_value varchar(64) not null default '' comment '属性对应的值',
    primary key (id),
    key (goods_id),
    key (attr_id)
)engine=Myisam charset=utf8 comment '商品-属性关联表';

--删除索引
alter table php41_goods drop key goods_name;
--修改字段长度为256字节
alter table php41_goods modify goods_name varchar(256) not null  comment '商品名称';

--垂直分表，把“相册”的相关字段通过“独立的表”进行存储
create table php41_goods_pics(
    id int unsigned not null auto_increment comment '主键',
    goods_id mediumint unsigned not null  comment '商品id',
    pics_big char(100) not null comment '相册原图',
    pics_small char(100) not null comment '相册缩略图',
    primary key (id)
)engine=Myisam charset=utf8 comment '商品相册表';

--"类型"数据表
create table php41_type(
    type_id smallint unsigned not null auto_increment comment '主键id',
    type_name varchar(32) not null  comment '类型名称',
    primary key (type_id)
)engine=Myisam charset=utf8 comment '商品类型表';

--"属性"数据表
create table php41_attribute(
    attr_id int unsigned not null auto_increment comment '主键id',
    attr_name varchar(32) not null  comment '属性名称',
    type_id smallint unsigned not null comment '对应类型id',
    attr_is_sel tinyint not null default 0 comment '0:唯一 1:多选',
    attr_write_mod  tinyint not null default 0 comment '0:手工  1:下拉列表选择',
    attr_sel_opt  varchar(100) not null default '' comment '多选情况被选取的项目信息，多个值彼此使用,逗号分隔',
    primary key (attr_id),
    key (type_id)
)engine=Myisam charset=utf8 comment '商品属性表';


--"分类"数据表
drop table if exists php41_category;
create table php41_category(
    cat_id smallint unsigned not null auto_increment comment '主键id',
    cat_name varchar(32) not null  comment '分类名称',
    cat_pid smallint  unsigned not null default 0 comment '上级id', 
    cat_path varchar(32) not null default '' comment '全路径',
    cat_level tinyint not null default 0 comment '等级',
    primary key (cat_id),
    key (cat_pid)
)engine=Myisam charset=utf8 comment '商品分类表';


-- "商品-(多对多)-分类"" 中间联系表
drop table if exists php41_goods_cat;
create table php41_goods_cat(
    id mediumint unsigned not null auto_increment comment '主键id',
    goods_id mediumint unsigned not null comment '商品id',
    cat_id mediumint unsigned not null comment '分类id',
    primary key (id),
    key (goods_id),
    key (cat_id)
)engine=Myisam charset=utf8 comment '商品-分类，关联表';


--会员表
drop table if exists php41_user;
create table php41_user(
    user_id mediumint unsigned not null auto_increment comment '主键id',
    user_name  varchar(32) not null comment '会员名称',
    user_email varchar(64) not null default '' comment '邮箱',
    user_pwd char(32) not null comment '密码',
    user_sex enum('男','女','保密') not null default '男' comment '性别',
    user_weight smallint not null default 0 comment '体重',
    user_height decimal(5,2) not null default 0 comment '身高',
    user_logo varchar(128) not null default '' comment '头像',
    user_tel char(11) not null default '' comment '手机',
    user_identify char(18) not null default '' comment '身份号码',
    user_check enum('0','1') not null default '0' comment '是否激活, 0:未激活  1:已激活',
    user_check_code char(32) not null default '' comment '邮箱验证激活码',
    add_time int not null comment '注册时间',
    is_del enum('0','1') not null default '0' comment '是否删除, 0:正常  1:被删除',
    primary key (user_id),
    key (user_name),
    key (user_tel)
)engine=Myisam charset=utf8 comment '会员表';

alter table php41_user add openid char(32) not null default '' comment 'qq登录的openid信息' after user_pwd;