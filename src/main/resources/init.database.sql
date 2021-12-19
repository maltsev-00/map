

create table item_ingredient
(
    id bigint not null
        primary key
);

alter table item_ingredient
    owner to postgres;

create table item_description
(
    id                 bigint           not null
        primary key,
    path_image         varchar(255),
    price              double precision not null,
    weight             double precision not null,
    item_ingredient_id bigint
        constraint fkfgaj9xi4o1vwep84m5bc52c52
            references item_ingredient
);

alter table item_description
    owner to postgres;

create table currency
(
    id                  bigint not null
        primary key,
    name                varchar(255),
    item_description_id bigint
        constraint fkqfp7n8gsqn6f15e41t2h4gidf
            references item_description
);

alter table currency
    owner to postgres;

create table ingredient
(
    id            bigint not null
        primary key,
    name          varchar(255),
    ingredient_id bigint
        constraint fkswn5b9gr6rgo7jnr84p870wtl
            references item_description
);

alter table ingredient
    owner to postgres;

create table role
(
    id   bigserial
        primary key,
    name varchar(255)
);

alter table role
    owner to postgres;

create table type_place
(
    id   bigint not null
        primary key,
    name varchar(255)
);

alter table type_place
    owner to postgres;

create table place
(
    id            bigint not null
        primary key,
    address       varchar(255),
    favorite      boolean,
    height        double precision,
    name          varchar(255),
    raiting       real   not null,
    width         double precision,
    type_place_id bigint
        constraint fks9jxnngmo9yrdkepl784c9v30
            references type_place
);

alter table place
    owner to postgres;

create table menu_item
(
    id                  bigint not null
        primary key,
    name                varchar(255),
    item_description_id bigint
        constraint fk4m2oei4jvg1xgy947at9537or
            references item_description,
    place_id            bigint
        constraint fkefcldcdv9ynxre9sgo2yjm2gi
            references place
);

alter table menu_item
    owner to postgres;

create table users
(
    id         bigint not null
        primary key,
    email      varchar(255)
        constraint uk6dotkott2kjsp8vw4d0m25fb7
            unique,
    first_name varchar(255),
    last_name  varchar(255),
    password   varchar(255)
);

alter table users
    owner to postgres;

create table users_roles
(
    user_id bigint not null
        constraint fk2o0jvgh89lemvvo17cbqvdxaa
            references users,
    role_id bigint not null
        constraint fkt4v0rrweyk393bdgt107vdx0x
            references role
);

alter table users_roles
    owner to postgres;





INSERT INTO type_place (id, name)
VALUES (1, 'Повседневные заведения'),
       (2, 'Семейного типа'),
       (3, 'Фаст-фуды'),
       (4, 'Кафе'),
       (5, 'Буфеты'),
       (6, 'Поп-ап рестораны'),
       (7, 'Виртуальные рестораны'),
       (8, 'Рестораны престижного класса');


INSERT INTO place (id, name, address, height, width, raiting, type_place_id)
VALUES (1, 'NEFT (Нефть)', 'Минск, ул. Аранская, 8', 53.885300, 27.569900, 4.8, 2),
       (2, 'Nuahule Minsk (Нуауле Минск)', 'Минск, Ул. Красная, 12', 53.913400, 27.575700, 4.4, 3),
       (3, 'Radio Killers (Радио Киллерс)', 'Минск, пр-т Победителей, 49', 53.917100, 27.533000, 4.6, 4),
       (4, 'Madame Koko (Мадам Коко)', 'Минск, ул. К. Маркса, 17', 53.896600, 27.554000, 4.5, 1),
       (5, 'American BBQ (Американ Барбекю)', 'Минск, ул. Володько, 6/6', 53.882100, 27.562400, 4.4, 5),
       (6, 'The View (Зэ Вью)', 'Минск, пр-т Победителей, 7а, эт. 28', 53.908400, 27.548900, 4.5, 1),
       (7, 'Бруклин', 'Минск, ул. Тимирязева, 9/10', 53.908100, 27.529500, 4.4, 1),
       (8, 'Поедем Поедим', 'Минск, Папернянский сельсовет, 111/11', 53.969600, 27.601800, 3.9, 1),
       (9, 'Мята Lounge Center (Мята Лаунж Центр)', 'Минск, пр-т. Независимости, 19', 53.899900, 27.556800, 4.3, 6),
       (10, 'Лаборатория', 'Минск, ул. Толбухина, 4, комн. 62', 53.926900, 27.613900, 4, 7),
       (11, 'JT Bar (Джей Ти Бар)', 'Минск, ул. Сурганова, 20', 53.924900, 27.598500, 4.8, 8),
       (12, 'The Office (Офис)', 'Минск, ул. Кульман, 9', 53.921000, 27.580100, 4.6, 8),
       (13, 'HookahPlace Lounge Bar Yakuba Kolasa (ХукаПлейс Лаунж Бар Якуба Коласа)', 'Минск, ул. Якуба Коласа, 42',
        53.929800, 27.598600, 4.6, 3),
       (14, 'Тусэ', 'Минск, ул. Сурганова, 57б', 53.928500, 27.583100, 4.7, 7),
       (15, 'HP Sportivnaya (ХП Спортивная)', 'Минск, ул. Дунина-Марцинкевича, 3', 53.907000, 27.483700, 4.7, 8),
       (16, 'Караоке-клуб JEL’SA (Джельса)', 'Минск, ул. Немига, 5', 53.902000, 27.549300, 4, 2),
       (17, 'Hookah Place Stella (Хука Плейс Стелла)', 'Минск, пр-т. Победителей', 53.912500, 27.538300, 4.5, 7),
       (18, 'Дружба', 'Минск, пр-т Дзержинского, 119', 53.852200, 27.477100, 4.9, 2)
        ,
       (19, 'Столовая Белдорстрой', 'Минск, ул. Кальварийская, 37', 53.907900, 27.510700, 3.8, 2),
       (20, 'Облака', 'Минск, ул. Кульман, 3', 53.919800, 27.582700, 4.8, 4),
       (21, 'Мята Lounge Институт Культуры', 'Минск, Могилёвская, 12', 53.884200, 27.543200, 4.6, 5),
       (22, 'Middle Ground (Мидл Граунд)', 'Минск, ул. Октябрьская, 23, эт. 2', 53.890100, 27.574600, 4.2, 6),
       (23, 'Zalkind Kitchen (Залкинд китчн)', 'Минск, ул. Революционная, 24', 53.902400, 27.551100, 4.6, 7),
       (24, 'Хлеб Соль', 'Минск, ул. Некрасова, 20', 53.933100, 27.591700, 4.9, 8),
       (25, 'Поющий Центр', 'Минск, пл. Октябрьская, 1/1, пом. 402', 53.903100, 27.560100, 4, 8)
        ,
       (26, 'BierKeller (БирКеллер)', 'Минск, пер. Войсковой, 12', 53.907100, 27.580300, 3.8, 2),
       (27, 'Зелёный попугай', 'Минск, ул. П. Бровки, 15', 53.912700, 27.601900, 4, 4),
       (28, 'МясоМузыкалити', 'Минск, ул. Тимирязева, 46а', 53.917500, 27.523400, 4.7, 8),
       (29, 'Vegas (Вегас)', 'Минск, пр-т Дзержинского, 1е', 53.892300, 27.529100, 4.3, 1),
       (30, 'Ресторан и доставка суши и морепродуктов FriendsFish (ФрендсФиш)',
        'Минск, ул. Петра Мстиславца, 18, пом. 380', 53.931600, 27.651900, 4.9, 2),
       (31, 'Мустанг', '2 км от МКАД, трасса Р28 Минск-Молодечно', 53.953600, 27.409900, 4.4, 2),
       (32, 'Beef&Beer (Биф энд Бир)', 'Минск, ул.Тимирязева, 65', 53.924500, 27.509100, 4.6, 3),
       (33, 'Бар Monkey Brothers (Манки Бразерс)', 'Минск, ул. Октябрьская, 19/4', 53.891200, 27.572300, 3.9, 2),
       (34, 'МясоМузыкалити', 'Минск, ул. Тимирязева, 46а', 53.917500, 27.523400, 4.7, 8),
       (35, 'Vegas (Вегас)', 'Минск, пр-т Дзержинского, 1е', 53.892300, 27.529100, 4.3, 1),
       ( 36, 'Ресторан и доставка суши и морепродуктов FriendsFish (ФрендсФиш)'
       , 'Минск, ул. Петра Мстиславца, 18, пом. 380'
       , 53.931600, 27.651900, 4.9, 2),
       (37, 'Мустанг', '2 км от МКАД, трасса Р28 Минск-Молодечно', 53.953600, 27.409900, 4.4, 2),
       (38, 'Beef&Beer (Биф энд Бир)', 'Минск, ул.Тимирязева, 65', 53.924500, 27.509100, 4.6, 1),

       (39, 'Бар Monkey Brothers (Манки Бразерс)', 'Минск, ул. Октябрьская, 19/4', 53.891200, 27.572300, 3.7, 2),
       (40, 'Дрова', 'Минский р-н пос. Ждановичи ул. Заречная, 1а', 53.945400, 27.433800, 4.9, 4),
       (41, 'Velour (Велюр)', 'Минск, ул. Тимирязева, 65А', 53.923400, 27.510500, 4.5, 5),
       (42, 'Кафе на Одоевского 10', 'Минск, ул. Одоевского, 10', 53.906100, 27.508600, 4.2, 3);

INSERT INTO place (id, name, address, height, width, raiting, type_place_id)
VALUES (43, 'Кафе 5', 'Минск, ул. Октябрьская, 23А', 53.890100, 27.575500, 4.5, 6),
       (44, 'SFB Minsk (СиФудБар Минск)', 'Минск, ул. Революционная, 17', 53.901500, 27.549600, 4.8, 7),
       (45, 'Ресторан партнеры CoffeeRest (Коферест)', 'Минск, пр-т Независимости, 89', 53.923100, 27.606200, 4, 2),
       (46, 'Батискаф', 'Минск, пр-т Любимова, 10', 53.859200, 27.469500, 4.2, 1),
       (47, 'Savory (Савори)', 'Минск, ул. Кальварийская, 5', 53.905400, 27.536800, 4.1, 2),
       (48, 'Believe (Белив)', 'аг. Ратомка, ул. Новая, 20А', 53.940400, 27.319900, 4, 1),
       (49, 'ROKAS (РОКАС)', 'Минск, пр-т Победителей, 4', 53.910500, 27.551600, 4.7, 2),
       (50, 'AST club (Аст клаб)', 'Минск, ул. Смоленская, 15', 53.892000, 27.585100, 4.2, 4),
       (51, 'Stvol House (Ствол Хаус)', 'Минск, ул. П. Мстиславца, 8', 53.930900, 27.651700, 4.4, 1),
       (52, 'Ханум Базар', 'Минск, ТРЦ ARENAcity, пр-т Победителей, 84', 53.938000, 27.489400, 4.2, 2),
       (53, 'Клумба', 'Минск, ул. Зыбицкая, 6', 53.906400, 27.557500, 3.8, 2),
       (54, 'WINBET (Винбет)', 'Минск, ул. Кульман, 11', 53.921900, 27.577100, 4.9, 3),
       (55, 'WINBET (Винбет)', 'Минск, ул. Немига, 40', 53.899500, 27.543300, 4.7, 3),
       (56, 'WINBET (Винбет)', 'Минск, ул.  Притыцкого, 144', 53.907500, 27.438300, 3.8, 3),
       (57, 'Вестфалия', 'Минск, пр-т Газеты Правда, 11', 53.869200, 27.487200, 4.5, 1),
       (58, 'Ресторан Maslow6 (Маслоу 6)', 'Минск, ул. Интернациональная, 25а', 53.904600, 27.558700, 4.2, 2),
       (59, 'Старая мельница', 'д. Королев Стан, съезд на трассу М2', 53.990300, 27.804700, 3.8, 2),
       (60, 'Noodles (Нудлс)', 'Минск, пр-т Машерова, 11', 53.915700, 27.569200, 4.5, 3),
       (61, 'Eventime (Ивентайм)', 'Минск, Ждановичи, ул. Мира, 26/1', 53.950200, 27.416000, 4.7, 5),
       (62, 'Osteria La Bruscetta (Остериа ла Брусчетта)', 'Минск, ул. Комсомольская, 9', 53.902900, 27.552100, 4, 1),
       (63, 'Melograno (Мелограно)', 'Минск, ул. Кальварийская, 4', 53.905800, 27.539100, 4.1, 1),
       (64, 'Tiflis (Тифлисъ)', 'Минск, ул. Толбухина, 3', 53.925700, 27.612800, 4.6, 1),
       (65, 'Белый налив', 'Минск, ул. Зыбицкая, 6, пом. 13', 53.906200, 27.557700, 4.6, 8);

INSERT INTO place (id, name, address, height, width, raiting, type_place_id)
VALUES (66, 'Белый налив', 'Минск, ул. Октябрьская, 23А', 53.890100, 27.575500, 3.8, 8),
       (67, 'Dead Rabbits (Мёртвые кролики)', 'Минск, ул. К. Маркса, 21', 53.897200, 27.555600, 4.5, 5),
       (68, 'Beef&Fire (Биф энд Фаер)', 'Минск, ул. Захарова, 31', 53.904500, 27.581800, 4.7, 3),
       (69, 'Ходят слухи', 'Минск, ул. Я.Купалы, 25, эт. 2', 53.905500, 27.561500, 4.2, 1),
       (70, 'CafePeony (Кафе Пионы)', 'Минск, ТРЦ Dana Mall, ул. Петра Мстиславца, 12, пом. 231', 53.931700, 27.650000,
        4.9, 3),
       (71, 'Elementum (Элементум)', 'Минск, ул. Интернациональная, 20А, эт. 1, пом. 45-15', 53.901400, 27.554100, 4.8,
        3),
       (72, 'URBAN BAR MYOD (Бар Мёд)', 'Минск, пер. Музыкальный, 1', 53.904700, 27.558600, 4, 3),
       (73, 'Cuprum (Капрум)', 'Минск, пл. Свободы, 13', 53.903900, 27.554200, 4.8, 5),
       (74, ' Patisserie (Патиссерия)', 'Минск, ул. Чечота, 7', 53.849600, 27.478100, 4.8, 1),
       (75, 'Персона', 'Минск, Маяковского, 129А', 53.860700, 27.574900, 4.3, 2),
       (76, 'ФортеPiano (ФортеПиано)', 'Минск, ул. Кальварийская, 1', 53.905100, 27.539100, 3.8, 4),
       (77, 'Гаштет', 'Минск, ул. Комсомольская, 9', 53.902900, 27.552000, 4.8, 2),
       (78, 'Ember terrace (Эмбер терраса)', 'Минск, пр-т Победителей, 9, эт. 7', 53.908600, 27.548600, 4.4, 1),
       (79, 'Гвоздь', 'Минск, ул. Гикало, 5', 53.914600, 27.590300, 4.7, 2),
       (80, 'Stolle (Штолле)', 'Минск, ул. Свердлова, 22', 53.893600, 27.553500, 4.1, 3),
       (81, 'Публика', 'Минск, пр-т Победителей, 21', 53.911000, 27.545200, 4.4, 1),
       (82, 'Paul (Поль)', 'Минск, ул. Интернациональная, 21', 53.903700, 27.558300, 4.2, 4),
       (83, 'Gavana (Гавана)', 'Минск, ул. Бобруйская, 4А', 53.891200, 27.548300, 4.2, 3),
       (84, 'Аква-Минск', 'Минск, пр-т Победителей, 118', 53.950200, 27.453500, 3.9, 1),
       (85, 'Da Claudio (У Клаудио)', 'Минск, ул. К.Маркса, 25', 53.898100, 27.557500, 4.5, 1),
       (86, 'Суши Весла take away', 'Минск, пр-т Машерова, 78', 53.912700, 27.531700, 4.1, 4),
       (87, 'Суши Весла take away', 'Минск, ул. Я. Коласа, 37', 53.925900, 27.592700, 4.7, 3),
       (88, 'Суши Весла take away', 'Минск, ул. Притыцкого, 83', 53.905600, 27.449300, 4.7, 1),
       (89, 'Golden Coffee (Голден кофе)', 'Минск, ул. М. Богдановича, 26', 53.916000, 27.563800, 4, 2),
       (90, 'Rib Raw (Риб Ро)', 'Минск, ул. Гикало, 7', 53.913600, 27.592200, 4.1, 1),
       (91, 'Пиросмани', 'Минск, ул. Некрасова, 11/34', 53.931600, 27.593000, 3.9, 2),
       (92, 'Оазис', 'Минский р-н пос. Раубичи', 54.058400, 27.734100, 4.5, 2);

INSERT INTO place (id, name, address, height, width, raiting, type_place_id)
VALUES (93, 'Luxuria LXR (Люксурия)', 'Минск, ул. Зыбицкая, 2, пом. 1', 53.905800, 27.560000, 4.8, 4),
       (94, 'Берлога', 'Минский р-н пос. Ждановичи ул. Парковая, 9а', 53.953700, 27.428400, 4.8, 2),
       (95, 'Бейкери дю солей', 'Минск, ул. Воронянского, 50/5', 53.876000, 27.553200, 3.8, 4),
       (96, 'Red Head (Ред Хед)', 'Минск, ул. Интернациональная, 25А', 53.904500, 27.559000, 4.4, 8),
       (97, 'Cafe Prime Time (Кафе Прайм Тайм)', 'Минск, ул. Сурганова, 41', 53.926400, 27.590700, 4.8, 2),
       (98, 'Время есть & BILLIE JEAN BAR', 'Минск, ул. Матусевича, 33', 53.915900, 27.461500, 4.5, 4),
       (99, 'Имбирь', 'Минск, ул. Притыцкого, 2а', 53.911300, 27.503400, 4.9, 1),
       (100, 'Хинкальная', 'Минск, пр-т Независимости, 126', 53.933900, 27.650300, 4.3, 4),
       (101, 'Хинкальная', 'Минск, ул. Притыцкого, 97Б', 53.906100, 27.438100, 3.8, 4),
       (102, 'Кафе A’More (Аморе)', 'Минск, ТРЦ Palazzo, ул. Тимирязева, 74а, эт. 3, пом. 41', 53.926700, 27.509600,
        3.8, 3);


INSERT INTO place (id, name, address, height, width, raiting, type_place_id)
VALUES (135, 'БашЪ', 'Минск, ул. Интернациональная, 25а', 53.904400, 27.558500, 4.6, 8)
     , (136, 'Планета Суши', 'Минск, ул. Ленина, 3', 53.902100, 27.557600, 4.1, 1)
     , (137, 'Усадьба', 'Минск, ул. Филимонова, 24', 53.919700, 27.638800, 4.9, 6)
     , (138, 'Серебряная Ложка', 'Минск, ул. Центральная, 6', 53.865800, 27.653000, 4.3, 1)
     , (139, 'Fusion Sushi (Фьюжн Суши)', 'Минск, ТЦ DiaMond city, фудкорт, эт. 3', 53.849200, 27.433800, 3.8,2)
     , (140, 'RICH CAT (Рич Кэт)', 'Минск, ул. Веры Хоружей, 29', 53.921800, 27.562300, 4.8, 2)
     , (141, ' Tesla bar (Тесла бар)', 'Минск, ул. Зыбицкая, 6', 53.906500, 27.558200, 3.9, 1)
     , (142, 'Хинкальня', 'ТЦ Титан, пр-т Дзержинского, 104', 53.861300, 27.479300, 4.6, 1)
     , (143, 'La Crête D’Or (Золотой гребешок)', 'Минск, пр-т Независимости, 37', 53.909500, 27.575500, 3.8, 2)
     , (144, 'Милавица', 'Минск, ул. Нововиленская, 28/2', 53.934100, 27.537000, 4.4, 2)
     , (145, 'Beans & Leaves (Бинс энд Ливс)', 'Минск, пр-т Победителей, 9, эт. 1', 53.908600, 27.548600, 4.4, 2)
     , (146, 'Авиньон', 'Минск, ул. Интернациональная, 28', 53.902600, 27.557000, 3.9, 3)
     , (147, 'Столовая на ул. Рыбалко', 'Минск, ул. Рыбалко, 26', 53.890000, 27.595000, 3.8, 2)
     , (148, 'Falcone (Фальконе)', 'Минск, ул. Короля, 9', 53.902200, 27.542100, 4.6, 2)
     , (149, 'Богема', 'Минск, пр-т Машерова, 11', 53.915700, 27.569200, 4, 1)
     , (150, 'Цімохін двор', 'Минск, ул. Притыцкого, 74', 53.907000, 27.449600, 4, 2)
     , (151, ' Clever Rock Pub (Клевер Рок Паб)', 'Минск, ул. Берсона, 14', 53.897500, 27.546000, 4.5, 3)
     , (152, 'Счастливый день', 'Минск, ул. Уральская, 3а, эт. 1', 53.899900, 27.607600, 4.5, 4)
     , (153, 'Чешская пивная', 'Минск, пр. Машерова, 17/4', 53.916200, 27.564600, 4.5, 5)
     , (154, 'Маяк', 'Минск, ул. Маяковского, 75', 53.877700, 27.569200, 3.9, 6)
     , (155, 'Marumi (Маруми)', 'Минск, пр-т Независимости, 78', 53.922500, 27.606600, 4.6, 2)
     , (156, 'Олимп', 'Минск, пр-т Независимости, 51, эт. 1', 53.917300, 27.585000, 4.8, 1)
     , (157, 'Шынок у Лявона', 'Минск, ул. В. Хоружей, 17, эт. 1', 53.920000, 27.571900, 4.7, 3)
     , (158, 'Pub 1067 (Паб 1067)', 'Минск, ул. Володарского, 22', 53.895700, 27.553400, 4.6, 1)
     , (159, 'Honky Tonk Piano Bar (Хонки Тонк Пиано Бар)', 'Минск, ул. Интернациональная, 25а', 53.904500, 27.558600,
        4.6, 5)
     , (160, 'The Pub (Зэ Паб)', 'Минск, ул. К. Маркса, 6', 53.895700, 27.553100, 4.2, 6)
     , (161, 'Ангелы', 'Минск, ул. Толбухина, 2', 53.926100, 27.614700, 4.6, 2)
     , (162, 'Паланга', 'Минский р-н, д.Тарасово, ул. Ратомская, 1Б', 53.915000, 27.391600, 4.8, 1)
     , (163, 'Амстердам', 'Минск, пр-т Победителей, 65', 53.926300, 27.517400, 4.5, 5)
     , (164, 'Славянский двор', 'Минск, ул. Червякова, 23', 53.924200, 27.549600, 4.3, 4)
     , (165, 'Есенин', 'Минск, ул. С. Есенина, 10', 53.849600, 27.465200, 3.9, 2)
     , (166, 'CRAFTMAN (КРАФТМЭН)', 'Минск, ул. Гикало, 5', 53.915200, 27.589200, 4, 2)
     , (167, 'Lugano x BAZIS bar & lounge (Лугано Базис Лаунж-бар)', 'Минск, ул. Зыбицкая, 2', 53.905400, 27.560500,
        3.9, 4)
     , (168, 'Луна (Luna)', 'Минск, Я. Купалы, 25', 53.905500, 27.561100, 3.8, 2)
     , (169, 'Бар Malanka Taproom (Маланка Тапрум)', 'Минск, ул. Ленинградская, 3', 53.893300, 27.550000, 4.9,
        2)
     , (170, 'Ирландец', 'Минск, ул. Леонида Беды, 45', 53.944000, 27.598600, 4.9, 3)
     , (171, 'К7 ГастроПаб', 'Минск, ул. Казинца, 7', 53.866300, 27.525000, 3.8, 4)
     , (172, 'Bistro Da! (Бистро О\Да!)', 'Минск, ул. Мстиславца, 18', 53.931600, 27.651900, 4, 5)
     , (173, 'Terra (Терра)', 'Минск, ул. Бурдейного, 13', 53.903600, 27.455400, 4.7, 1)
     , (174, 'Terra (Терра)', 'Минск, ул. Мележа, 1', 53.939500, 27.601300, 4.3, 4)
     , (175, 'Terra (Терра)', 'Минск, пр-т Независимости, 186', 53.947600, 27.697300, 4.2, 6)
     , (176, 'Кафе 2', 'Минск, ул. Октябрьская, 23', 53.890100, 27.574600, 4.8, 1);

INSERT INTO item_ingredient (id)
VALUES (1),
       (2),
       (3),
       (4),
       (5),
       (6),
       (7),
       (8),
       (9),
       (10),
       (11),
       (12),
       (13),
       (14),
       (15),
       (16),
       (17),
       (18),
       (19),
       (20),
       (21),
       (22),
       (23),
       (24),
       (25),
       (26),
       (27),
       (28),
       (29),
       (30),
       (31),
       (32),
       (33),
       (34),
       (35),
       (36),
       (37),
       (38),
       (39),
       (40),
       (41),
       (42),
       (43),
       (44),
       (45),
       (46),
       (47),
       (48),
       (49),
       (50),
       (51),
       (52),
       (53),
       (54),
       (55),
       (56),
       (57),
       (58),
       (59),
       (60),
       (61),
       (62),
       (63),
       (64),
       (65),
       (66),
       (67),
       (68),
       (69),
       (70),
       (71),
       (72),
       (73),
       (74),
       (75),
       (76),
       (77),
       (78),
       (79),
       (80),
       (81),
       (82),
       (83),
       (84),
       (85),
       (86),
       (87),
       (88),
       (89),
       (90);

INSERT INTO item_description (id, price, weight, item_ingredient_id)
VALUES (1, 124, 21, 1),
       (2, 125, 22, 2),
       (3, 126, 23, 3),
       (4, 127, 24, 4),
       (5, 128, 25, 5),
       (6, 129, 26, 6),
       (7, 130, 27, 7),
       (8, 131, 28, 8),
       (9, 132, 29, 9),
       (10, 133, 30, 10),
       (11, 134, 31, 11),
       (12, 135, 32, 12),
       (13, 136, 33, 13),
       (14, 137, 34, 14),
       (15, 138, 35, 15),
       (16, 139, 36, 16),
       (17, 140, 37, 17),
       (18, 141, 38, 18),
       (19, 142, 39, 19),
       (20, 143, 40, 20),
       (21, 144, 41, 21),
       (22, 145, 42, 22),
       (23, 146, 43, 23),
       (24, 147, 44, 24),
       (25, 148, 45, 25),
       (26, 149, 46, 26),
       (27, 150, 47, 27),
       (28, 151, 48, 28),
       (29, 152, 49, 29),
       (30, 153, 50, 30),
       (31, 154, 51, 31),
       (32, 155, 52, 32),
       (33, 156, 53, 33),
       (34, 157, 54, 34),
       (35, 158, 55, 35),
       (36, 159, 56, 36),
       (37, 160, 57, 37),
       (38, 161, 58, 38),
       (39, 162, 59, 39),
       (40, 163, 60, 40),
       (41, 164, 61, 41),
       (42, 165, 62, 42),
       (43, 166, 63, 43),
       (44, 167, 64, 44),
       (45, 168, 65, 45),
       (46, 169, 66, 46),
       (47, 170, 67, 47),
       (48, 171, 68, 48),
       (49, 172, 69, 49),
       (50, 173, 70, 50),
       (51, 174, 71, 51),
       (52, 175, 72, 52),
       (53, 176, 73, 53),
       (54, 177, 74, 54),
       (55, 178, 75, 55),
       (56, 179, 76, 56),
       (57, 180, 77, 57),
       (58, 181, 78, 58),
       (59, 182, 79, 59),
       (60, 183, 80, 60),
       (61, 184, 81, 61),
       (62, 185, 82, 62),
       (63, 186, 83, 63),
       (64, 187, 84, 64),
       (65, 188, 85, 65),
       (66, 189, 86, 66),
       (67, 190, 87, 67),
       (68, 191, 88, 68),
       (69, 192, 89, 69),
       (70, 193, 90, 70),
       (71, 194, 91, 71),
       (72, 195, 92, 72),
       (73, 196, 93, 73),
       (74, 197, 94, 74),
       (75, 198, 95, 75),
       (76, 199, 96, 76),
       (77, 200, 97, 77),
       (78, 201, 98, 78),
       (79, 202, 99, 79),
       (80, 203, 100, 80),
       (81, 204, 101, 81),
       (82, 205, 102, 82),
       (83, 206, 103, 83),
       (84, 207, 104, 84),
       (85, 208, 105, 85),
       (86, 209, 106, 86),
       (87, 210, 107, 87),
       (88, 211, 108, 88),
       (89, 212, 109, 89),
       (90, 213, 110, 90);



INSERT INTO ingredient(id, name, ingredient_id)
VALUES (11894, '\nfrench fries', 1),
       (11898, '\nspicy chilli sauce', 2),
       (6154, '\nмаянезны соус', 3),
       (11720, '\nпшеничная смесь', 4),
       (11912, '\nсоус жгучая сальса', 5),
       (11916, '\nсоус сладкий чили', 6),
       (11908, '\nсыр чеддер', 7),
       (2696, '', 8),
       (9769, 'лук маринованный ,овощи св.,зелень/ veal', 9),
       (5244, 'перепелиное яйцо', 10),
       (5243, 'красный лук', 11),
       (5242, 'лимонная заправка', 12),
       (14699, 'грибы маринованные', 13),
       (1683, 'глазурь на выбор:: bbq', 14),
       (1850, ' гренки из бородинского хлеба с чесноком', 15),
       (14700, '  огурцы маринованные', 16),
       (14284, '  полендвица сырокопченая', 17),
       (11543, '  черри', 18),
       (11374, ' (клюквенный морс', 19),
       (5616, ' potatoes', 20),
       (4871, ' walnut', 21),
       (3460, ' «лодочка» из теста с сыром и яичным желтком', 22),
       (7518, ' а подаётся на пюре из сельдерея.  советуем к ней внимательно  присмотреться', 23),
       (5458, ' арбуз', 24),
       (7520, ' бланшированными листьями шпината', 25),
       (5478, ' болгарский перец', 26),
       (4348, ' бриошь', 27),
       (8366, ' брынзы', 28),
       (6075, ' брынзы и зелени', 29);
INSERT INTO ingredient(id, name, ingredient_id)
VALUES (8225, ' великобритания • чрезмерное употребление пива вредит вашему здоровью', 30),
       (2680, ' ветчина', 31),
       (11551, ' ветчина к/в', 32),
       (3896, ' вешенки', 33),
       (5371, ' вино', 34),
       (11555, ' виноград', 35),
       (9362, ' вишня', 36),
       (5598, ' вяленый томат ', 37),
       (1733, ' глазированная булочка', 38),
       (1496, ' горошек', 39),
       (9078, ' горчица', 40),
       (2686, ' грибы', 41),
       (5143, ' грудинка', 42),
       (13200, ' деревенская 600 г.', 43),
       (11180, ' заправка на основе оливкового масла', 44),
       (4797, ' заправка цезарь', 44),
       (7121, ' заправленный сметаной', 45),
       (4791, ' зелень', 46),
       (9756, ' зелень/ lamb (lamb loin)', 47),
       (4802, ' капуста', 48),
       (10459, ' картофель', 49),
       (11561, ' картофель фри', 50),
       (11545, ' картофельные дольки жареные', 51),
       (8226, ' китай • чрезмерное употребление пива вредит вашему здоровью', 52),
       (14409, ' клубника', 53),
       (992, ' колбаса салями', 54),
       (692, ' колбаска охотничья', 55),
       (9148, ' красным луком', 56),
       (14091, ' крахмал', 57),
       (7711, ' кукуруза', 58),
       (6825, ' кунжут', 59),
       (248, ' кунжут чёрный зелень микрогрин', 60),
       (7487, ' кунжутное масло', 61),
       (3207, ' кунжутом и обжаренным арахисом в соусе пад тай', 62),
       (14205, ' куриное филе', 63),
       (13254, ' куриные крылышки в хрустящей панировке', 64),
       (7483, ' курица на шпажках', 65),
       (4783, ' лаваш', 66),
       (5435, ' лайм', 67),
       (1407, ' лимоном', 68),
       (5433, ' лисички', 69),
       (4136, ' лосось', 70),
       (2685, ' лук', 71),
       (8859, ' лук красный св.', 72),
       (4786, ' лук маринованный', 73);

INSERT INTO ingredient(id, name, ingredient_id)
VALUES (9770, ' лук маринованный ,овощи св.,зелень. chicken fillet', 74),
       (2992, ' луковые кольца', 75),
       (14538, ' луком и маринованными опятами', 76),
       (10482, ' люля кебаб из свинины', 77),
       (13928, ' маслинами', 78),
       (11556, ' маслины', 79),
       (14062, ' масло растительное', 80),
       (2551, ' масло с лемонграссом /трюфельный понзу', 81),
       (14586, ' масло чесночное', 82),
       (9196, ' микс салата', 83),
       (9047, ' микс салатов', 84),
       (14017, ' микс свежих салатов', 85),
       (3984, ' миньонет', 86),
       (7545, ' мисо майонез (майонез', 87),
       (5445, ' молочный улун', 88),
       (4263, ' морковь', 89),
       (6828, ' морковь нарезанная', 90);


-- INSERT INTO item_description(id, price, weight, item_ingredient_id, path_image)
-- VALUES (2, 7, 1, 1,
--         'https://ms1.relax.by/images/ebab29459d1a6f0285c3def2c89e0845/thumb/point=middle-center,w=228,h=156,q=80,watermark=false/price_photo/3d/67/a0/3d67a053f4dc331ca2c72c551a95658f.jpg'),
--        (3, 8, 1, 2,
--         'https://ms1.relax.by/images/ebab29459d1a6f0285c3def2c89e0845/thumb/point=middle-center,w=228,h=156,q=80,watermark=false/price_photo/c1/ef/1e/c1ef1ed3e90f5b1d37e061ae337ca9b7.jpg'),
--        (4, 8, 1, 3,
--         'https://ms1.relax.by/images/ebab29459d1a6f0285c3def2c89e0845/thumb/point=middle-center,w=228,h=156,q=80,watermark=false/price_photo/16/10/a4/1610a47f84c0f838027bc7e3f12f1752.jpg'),
--        (5, 7, 1, 4,
--         'https://ms1.relax.by/images/ebab29459d1a6f0285c3def2c89e0845/thumb/point=middle-center,w=228,h=156,q=80,watermark=false/price_photo/8e/d2/6a/8ed26a6318fd3a81d2eac66433644fbf.jpg'),
--        (6, 7, 1, 5,
--         'https://ms1.relax.by/images/ebab29459d1a6f0285c3def2c89e0845/thumb/point=middle-center,w=228,h=156,q=80,watermark=false/price_photo/e0/99/26/e099262514f725535ec16e9c1cfb64cf.jpg'),
--        (7, 7, 1, 5,
--         'https://ms1.relax.by/images/ebab29459d1a6f0285c3def2c89e0845/thumb/point=middle-center,w=228,h=156,q=80,watermark=false/price_photo/7d/e5/b8/7de5b8ecf5bbcc9bd8753a98a204afba.jpg'),
--        (9, 16, 1, 6,
--         'https://ms1.relax.by/images/ebab29459d1a6f0285c3def2c89e0845/thumb/point=middle-center,w=228,h=156,q=80,watermark=false/price_photo/9f/d8/9f/9fd89f880bb76a9a508fa66f438d366c.jpg'),
--        (10, 8, 1, 7,
--         'https://ms1.relax.by/images/ebab29459d1a6f0285c3def2c89e0845/thumb/point=middle-center,w=228,h=156,q=80,watermark=false/price_photo/df/cd/a0/dfcda0ea45dd292ab3c405cb7ee12827.jpg'),
--        (11, 9, 1, 8,
--         'https://ms1.relax.by/images/ebab29459d1a6f0285c3def2c89e0845/thumb/point=middle-center,w=228,h=156,q=80,watermark=false/price_photo/83/e5/90/83e5907c45cf5e9338811d40c513c99d.jpg'),
--        (12, 6, 1, 9,
--         'https://ms1.relax.by/images/ebab29459d1a6f0285c3def2c89e0845/thumb/point=middle-center,w=228,h=156,q=80,watermark=false/price_photo/51/29/ac/5129ac06f1bb9f9654ac91ecc6e27d07.jpg'),
--        (13, 6, 1, 10,
--         'https://ms1.relax.by/images/ebab29459d1a6f0285c3def2c89e0845/thumb/point=middle-center,w=228,h=156,q=80,watermark=false/price_photo/f4/dd/05/f4dd05ae4de0ecd40d54e946b332da2b.jpg'),
--        (15, 10, 1, 11,
--         'https://ms1.relax.by/images/ebab29459d1a6f0285c3def2c89e0845/thumb/point=middle-center,w=228,h=156,q=80,watermark=false/price_photo/c0/b4/07/c0b407a531aa1409c030c2ced8172800.jpg'),
--        (16, 6, 1, 12,
--         'https://ms1.relax.by/images/ebab29459d1a6f0285c3def2c89e0845/thumb/point=middle-center,w=228,h=156,q=80,watermark=false/price_photo/ec/aa/a5/ecaaa58d838d63a9c8b0bc49b559df68.jpg'),
--        (17, 10, 1, 13,
--         'https://ms1.relax.by/images/ebab29459d1a6f0285c3def2c89e0845/thumb/point=middle-center,w=228,h=156,q=80,watermark=false/price_photo/bf/89/44/bf894443e1425cc135c9702fdeacdd91.jpg'),
--        (18, 19, 1, 14,
--         'https://ms1.relax.by/images/ebab29459d1a6f0285c3def2c89e0845/thumb/point=middle-center,w=228,h=156,q=80,watermark=false/price_photo/ff/3b/4d/ff3b4d2aad954dd6e8f0f32ddf0e4e9e.jpg'),
--        (19, 16, 1, 15,
--         'https://ms1.relax.by/images/ebab29459d1a6f0285c3def2c89e0845/thumb/point=middle-center,w=228,h=156,q=80,watermark=false/price_photo/3d/dd/50/3ddd505bdacc4779bd01f4c66c485a93.jpg'),
--
--        (54, 20, 1, 16,
--         'https://ms1.relax.by/images/ebab29459d1a6f0285c3def2c89e0845/thumb/point=middle-center,w=228,h=156,q=80,watermark=false/price_photo/a3/c1/b2/a3c1b2eda6b4c4d1c82d601746204f02.jpg'),
--        (56, 35, 1, 17,
--         'https://ms1.relax.by/images/ebab29459d1a6f0285c3def2c89e0845/thumb/point=middle-center,w=228,h=156,q=80,watermark=false/price_photo/5c/b0/69/5cb06906928fd47c006d60ba6e8f887c.jpg'),
--        (57, 24, 1, 18,
--         'https://ms1.relax.by/images/ebab29459d1a6f0285c3def2c89e0845/thumb/point=middle-center,w=228,h=156,q=80,watermark=false/price_photo/7a/5c/13/7a5c138c14c2fd98f6c63838ef2d6552.jpg'),
--        (59, 22, 1, 19,
--         'https://ms1.relax.by/images/ebab29459d1a6f0285c3def2c89e0845/thumb/point=middle-center,w=228,h=156,q=80,watermark=false/price_photo/60/66/03/606603fed9accfed22a7bb72f8a51483.jpg'),
--        (60, 25, 1, 20,
--         'https://ms1.relax.by/images/ebab29459d1a6f0285c3def2c89e0845/thumb/point=middle-center,w=228,h=156,q=80,watermark=false/price_photo/92/86/fb/9286fbe5e054340eaa4350e00b5f2875.jpg'),
--        (61, 22, 1, 21,
--         'https://ms1.relax.by/images/ebab29459d1a6f0285c3def2c89e0845/thumb/point=middle-center,w=228,h=156,q=80,watermark=false/price_photo/0d/74/2a/0d742a8cd858ad1dc2a8f5800d906294.jpg'),
--        (62, 35, 1, 22,
--         'https://ms1.relax.by/images/ebab29459d1a6f0285c3def2c89e0845/thumb/point=middle-center,w=228,h=156,q=80,watermark=false/price_photo/fd/d4/d2/fdd4d28fe3ddb12822e664b6ec223748.jpg'),
--        (63, 23, 1, 23,
--         'https://ms1.relax.by/images/ebab29459d1a6f0285c3def2c89e0845/thumb/point=middle-center,w=228,h=156,q=80,watermark=false/price_photo/06/5f/ee/065fee34562c31e5ffa27c3a83331f56.jpg'),
--        (64, 20, 1, 24,
--         'https://ms1.relax.by/images/ebab29459d1a6f0285c3def2c89e0845/thumb/point=middle-center,w=228,h=156,q=80,watermark=false/price_photo/a3/c1/b2/a3c1b2eda6b4c4d1c82d601746204f02.jpg'),
--        (66, 35, 1, 25,
--         'https://ms1.relax.by/images/ebab29459d1a6f0285c3def2c89e0845/thumb/point=middle-center,w=228,h=156,q=80,watermark=false/price_photo/5c/b0/69/5cb06906928fd47c006d60ba6e8f887c.jpg'),
--        (67, 24, 1, 26,
--         'https://ms1.relax.by/images/ebab29459d1a6f0285c3def2c89e0845/thumb/point=middle-center,w=228,h=156,q=80,watermark=false/price_photo/7a/5c/13/7a5c138c14c2fd98f6c63838ef2d6552.jpg');


INSERT INTO currency(id, name, item_description_id)
VALUES (1, 'BYN', 1),
       (3, 'EUR', 2),
       (5, 'RUB', 3),
       (4, 'UAH', 4),
       (2, 'USD', 5),
       (6, 'BYN', 6),
       (7, 'BYN', 7),
       (8, 'BYN', 8),
       (9, 'BYN', 9),
       (10, 'BYN', 10),
       (11, 'BYN', 11),
       (12, 'BYN', 12),
       (13, 'BYN', 13),
       (14, 'BYN', 14),
       (15, 'BYN', 15),
       (16, 'BYN', 16),
       (17, 'BYN', 17),
       (18, 'BYN', 18),
       (19, 'BYN', 19),
       (20, 'BYN', 20),
       (21, 'BYN', 21),
       (22, 'BYN', 22),
       (23, 'BYN', 23),
       (24, 'BYN', 24),
       (25, 'BYN', 25),
       (26, 'BYN', 26),
       (27, 'BYN', 27),
       (28, 'BYN', 28),
       (29, 'BYN', 29),
       (30, 'BYN', 30),
       (31, 'BYN', 31),
       (32, 'BYN', 32),
       (33, 'BYN', 33),
       (34, 'BYN', 34),
       (35, 'BYN', 35),
       (36, 'BYN', 36),
       (37, 'BYN', 37),
       (38, 'BYN', 38),
       (39, 'BYN', 39),
       (40, 'BYN', 40),
       (41, 'BYN', 41),
       (42, 'BYN', 42),
       (43, 'BYN', 43),
       (44, 'BYN', 44),
       (45, 'BYN', 45),
       (46, 'BYN', 46),
       (47, 'BYN', 47),
       (48, 'BYN', 48),
       (49, 'BYN', 49),
       (50, 'BYN', 50),
       (51, 'BYN', 51),
       (52, 'BYN', 52),
       (53, 'BYN', 53),
       (54, 'BYN', 54),
       (55, 'BYN', 55),
       (56, 'BYN', 56),
       (57, 'BYN', 57),
       (58, 'BYN', 58),
       (59, 'BYN', 59),
       (60, 'BYN', 60),
       (61, 'BYN', 61),
       (62, 'BYN', 62),
       (63, 'BYN', 63),
       (64, 'BYN', 64),
       (65, 'BYN', 65),
       (66, 'BYN', 66),
       (67, 'BYN', 67),
       (68, 'BYN', 68),
       (69, 'BYN', 69),
       (70, 'BYN', 70),
       (71, 'BYN', 71),
       (72, 'BYN', 72),
       (73, 'BYN', 73),
       (74, 'BYN', 74),
       (75, 'BYN', 75),
       (76, 'BYN', 76),
       (77, 'BYN', 77),
       (78, 'BYN', 78),
       (79, 'BYN', 79),
       (80, 'BYN', 80),
       (81, 'BYN', 81),
       (82, 'BYN', 82),
       (83, 'BYN', 83),
       (84, 'BYN', 84),
       (85, 'BYN', 85),
       (86, 'BYN', 86),
       (87, 'BYN', 87),
       (88, 'BYN', 88),
       (89, 'BYN', 89),
       (90, 'BYN', 90);



INSERT INTO menu_item (id, item_description_id, place_id, name)
VALUES (33542, 1, 2, 'Говядина под сливочно-грибным соусом'),
       (33543, 2, 1, 'Стейк из говядины с рукколой и лимоном'),
       (33544, 3, 3, 'Шницель свиной'),
       (33545, 4, 4, 'Свинина с черносливом, перцем и грецким орехом'),
       (33546, 5, 5, 'Свиные жареные ребрышки в пикантной глазури'),
       (33547, 6, 6, 'Стейк из свинины'),
       (33548, 7, 7, 'Свиная отбивная с грибами и сыром'),
       (33549, 8, 8, 'Курица по - Аджарски с овощами'),
       (33550, 9, 9, 'Стейк из птицы'),
       (33551, 10, 10, 'Утка с фруктами-гриль под клюквенным соусом'),
       (33552, 1, 11, 'Филе индейки, запеченое с сыром и яблоком'),
       (33553, 12, 12, 'Бифштекс из курицы'),
       (33554, 13, 13, 'Куринша с лимоном и зеленью'),
       (33556, 15, 15, 'Дорадо, фаршированная оливками и овощами'),
       (33557, 16, 16, 'Окунь морской запеченый с шампиньонами под сырным соусом'),
       (33558, 17, 17, 'Сибас запеченный целиком с лимоном и зеленью'),
       (33559, 18, 18, 'Стейк из семги с зеленью и лимоном'),
       (33560, 19, 19, 'Скумбрия с овощами и грибами'),
       (33561, 20, 20, 'Говядина под клюквенно-винным соусом с печеным яблоком')

