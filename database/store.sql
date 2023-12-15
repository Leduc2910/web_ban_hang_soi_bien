-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: store
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Rau-củ-quả','https://lh3.googleusercontent.com/Tbx6y7pI3TBXLszBKa_UDfPXNWKufgrNzmalmQKEHHJ_88UWAyWQeXHPIu34GlAT1uzvNbaj26M9BPDmotQHMVZRMQ2rw1heiA=rw'),(2,'Thịt tươi sống','https://lh3.googleusercontent.com/F3vKdxaVPmRAnQha3-4U6dttbxoKG6efdBwZn56rrp4AkrbiIaZF_F1O1K4QBm_JpQ8s9QqO0w4fBLi0_gKbQrP9SFQrSASS=rw'),(3,'Thủy hải sản','https://lh3.googleusercontent.com/EVymB6noxcgaWo-OL7nrV2aTW0fb-9KhA0x7YNF8fFmStgSMGgtpHgKNTNnytkuSdjJzDEeMyLx-f7eHdl4Uc8O5Oo3yvpFZ'),(4,'Hàng đông lạnh','https://lh3.googleusercontent.com/5Dd8bolWxWh0tEtpT62IyZeugwutTQuTNAJSNQgRrAhRmCvMC_dJ1jjXKAUEHxoF10HyYXu-cLPLlFaQ1Z8aviCF11s4OpB9'),(5,'Thực phẩm khô','https://lh3.googleusercontent.com/dhwUTi4n9xpR7kM28yoTLgmQleKxiXZVohyvL4gLrDyM0AVX9XPx9Gh6_KmFvwHex34yh5AIvC_5cgmqawt9hZGjInjs0ug'),(6,'Kem - bơ - sữa - trứng','https://lh3.googleusercontent.com/78IW4RsG90dZGmhxjVPz0dDOawSHK6-lbRL_phE3MIVAUL_v0O853CD34oHJQszXebbWQ3i2PD_WRIWZ6mZWpFpWTsjtFj2l');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idUser` int NOT NULL,
  `totalPrice` double DEFAULT '0',
  `status` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_OrderUser` (`idUser`),
  CONSTRAINT `FK_OrderUser` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idOrder` int NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `phoneNumber` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `totalPrice` double DEFAULT '0',
  `status` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_OrderDetailOrder` (`idOrder`),
  CONSTRAINT `FK_OrderDetailOrder` FOREIGN KEY (`idOrder`) REFERENCES `order` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idOrder` int NOT NULL,
  `idProduct` int NOT NULL,
  `quantity` int DEFAULT '0',
  `totalPrice` double DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_OrderItemOrder` (`idOrder`),
  KEY `FK_OrderItemProduct` (`idProduct`),
  CONSTRAINT `FK_OrderItemOrder` FOREIGN KEY (`idOrder`) REFERENCES `order` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_OrderItemProduct` FOREIGN KEY (`idProduct`) REFERENCES `product` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product`
(
    `id`          int          NOT NULL AUTO_INCREMENT,
    `name`        varchar(255) NOT NULL,
    `brand`       varchar(255) NOT NULL,
    `unit`        varchar(50)  NOT NULL,
    `weight` double NOT NULL,
    `price`       double DEFAULT '0',
    `description` text         NOT NULL,
    `image`       text         NOT NULL,
    `idCategory`  int          null,
    PRIMARY KEY (`id`),
    KEY           `idCategory` (`idCategory`),
    CONSTRAINT `product_ibfk_1` FOREIGN KEY (`idCategory`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Rau cải cúc Vietgap 500g_LT','Đang cập nhật','Túi',0,19000,'Rau cải cúc Vietgap 500g<br>\r\n\r\nĐơn vị chịu trách nghiệm: Hợp tác xã sản xuất và kinh doanh nông sản sạch Lâm Thao<br>\r\n\r\nXuất xứ: Phú Thọ<br>\r\n\r\nĐịnh lượng: 500g/túi<br>\r\n\r\nThành phần: Rau cải cúc Vietgap 500g<br>\r\n\r\nLưu ý: Không sử dụng khi sản phẩm có dấu hiệu hư hỏng<br>\r\n\r\nHướng dẫn sử dụng: Ăn liền<br>\r\n\r\nHướng dẫn bảo quản: Tủ mát<br>\r\n\r\nCải cúc Vietgap do Sói Biển cung cấp cam kết tuân thủ những nguyên tắc, trình tự, thủ  tục hướng dẫn sản xuất, thu hoạch, xử lý sau thu hoạch nhằm đảm bảo an toàn, loại bỏ hoàn toàn các mối lo về thuốc trừ sâu, thuốc kích thích tăng trưởng, đảm bảo tiêu chí ngon, an toàn thực phẩm.<br>\r\n\r\nHướng dẫn bảo quản<br>\r\n\r\n-Bảo quản cải cúc trong ngăn mát tủ lạnh.<br>\r\n\r\n-Rửa sạch cải cúc trước khi chế biến nhưng không nên ngâm nước quá lâu<br>\r\n\r\nGiá trị dinh dưỡng<br>\r\n\r\nRau cải cúc hay tên gọi khác là Tần Ô được biết đến như một bài thuốc tự nhiên, một loài thực vật có hàm lượng dinh dưỡng cao. Ngoài việc giàu vitamin, caroten, canxi, phốt pho, sắt, chất xơ thô tác tác dụng chữa tăng huyết áp, trị cảm cúm, ho dai dẳng, trị đau đầu, trị ho ở Trẻ em,...Đặc biệt giúp kích thích ăn uống dành cho các bạn nhỏ .<br>\r\n\r\nLưu ý: Những người có thể trạng lạnh, hay bị lạnh bụng, tiêu chảy thì nên hạn chế ăn cải cúc.<br>\r\n\r\nCách chế biến ngon<br>\r\n\r\nCải cúc là loại rau dễ ăn, dễ chế biến và có chứa hàm lượng dinh dưỡng cao. Có thể chế biến thành nhiều món như: cải cúc xào thịt băm, cải cúc xào tỏi, cải cúc xào cà chua, canh thịt cải cúc, hoặc nhúng lẩu.<br>','https://lh3.googleusercontent.com/3Rt7Pe_nmWSrHOG_-iT1aoWEhUZzFa2CFAq4OvwbXtflT6I-A9xPoKimhRDkiRdJU76sGMPmarT2QUA-4QC_KnUB7JovgWE=w500-rw',1),(2,'Su su hữu cơ','Đang cập nhật','Kg',1,43000,'Su hào Hữu cơ<br>\r\n\r\nĐơn vị chịu trách nghiệm: NCC Công Ty TNHH ĐT Và DV Nông Nghiệp Thanh Xuân và NCC HTX DV Nông Nghiệp sạch Hữu cơ Thanh Xuân<br>\r\n\r\nXuất xứ: Sóc Sơn<br>\r\n\r\nĐịnh lượng: 1Kg<br>\r\n\r\nThành phần: Su hào Hữu cơ<br>\r\n\r\nLưu ý: Không sử dụng khi sản phẩm có dấu hiệu hư hỏng<br>\r\n\r\nHướng dẫn sử dụng: Luộc<br>\r\n\r\nHướng dẫn bảo quản: Tủ mát<br>\r\n\r\n Su hào là loại củ được trồng nhiều trong mùa lạnh. Hiện tại, su hào vẫn còn được bán nhiều ở chợ. Bản thân củ su hào đem lại rất nhiều lợi ích cho cơ thể con người. Su hào là thực phẩm ít chất béo hoà tan và cholesterol. Điều đó có nghĩa rằng, nó rất tốt cho tim và hệ tuần hoàn máu.<br>\r\n\r\nHơn nữa, trong mùa lạnh, hệ miễn dịch của chúng ta dễ bị tấn công do sự phát triển mạnh của vi rút, do vậy mà chúng ta dễ bị cảm cúm, ho, xổ mũi và mệt mỏi. Tuy nhiên, theo các chuyên gia, nếu chăm ăn su hào vào mùa đông, nó sẽ giúp chúng ta tăng cường sức khỏe hệ miễn dịch.<br>\r\n\r\nVới những lợi ích đáng quý của su hào, chị em nên làm những món ăn từ su hào cho cả nhà nhé.<br>\r\n\r\nSu hào có thể chế biến thành nhiều món ăn ngon và hấp dẫn.<br>','https://lh3.googleusercontent.com/Q0YklUXpjbxplTlMKPnfF48TGWanhH3F1NwZ9Fqihd06HBWwbxcmAUBduchRfXvzOcZjiBcjdLPwrCuE3bQPywJBng_00cc=w500-rw',1),(3,'Bắp bò Quê','Đang cập nhật','Kg',1,349000,'Bắp bò Quê<br>\r\n\r\nĐơn vị chịu trách nghiệm: NCC Công ty TNHH TM & DV và thực phẩm Kỳ Linh<br>\r\n\r\nXuất xứ: Hà Nội<br>\r\n\r\nĐịnh lượng: 1Kg<br>\r\n\r\nThành phần: Bắp bò Quê<br>\r\n\r\nLưu ý: Không sử dụng sản phẩm khi hết date hoặc có dấu hiệu hư hỏng<br>\r\n\r\nHướng dẫn sử dụng: Luộc<br>\r\n\r\nHướng dẫn bảo quản: Tủ mát<br>\r\n\r\nBắp bò quê tại Sói Biển được khai thác từ giống bò lai Úc.Mọi khâu từ tuyển chọn nguyên liệu tới chế biến, đóng bao bì đều diễn ra khép kín dưới sự giám sát và kiểm tra nghiêm ngặt, người tiêu dùng hoàn toàn có thể yên tâm khi lựa chọn. <br>\r\n\r\nBắp bò là thực phẩm quen thuộc giàu dinh dưỡng, có thể chế biến được nhiều món trong bữa ăn hàng ngày. Bắp bò rất giàu chất sắt có tác dụng bổ sung lượng máu cho cơ thể và phòng tránh cơ thể bị thiếu máu do đó nó thích hợp cho những người có thể chất yếu hoặc trí não đang bị suy giảm. Thành phần axit amin, protein trong thịt bắp bò cũng rất cần thiết cho cơ thể của con người, giúp cải thiện sức đề kháng của cơ thể và phòng tránh nhiều bệnh tật.<br>','https://lh3.googleusercontent.com/YEORsgP8ZbyWK9JrqLhY2g5cwdhhqbfuG6KUucqaAMe9EzgCci2WGq12pssEKIPxS50Q52Q2mUpVcbRDojNph3AkNwgt5MSn=w500-rw',2),(4,'Bắp hoa bò Quê','Đang cập nhật','Kg',1,459000,'Bắp hoa bò Quê<br>\r\n\r\nĐơn vị chịu trách nghiệm: NCC Công ty TNHH TM & DV và thực phẩm Kỳ Linh<br>\r\n\r\nXuất xứ: Hà Nội<br>\r\n\r\nĐịnh lượng: 1Kg<br>\r\n\r\nThành phần: Bắp hoa bò Quê<br>\r\n\r\nLưu ý: Không sử dụng sản phẩm khi hết date hoặc có dấu hiệu hư hỏng<br>\r\n\r\nHướng dẫn sử dụng: Luộc<br>\r\n\r\nHướng dẫn bảo quản: Tủ mát<br>\r\n\r\nBắp hoa bò là thực phẩm quen thuộc giàu dinh dưỡng, có thể chế biến được nhiều món trong bữa ăn hàng ngày. Bắp bò rất giàu chất sắt có tác dụng bổ sung lượng máu cho cơ thể và phòng tránh cơ thể bị thiếu máu do đó nó thích hợp cho những người có thể chất yếu hoặc trí não đang bị suy giảm. Thành phần axit amin, protein trong thịt bắp bò cũng rất cần thiết cho cơ thể của con người, giúp cải thiện sức đề kháng của cơ thể và phòng tránh nhiều bệnh tật. Cùng với các thực phẩm khác, bạn có thể chế biến bắp bò thành rất nhiều món ăn hấp dẫn như: bắp bò ngâm mắm, xào, gói bắp bò, bắp bò gác bếp.','https://lh3.googleusercontent.com/qeT9EG7BmBj9_6ToB0gezKZgTyUN8OasNa26XvY-QBstDDv_664qkX8a2UbvKumhiQGUDiXIAG9i5QyLOZqTvMeBbbJtX5r4=w500-rw',2),(5,'Bắp hoa Bò','Đang cập nhật','Kg',1,459000,'Bắp hoa Bò<br>\r\n\r\nĐơn vị chịu trách nghiệm: Hộ kinh doanh An Nga<br>\r\n\r\nXuất xứ: Hà Nội<br>\r\n\r\nĐịnh lượng: 1Kg<br>\r\n\r\nThành phần: Bắp hoa Bò<br>\r\n\r\nLưu ý: Không sử dụng sản phẩm khi hết date hoặc có dấu hiệu hư hỏng<br>\r\n\r\nHướng dẫn sử dụng: Luộc<br>\r\n\r\nHướng dẫn bảo quản: Tủ mát<br>\r\n\r\nTHÔNG TIN SẢN PHẨM<br>\r\n\r\n- Tên sản phẩm: Bắp hoa bò Úc<br>\r\n\r\n- Xuất xứ: Úc<br>\r\n\r\n- Bảo quản: bảo quản trong mát tủ lạnh<br>\r\n\r\nMÔ TẢ SẢN PHẨM<br>\r\n\r\nBắp hoa bò Úc là phần cơ nhỏ, nằm bên trong bắp chân trước của con bò. Thịt bắp hoa có màng gân bao quanh, màu đỏ sẫm, là phần cơ vận động nhiều nhất của con bò nên thớ thịt nhỏ, săn chắc. Đồng thời, phần thịt này có nhiều vân giống như cánh hoa nên gọi là bắp hoa. Bắp hoa không có hoặc hầu như không có mỡ, ăn giòn và rất thơm.<br>\r\n\r\nBắp hoa chiếm tỉ lệ rất nhỏ trong con bò. Là loại thịt ngon, lại hiếm nên bắp hoa rất được các bà nội trợ ưa chuộng khi chế biến món ăn liên quan đến thịt bò. Bắp hoa có vị ngọt ngon, dai giòn nên được rất nhiều người ưa thích, bắp hoa đặc biệt ngon khi làm món phở hoặc bắp hoa ngâm mắm.<br>\r\n\r\nGIÁ TRỊ DINH DƯỠNG<br>\r\n\r\nTrong 100g hoa bò Úc chứa: 18.5g protein, 19g chất béo, 7.5g chất béo bão hòa, 251 calo và 0g carb.<br>\r\n\r\nNgoài ra, bắp hoa bò còn chứa lượng vitamin và khoáng chất tuyệt vời:<br>\r\n\r\nVitamin B12 – đóng vai trò quan trọng trong việc hình thành tế bào máu và chức năng của não.<br>\r\n\r\nSắt – chiếm hàm lượng cao, được hấp thu rất hiệu quả trong thịt bò Úc cũng tốt cho máu, làm giảm nguy cơ thiếu máu.<br>\r\n\r\nKẽm –  giúp duy trì và phát triển cơ thể hiệu quả.<br>\r\n\r\nNhiều vitamin và khoáng chất khác như vitamin B6, phốt pho, selenium, vitamin B3…<br>\r\n\r\nThịt bò Úc có 0g carb nên hỗ trợ rất tốt trong việc giảm cân mà lại tốt cho việc tạo cơ bắp của những người tập gym.<br>\r\n\r\nKhông chỉ thế, thịt bò Úc còn chứa một số loại hoạt chất sinh học như creatine, taurine, glutathione… mang lại nhiều lợi ích sức khỏe. Thịt bò Úc được nuôi dưỡng chăn thả tự nhiên không có chất hóa học, không cám tăng trọng, không nuôi trong môi trường ô nhiễm nên thịt càng chất lượng và cực kỳ an toàn cho sức khỏe người sử dụng.\r\n\r\nGỢI Ý CÁC MÓN ĂN TỪ BẮP HOA BÒ ÚC\r\n\r\nGỏi xoài bắp hoa\r\n\r\nNguyên liệu\r\n\r\n- 350g bắp bò hoa Úc\r\n\r\n- 800g xoài keo ( nên dùng xoài xanh và hơi chua sẽ ngon hơn )\r\n\r\n- 50g lạc rang\r\n\r\n- 1 củ cà rốt\r\n\r\n- Các loại rau thơm: Húng, gừng, sả, ót, chanh tươi\r\n\r\n- Gia vị trộn gỏi: Đường, hạt tiêu, mắm, giấm\r\n\r\nCác bước làm \r\n\r\nBước 1: Gừng đem rủa sạch, cạo bỏ vỏ, đập dập. Sả cắt khúc.\r\n\r\nBước 2: Bắp bò rửa sạch, dùng lạt hoặc dây cột chặt bò lại. Cho bắp bò vào nồi đặt lên bếp cùng với chút nước, cho thêm 1 thìa giấm, 1 thìa đường, 2 thìa nươc mắm, gừng và sả khử bớt mùi hôi và tạo mùi thơm. Đun đến khi sôi thì các bạn vặn nhỏ lửa, đun thêm khoảng 40 – 45 phút cho thịt bò chín mềm.\r\n\r\nBước 3: Trong lúc chờ thịt bò chín, các bạn rang lạc chín vàng, bóc vỏ, giã qua tránh để lạc bị vụn quá.\r\n\r\nBước 4: Nạo vỏ cà rốt và xoài xanh rồi bào sợi nhỏ. Ngâm xoài trong nước đá 10 phút để xoài giòn hơn và ngâm cà rốt 10 phút để cà rốt ra bớt nước.\r\n\r\nBước 5: Hòa tan hỗn hợp đường, mắm, ớt thái lát, với một thìa nước cốt chanh (trong xoài có sẵn vị chua nên chúng ta chỉ cần thêm 1 ít nước cốt chanh nữa ) và nêm nếm lại.\r\n\r\nBước 6: Sau khi thịt bò đã chín, vớt ra đĩa để nguội, thái miếng vừa ăn rồi trộn với hỗn hợp ở bước 5 khoảng 10 phút thì cho lần lượt cà rốt, xoài xanh, rau húng, lạc rang vào trộn đều.\r\n\r\nBước 7: Cho hỗn hợp ra đĩa, rắc thêm chút lạc rang còn lại lên trên và thưởng thức.','https://lh3.googleusercontent.com/puD62aNEmuw3WXmo-iGqIeo1mJO1yeRisu6dFRtz5iTLkjUU6_je3E0R49JiQzZPN1fnQRg2clnOsWRkYMMAq4XD879EWZWq=w500-rw',2),(6,'Bí cô tiên Vietgap_LT','Đang cập nhật','Kg',1,25000,'Bí cô tiên Vietgap<br>\r\nĐơn vị chịu trách nghiệm: Hợp tác xã sản xuất và kinh doanh nông sản sạch Lâm Thao<br>\r\n\r\nXuất xứ: Phú Thọ<br>\r\n\r\nĐịnh lượng: 1Kg<br>\r\n\r\nThành phần: Bí cô tiên Vietgap<br>\r\n\r\nLưu ý: Không sử dụng khi sản phẩm có dấu hiệu hư hỏng<br>\r\n\r\nHướng dẫn sử dụng: Ăn liền<br>\r\n\r\nHướng dẫn bảo quản: Tủ mát<br>\r\n\r\nBí đỏ cô tiên là thuộc họ bầu bí. Được dùng làm rau ăn: xào, nấu canh, hầm xương. Có tính thanh nhiệt, nhuận tràng nhờ chất xơ kích thích nhu động ruột. Bí đỏ là một loại cây dây thuộc chi Cucurbita, họ Bầu bí. Đây là tên thông dụng để chỉ các loại cây thuộc các loài: Cucurbita pepo, Cucurbita mixta, Cucurbita maxima, và Cucurbita moschata. Nguồn gốc của bí đỏ chưa được xác định tuy nhiên nhiều người cho rằng bí đỏ có nguồn gốc ở Bắc Mỹ.<br>\r\n\r\nBí đỏ cô tiên là một nhánh của họ bầu bí.<br>\r\nĐược dùng làm rau ăn: xào, nấu canh, hầm xương. Có tính thanh nhiệt, nhuận tràng nhờ chất xơ kích thích nhu động ruột. Có vị ngọt tự nhiên nên chế biến các món ăn rất thơm ngon hấp dẫn.\r\nKết hợp món ăn từ Bí đỏ cô tiên và cà chua đều thanh nhiệt, nhuận tràng. Đây là một kết hợp đồng vận vì cả hai đều có tính chống oxy-hoá, tăng tính trị liệu cũng tăng khẩu vị. Khi trời nắng nóng nên ăn món này.<br>','https://lh3.googleusercontent.com/x8tHfYpr2AKEPrgeuqjMUIHctljyuiMEGKu2-2lGs-fJO4F6G5BFd1K18Kqbpcy2Fa-dFexS9rdvoOgrAJt8rMYJsMi-ZRd_=w500-rw',1),(8,'Rau rút VietGap 200g','OEM','Khay',0,38000,'Rau rút VietGap 200g<br>\r\nĐơn vị chịu trách nhiệm: Gtech Việt Nam<br>\r\n\r\nXuất xứ: Việt Nam<br>\r\n\r\nĐịnh lượng: 200g<br>\r\n\r\nThành phần: Rau rút<br>\r\n\r\nRau Rút (Nhút) là cây thảo nổi trên mặt nước, quanh thân có phao trắng, lá kép lông chim.Rau Rút là loại rau ăn rất thông dụng, mùa hè nấu canh với khoai sọ và riêu cua. Rau Rút có mùi thơm đặc biệt như mùi nấm hương, thân ăn giòn. Rau Rút có hàm lượng protein cao vượt xa các loại rau khác như xà lách, mồng tơi, rau muống. Rau Rút có thể nấu canh với cua, khoai sọ hoặc với tôm, thịt heo, thịt gà... Những món ăn này có tác dụng ngon miệng, mát, bổ, làm cho dễ ngủ.','https://lh3.googleusercontent.com/K1XjF-9DBLJ6rkorrT5zAI_nbKoLyJQFwOvHVMenWvQK2wSF2GenBRhves_jICI35CuZwbpSk2OgBBZ0zoDNW0ovRYuwaS3K=rw',1),(9,'Bông cải trắng hữu cơ Đà Lạt','CP','Kg',1,155000,'Bông cải trắng hữu cơ Đà Lạt<br>\r\n\r\nĐơn vị chịu trách nghiệm: Công ty CP chăn nuôi CP Việt Nam - Chi nhánh 2 Lâm Đồng<br>\r\n\r\nXuất xứ: Lâm Đồng<br>\r\n\r\nĐịnh lượng: 1Kg<br>\r\n\r\nThành phần: Bông cải trắng hữu cơ Đà Lạt<br>\r\n\r\nLưu ý: Không sử dụng khi sản phẩm có dấu hiệu hư hỏng<br>\r\n\r\nHướng dẫn sử dụng: Xào<br>\r\n\r\nHướng dẫn bảo quản: Tủ mát<br>\r\n\r\nBông cải trắng hữu cơ Đà Lạt<br>\r\n\r\nBông cải trắng hữu cơ Đà Lạt chứa nhiều chất chống oxy hóa tự nhiên, cung cấp nhiều vitamin A,C K, chất xơ, carotenoid, đường tan, muối khoáng và phenolic. Ăn bông cải trắng thường xuyên sẽ giảm nguy cơ mắc bệnh ung thư, tim mạch,tiểu đường, ổn định huyết áp, tốt cho thận, chống lão hóa và tăng cường sức đề kháng,...','https://lh3.googleusercontent.com/XwmmwGn7lJb_NvWvARZukzz2SE7lFNBHpPCQqtQwhjYqy3Bm3oSlMzD07Je0GEHTBSQ3-igjgJdcKwPEkvnJhNYmBGv6iTFE=rw',1),(10,'Thịt bê','Thịt nội địa','Kg',1,349000,'THÔNG TIN SẢN PHẨM<br>\r\n\r\n- Xuất xứ: Hòa Bình<br>\r\n\r\n- Quy cách: Khay<br>\r\n\r\n- Hướng dẫn sử dụng: xào, hấp sả,...<br>\r\n\r\n- Hướng dẫn bảo quản: Bảo quản lạnh ở 2 - 4 độ C<br>\r\n\r\nMÔ TẢ SẢN PHẨM<br>\r\n\r\nThịt bê Hòa Bình là món đặc sản dân dã quen thuộc của người dân Việt. Bê được các hộ dân bản địa chăn thả tại các vùng đồi núi ở Kim Bôi, Hòa Bình. Thịt bê thơm, bùi, giòn có thể chế biến thành rất nhiều món ăn ngon miệng như: bê xào sả ớt, bê xào lá lồm, bê hấp sả,...<br>\r\n\r\nThịt bê Hòa Bình do Sói Biển cung cấp được lấy từ nguồn thịt sạch, tươi ngon. Mọi khâu từ tuyển chọn nguyên liệu tới chế biến, đóng bao bì đều diễn ra khép kín dưới sự giám sát và kiểm tra nghiêm ngặt, người tiêu dùng hoàn toàn có thể yên tâm khi lựa chọn. <br>\r\n\r\nGIÁ TRỊ DINH DƯỠNG<br>\r\n\r\nThịt bê giàu vitamin và các loại khoáng chất khác. Đặc biệt là sắt và kẽm, do đó nó được khuyến nghị nên có trong chế độ ăn uống lành mạnh.<br>\r\n\r\nGỢI Ý MÓN ĂN<br>\r\n\r\nGỢI Ý MÓN THỊT BÊ HÒA BÌNH XÀO SẢ ỚT<br>\r\n\r\nNguyên liệu:<br>\r\n\r\n- Thịt bê, thái miếng mỏng vừa ăn<br>\r\n\r\n- 1 củ Ớt chuông đỏ, xanh, 2 cây Sả, 2 củ Tỏi, Vừng rang<br>\r\n\r\n- Dầu hào, dầu mè, hạt nêm, đường...<br>\r\n\r\nChế biến:<br>\r\n\r\n- Ớt chuông thái miếng dài. Sả thái vát hoặc khoanh tròn, tỏi băm nhỏ.<br>\r\n\r\n- Thịt bê ướp với 1 tbsp dầu mè, 1/2 tbsp dầu hào, 1/2 tbsp hạt nêm, 1/2 tbsp đường, 1 tsp mì chính, chút dầu ăn. Thêm vừng rang, tỏi, sả. Bóp đều để ngấm 15-30p.<br>\r\n\r\n- Cho chút dầu ăn vào chảo, dầu nóng xào nhanh ớt chuông ở lửa to, chỉ 1p là được. Sau đó trút thịt vào, xào nhanh tay, xóc chảo đc thì càng tốt. Xào 3p là thịt chín mềm.<br>\r\n\r\nThịt bê hấp<br>\r\n\r\nNguyên liệu<br>\r\n\r\n- 350gr bắp bê,<br>\r\n- 1 miếng gừng nhỏ,<br>\r\n- Tương bần,<br>\r\n- Rau ăn kèm đinh lăng,<br>\r\n- Chuối xanh,<br>\r\n- Khế.<br>\r\nCách làm: <br>\r\n\r\nBắp bê rửa sạch, để ráo nước. Ướp với một chút muối, gừng cho thơm và đậm đà, hấp chín. Khi ăn cắt mỏng thịt bê, chấm nước tương kèm lá đinh lăng, khế, chuối xanh tùy theo sở thích.<br>\r\n\r\nMón cháo bê<br>\r\n\r\nNguyên liệu:<br>\r\n\r\n- 500g thịt bê,<br>\r\n- 50g gạo thơm,<br>\r\n- Gừng, hành, nước mắm, rau thơm, ...<br>\r\n\r\nCách làm<br>\r\nVo gạo sạch, cho vào nồi nấu cháo. Thịt bê cắt khúc lớn cỡ bao diêm, ướp gia vị gừng, hành, muối, nước mắm, tiêu cho thấm. Phi thơm hành cho thịt bê vào xào săn. Khi cháo gần được trút thịt vào hầm nhừ. Nêm thêm gia vị lần nữa cho vừa miệng ăn. Múc cháo ra tô, thêm vài lát gừng cắt sợi, chút rau thơm lên trên, ăn nóng.','https://lh3.googleusercontent.com/_p5Jc64xlSB4lBFd6PzER0v6bEBpyF1adipMsHtw2dfU4-TtFxlcFrkuT8gjPISvogqoIjRCLBl98PCDg2MZJTt2Au7dLNAm=rw',2),(11,'Thịt chân giò thảo quế - Ba Lửa','Thịt nội địa','Kg',1,209000,'Thịt chân giò thảo quế - Ba Lửa<br>\r\n\r\nĐơn vị chịu trách nghiệm: Công ty cổ phần Ba Lửa<br>\r\n\r\nXuất xứ: Hà Nam<br>\r\n\r\nĐịnh lượng: 1Kg<br>\r\n\r\nThành phần: Thịt chân giò thảo quế - Ba Lửa<br>\r\n\r\nLưu ý: Không sử dụng sản phẩm khi hết date hoặc có dấu hiệu hư hỏng<br>\r\n\r\nHướng dẫn sử dụng: Luộc<br>\r\n\r\nHướng dẫn bảo quản: Tủ mát<br>\r\n\r\nThịt chân giò thảo quế - Ba Lửa','https://lh3.googleusercontent.com/e3JKxbeEWY2dct9eObhBpH8YiJhl-AnDpaZBTLjMUZG_-iBFNCpWHpPigv0s1oJtk5MoX4sDsn11htmcOd37l-59h4B9oBL7=rw',2),(12,'Cá hồi Nauy fille 500gr','Thủy hải sản nhập khẩu','Kg',1,609000,'Cá hồi Nauy Fille<br>\r\n\r\nĐơn vị chịu trách nghiệm: NCC Công ty TNHH TM Hoàng Lê<br>\r\n\r\nXuất xứ: Nauy<br>\r\n\r\nĐịnh lượng: 1Kg<br>\r\n\r\nThành phần: Cá hồi Nauy Fille<br>\r\n\r\nLưu ý: Không sử dụng sản phẩm khi hết date hoặc có dấu hiệu hư hỏng\r\n<br>\r\nHướng dẫn sử dụng: Sốt\r\n<br>\r\nHướng dẫn bảo quản: Tủ mát\r\n<br>\r\nHiện tại Cá hồi Na Uy tại Sói Biến cung cấp được nhập khẩu từ nguồn nguyên liệu sạch, an toàn và tươi ngon. Mọi khâu từ tuyển chọn nguyên liệu tới, đóng bao bì đều diễn ra khép kín dưới sự giám sát và kiểm tra nghiêm ngặt, người tiêu dùng hoàn toàn có thể yên tâm khi lựa chọn. Cá hồi Na Uy khác với các nước khác là bởi cá hồi nơi đây được coi là một trong những giống cá hồi to lớn và béo khỏe nhất trong tất cả các giống cá hồi trên thế giới. Cá sinh sống trong làn nước sạch tự nhiên, có nhiệt độ thấp đặc trưng của Bắc Âu, đây là điều kiện phát triển thuận lợi nhất cho loài cá hồi, khiến chúng chứa đựng một hàm lượng chất béo và chất đạm đặc biệt, bổ dưỡng hơn cá hồi sinh sống tại các nơi khác.\r\nGIÁ TRỊ DINH DƯỠNG\r\n<br>\r\nCá hồi Nauy được nhiều người yêu thích vì hương vị ngọt, thơm tự nhiên cùng giá trị dinh dưỡng cao, phong phú các dưỡng chất, vitamin thiết yếu. Có rất nhiều lợi ích của cá hồi đối với sức khoẻ như:\r\n<br>\r\n- Cải thiện sức khoẻ tim mạch\r\n<br>\r\n- Tăng cường trao đổi chất\r\n<br>\r\n- Cải thiện não và thần kinh\r\n<br>\r\n- Tăng cường sức khoẻ mắt\r\n<br>\r\n- Tốt cho xương và khớp\r\n<br>\r\n- Ngăn ngừa ung thư','https://lh3.googleusercontent.com/h9OZKBkB8LSu-48uE-e_vH2R3xmMacbA2XKwi3ookyUszlWwEUejpsMHhPC-W5837DDrDXc1iLHqce6o7ui8ZlhkliZ0rVS4=rw',3),(13,'Cá Tầm làm sạch size 2-3kg/ con','Thủy hải sản nội địa','Kg',1,499000,'Cá tầm là loại cá được nhiều người biết đến với cái tên khoa học là Acipenser, loại cá này sẽ bao gồm 21 loài khác nhau. Cá tầm là một loại cá nước ngọt có kích thước rất lớn và tuổi thọ có thể lên đến 150 năm.\r\n<br>\r\n- Cá tầm nổi tiếng có rất nhiều chất dinh dưỡng, thịt cá thì ngon ngọt, thơm tự nhiên. Thịt cá có chứa một lượng dưỡng chất lớn như vitamin A, selenium, canxi, phốt pho, DHA tự nhiên. Ngoài ra thì còn các loại axit béo như omega 3, omega 6 và collagen.\r\n<br>\r\n- Những dưỡng chất của cá tằm sẽ là nguồn dinh dưỡng tốt cho phát đẹp, đặc biệt là các bà mẹ đang mang thai. Giúp bồi bổ cơ thể và tăng cường sức lực cho con người.\r\n<br>\r\nCá tầm làm sạch đã được Sói Biển làm sạch đầu và mang cá, cắt khúc tiện lợi, khách hàng mua về dễ dàng chế biến với nhiều món ngon khác nhau: canh cá, lẩu cá tầm, cá tầm nấu canh chua, cá tầm nướng riềng mẻ...','https://lh3.googleusercontent.com/HNFOUAGbrIp82W3n66n-bWud833wNcQFiSRMH7tihSylE6fQ-m3EbTOhFJn94XaIqXtwzlzGvOOBHgqeXxPjI3om6sBay_J-=rw',3),(14,'Cá diêu hồng sông Đà làm sạch đông lạnh size 1-1,5kg/con','Đang cập nhật','Kg',1,159000,'Cá diêu hồng sông Đà làm sạch đông lạnh size 1-1,5kg/con','https://lh3.googleusercontent.com/0pDNRMEHzfh_S3pdsdDcToO9BlIpmiL4c44N13OLHhK5wOyqXcae4yP4gdoBiAzmj9ogTYC3necC6Q7pZZ6_jpL4S1EdYvTd=rw',3),(15,'Sầu riêng Minh Hoàng Khôi ( kg)','Đang cập nhật','Kg',1,419000,'Sầu riêng Minh Hoàng Khôi ( kg)\r\n<br>\r\nĐơn vị chịu trách nghiệm: Công ty CP đầu tư sản xuất chế biến VINASAURIENG\r\n<br>\r\nXuất xứ: Lâm Đồng\r\n<br>\r\nĐịnh lượng: 1kg\r\n<br>\r\nThành phần: Sầu riêng Minh Hoàng Khôi ( kg)\r\n<br>\r\nLưu ý: Không sử dụng sản phẩm khi hết date hoặc có dấu hiệu hư hỏng\r\n<br>\r\nHướng dẫn sử dụng: Ăn liền\r\n<br>\r\nHướng dẫn bảo quản: ≤ - 18°C\r\n<br>\r\nMang những đặc trưng riêng biệt, sầu riêng Minh Hoàng Khôi được đóng hộp từ những trái sầu riêng chín tự nhiên. Với tiêu chí “sạch – ngon- rẻ” luôn đặt chữ “tín” lên hàng đầu, ngoài sử dụng bao bì bắt mắt, sầu riêng đông lạnh còn cam kết không sử dụng chất bảo quản, chất hóa học hay chất kích thích gây ảnh hưởng đến sức khỏe người tiêu dùng.\r\n<br>\r\nNhững múi sầu dày cơm, múi nào múi nấy thơm ngon, ngọt mới được mang đi cấp đông theo đúng quy trình. Sầu được bảo quản ở  -18 độ C để giữ được độ tươi ngon và đặc biệt là sẽ không làm thay đổi chất lượng sau khi rã đông.\r\n<br>\r\nLà một loại trái cây có giá trị dinh dưỡng rất cao. Vì vậy mà nó mang lại rất nhiều lợi ích cho sức khỏe chúng ta như:\r\n<br>\r\n- Kích thích tiêu hóa, phòng và chữa trị bệnh táo bón nhờ vào hàm lượng chất xơ tự nhiên dồi dào trong sầu riêng.\r\n<br>\r\n- Giúp cơ thể ngăn ngừa, cải thiện chứng thiếu máu nhờ chứa nhiều chất sắt và folate.\r\n<br>\r\n- Tốt cho sự phát triển của xương vì trong sầu chứa khá nhiều protein.','https://lh3.googleusercontent.com/xt4RROdjZG_yAeRyZ6oKZBcaOE1uXKNv4j4-Bk3ejH_d0WhTeUnijLQP0TF1mJB9c00B583gMp8GFfOGGoSrfpWoQoget7M=rw',4),(16,'Thịt bò Fuji - bít tết 200gram','Fuji','Gói',0,169000,'Thịt bò Fuji - bít tết 200gram\r\n<br>\r\nĐơn vị chịu trách nghiệm: Công ty cổ phần thực phẩm Fuji\r\n<br>\r\nXuất xứ: Nhật Bản\r\n<br>\r\nĐịnh lượng: 200g/gói\r\n<br>\r\nThành phần: Thịt bò Fuji - bít tết 200gram\r\n<br>\r\nLưu ý: Không sử dụng sản phẩm khi hết date hoặc có dấu hiệu hư hỏng\r\n<br>\r\nHướng dẫn sử dụng: Nướng\r\n<br>\r\nHướng dẫn bảo quản: ≤ - 18°C\r\n<br>\r\nThịt bò Fuji - bít tết được lựa chọn kỹ lưỡng từ nguồn thịt sạch, tươi ngon, được bảo quản và chế biến đóng gói theo công nghệ hiện đại, khép kín dưới sự giám sát và kiểm tra theo tiêu chuẩn nghiêm ngặt của Nhật Bản. Sản phẩm được sơ chế và bảo quản theo tiêu chuẩn vệ sinh an toàn thực phẩm. Đặc trưng của thịt bò phong cách Nhật Bản là những vân mỡ xen kẽ với thịt theo tỷ lệ tương đối đồng đều. Thành phần thịt và mỡ đều nhau giúp miếng thịt vừa mềm mại vừa có hương vị thơm ngon.\r\n<br>\r\nSản phẩm kèm nước chấm Nhật Bản sẵn có để tẩm ướp, không mất nhiều thời gian chế biến, rất hợp đối với những người bận rộn, không có nhiều thời gian để chuẩn bị cho bữa ăn, thì thịt bò Fuji - Bít tết là phương pháp hữu hiệu mang đến cho cả nhà bữa ăn ngon và đầy đủ chất dinh dưỡng. Sản phẩm thích hợp cho các món bít tết, áp chảo... thay đổi khẩu vị cho bữa cơm gia đình. \r\n<br>\r\nGiá trị dinh dưỡng\r\n<br>\r\nSản phẩm với giá trị dinh dưỡng cao, giàu vitamin và sắt rất tốt cho sức khoẻ, giúp bạn tăng cường khả năng miễn dịch, thúc đẩy trao đổi chất. Sử dụng sản phẩm các bà mẹ nội chợ cảm giác tiện lợi giúp tiết kiệm thời gian trong khâu sơ chế, chế biến mang đến cho cả nhà bữa ăn ngon và đầy đủ chất dinh dưỡng.\r\n<br>\r\nHàm lượng dinh dưỡng có trong 100g thịt bò cung cấp khoảng 28g protein, 10g lipid cùng các loại vitamin (B12, B6), khoáng chất (cacnitin, kali, kẽm, sắt,…), đồng thời cung cấp 280 kcal năng lượng. Tất cả đều là những nguồn hữu cơ cung cấp năng lượng cho cơ thể.\r\n<br>\r\nViệc sử dụng thịt bò thường xuyên mang lại rất nhiều lợi ích cho sức khỏe như tăng cường cơ bắp, giàu vitamin B6 và protein giúp cải thiện hệ miễn dịch, chuyển hóa và tổng hợp thức ăn góp phần phục hồi cơ thể sau khi hoạt động. Khoáng chất carnitine hỗ trợ quá trình chuyển hóa chất béo, chuỗi axit amin giữ cho cơ thể được cân đối. Khoáng chất sắt có trong thịt bò giúp bổ sung lượng máu trong cơ thể. Ngoài ra, thịt bò còn cực kì hiệu quả trong vấn đề giảm cân và phòng tránh ung thư.','https://lh3.googleusercontent.com/LntbcQFdTwnZ5fBYGrd4IRrxZkLVPFJP4YsabqlTWVFDsEufH6g5WXf2iZl83I1EkgM6BZa16hoDYpAU6GZqVnQsS8f9tvY=rw',4),(17,'Bột chiên gà giòn Ottogi 500g','Ottogi','Gói',0,50000,'Bột chiên gà giòn Ottogi 500g\r\n<br>\r\nĐơn vị chịu trách nghiệm: Công ty TNHH Đầu tư Nguyễn Trọng\r\n<br>\r\nXuất xứ: Việt Nam\r\n<br>\r\nĐịnh lượng: 500g/gói\r\n<br>\r\nThành phần: Bột chiên gà giòn Ottogi 500g\r\n<br>\r\nLưu ý: Không sử dụng sản phẩm khi hết date hoặc có dấu hiệu hư hỏng\r\n<br>\r\nHướng dẫn sử dụng: Chiên\r\n<br>\r\nHướng dẫn bảo quản: Nhiệt độ thường\r\n<br>\r\nBột chiên gà Ottogi là loại bột thích hợp nhất để dùng trong chế biến gà chiên vì bột được kết hợp hài hoà giữa hành, tỏi,...và các loại gia vị ướp khác nên so với các loại bột chiên thông thường khác nó làm cho thịt gà trở nên giòn hơn và có một chút vị mè rang. <br>\r\nSản phẩm được sản xuất dựa trên công nghệ hiện đại đảm bảo an toàn vệ sinh thực phẩm. ','https://lh3.googleusercontent.com/NsIkIfIrB0f_6nNoJXD80Lq3g488K70NjTItlTanwRnHNz2CBK4lKEMpHoH_ckJZxdPB187jCW2GbiYDnfwSbXJ2dgIqv1PxYg=rw',5),(18,'Sữa thanh trùng không đường Mộc Châu 880ml','Mộc Châu','Chai',0,37000,'Sữa thanh trùng không đường Mộc Châu 880ml\r\n<br>\r\nĐơn vị chịu trách nghiệm: Công ty TNHH tư vấn đầu tư và thương mại dịch vụ Thanh Phong\r\n<br>\r\nXuất xứ: Việt Nam\r\n<br>\r\nĐịnh lượng: 880ml/chai\r\n<br>\r\nThành phần: Sữa thanh trùng không đường Mộc Châu 880ml\r\n<br>\r\nLưu ý: Không sử dụng sản phẩm khi hết date hoặc có dấu hiệu hư hỏng\r\n<br>\r\nHướng dẫn sử dụng: Ăn liền\r\n<br>\r\nHướng dẫn bảo quản: Tủ mát 0 - 5°C\r\n<br>\r\nSữa thanh trùng không đường Mộc Châu có vị béo ngậy tự nhiên, sữa tươi nguyên chất được vắt và vận chuyển từ nông trại đến nhà máy sản xuất ngay trong ngày để đảm bảo sữa vẫn giữ nguyên giá trị dinh dưỡng và tươi ngon nhất.\r\n<br>\r\nSữa Mộc Châu được sản xuất với công nghệ thanh trùng ở nhiệt độ cao trong thời gian ngắn giúp sữa tươi được thanh trùng mà vẫn giữu nguyên giá trị dinh dưỡng, các loại vitamin và dưỡng chất tốt cho sức khoẻ.\r\n<br>\r\nSữa thanh trùng không đường Mộc Châu được nhiều gia đình tin dùng vì hương vị thơm ngon và giá trị dinh dưỡng cao. Đặc biệt sản phẩm sữa không đường được nhiều người ăn kiêng, bị tiêu đường sử dụng để tăng cường sức đề kháng cho cơ thể.','https://lh3.googleusercontent.com/mVaZcoucOZl132EG6wM2CpF4XdvCZx02ZlTQ56hqynykfEQh6F9Pk3C20cIUIVPnJx6G6hY_OjQ3rwCz5rvG0CtKulMc3f4=rw',6);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `phoneNumber` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` int DEFAULT '0',
  `fullName` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phoneNumber` (`phoneNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK
TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user`
VALUES (1, '0936759690', 'mihduc2910', 1, 'Lê Minh Đức'),
       (2, '0123456789', 'doande2002', 0, 'Doãn Đình Đề'),
       (4, '1111111111', 'tronghieu', 1, 'Nguyễn Trọng Hiếu');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK
TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-13 13:14:11
