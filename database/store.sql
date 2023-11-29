create
database store;
use
store;
create table product
(
    id          int          not null auto_increment primary key,
    name        varchar(255) not null,
    brand       varchar(255) not null,
    unit        varchar(50)  not null,
    weight double not null,
    price       int default 0,
    description text         not null,
    image       text         not null,
    idCategory  int          not null
);
create table category
(
    id   int          not null auto_increment primary key,
    name varchar(255) not null
);
create table user
(
    id          int         not null auto_increment primary key,
    phoneNumber varchar(20) not null unique,
    password    varchar(50) not null
);
alter table product
    add foreign key (idCategory) references category (id);

INSERT INTO `category`
VALUES (1, 'Rau-củ-quả'),
       (2, 'Thịt tươi sống');

INSERT INTO `product`
VALUES (1, 'Rau cải cúc Vietgap 500g_LT', 'Đang cập nhật', 'Túi', 0, 19000,
        'Rau cải cúc Vietgap 500g\n\nĐơn vị chịu trách nghiệm: Hợp tác xã sản xuất và kinh doanh nông sản sạch Lâm Thao\n\nXuất xứ: Phú Thọ\n\nĐịnh lượng: 500g/túi\n\nThành phần: Rau cải cúc Vietgap 500g\n\nLưu ý: Không sử dụng khi sản phẩm có dấu hiệu hư hỏng\n\nHướng dẫn sử dụng: Ăn liền\n\nHướng dẫn bảo quản: Tủ mát\n\nCải cúc Vietgap do Sói Biển cung cấp cam kết tuân thủ những nguyên tắc, trình tự, thủ  tục hướng dẫn sản xuất, thu hoạch, xử lý sau thu hoạch nhằm đảm bảo an toàn, loại bỏ hoàn toàn các mối lo về thuốc trừ sâu, thuốc kích thích tăng trưởng, đảm bảo tiêu chí ngon, an toàn thực phẩm.\n\nHướng dẫn bảo quản\n\n-Bảo quản cải cúc trong ngăn mát tủ lạnh.\n\n-Rửa sạch cải cúc trước khi chế biến nhưng không nên ngâm nước quá lâu\n\nGiá trị dinh dưỡng\n\nRau cải cúc hay tên gọi khác là Tần Ô được biết đến như một bài thuốc tự nhiên, một loài thực vật có hàm lượng dinh dưỡng cao. Ngoài việc giàu vitamin, caroten, canxi, phốt pho, sắt, chất xơ thô tác tác dụng chữa tăng huyết áp, trị cảm cúm, ho dai dẳng, trị đau đầu, trị ho ở Trẻ em,...Đặc biệt giúp kích thích ăn uống dành cho các bạn nhỏ .\n\nLưu ý: Những người có thể trạng lạnh, hay bị lạnh bụng, tiêu chảy thì nên hạn chế ăn cải cúc.\n\nCách chế biến ngon\n\nCải cúc là loại rau dễ ăn, dễ chế biến và có chứa hàm lượng dinh dưỡng cao. Có thể chế biến thành nhiều món như: cải cúc xào thịt băm, cải cúc xào tỏi, cải cúc xào cà chua, canh thịt cải cúc, hoặc nhúng lẩu.',
        'https://lh3.googleusercontent.com/3Rt7Pe_nmWSrHOG_-iT1aoWEhUZzFa2CFAq4OvwbXtflT6I-A9xPoKimhRDkiRdJU76sGMPmarT2QUA-4QC_KnUB7JovgWE=w500-rw',
        1);


