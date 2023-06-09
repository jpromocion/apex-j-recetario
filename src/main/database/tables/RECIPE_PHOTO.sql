create table RECIPE_PHOTO (
    id number generated by default on null as identity,
    idrecipe number not null,
    photo BLOB not null,
    namefile varchar2(1000) not null,
    mimetype varchar2(500) not null,
    created date not null,
    created_by varchar2(255 char) not null,
    updated date not null,
    updated_by varchar2(255 char) not null
);

alter table RECIPE_PHOTO add constraint RECIPE_PHOTO_PK primary key (id);
alter table RECIPE_PHOTO add constraint RECIPE_PHOTO_FK foreign  key (idrecipe) references RECIPE(id);

