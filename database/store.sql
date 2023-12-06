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
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Rau-củ-quả'),(2,'Thịt tươi sống');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
                           `id` int NOT NULL AUTO_INCREMENT,
                           `name` varchar(255) NOT NULL,
                           `brand` varchar(255) NOT NULL,
                           `unit` varchar(50) NOT NULL,
                           `weight` double NOT NULL,
                           `price` int DEFAULT '0',
                           `description` text NOT NULL,
                           `image` text NOT NULL,
                           `idCategory` int NOT NULL,
                           PRIMARY KEY (`id`),
                           KEY `idCategory` (`idCategory`),
                           CONSTRAINT `product_ibfk_1` FOREIGN KEY (`idCategory`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Rau cải cúc Vietgap 500g_LT','Đang cập nhật','Túi',0,19000,'Rau cải cúc Vietgap 500g\r\n\r\nĐơn vị chịu trách nghiệm: Hợp tác xã sản xuất và kinh doanh nông sản sạch Lâm Thao\r\n\r\nXuất xứ: Phú Thọ\r\n\r\nĐịnh lượng: 500g/túi\r\n\r\nThành phần: Rau cải cúc Vietgap 500g\r\n\r\nLưu ý: Không sử dụng khi sản phẩm có dấu hiệu hư hỏng\r\n\r\nHướng dẫn sử dụng: Ăn liền\r\n\r\nHướng dẫn bảo quản: Tủ mát\r\n\r\nCải cúc Vietgap do Sói Biển cung cấp cam kết tuân thủ những nguyên tắc, trình tự, thủ  tục hướng dẫn sản xuất, thu hoạch, xử lý sau thu hoạch nhằm đảm bảo an toàn, loại bỏ hoàn toàn các mối lo về thuốc trừ sâu, thuốc kích thích tăng trưởng, đảm bảo tiêu chí ngon, an toàn thực phẩm.\r\n\r\nHướng dẫn bảo quản\r\n\r\n-Bảo quản cải cúc trong ngăn mát tủ lạnh.\r\n\r\n-Rửa sạch cải cúc trước khi chế biến nhưng không nên ngâm nước quá lâu\r\n\r\nGiá trị dinh dưỡng\r\n\r\nRau cải cúc hay tên gọi khác là Tần Ô được biết đến như một bài thuốc tự nhiên, một loài thực vật có hàm lượng dinh dưỡng cao. Ngoài việc giàu vitamin, caroten, canxi, phốt pho, sắt, chất xơ thô tác tác dụng chữa tăng huyết áp, trị cảm cúm, ho dai dẳng, trị đau đầu, trị ho ở Trẻ em,...Đặc biệt giúp kích thích ăn uống dành cho các bạn nhỏ .\r\n\r\nLưu ý: Những người có thể trạng lạnh, hay bị lạnh bụng, tiêu chảy thì nên hạn chế ăn cải cúc.\r\n\r\nCách chế biến ngon\r\n\r\nCải cúc là loại rau dễ ăn, dễ chế biến và có chứa hàm lượng dinh dưỡng cao. Có thể chế biến thành nhiều món như: cải cúc xào thịt băm, cải cúc xào tỏi, cải cúc xào cà chua, canh thịt cải cúc, hoặc nhúng lẩu.','https://lh3.googleusercontent.com/3Rt7Pe_nmWSrHOG_-iT1aoWEhUZzFa2CFAq4OvwbXtflT6I-A9xPoKimhRDkiRdJU76sGMPmarT2QUA-4QC_KnUB7JovgWE=w500-rw',1),(2,'Su su hữu cơ','Đang cập nhật','Kg',1,43000,'Su su hữu cơ  Đơn vị chịu trách nghiệm: NCC Công Ty TNHH ĐT Và DV Nông Nghiệp Thanh Xuân và NCC HTX DV Nông Nghiệp sạch Hữu cơ Thanh Xuân  Xuất xứ: Sóc Sơn  Định lượng: 1Kg  Thành phần: Su su hữu cơ  Lưu ý: Không sử dụng khi sản phẩm có dấu hiệu hư hỏng  Hướng dẫn sử dụng: Luộc  Hướng dẫn bảo quản: Tủ mát  Su su hữu cơ thường được xem như một loại rau nhưng trên thực tế đây là một loại trái cây. Loại quả này phổ biến ở rất nhiều nước và có thể chế biến thành nhiều món ăn.  - Su su có chứa nước 94%, protid 0,85%, glucid 3,7%, vitamin C 4mg%...  - Tốt cho tim: Su su giàu folate, và vitamin B giúp ngăn ngừa việc hình thành homocystein, một loại acid amin chứa sulfur. Quá nhiều acid amin này trong máu gây nguy cơ mắc bệnh tim mạch và đột quỵ.  - Ngăn ngừa ung thư: Vitamin C có trong su su được biết đến như là một chất chống oxy hóa mạnh mẽ, những chất có thể bảo vệ các tế bào khỏi bị hư hại gây ra bởi các gốc tự do. Nghiên cứu cho rằng chất chống oxy hóa có thể làm chậm hoặc có thể ngăn chặn sự phát triển của bện','https://lh3.googleusercontent.com/Q0YklUXpjbxplTlMKPnfF48TGWanhH3F1NwZ9Fqihd06HBWwbxcmAUBduchRfXvzOcZjiBcjdLPwrCuE3bQPywJBng_00cc=w500-rw',1),(3,'Bắp bò Quê','Đang cập nhật','Kg',1,349000,'Bắp bò Quê\r\n\r\nĐơn vị chịu trách nghiệm: NCC Công ty TNHH TM & DV và thực phẩm Kỳ Linh\r\n\r\nXuất xứ: Hà Nội\r\n\r\nĐịnh lượng: 1Kg\r\n\r\nThành phần: Bắp bò Quê\r\n\r\nLưu ý: Không sử dụng sản phẩm khi hết date hoặc có dấu hiệu hư hỏng\r\n\r\nHướng dẫn sử dụng: Luộc\r\n\r\nHướng dẫn bảo quản: Tủ mát\r\n\r\nBắp bò quê tại Sói Biển được khai thác từ giống bò lai Úc.Mọi khâu từ tuyển chọn nguyên liệu tới chế biến, đóng bao bì đều diễn ra khép kín dưới sự giám sát và kiểm tra nghiêm ngặt, người tiêu dùng hoàn toàn có thể yên tâm khi lựa chọn. \r\n\r\nBắp bò là thực phẩm quen thuộc giàu dinh dưỡng, có thể chế biến được nhiều món trong bữa ăn hàng ngày. Bắp bò rất giàu chất sắt có tác dụng bổ sung lượng máu cho cơ thể và phòng tránh cơ thể bị thiếu máu do đó nó thích hợp cho những người có thể chất yếu hoặc trí não đang bị suy giảm. Thành phần axit amin, protein trong thịt bắp bò cũng rất cần thiết cho cơ thể của con người, giúp cải thiện sức đề kháng của cơ thể và phòng tránh nhiều bệnh tật.','https://lh3.googleusercontent.com/YEORsgP8ZbyWK9JrqLhY2g5cwdhhqbfuG6KUucqaAMe9EzgCci2WGq12pssEKIPxS50Q52Q2mUpVcbRDojNph3AkNwgt5MSn=w500-rw',2),(4,'Bắp hoa bò Quê','Đang cập nhật','Kg',1,459000,'Bắp hoa bò Quê<br>\r\n\r\nĐơn vị chịu trách nghiệm: NCC Công ty TNHH TM & DV và thực phẩm Kỳ Linh<br>\r\n\r\nXuất xứ: Hà Nội<br>\r\n\r\nĐịnh lượng: 1Kg<br>\r\n\r\nThành phần: Bắp hoa bò Quê<br>\r\n\r\nLưu ý: Không sử dụng sản phẩm khi hết date hoặc có dấu hiệu hư hỏng<br>\r\n\r\nHướng dẫn sử dụng: Luộc<br>\r\n\r\nHướng dẫn bảo quản: Tủ mát<br>\r\n\r\nBắp hoa bò là thực phẩm quen thuộc giàu dinh dưỡng, có thể chế biến được nhiều món trong bữa ăn hàng ngày. Bắp bò rất giàu chất sắt có tác dụng bổ sung lượng máu cho cơ thể và phòng tránh cơ thể bị thiếu máu do đó nó thích hợp cho những người có thể chất yếu hoặc trí não đang bị suy giảm. Thành phần axit amin, protein trong thịt bắp bò cũng rất cần thiết cho cơ thể của con người, giúp cải thiện sức đề kháng của cơ thể và phòng tránh nhiều bệnh tật. Cùng với các thực phẩm khác, bạn có thể chế biến bắp bò thành rất nhiều món ăn hấp dẫn như: bắp bò ngâm mắm, xào, gói bắp bò, bắp bò gác bếp.','https://lh3.googleusercontent.com/qeT9EG7BmBj9_6ToB0gezKZgTyUN8OasNa26XvY-QBstDDv_664qkX8a2UbvKumhiQGUDiXIAG9i5QyLOZqTvMeBbbJtX5r4=w500-rw',2),(5,'Bắp hoa Bò','Đang cập nhật','Kg',1,459000,'Bắp hoa Bò<br>\r\n\r\nĐơn vị chịu trách nghiệm: Hộ kinh doanh An Nga<br>\r\n\r\nXuất xứ: Hà Nội<br>\r\n\r\nĐịnh lượng: 1Kg<br>\r\n\r\nThành phần: Bắp hoa Bò<br>\r\n\r\nLưu ý: Không sử dụng sản phẩm khi hết date hoặc có dấu hiệu hư hỏng<br>\r\n\r\nHướng dẫn sử dụng: Luộc<br>\r\n\r\nHướng dẫn bảo quản: Tủ mát<br>\r\n\r\nTHÔNG TIN SẢN PHẨM<br>\r\n\r\n- Tên sản phẩm: Bắp hoa bò Úc<br>\r\n\r\n- Xuất xứ: Úc<br>\r\n\r\n- Bảo quản: bảo quản trong mát tủ lạnh<br>\r\n\r\nMÔ TẢ SẢN PHẨM<br>\r\n\r\nBắp hoa bò Úc là phần cơ nhỏ, nằm bên trong bắp chân trước của con bò. Thịt bắp hoa có màng gân bao quanh, màu đỏ sẫm, là phần cơ vận động nhiều nhất của con bò nên thớ thịt nhỏ, săn chắc. Đồng thời, phần thịt này có nhiều vân giống như cánh hoa nên gọi là bắp hoa. Bắp hoa không có hoặc hầu như không có mỡ, ăn giòn và rất thơm.<br>\r\n\r\nBắp hoa chiếm tỉ lệ rất nhỏ trong con bò. Là loại thịt ngon, lại hiếm nên bắp hoa rất được các bà nội trợ ưa chuộng khi chế biến món ăn liên quan đến thịt bò. Bắp hoa có vị ngọt ngon, dai giòn nên được rất nhiều người ưa thích, bắp hoa đặc biệt ngon khi làm món phở hoặc bắp hoa ngâm mắm.<br>\r\n\r\nGIÁ TRỊ DINH DƯỠNG<br>\r\n\r\nTrong 100g hoa bò Úc chứa: 18.5g protein, 19g chất béo, 7.5g chất béo bão hòa, 251 calo và 0g carb.<br>\r\n\r\nNgoài ra, bắp hoa bò còn chứa lượng vitamin và khoáng chất tuyệt vời:<br>\r\n\r\nVitamin B12 – đóng vai trò quan trọng trong việc hình thành tế bào máu và chức năng của não.<br>\r\n\r\nSắt – chiếm hàm lượng cao, được hấp thu rất hiệu quả trong thịt bò Úc cũng tốt cho máu, làm giảm nguy cơ thiếu máu.<br>\r\n\r\nKẽm –  giúp duy trì và phát triển cơ thể hiệu quả.<br>\r\n\r\nNhiều vitamin và khoáng chất khác như vitamin B6, phốt pho, selenium, vitamin B3…<br>\r\n\r\nThịt bò Úc có 0g carb nên hỗ trợ rất tốt trong việc giảm cân mà lại tốt cho việc tạo cơ bắp của những người tập gym.<br>\r\n\r\nKhông chỉ thế, thịt bò Úc còn chứa một số loại hoạt chất sinh học như creatine, taurine, glutathione… mang lại nhiều lợi ích sức khỏe. Thịt bò Úc được nuôi dưỡng chăn thả tự nhiên không có chất hóa học, không cám tăng trọng, không nuôi trong môi trường ô nhiễm nên thịt càng chất lượng và cực kỳ an toàn cho sức khỏe người sử dụng.\r\n\r\nGỢI Ý CÁC MÓN ĂN TỪ BẮP HOA BÒ ÚC\r\n\r\nGỏi xoài bắp hoa\r\n\r\nNguyên liệu\r\n\r\n- 350g bắp bò hoa Úc\r\n\r\n- 800g xoài keo ( nên dùng xoài xanh và hơi chua sẽ ngon hơn )\r\n\r\n- 50g lạc rang\r\n\r\n- 1 củ cà rốt\r\n\r\n- Các loại rau thơm: Húng, gừng, sả, ót, chanh tươi\r\n\r\n- Gia vị trộn gỏi: Đường, hạt tiêu, mắm, giấm\r\n\r\nCác bước làm \r\n\r\nBước 1: Gừng đem rủa sạch, cạo bỏ vỏ, đập dập. Sả cắt khúc.\r\n\r\nBước 2: Bắp bò rửa sạch, dùng lạt hoặc dây cột chặt bò lại. Cho bắp bò vào nồi đặt lên bếp cùng với chút nước, cho thêm 1 thìa giấm, 1 thìa đường, 2 thìa nươc mắm, gừng và sả khử bớt mùi hôi và tạo mùi thơm. Đun đến khi sôi thì các bạn vặn nhỏ lửa, đun thêm khoảng 40 – 45 phút cho thịt bò chín mềm.\r\n\r\nBước 3: Trong lúc chờ thịt bò chín, các bạn rang lạc chín vàng, bóc vỏ, giã qua tránh để lạc bị vụn quá.\r\n\r\nBước 4: Nạo vỏ cà rốt và xoài xanh rồi bào sợi nhỏ. Ngâm xoài trong nước đá 10 phút để xoài giòn hơn và ngâm cà rốt 10 phút để cà rốt ra bớt nước.\r\n\r\nBước 5: Hòa tan hỗn hợp đường, mắm, ớt thái lát, với một thìa nước cốt chanh (trong xoài có sẵn vị chua nên chúng ta chỉ cần thêm 1 ít nước cốt chanh nữa ) và nêm nếm lại.\r\n\r\nBước 6: Sau khi thịt bò đã chín, vớt ra đĩa để nguội, thái miếng vừa ăn rồi trộn với hỗn hợp ở bước 5 khoảng 10 phút thì cho lần lượt cà rốt, xoài xanh, rau húng, lạc rang vào trộn đều.\r\n\r\nBước 7: Cho hỗn hợp ra đĩa, rắc thêm chút lạc rang còn lại lên trên và thưởng thức.','https://lh3.googleusercontent.com/puD62aNEmuw3WXmo-iGqIeo1mJO1yeRisu6dFRtz5iTLkjUU6_je3E0R49JiQzZPN1fnQRg2clnOsWRkYMMAq4XD879EWZWq=w500-rw',2),(6,'Bí cô tiên Vietgap_LT','Đang cập nhật','Kg',1,25000,'Bí cô tiên Vietgap<br>\r\nĐơn vị chịu trách nghiệm: Hợp tác xã sản xuất và kinh doanh nông sản sạch Lâm Thao<br>\r\n\r\nXuất xứ: Phú Thọ<br>\r\n\r\nĐịnh lượng: 1Kg<br>\r\n\r\nThành phần: Bí cô tiên Vietgap<br>\r\n\r\nLưu ý: Không sử dụng khi sản phẩm có dấu hiệu hư hỏng<br>\r\n\r\nHướng dẫn sử dụng: Ăn liền<br>\r\n\r\nHướng dẫn bảo quản: Tủ mát<br>\r\n\r\nBí đỏ cô tiên là thuộc họ bầu bí. Được dùng làm rau ăn: xào, nấu canh, hầm xương. Có tính thanh nhiệt, nhuận tràng nhờ chất xơ kích thích nhu động ruột. Bí đỏ là một loại cây dây thuộc chi Cucurbita, họ Bầu bí. Đây là tên thông dụng để chỉ các loại cây thuộc các loài: Cucurbita pepo, Cucurbita mixta, Cucurbita maxima, và Cucurbita moschata. Nguồn gốc của bí đỏ chưa được xác định tuy nhiên nhiều người cho rằng bí đỏ có nguồn gốc ở Bắc Mỹ.<br>\r\n\r\nBí đỏ cô tiên là một nhánh của họ bầu bí.<br>\r\nĐược dùng làm rau ăn: xào, nấu canh, hầm xương. Có tính thanh nhiệt, nhuận tràng nhờ chất xơ kích thích nhu động ruột. Có vị ngọt tự nhiên nên chế biến các món ăn rất thơm ngon hấp dẫn.\r\nKết hợp món ăn từ Bí đỏ cô tiên và cà chua đều thanh nhiệt, nhuận tràng. Đây là một kết hợp đồng vận vì cả hai đều có tính chống oxy-hoá, tăng tính trị liệu cũng tăng khẩu vị. Khi trời nắng nóng nên ăn món này.<br>','https://lh3.googleusercontent.com/x8tHfYpr2AKEPrgeuqjMUIHctljyuiMEGKu2-2lGs-fJO4F6G5BFd1K18Kqbpcy2Fa-dFexS9rdvoOgrAJt8rMYJsMi-ZRd_=w500-rw',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'0936759690','mihduc2910',1,'Lê Minh Đức'),(2,'0123456789','doande2002',0,'Doãn Đình Đề'),(3,'0987654312','truonglinh',1,'Trương Đăng Vũ Linh');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-06 19:49:24
