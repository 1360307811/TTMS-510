/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2005                    */
/* Created on:     2019/4/29 20:56:43                           */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('data_dict') and o.name = 'FK_DATA_DIC_SUPER_CHI_DATA_DIC')
alter table data_dict
   drop constraint FK_DATA_DIC_SUPER_CHI_DATA_DIC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('play') and o.name = 'FK_PLAY_DICT_LAN__DATA_DIC')
alter table play
   drop constraint FK_PLAY_DICT_LAN__DATA_DIC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('play') and o.name = 'FK_PLAY_DICT_TYPE_DATA_DIC')
alter table play
   drop constraint FK_PLAY_DICT_TYPE_DATA_DIC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('sale') and o.name = 'FK_SALE_EMPLOYEE__EMPLOYEE')
alter table sale
   drop constraint FK_SALE_EMPLOYEE__EMPLOYEE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('sale_item') and o.name = 'FK_SALE_ITE_SALE_SALE_SALE')
alter table sale_item
   drop constraint FK_SALE_ITE_SALE_SALE_SALE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('sale_item') and o.name = 'FK_SALE_ITE_TICKET_SA_TICKET')
alter table sale_item
   drop constraint FK_SALE_ITE_TICKET_SA_TICKET
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('schedule') and o.name = 'FK_SCHEDULE_PLAY_SCHE_PLAY')
alter table schedule
   drop constraint FK_SCHEDULE_PLAY_SCHE_PLAY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('schedule') and o.name = 'FK_SCHEDULE_STUDIO_SC_STUDIO')
alter table schedule
   drop constraint FK_SCHEDULE_STUDIO_SC_STUDIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('seat') and o.name = 'FK_SEAT_STUDIO_SE_STUDIO')
alter table seat
   drop constraint FK_SEAT_STUDIO_SE_STUDIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ticket') and o.name = 'FK_TICKET_SCHED_TIC_SCHEDULE')
alter table ticket
   drop constraint FK_TICKET_SCHED_TIC_SCHEDULE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ticket') and o.name = 'FK_TICKET_SEAT_TICK_SEAT')
alter table ticket
   drop constraint FK_TICKET_SEAT_TICK_SEAT
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('data_dict')
            and   name  = 'super_child_dict_FK'
            and   indid > 0
            and   indid < 255)
   drop index data_dict.super_child_dict_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('data_dict')
            and   type = 'U')
   drop table data_dict
go

if exists (select 1
            from  sysobjects
           where  id = object_id('employee')
            and   type = 'U')
   drop table employee
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('play')
            and   name  = 'dict_type_play_FK'
            and   indid > 0
            and   indid < 255)
   drop index play.dict_type_play_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('play')
            and   name  = 'dict_lan_play_FK'
            and   indid > 0
            and   indid < 255)
   drop index play.dict_lan_play_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('play')
            and   type = 'U')
   drop table play
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('sale')
            and   name  = 'employee_sale_FK'
            and   indid > 0
            and   indid < 255)
   drop index sale.employee_sale_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('sale')
            and   type = 'U')
   drop table sale
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('sale_item')
            and   name  = 'sale_sale_item_FK'
            and   indid > 0
            and   indid < 255)
   drop index sale_item.sale_sale_item_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('sale_item')
            and   name  = 'ticket_sale_item_FK'
            and   indid > 0
            and   indid < 255)
   drop index sale_item.ticket_sale_item_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('sale_item')
            and   type = 'U')
   drop table sale_item
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('schedule')
            and   name  = 'studio_sched_FK'
            and   indid > 0
            and   indid < 255)
   drop index schedule.studio_sched_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('schedule')
            and   name  = 'play_sched_FK'
            and   indid > 0
            and   indid < 255)
   drop index schedule.play_sched_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('schedule')
            and   type = 'U')
   drop table schedule
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('seat')
            and   name  = 'studio_seat_FK'
            and   indid > 0
            and   indid < 255)
   drop index seat.studio_seat_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('seat')
            and   type = 'U')
   drop table seat
go

if exists (select 1
            from  sysobjects
           where  id = object_id('studio')
            and   type = 'U')
   drop table studio
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ticket')
            and   name  = 'seat_ticket_FK'
            and   indid > 0
            and   indid < 255)
   drop index ticket.seat_ticket_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ticket')
            and   name  = 'sched_ticket_FK'
            and   indid > 0
            and   indid < 255)
   drop index ticket.sched_ticket_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ticket')
            and   type = 'U')
   drop table ticket
go

/*==============================================================*/
/* Table: data_dict                                             */
/*==============================================================*/
create table data_dict (
   dict_id              int                  identity,
   dict_parent_id       int                  null,
   dict_index           int                  null,
   dict_name            varchar(200)         null,
   dict_value           varchar(100)         not null,
   constraint PK_DATA_DICT primary key nonclustered (dict_id)
)
go

/*==============================================================*/
/* Index: super_child_dict_FK                                   */
/*==============================================================*/
create index super_child_dict_FK on data_dict (
dict_parent_id ASC
)
go

/*==============================================================*/
/* Table: employee                                              */
/*==============================================================*/
create table employee (
   emp_id               int                  identity,
   emp_no               char(20)             not null,
   emp_name             varchar(100)         not null,
   emp_tel_num          char(20)             null,
   emp_addr             varchar(200)         null,
   emp_email            varchar(100)         null,
   constraint PK_EMPLOYEE primary key nonclustered (emp_id)
)
go

/*==============================================================*/
/* Table: play                                                  */
/*==============================================================*/
create table play (
   play_id              int                  identity,
   play_type_id         int                  null,
   play_lang_id         int                  null,
   play_name            varchar(200)         null,
   play_introduction    varchar(2000)        null,
   play_image           image                null,
   play_length          int                  null,
   play_ticket_price    numeric(10,2)        null,
   play_status          smallint             null,
   constraint PK_PLAY primary key nonclustered (play_id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('play')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'play_status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'play', 'column', 'play_status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '取值含义：
   0：待安排演出
   1：已安排演出
   -1：下线',
   'user', @CurrentUser, 'table', 'play', 'column', 'play_status'
go

/*==============================================================*/
/* Index: dict_lan_play_FK                                      */
/*==============================================================*/
create index dict_lan_play_FK on play (
play_lang_id ASC
)
go

/*==============================================================*/
/* Index: dict_type_play_FK                                     */
/*==============================================================*/
create index dict_type_play_FK on play (
play_type_id ASC
)
go

/*==============================================================*/
/* Table: sale                                                  */
/*==============================================================*/
create table sale (
   sale_ID              bigint               identity,
   emp_id               int                  null,
   sale_time            datetime             null,
   sale_payment         decimal(10,2)        null,
   sale_change          numeric(10,2)        null,
   sale_type            smallint             null,
   sale_status          smallint             null,
   constraint PK_SALE primary key nonclustered (sale_ID)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sale')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'sale_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sale', 'column', 'sale_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '类别取值含义：
   1：销售单
   -1：退款单',
   'user', @CurrentUser, 'table', 'sale', 'column', 'sale_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sale')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'sale_status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sale', 'column', 'sale_status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售单状态如下：
   0：代付款
   1：已付款',
   'user', @CurrentUser, 'table', 'sale', 'column', 'sale_status'
go

/*==============================================================*/
/* Index: employee_sale_FK                                      */
/*==============================================================*/
create index employee_sale_FK on sale (
emp_id ASC
)
go

/*==============================================================*/
/* Table: sale_item                                             */
/*==============================================================*/
create table sale_item (
   sale_item_id         bigint               identity,
   ticket_id            bigint               null,
   sale_ID              bigint               null,
   sale_item_price      numeric(10,2)        null,
   constraint PK_SALE_ITEM primary key nonclustered (sale_item_id)
)
go

/*==============================================================*/
/* Index: ticket_sale_item_FK                                   */
/*==============================================================*/
create index ticket_sale_item_FK on sale_item (
ticket_id ASC
)
go

/*==============================================================*/
/* Index: sale_sale_item_FK                                     */
/*==============================================================*/
create index sale_sale_item_FK on sale_item (
sale_ID ASC
)
go

/*==============================================================*/
/* Table: schedule                                              */
/*==============================================================*/
create table schedule (
   计划ID                 int                  identity,
   studio_id            int                  null,
   play_id              int                  null,
   演出时间                 datetime             not null,
   票价                   numeric(10,2)        null,
   constraint PK_SCHEDULE primary key nonclustered (计划ID)
)
go

/*==============================================================*/
/* Index: play_sched_FK                                         */
/*==============================================================*/
create index play_sched_FK on schedule (
play_id ASC
)
go

/*==============================================================*/
/* Index: studio_sched_FK                                       */
/*==============================================================*/
create index studio_sched_FK on schedule (
studio_id ASC
)
go

/*==============================================================*/
/* Table: seat                                                  */
/*==============================================================*/
create table seat (
   seat_id              int                  identity,
   studio_id            int                  null,
   seat_row             int                  null,
   seat_column          int                  null,
   constraint PK_SEAT primary key nonclustered (seat_id)
)
go

/*==============================================================*/
/* Index: studio_seat_FK                                        */
/*==============================================================*/
create index studio_seat_FK on seat (
studio_id ASC
)
go

/*==============================================================*/
/* Table: studio                                                */
/*==============================================================*/
create table studio (
   studio_id            int                  identity,
   studio_name          varchar(100)         not null,
   studio_row_count     int                  null,
   studio_col_count     int                  null,
   constraint PK_STUDIO primary key nonclustered (studio_id)
)
go

/*==============================================================*/
/* Table: ticket                                                */
/*==============================================================*/
create table ticket (
   ticket_id            bigint               identity,
   seat_id              int                  null,
   计划ID                 int                  null,
   ticket_price         numeric(10,2)        null,
   ticket_status        smallint             null,
   constraint PK_TICKET primary key nonclustered (ticket_id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('ticket')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ticket_status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'ticket', 'column', 'ticket_status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '含义如下：
   0：待销售
   1：锁定
   9：卖出',
   'user', @CurrentUser, 'table', 'ticket', 'column', 'ticket_status'
go

/*==============================================================*/
/* Index: sched_ticket_FK                                       */
/*==============================================================*/
create index sched_ticket_FK on ticket (
计划ID ASC
)
go

/*==============================================================*/
/* Index: seat_ticket_FK                                        */
/*==============================================================*/
create index seat_ticket_FK on ticket (
seat_id ASC
)
go

alter table data_dict
   add constraint FK_DATA_DIC_SUPER_CHI_DATA_DIC foreign key (dict_parent_id)
      references data_dict (dict_id)
go

alter table play
   add constraint FK_PLAY_DICT_LAN__DATA_DIC foreign key (play_lang_id)
      references data_dict (dict_id)
go

alter table play
   add constraint FK_PLAY_DICT_TYPE_DATA_DIC foreign key (play_type_id)
      references data_dict (dict_id)
go

alter table sale
   add constraint FK_SALE_EMPLOYEE__EMPLOYEE foreign key (emp_id)
      references employee (emp_id)
go

alter table sale_item
   add constraint FK_SALE_ITE_SALE_SALE_SALE foreign key (sale_ID)
      references sale (sale_ID)
go

alter table sale_item
   add constraint FK_SALE_ITE_TICKET_SA_TICKET foreign key (ticket_id)
      references ticket (ticket_id)
go

alter table schedule
   add constraint FK_SCHEDULE_PLAY_SCHE_PLAY foreign key (play_id)
      references play (play_id)
go

alter table schedule
   add constraint FK_SCHEDULE_STUDIO_SC_STUDIO foreign key (studio_id)
      references studio (studio_id)
go

alter table seat
   add constraint FK_SEAT_STUDIO_SE_STUDIO foreign key (studio_id)
      references studio (studio_id)
go

alter table ticket
   add constraint FK_TICKET_SCHED_TIC_SCHEDULE foreign key (计划ID)
      references schedule (计划ID)
go

alter table ticket
   add constraint FK_TICKET_SEAT_TICK_SEAT foreign key (seat_id)
      references seat (seat_id)
go

