create table RECIPE_MEDIA (
    id number generated by default on null as identity,
    idrecipe number not null,
    type varchar2(1) not null,
    description varchar2(2000) null,
    url varchar2(2000) null,
    created date not null,
    created_by varchar2(255 char) not null,
    updated date not null,
    updated_by varchar2(255 char) not null
);

alter table RECIPE_MEDIA add constraint RECIPE_MEDIA_PK primary key (id);
alter table RECIPE_MEDIA add constraint RECIPE_MEDIA_FK foreign  key (idrecipe) references RECIPE(id);
alter table RECIPE_MEDIA add constraint RECIPE_MEDIA_CK check (type IN ('U','V'));

