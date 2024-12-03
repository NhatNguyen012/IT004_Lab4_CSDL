----------HomeWork buổi số 4----------
USE Lab1HomeWORK;
GO
-- Tạo bảng Chuyên gia
CREATE TABLE ChuyenGia (
    MaChuyenGia INT PRIMARY KEY,
    HoTen NVARCHAR(100),
    NgaySinh DATE,
    GioiTinh NVARCHAR(10),
    Email NVARCHAR(100),
    SoDienThoai NVARCHAR(20),
    ChuyenNganh NVARCHAR(50),
    NamKinhNghiem INT
);
GO

-- Tạo bảng Công ty
CREATE TABLE CongTy (
    MaCongTy INT PRIMARY KEY,
    TenCongTy NVARCHAR(100),
    DiaChi NVARCHAR(200),
    LinhVuc NVARCHAR(50),
    SoNhanVien INT
);
GO

-- Tạo bảng Dự án
CREATE TABLE DuAn (
    MaDuAn INT PRIMARY KEY,
    TenDuAn NVARCHAR(200),
    MaCongTy INT,
    NgayBatDau DATE,
    NgayKetThuc DATE,
    TrangThai NVARCHAR(50),
    FOREIGN KEY (MaCongTy) REFERENCES CongTy(MaCongTy)
);
GO

-- Tạo bảng Kỹ năng
CREATE TABLE KyNang (
    MaKyNang INT PRIMARY KEY,
    TenKyNang NVARCHAR(100),
    LoaiKyNang NVARCHAR(50)
);
GO

-- Tạo bảng Chuyên gia - Kỹ năng
CREATE TABLE ChuyenGia_KyNang (
    MaChuyenGia INT,
    MaKyNang INT,
    CapDo INT,
    PRIMARY KEY (MaChuyenGia, MaKyNang),
    FOREIGN KEY (MaChuyenGia) REFERENCES ChuyenGia(MaChuyenGia),
    FOREIGN KEY (MaKyNang) REFERENCES KyNang(MaKyNang)
);
GO

-- Tạo bảng Chuyên gia - Dự án
CREATE TABLE ChuyenGia_DuAn (
    MaChuyenGia INT,
    MaDuAn INT,
    VaiTro NVARCHAR(50),
    NgayThamGia DATE,
    PRIMARY KEY (MaChuyenGia, MaDuAn),
    FOREIGN KEY (MaChuyenGia) REFERENCES ChuyenGia(MaChuyenGia),
    FOREIGN KEY (MaDuAn) REFERENCES DuAn(MaDuAn)
);
GO

-- Chèn dữ liệu mẫu vào bảng Chuyên gia
INSERT INTO ChuyenGia (MaChuyenGia, HoTen, NgaySinh, GioiTinh, Email, SoDienThoai, ChuyenNganh, NamKinhNghiem)
VALUES 
(1, N'Nguyễn Văn An', '1985-05-10', N'Nam', 'nguyenvanan@email.com', '0901234567', N'Phát triển phần mềm', 10),
(2, N'Trần Thị Bình', '1990-08-15', N'Nữ', 'tranthiminh@email.com', '0912345678', N'An ninh mạng', 7),
(3, N'Lê Hoàng Cường', '1988-03-20', N'Nam', 'lehoangcuong@email.com', '0923456789', N'Trí tuệ nhân tạo', 9),
(4, N'Phạm Thị Dung', '1992-11-25', N'Nữ', 'phamthidung@email.com', '0934567890', N'Khoa học dữ liệu', 6),
(5, N'Hoàng Văn Em', '1987-07-30', N'Nam', 'hoangvanem@email.com', '0945678901', N'Điện toán đám mây', 8),
(6, N'Ngô Thị Phượng', '1993-02-14', N'Nữ', 'ngothiphuong@email.com', '0956789012', N'Phân tích dữ liệu', 5),
(7, N'Đặng Văn Giang', '1986-09-05', N'Nam', 'dangvangiang@email.com', '0967890123', N'IoT', 11),
(8, N'Vũ Thị Hương', '1991-12-20', N'Nữ', 'vuthihuong@email.com', '0978901234', N'UX/UI Design', 7),
(9, N'Bùi Văn Inh', '1989-04-15', N'Nam', 'buivaninch@email.com', '0989012345', N'DevOps', 8),
(10, N'Lý Thị Khánh', '1994-06-30', N'Nữ', 'lythikhanh@email.com', '0990123456', N'Blockchain', 4);
GO

-- Chèn dữ liệu mẫu vào bảng Công ty
INSERT INTO CongTy (MaCongTy, TenCongTy, DiaChi, LinhVuc, SoNhanVien)
VALUES 
(1, N'TechViet Solutions', N'123 Đường Lê Lợi, TP.HCM', N'Phát triển phần mềm', 200),
(2, N'DataSmart Analytics', N'456 Đường Nguyễn Huệ, Hà Nội', N'Phân tích dữ liệu', 150),
(3, N'CloudNine Systems', N'789 Đường Trần Hưng Đạo, Đà Nẵng', N'Điện toán đám mây', 100),
(4, N'SecureNet Vietnam', N'101 Đường Võ Văn Tần, TP.HCM', N'An ninh mạng', 80),
(5, N'AI Innovate', N'202 Đường Lý Tự Trọng, Hà Nội', N'Trí tuệ nhân tạo', 120);
GO

-- Chèn dữ liệu mẫu vào bảng Dự án
INSERT INTO DuAn (MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai)
VALUES 
(1, N'Phát triển ứng dụng di động cho ngân hàng', 1, '2023-01-01', '2023-06-30', N'Hoàn thành'),
(2, N'Xây dựng hệ thống phân tích dữ liệu khách hàng', 2, '2023-03-15', '2023-09-15', N'Đang thực hiện'),
(3, N'Triển khai giải pháp đám mây cho doanh nghiệp', 3, '2023-02-01', '2023-08-31', N'Đang thực hiện'),
(4, N'Nâng cấp hệ thống bảo mật cho tập đoàn viễn thông', 4, '2023-04-01', '2023-10-31', N'Đang thực hiện'),
(5, N'Phát triển chatbot AI cho dịch vụ khách hàng', 5, '2023-05-01', '2023-11-30', N'Đang thực hiện');
GO

-- Chèn dữ liệu mẫu vào bảng Kỹ năng
INSERT INTO KyNang (MaKyNang, TenKyNang, LoaiKyNang)
VALUES 
(1, 'Java', N'Ngôn ngữ lập trình'),
(2, 'Python', N'Ngôn ngữ lập trình'),
(3, 'Machine Learning', N'Công nghệ'),
(4, 'AWS', N'Nền tảng đám mây'),
(5, 'Docker', N'Công cụ'),
(6, 'Kubernetes', N'Công cụ'),
(7, 'SQL', N'Cơ sở dữ liệu'),
(8, 'NoSQL', N'Cơ sở dữ liệu'),
(9, 'React', N'Framework'),
(10, 'Angular', N'Framework');
GO

-- 76. Liệt kê top 3 chuyên gia có nhiều kỹ năng nhất và số lượng kỹ năng của họ.
SELECT TOP 3 
    CG.HoTen,
    COUNT(CGKN.MaKyNang) AS SoLuongKyNang
FROM ChuyenGia CG
INNER JOIN ChuyenGia_KyNang CGKN ON CG.MaChuyenGia = CGKN.MaChuyenGia
GROUP BY CG.HoTen
ORDER BY SoLuongKyNang DESC;
GO
-- 77. Tìm các cặp chuyên gia có cùng chuyên ngành và số năm kinh nghiệm chênh lệch không quá 2 năm.
SELECT 
    CG1.HoTen AS ChuyenGia1,
    CG2.HoTen AS ChuyenGia2,
    CG1.ChuyenNganh,
    ABS(CG1.NamKinhNghiem - CG2.NamKinhNghiem) AS ChenhLechNam
FROM ChuyenGia CG1
INNER JOIN ChuyenGia CG2 
    ON CG1.MaChuyenGia < CG2.MaChuyenGia
    AND CG1.ChuyenNganh = CG2.ChuyenNganh
    AND ABS(CG1.NamKinhNghiem - CG2.NamKinhNghiem) <= 2;
GO

-- 78. Hiển thị tên công ty, số lượng dự án và tổng số năm kinh nghiệm của các chuyên gia tham gia dự án của công ty đó.
SELECT 
    CTY.TenCongTy,
    COUNT(DISTINCT DA.MaDuAn) AS SoLuongDuAn,
    SUM(DISTINCT CG.NamKinhNghiem) AS TongNamKinhNghiem
FROM CongTy CTY
INNER JOIN DuAn DA ON CTY.MaCongTy = DA.MaCongTy
INNER JOIN ChuyenGia_DuAn CGDA ON DA.MaDuAn = CGDA.MaDuAn
INNER JOIN ChuyenGia CG ON CGDA.MaChuyenGia = CG.MaChuyenGia
GROUP BY CTY.TenCongTy;
GO

-- 79. Tìm các chuyên gia có ít nhất một kỹ năng cấp độ 5 nhưng không có kỹ năng nào dưới cấp độ 3.
SELECT DISTINCT CG.HoTen
FROM ChuyenGia CG
INNER JOIN ChuyenGia_KyNang CGKN ON CG.MaChuyenGia = CGKN.MaChuyenGia
WHERE CGKN.CapDo = 5
    AND CG.MaChuyenGia NOT IN (
        SELECT MaChuyenGia 
        FROM ChuyenGia_KyNang 
        WHERE CapDo < 3
    );
GO

-- 80. Liệt kê các chuyên gia và số lượng dự án họ tham gia, bao gồm cả những chuyên gia không tham gia dự án nào.
SELECT 
    CG.HoTen,
    COUNT(CGDA.MaDuAn) AS SoLuongDuAn
FROM ChuyenGia CG
LEFT JOIN ChuyenGia_DuAn CGDA ON CG.MaChuyenGia = CGDA.MaChuyenGia
GROUP BY CG.HoTen;
GO

-- 81*. Tìm chuyên gia có kỹ năng ở cấp độ cao nhất trong mỗi loại kỹ năng.
SELECT 
    KN.LoaiKyNang,
    KN.TenKyNang,
    CG.HoTen AS ChuyenGia,
    CGKN.CapDo
FROM ChuyenGia_KyNang CGKN
JOIN KyNang KN ON CGKN.MaKyNang = KN.MaKyNang
JOIN ChuyenGia CG ON CGKN.MaChuyenGia = CG.MaChuyenGia
WHERE CGKN.CapDo = (
    SELECT MAX(CGKN2.CapDo)
    FROM ChuyenGia_KyNang CGKN2
    JOIN KyNang KN2 ON CGKN.MaKyNang = KN2.MaKyNang
    WHERE KN2.LoaiKyNang = KN.LoaiKyNang
);
GO

-- 82. Tính tỷ lệ phần trăm của mỗi chuyên ngành trong tổng số chuyên gia.
SELECT 
    ChuyenNganh,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ChuyenGia) AS TyLePhanTram
FROM ChuyenGia
GROUP BY ChuyenNganh;
GO

-- 83. Tìm các cặp kỹ năng thường xuất hiện cùng nhau nhất trong hồ sơ của các chuyên gia.
SELECT 
    KN1.TenKyNang AS KyNang1,
    KN2.TenKyNang AS KyNang2,
    COUNT(*) AS SoLanCungXuatHien
FROM ChuyenGia_KyNang CGKN1
INNER JOIN ChuyenGia_KyNang CGKN2 
    ON CGKN1.MaChuyenGia = CGKN2.MaChuyenGia 
    AND CGKN1.MaKyNang < CGKN2.MaKyNang
INNER JOIN KyNang KN1 ON CGKN1.MaKyNang = KN1.MaKyNang
INNER JOIN KyNang KN2 ON CGKN2.MaKyNang = KN2.MaKyNang
GROUP BY KN1.TenKyNang, KN2.TenKyNang
ORDER BY SoLanCungXuatHien DESC;
GO

-- 84. Tính số ngày trung bình giữa ngày bắt đầu và ngày kết thúc của các dự án cho mỗi công ty.
SELECT 
    CTY.TenCongTy,
    AVG(DATEDIFF(DAY, DA.NgayBatDau, DA.NgayKetThuc)) AS SoNgayTrungBinh
FROM CongTy CTY
INNER JOIN DuAn DA ON CTY.MaCongTy = DA.MaCongTy
GROUP BY CTY.TenCongTy;
GO

-- 85*. Tìm chuyên gia có sự kết hợp độc đáo nhất của các kỹ năng (kỹ năng mà chỉ họ có).
SELECT 
    CG.HoTen,
    STRING_AGG(KN.TenKyNang, ', ') AS DanhSachKyNang
FROM ChuyenGia CG
LEFT JOIN ChuyenGia_KyNang CGKN ON CG.MaChuyenGia = CGKN.MaChuyenGia
LEFT JOIN KyNang KN ON CGKN.MaKyNang = KN.MaKyNang
GROUP BY CG.HoTen;
GO

-- 86*. Tạo một bảng xếp hạng các chuyên gia dựa trên số lượng dự án và tổng cấp độ kỹ năng.
SELECT 
    CG.HoTen,
    COUNT(DISTINCT CGDA.MaDuAn) AS SoLuongDuAn,
    SUM(CGKN.CapDo) AS TongCapDoKyNang,
    RANK() OVER (ORDER BY COUNT(DISTINCT CGDA.MaDuAn) DESC, SUM(CGKN.CapDo) DESC) AS XepHang
FROM ChuyenGia CG
LEFT JOIN ChuyenGia_DuAn CGDA ON CG.MaChuyenGia = CGDA.MaChuyenGia
LEFT JOIN ChuyenGia_KyNang CGKN ON CG.MaChuyenGia = CGKN.MaChuyenGia
GROUP BY CG.HoTen;
GO

-- 87. Tìm các dự án có sự tham gia của chuyên gia từ tất cả các chuyên ngành.
SELECT 
    DA.TenDuAn
FROM DuAn DA
INNER JOIN ChuyenGia_DuAn CGDA ON DA.MaDuAn = CGDA.MaDuAn
INNER JOIN ChuyenGia CG ON CGDA.MaChuyenGia = CG.MaChuyenGia
GROUP BY DA.TenDuAn
HAVING COUNT(DISTINCT CG.ChuyenNganh) = (SELECT COUNT(DISTINCT ChuyenNganh) FROM ChuyenGia);
GO

-- 88. Tính tỷ lệ thành công của mỗi công ty dựa trên số dự án hoàn thành so với tổng số dự án.
SELECT 
    ct.TenCongTy,
    CAST(SUM(CASE WHEN da.TrangThai = N'Hoàn thành' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(da.MaDuAn) * 100 AS TyLeThanhCong
FROM CongTy ct
JOIN DuAn da ON ct.MaCongTy = da.MaCongTy
GROUP BY ct.TenCongTy;
GO