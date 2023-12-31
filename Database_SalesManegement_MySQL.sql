CREATE database QLBH;

USE QLBH;

CREATE TABLE QUANTRIVIEN (

    ID_QUANTRIVIEN INT not null PRIMARY KEY auto_increment,
    TENQUANTRIVIEN VARCHAR(50),
    SODIENTHOAI VARCHAR(12),
    EMAIL VARCHAR(50),
    MATKHAU VARCHAR(30),
    NGAYSINH DATE,
    UNIQUE KEY ID_QUANTRIVIEN_UNIQUE_KEY (ID_QUANTRIVIEN),
    UNIQUE KEY EMAIL_QUANTRIVIEN_UNIQUE_KEY (EMAIL)
);

CREATE TABLE KHACHHANG (
    ID_KHACHHANG INT not null PRIMARY KEY auto_increment,
    TENKHACHHANG VARCHAR(50),
    DIACHI VARCHAR(70),
    SODIENTHOAI VARCHAR(12),
    NGAYSINH DATE,
    NGAYDANGKY DATE,
    DIEM double,
    UNIQUE KEY ID_KHACHHANG_UNIQUE_KEY (ID_KHACHHANG),
    UNIQUE KEY SDT_KHACHHANG_UNIQUE_KEY (SODIENTHOAI)
);

CREATE TABLE NHANVIEN (
	ID_NHANVIEN INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    TENNHANVIEN VARCHAR(50),
    DIACHI VARCHAR(70),
    SODIENTHOAI VARCHAR(12),
    EMAIL VARCHAR(50),
    MATKHAU VARCHAR(50),
    NGAYSINH DATE,
    UNIQUE KEY ID_NHANVIEN_UNIQUE_KEY (ID_NHANVIEN),
    UNIQUE KEY EMAIL_UNIQUE_KEY (EMAIL)
);

CREATE TABLE DOANHTHU_NHANVIEN (
	ID_NHANVIEN INT NOT NULL  ,
    THANG int,
	DOANHTHU DOUBLE,
    FOREIGN KEY (ID_NHANVIEN) REFERENCES NHANVIEN (ID_NHANVIEN) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE NHACUNGCAP (
    ID_NHACUNGCAP INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    TENNHACUNGCAP VARCHAR(50),
    DIACHI VARCHAR(50),
    SODIENTHOAI VARCHAR(50),
    EMAIL VARCHAR(50),
    UNIQUE KEY ID_NHACUNGCAP_UNIQUE_KEY (ID_NHACUNGCAP),
    UNIQUE KEY SDT_NHACUNGCAP_UNIQUE_KEY (SODIENTHOAI),
    UNIQUE KEY EMAIL_UNIQUE_KEY (EMAIL)
);

CREATE TABLE DANHMUCSANPHAM (
    ID_DANHMUC INT PRIMARY KEY AUTO_INCREMENT,
    TENDANHMUC VARCHAR(50) NOT NULL,
    MOTA VARCHAR(200),
    UNIQUE KEY TENDANHMUC_DANHMUC_KEY (TENDANHMUC),
    UNIQUE KEY ID_DANHMUC_UNIQUE_KEY (ID_DANHMUC)
);
CREATE TABLE SANPHAM (
    ID_SANPHAM INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    TENSANPHAM VARCHAR(50),
    TENDANHMUC VARCHAR(50),
    TENNHACUNGCAP VARCHAR(50),
    GIA DOUBLE,
    SOLUONG INT,
    ID_DANHMUC INT,
    ID_NHACUNGCAP INT,
    UNIQUE KEY ID_SANPHAM_UNIQUE_KEY (ID_SANPHAM),
    UNIQUE KEY TEN_SANPHAM_UNIQUE_KEY (TENSANPHAM),
    FOREIGN KEY (ID_DANHMUC) REFERENCES DANHMUCSANPHAM (ID_DANHMUC) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ID_NHACUNGCAP) REFERENCES NHACUNGCAP (ID_NHACUNGCAP) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE HOADON (
    ID_HOADON INT NOT NULL AUTO_INCREMENT PRIMARY KEY,    
    TENKHACHHANG VARCHAR(50),
    SODIENTHOAI VARCHAR(12),
    GIA DOUBLE,
    NGAYMUA DATE,
    ID_KHACHHANG INT,
    ID_NHANVIEN INT,
    UNIQUE KEY ID_HOADON_UNIQUE_KEY (ID_HOADON),
	FOREIGN KEY (ID_KHACHHANG) REFERENCES KHACHHANG (ID_KHACHHANG) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ID_NHANVIEN) REFERENCES NHANVIEN (ID_NHANVIEN) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE CTHD (
	ID_HOADON INT NOT NULL,
    STT INT,
    TENSANPHAM VARCHAR(50),
    SOLUONG INT,
    GIATONG DOUBLE,
    ID_SANPHAM INT,
    FOREIGN KEY (ID_HOADON) REFERENCES HOADON (ID_HOADON) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ID_SANPHAM) REFERENCES SANPHAM (ID_SANPHAM) ON DELETE CASCADE ON UPDATE CASCADE
   
);

INSERT INTO QUANTRIVIEN (TENQUANTRIVIEN, SODIENTHOAI, EMAIL, MATKHAU, NGAYSINH)
VALUES ('Nguyen Van An', '0123456789', 'An@gmail.com', '123', '1990-01-01');

INSERT INTO KHACHHANG (TENKHACHHANG, DIACHI, SODIENTHOAI, NGAYSINH, NGAYDANGKY, DIEM) VALUES
('Phạm Thị Dung', '321 Đường Trần Hưng Đạo', '09897876876', '1988-12-25', '2022-05-28', 14.95999),
('Hoàng Văn Em', '654 Đường Nguyễn Hữu Cầu', '09978433366', '1992-09-18', '2020-05-12', 5),
('Ngô Thị Hà', '987 Đường Lý Thường Kiệt', '08863356655', '1993-06-05', '2013-11-30', 7.1099499999999995),
('Vũ Văn Giang', '741 Đường Lê Đức Thọ', '0988865335', '1997-04-12', '2013-08-25', 3.3),
('Đặng Thị Hà', '852 Đường Nguyễn Thái Sơn', '09997647777', '1984-11-30', '2018-02-21', 0),
('Bùi Văn Vinh', '963 Đường Lê Văn Việt', '0123452565', '1990-03-20', '2019-05-31', 2.067),
('Vũ Trung Quân', '741 Đường Lê Nin', '0999333212', '1987-04-12', '2014-08-25', 20.39998),
('Nguyễn Thu Hà', '852 Đường Nguyễn Thái Sơn', '0999333216', '1989-11-30', '2018-02-22', 7.52999),
('Lê Văn Vinh', '333 Đường Đại Cồ Việt', '0333833215', '1991-03-20', '2019-05-31', 4.05998);

    
INSERT INTO NHANVIEN (TENNHANVIEN, DIACHI, SODIENTHOAI, EMAIL, MATKHAU, NGAYSINH)
VALUES
    ('Phạm Thị Dung', '321 Đường Trần Hưng Đạo', '09897876876', 'Dung@gmail.com', '12345', '1988-12-25'),
    ('Nguyễn Văn An', '123 Đường Nguyễn Du', '0987654321', 'nva@gmail.com', 'abcde', '1990-01-01'),
    ('Trần Thị Bình', '456 Đường Lê Lợi', '0123456789', 'ttb@gmail.com', 'fghij', '1992-03-15'),
    ('Lê Văn Cường', '789 Đường Ngô Quyền', '0912345678', 'lvc@gmail.com', 'klmno', '1985-07-20'),
    ('Hoàng Thị Dung', '321 Đường Lý Thường Kiệt', '0999888777', 'htd@gmail.com', 'pqrst', '1987-11-11'),
    ('Trần Văn Em', '654 Đường Trần Phú', '0777888999', 'tve@gmail.com', 'uvwxyz', '1995-05-05'),
    ('Phạm Thị Phi', '987 Đường Hùng Vương', '0833333333', 'ptf@gmail.com', '123456', '1998-09-10'),
    ('Nguyễn Văn Giang', '159 Đường Lý Thái Tổ', '0666666666', 'nvg@gmail.com', 'abcdef', '1993-12-31');

INSERT INTO nhacungcap (tennhacungcap, diachi, sodienthoai, email)
VALUES
    ('Apple', 'Hoa Kỳ', '0999687654', 'apple@gmail.com'),
    ('Samsung', 'Hàn Quốc', '09998765776', 'samsung@gmail.com'),
    ('LG Electronics', 'Hàn Quốc', '0988214555', 'lgtivi@gmail.com'),
    ('Philips', 'Hà Lan', '0966666216', 'philipsgd@gmail.com'),
    ('Toyota', 'Nhật Bản', '0766777645', 'toyotaoto@gmail.com'),
    ('Volkswagen Group', 'Đức', '0986478653', 'volkswagenoto@gmail.com'),
    ('Dell', 'Hoa Kỳ', '09863356655', 'dellpc@gmail.com'),
    ('HP', 'Hoa Kỳ', '09768676442', 'hppc@gmail.com'),
    ('Louis Vuitton', 'Pháp', '0987224466', 'louisvuitton@gmail.com'),
    ('Gucci', 'Ý', '09989787444', 'gucci@gmail.com'),
    ('Zara', 'Tây Ban Nha', '0777676542', 'zara@gmail.com'),
    ('H&M', 'Thụy Điển', '0999989211', 'hm@gmail.com'),
    ('Sony', 'Nhật Bản', '08988887686', 'sonytn@gmail.com'),
    ('IKEA', 'Thụy Điển', '09999787653', 'ikea@gmail.com'),
    ('Ashley Furniture Industries', 'Hoa Kỳ', '0999777643', 'ashley@gmail.com');
    SELECT * FROM NHACUNGCAP;
    
INSERT INTO DANHMUCSANPHAM (TENDANHMUC, MOTA)
VALUES
    ('Điện thoại', 'Danh mục sản phẩm điện thoại'),
    ('Tivi', 'Danh mục sản phẩm tivi'),
    ('Thiết bị gia dụng', 'Danh mục sản phẩm thiết bị gia dụng'),
    ('Máy tính', 'Danh mục sản phẩm máy tính'),
    ('Túi xách', 'Danh mục sản phẩm túi xách'),
    ('Quần áo', 'Danh mục sản phẩm quần áo'),
    ('Tai nghe', 'Danh mục sản phẩm tai nghe'),
    ('Đồ điện', 'Danh mục sản phẩm đồ điện'),
    ('Đồng hồ', 'Danh mục sản phẩm đồng hồ'),
    ('Đồ gỗ', 'Danh mục sản phẩm đồ gỗ');
INSERT INTO SANPHAM (TENSANPHAM, TENDANHMUC, TENNHACUNGCAP, GIA, SOLUONG, ID_DANHMUC, ID_NHACUNGCAP)
VALUES
    ('iPhone 12', 'Điện thoại', 'Apple', 1000, 50, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Điện thoại'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Apple')),
    ('Galaxy S21', 'Điện thoại', 'Samsung', 900, 40, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Điện thoại'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Samsung')),
    ('V40 ThinQ', 'Điện thoại', 'LG Electronics', 800, 30, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Điện thoại'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'LG Electronics')),
    ('Xperia 1 III', 'Điện thoại', 'Sony', 1100, 35, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Điện thoại'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Sony')),
    ('Galaxy A52', 'Điện thoại', 'Samsung', 600, 30, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Điện thoại'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Samsung'));

INSERT INTO SANPHAM (TENSANPHAM, TENDANHMUC, TENNHACUNGCAP, GIA, SOLUONG, ID_DANHMUC, ID_NHACUNGCAP)
VALUES
    ('Samsung QLED 4K TV', 'Tivi', 'Samsung', 1500, 20, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Tivi'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Samsung')),
    ('LG OLED TV', 'Tivi', 'LG Electronics', 2000, 15, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Tivi'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'LG Electronics')),
    ('Samsung Crystal UHD TV', 'Tivi', 'Samsung', 1200, 30, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Tivi'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Samsung')),
    ('LG NanoCell TV', 'Tivi', 'LG Electronics', 1600, 18, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Tivi'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'LG Electronics')),
    ('Samsung The Frame TV', 'Tivi', 'Samsung', 2500, 10, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Tivi'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Samsung')),
    ('LG OLED CX TV', 'Tivi', 'LG Electronics', 2300, 12, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Tivi'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'LG Electronics'));
INSERT INTO SANPHAM (TENSANPHAM, TENDANHMUC, TENNHACUNGCAP, GIA, SOLUONG, ID_DANHMUC, ID_NHACUNGCAP)
VALUES

    ('Tủ lạnh Samsung', 'Thiết bị gia dụng', 'Samsung', 1200, 15, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Thiết bị gia dụng'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Samsung')),
    ('Bình đun nước Philips', 'Thiết bị gia dụng', 'Philips', 50, 20, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Thiết bị gia dụng'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Philips'));

INSERT INTO SANPHAM (TENSANPHAM, TENDANHMUC, TENNHACUNGCAP, GIA, SOLUONG, ID_DANHMUC, ID_NHACUNGCAP)
VALUES
    ('Laptop Dell XPS 13', 'Máy tính', 'Dell', 1500, 10, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Máy tính'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Dell')),
    ('Desktop HP Pavilion', 'Máy tính', 'HP', 1000, 15, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Máy tính'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'HP')),
    ('MacBook Pro', 'Máy tính', 'Apple', 2000, 8, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Máy tính'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Apple')),
    ('iMac 27-inch', 'Máy tính', 'Apple', 3000, 6, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Máy tính'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Apple'));
INSERT INTO SANPHAM (TENSANPHAM, TENDANHMUC, TENNHACUNGCAP, GIA, SOLUONG, ID_DANHMUC, ID_NHACUNGCAP)
VALUES
    ('Túi xách Louis Vuitton', 'Túi xách', 'Louis Vuitton', 2000, 10, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Túi xách'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Louis Vuitton')),
    ('Túi xách Gucci', 'Túi xách', 'Gucci', 1500, 15, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Túi xách'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Gucci')),
    ('Túi xách Zara', 'Túi xách', 'Zara', 500, 20, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Túi xách'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Zara')),
    ('Túi xách H&M', 'Túi xách', 'H&M', 300, 12, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Túi xách'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'H&M'));

INSERT INTO SANPHAM (TENSANPHAM, TENDANHMUC, TENNHACUNGCAP, GIA, SOLUONG, ID_DANHMUC, ID_NHACUNGCAP)
VALUES
    ('Áo phông nam', 'Quần áo', 'Zara', 29.99, 20, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Quần áo'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Zara')),
    ('Áo sơ mi nữ', 'Quần áo', 'H&M', 39.99, 15, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Quần áo'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'H&M')),
    ('Quần jeans nam', 'Quần áo', 'Louis Vuitton', 149.99, 10, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Quần áo'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Louis Vuitton')),
    ('Váy dạ hội nữ', 'Quần áo', 'Gucci', 299.99, 5, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Quần áo'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Gucci')),
    ('Áo khoác nam', 'Quần áo', 'Zara', 79.99, 12, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Quần áo'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Zara'));

INSERT INTO SANPHAM (TENSANPHAM, TENDANHMUC, TENNHACUNGCAP, GIA, SOLUONG, ID_DANHMUC, ID_NHACUNGCAP)
VALUES
    ('Tai nghe Bluetooth', 'Tai nghe', 'Sony', 59.99, 20, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Tai nghe'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Sony')),
    ('Tai nghe chụp tai', 'Tai nghe', 'Apple', 249.99, 15, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Tai nghe'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Apple')),
    ('Tai nghe True Wireless', 'Tai nghe', 'Samsung', 129.99, 10, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Tai nghe'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Samsung')),
    ('Tai nghe over-ear', 'Tai nghe', 'Sony', 199.99, 5, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Tai nghe'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Sony')),
    ('Tai nghe in-ear', 'Tai nghe', 'Apple', 99.99, 12, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Tai nghe'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Apple'));

INSERT INTO SANPHAM (TENSANPHAM, TENDANHMUC, TENNHACUNGCAP, GIA, SOLUONG, ID_DANHMUC, ID_NHACUNGCAP)
VALUES
    ('Điện thoại iPhone 13', 'Đồ điện', 'Apple', 999.99, 20, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Đồ điện'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Apple')),
    ('Smart TV 55 inch', 'Đồ điện', 'Samsung', 799.99, 15, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Đồ điện'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Samsung')),
    ('Máy giặt LG', 'Đồ điện', 'LG Electronics', 499.99, 10, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Đồ điện'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'LG Electronics')),
    ('Đèn LED Philips', 'Đồ điện', 'Philips', 29.99, 5, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Đồ điện'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Philips')),
    ('Máy tính xách tay Dell', 'Đồ điện', 'Dell', 1199.99, 12, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Đồ điện'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Dell'));

INSERT INTO SANPHAM (TENSANPHAM, TENDANHMUC, TENNHACUNGCAP, GIA, SOLUONG, ID_DANHMUC, ID_NHACUNGCAP)
VALUES
    ('Đồng hồ Apple Watch SE', 'Đồng hồ', 'Apple', 349.99, 10, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Đồng hồ'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Apple')),
    ('Đồng hồ Samsung Galaxy Watch3', 'Đồng hồ', 'Samsung', 399.99, 5, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Đồng hồ'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Samsung')),
    ('Đồng hồ LG Watch Urbane', 'Đồng hồ', 'LG Electronics', 199.99, 8, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Đồng hồ'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'LG Electronics')),
    ('Đồng hồ Philips Hue Smartwatch', 'Đồng hồ', 'Philips', 149.99, 3, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Đồng hồ'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Philips')),
    ('Đồng hồ Sony Smartwatch 3', 'Đồng hồ', 'Sony', 149.99, 12, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Đồng hồ'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Sony'));
INSERT INTO SANPHAM (TENSANPHAM, TENDANHMUC, TENNHACUNGCAP, GIA, SOLUONG, ID_DANHMUC, ID_NHACUNGCAP)
VALUES
    ('Bàn làm việc gỗ thông', 'Đồ gỗ', 'IKEA', 199.99, 10, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Đồ gỗ'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'IKEA')),
    ('Ghế gỗ sồi tự nhiên', 'Đồ gỗ', 'Ashley Furniture Industries', 149.99, 5, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Đồ gỗ'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Ashley Furniture Industries')),
    ('Tủ quần áo gỗ óc chó', 'Đồ gỗ', 'Zara', 299.99, 8, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Đồ gỗ'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Zara')),
    ('Giường ngủ gỗ thông', 'Đồ gỗ', 'H&M', 249.99, 3, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Đồ gỗ'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'H&M')),
    ('Bàn trang điểm gỗ cao cấp', 'Đồ gỗ', 'Louis Vuitton', 999.99, 12, (SELECT ID_DANHMUC FROM DANHMUCSANPHAM WHERE TENDANHMUC = 'Đồ gỗ'), (SELECT ID_NHACUNGCAP FROM NHACUNGCAP WHERE TENNHACUNGCAP = 'Louis Vuitton'));
   
INSERT INTO DOANHTHU_NHANVIEN (ID_NHANVIEN, THANG, DOANHTHU) VALUES
(1, 1, 0),
(1, 2, 0),
(1, 3, 0),
(1, 4, 0),
(1, 5, 0),
(1, 6, 14099.98),
(1, 7, 0),
(1, 8, 0),
(1, 9, 0),
(1, 10, 0),
(1, 11, 0),
(1, 12, 0),
(2, 1, 0),
(2, 2, 0),
(2, 3, 0),
(2, 4, 0),
(2, 5, 0),
(2, 6, 13559.97),
(2, 7, 2000),
(2, 8, 0),
(2, 9, 0),
(2, 10, 0),
(2, 11, 0),
(2, 12, 0),
(3, 1, 0),
(3, 2, 0),
(3, 3, 0),
(3, 4, 0),
(3, 5, 0),
(3, 6, 6529.99),
(3, 7, 0),
(3, 8, 0),
(3, 9, 0),
(3, 10, 0),
(3, 11, 0),
(3, 12, 0),
(4, 1, 0),
(4, 2, 0),
(4, 3, 0),
(4, 4, 0),
(4, 5, 0),
(4, 6, 7319.969999999999),
(4, 7, 0),
(4, 8, 0),
(4, 9, 0),
(4, 10, 0),
(4, 11, 0),
(4, 12, 0),
(5, 1, 0),
(5, 2, 0),
(5, 3, 0),
(5, 4, 0),
(5, 5, 0),
(5, 6, 0),
(5, 7, 0),
(5, 8, 0),
(5, 9, 0),
(5, 10, 0),
(5, 11, 0),
(5, 12, 0),
(6, 1, 0),
(6, 2, 0),
(6, 3, 0),
(6, 4, 0),
(6, 5, 0),
(6, 6, 7839.969999999999),
(6, 7, 0),
(6, 8, 0),
(6, 9, 0),
(6, 10, 0),
(6, 11, 0),
(6, 12, 0),
(7, 1, 0),
(7, 2, 0),
(7, 3, 0),
(7, 4, 0),
(7, 5, 0),
(7, 6, 8509.93),
(7, 7, 0),
(7, 8, 0),
(7, 9, 0),
(7, 10, 0),
(7, 11, 0),
(7, 12, 0),
(8, 1, 0),
(8, 2, 0),
(8, 3, 0),
(8, 4, 0),
(8, 5, 0),
(8, 6, 10326.99),
(8, 7, 0),
(8, 8, 0),
(8, 9, 0),
(8, 10, 0),
(8, 11, 0),
(8, 12, 0);

INSERT INTO HOADON (TENKHACHHANG, SODIENTHOAI, GIA, NGAYMUA, ID_KHACHHANG, ID_NHANVIEN)
VALUES
('Phạm Thị Dung', '09897876876', 5200, '2023-06-01', 1, 1),
('Ngô Thị Hà', '08863356655', 2199.98, '2023-06-02', 3, 1),
('Nguyễn Thu Hà', '0999333216', 6700, '2023-06-01', 8, 1),
('Vũ Trung Quân', '0999333212', 10259.98, '2023-06-08', 7, 2),
('Bùi Văn Vinh', '0123452565', 3299.99, '2023-06-05', 6, 2),
('Phạm Thị Dung', '09897876876', 5000, '2023-06-02', 1, 3),
('Nguyễn Thu Hà', '0999333216', 1529.99, '2023-06-13', 8, 3),
('Lê Văn Vinh', '0333833215', 4059.98, '2023-06-14', 9, 4),
('Hoàng Văn Em', '09978433366', 3259.99, '2023-06-05', 2, 4),
('Ngô Thị Hà', '08863356655', 3339.99, '2023-06-07', 3, 6),
('Vũ Trung Quân', '0999333212', 4499.98, '2023-06-06', 7, 6),
('Vũ Trung Quân', '0999333212', 6399.98, '2023-06-03', 7, 7),
('Ngô Thị Hà', '08863356655', 2109.95, '2023-06-01', 3, 7),
('Phạm Thị Dung', '09897876876', 4959.99, '2023-06-12', 1, 8),
('Vũ Văn Giang', '0988865335', 3300, '2023-06-08', 4, 8),
('Bùi Văn Vinh', '0123452565', 2067, '2023-06-02', 6, 8),
('Hoàng Văn Em', '09978433366', 2000, '2023-07-12', 2, 2);

INSERT INTO CTHD (ID_HOADON, STT, TENSANPHAM, SOLUONG, GIATONG, ID_SANPHAM)
VALUES
(1, 1, 'Samsung Crystal UHD TV', 1, 1200, 8),
(1, 2, 'Desktop HP Pavilion', 2, 2000, 15),
(1, 3, 'Túi xách Louis Vuitton', 1, 2000, 18),
(2, 0, 'Túi xách Gucci', 1, 1500, 19),
(2, 1, 'Máy giặt LG', 1, 499.99, 34),
(2, 2, 'Đồng hồ LG Watch Urbane', 1, 199.99, 39),
(3, 0, 'Desktop HP Pavilion', 2, 2000, 15),
(3, 1, 'iPhone 12', 2, 2000, 1),
(3, 2, 'Galaxy S21', 3, 2700, 2),
(4, 1, 'Áo phông nam', 2, 59.98, 22),
(4, 2, 'Samsung Crystal UHD TV', 3, 3600, 8),
(4, 3, 'iPhone 12', 2, 2000, 1),
(4, 4, 'LG OLED CX TV', 2, 4600, 11),
(5, 0, 'Túi xách H&M', 1, 300, 21),
(5, 1, 'iPhone 12', 2, 2000, 1),
(5, 2, 'Điện thoại iPhone 13', 1, 999.99, 32),
(6, 1, 'Samsung QLED 4K TV', 2, 3000, 6),
(6, 2, 'Túi xách Zara', 2, 1000, 20),
(6, 3, 'iPhone 12', 1, 1000, 1),
(7, 1, 'Túi xách Gucci', 1, 1500, 19),
(7, 2, 'Áo phông nam', 1, 29.99, 22),
(8, 1, 'Áo phông nam', 2, 59.98, 22),
(8, 2, 'Desktop HP Pavilion', 2, 2000, 15),
(8, 3, 'iPhone 12', 2, 2000, 1),
(9, 0, 'Galaxy A52', 2, 1200, 5),
(9, 1, 'iPhone 12', 2, 2000, 1),
(9, 2, 'Tai nghe Bluetooth', 1, 59.99, 27),
(10, 1, 'Samsung Crystal UHD TV', 2, 2400, 8),
(10, 2, 'Galaxy S21', 1, 900, 2),
(10, 3, 'Áo sơ mi nữ', 1, 39.99, 23),
(11, 1, 'Túi xách Zara', 1, 500, 20),
(11, 2, 'iPhone 12', 2, 2000, 1),
(11, 3, 'Bàn trang điểm gỗ cao cấp', 2, 1999.98, 46),
(12, 1, 'iPhone 12', 2, 2000, 1),
(12, 2, 'Samsung Crystal UHD TV', 2, 2400, 8),
(12, 3, 'Điện thoại iPhone 13', 2, 1999.98, 32),
(13, 0, 'Túi xách Gucci', 1, 1500, 19),
(13, 1, 'Áo phông nam', 2, 59.98, 22),
(13, 2, 'Đồng hồ Sony Smartwatch 3', 1, 149.99, 41),
(13, 3, 'Bàn làm việc gỗ thông', 2, 399.98, 42),
(14, 1, 'Xperia 1 III', 2, 2200, 4),
(14, 2, 'Galaxy S21', 3, 2700, 2),
(14, 3, 'Tai nghe Bluetooth', 1, 59.99, 27),
(15, 1, 'Laptop Dell XPS 13', 1, 1500, 14),
(15, 2, 'V40 ThinQ', 1, 800, 3),
(15, 3, 'Túi xách Zara', 2, 1000, 20),
(16, 0, 'Túi xách Zara', 1, 500, 20),
(16, 1, 'V40 ThinQ', 2, 1600, 3),
(17, 1, 'iPhone 12', 1, 1000, 1),
(17, 2, 'Túi xách Zara', 2, 1000, 20);
DELIMITER //
CREATE TRIGGER tr_insert_doanhthu_nhanvien
AFTER INSERT ON NHANVIEN
FOR EACH ROW
BEGIN
    DECLARE i INT DEFAULT 1;
    
    WHILE i <= 12 DO
        INSERT INTO DOANHTHU_NHANVIEN (ID_NHANVIEN, THANG, DOANHTHU) VALUES (NEW.ID_NHANVIEN, i, 0);
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;