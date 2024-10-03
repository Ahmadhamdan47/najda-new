-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2024 at 12:54 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `najda_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `families`
--

CREATE TABLE `families` (
  `id` int(11) NOT NULL,
  `family_head` varchar(255) NOT NULL,
  `total_members` int(11) DEFAULT NULL,
  `under_two_years` int(11) DEFAULT NULL,
  `under_thirteen_years` int(11) DEFAULT NULL,
  `over_thirteen_years` int(11) DEFAULT NULL,
  `marital_status` varchar(255) DEFAULT NULL,
  `health_conditions` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `house_id` int(11) DEFAULT NULL,
  `furniture_needed` tinyint(1) DEFAULT NULL,
  `clothes_needed` tinyint(1) DEFAULT NULL,
  `household_tools_needed` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `families`
--

INSERT INTO `families` (`id`, `family_head`, `total_members`, `under_two_years`, `under_thirteen_years`, `over_thirteen_years`, `marital_status`, `health_conditions`, `notes`, `phone_number`, `house_id`, `furniture_needed`, `clothes_needed`, `household_tools_needed`) VALUES
(1, 'جومانة مزرعاني', 2, 0, 0, 2, NULL, NULL, 'بحاجة لأدوية', '71680056', 1, 0, 0, 0),
(2, 'علي مغنية', 4, 0, 0, 4, NULL, 'لا يوجد', NULL, '79106373', 1, 0, 0, 0),
(3, 'محمد بدران', 2, 1, 0, 1, NULL, 'لا يوجد', NULL, '81688575', 1, 0, 0, 0),
(4, 'فوزي بدران', 2, 0, 0, 2, NULL, 'لا يوجد', NULL, '71877678', 1, 0, 0, 0),
(5, 'سلية كريم', 1, 0, 0, 1, NULL, 'مزمنة', 'بحاجة لأدوية', 'تواصل مع مغنية', 1, 0, 0, 0),
(6, 'زهراء كريم', 1, 0, 0, 1, NULL, 'مزمنة', 'بحاجة لأدوية', 'تواصل مع مغنية', 1, 0, 0, 0),
(7, 'نهلاء كريم', 1, 0, 0, 1, NULL, 'مزمنة', 'بحاجة لأدوية', '3559434', 1, 0, 0, 0),
(8, 'سلام اسماعيل', 3, 0, 2, 1, NULL, 'لا يوجد', 'أيتام', '70884679', 2, 0, 0, 0),
(9, 'علي كريم', 5, 0, 3, 2, NULL, 'لا يوجد', 'كسر باليد لدى احد الأطفال', '70323822', 2, 0, 0, 0),
(10, 'ابراهيم ناصر', 2, 0, 0, 2, NULL, 'سكري', 'عجز', '78866712', 2, 0, 0, 0),
(11, 'محمد حسين فقيه', NULL, NULL, NULL, NULL, NULL, 'لا يوجد', NULL, '71907386', 3, 0, 0, 0),
(12, 'بنت علي ياسين عبود', 3, 1, 0, 2, NULL, 'لا يوجد', 'حفاضات', 'تواصل مع علي ياسين عبود', 4, 0, 0, 0),
(13, 'علي ياسين عبود', 4, 0, 0, 4, NULL, 'ضغط - سكري', NULL, '3487112', 4, 0, 0, 0),
(14, 'علي ابراهيم عبود', 4, 0, 1, 3, NULL, 'لا يوجد', NULL, '3929984', 4, 0, 0, 0),
(15, 'حسن عمار', 5, 1, 2, 2, NULL, 'لا يوجد', NULL, '71579092', 5, 0, 0, 0),
(16, 'مصطفى عمار', 3, 0, 0, 3, NULL, 'لا يوجد', NULL, '3180507', 5, 0, 0, 0),
(17, 'محسن غنام', 7, 0, 3, 4, NULL, 'لا يوجد', 'فرش', '71396472', 6, 0, 0, 0),
(18, 'قاسم يوسف', 7, 0, 5, 2, NULL, 'لا يوجد', 'فرش', 'تواصل مع غنام', 6, 0, 0, 0),
(19, 'علي غانم', 6, 0, 2, 4, NULL, 'لا يوجد', 'فرش', 'تواصل مع غنام', 6, 0, 0, 0),
(20, 'علي غنام', 4, 0, 1, 3, NULL, 'لا يوجد', 'فرش', 'تواصل مع غنام', 6, 0, 0, 0),
(21, 'فرح عقيل', 3, 0, 0, 3, NULL, 'لا يوجد', NULL, '71422541', 7, 0, 0, 0),
(22, 'وفيق رمال', 6, 0, 2, 4, NULL, 'امراض قلب', 'بحاجة لكرسي نقال|فوط صحية', '70603525', 8, 0, 0, 0),
(23, 'علي صوان', 3, 1, 1, 1, NULL, 'لا يوجد', 'حفاضات|panadol للأطفال', '81608673', 9, 0, 0, 0),
(24, 'اناس اسماعيل', 3, 1, 1, 1, NULL, 'لا يوجد', NULL, '81715363', 9, 0, 0, 0),
(25, 'رائف رمضان', 3, 0, 0, 3, NULL, 'ضغط', NULL, '76848749', 10, 0, 0, 0),
(26, 'عبدالاله فقيه', 3, 0, 0, 3, NULL, 'ضغط - قلب ', NULL, '71678972', 10, 0, 0, 0),
(27, 'يوسف شحادة', 5, 0, 2, 3, NULL, 'قلب', NULL, '70060712', 10, 0, 0, 0),
(28, 'محمد نورالدين', 5, 0, 3, 2, NULL, 'لا يوجد', 'طفل لديه كهرباء في الرأس وكسر في اليد|ملاقط للغسيل', '78830397', 10, 0, 0, 0),
(29, 'احمد نورالدين', 3, 0, 0, 3, NULL, 'لا يوجد', NULL, '78830397', 10, 0, 0, 0),
(30, 'سلمان فقيه', 3, 0, 0, 3, NULL, 'لا يوجد', NULL, '3727597', 10, 0, 0, 0),
(31, 'مصطفى علي عبود', 6, 0, 0, 6, NULL, 'لا يوجد', NULL, '70976576', 11, 0, 0, 0),
(32, 'عبدالله علي عبود', 7, 0, 1, 6, NULL, 'ضغط - حماية', NULL, '70721921', 11, 0, 0, 0),
(33, 'حسن علي عبود', 5, 0, 1, 4, NULL, 'لا يوجد', NULL, '70110350', 11, 0, 0, 0),
(34, 'سمير طحان', 5, 0, 0, 5, NULL, 'ضغط - حماية', 'حاجة خاصة (خرس|طرش)', '70102757', 11, 0, 0, 0),
(35, 'علي عبدالله عبود', 5, 0, 0, 5, NULL, 'لا يوجد', 'حالة ميل رقم 18 ومقعد', '76480141', 11, 0, 0, 0),
(36, 'شذا حمزة', 16, 2, 3, 11, 'جيدة', 'قلب - ضغط', NULL, '70600204', 12, 0, 0, 0),
(37, 'نزيه الحسن', 5, 0, 0, 5, NULL, 'لا يوجد', NULL, '70451051', 13, 0, 0, 0),
(38, 'حسن عفيف', 3, 0, 0, 3, NULL, 'لا يوجد', NULL, '70919325', 13, 0, 0, 0),
(39, 'علي شلهوب', 5, 0, 0, 5, 'سيئة', 'ضغط - سكري', NULL, '3986933', 13, 0, 0, 0),
(40, 'مالك شلهوب', 6, 1, 3, 2, NULL, 'لا يوجد', 'فرش - مواد غذائية', '3694500', 13, 0, 0, 0),
(41, 'محمود خشان', 3, 0, 0, 3, NULL, 'انسداد رئة - ضغط - سكري', NULL, '3357761', 14, 0, 0, 0),
(42, 'ايناس مرعي', 2, 0, 1, 1, NULL, 'لا يوجد', NULL, '71091977', 14, 0, 0, 0),
(43, 'حمزة عمرو', 1, 0, 0, 1, NULL, 'لا يوجد', 'اصابة في الرأس (معالج)', '71064892', 15, 0, 0, 0),
(44, 'زكريا السالم', 7, 0, 3, 4, NULL, 'قلب - ضغط', 'حساسية - حالة حمل', '78948722', 15, 0, 0, 0),
(45, 'صدرالدين بداح', 5, 0, 0, 5, NULL, 'لا يوجد', NULL, '71445519', 16, 0, 0, 0),
(46, 'موسى داغر', 6, 0, 4, 2, NULL, 'لا يوجد', NULL, 'تواصل مع بداح', 16, 0, 0, 0),
(47, 'يوسف سلامة', 5, 0, 0, 5, NULL, 'لا يوجد', 'أجار', '3474254', 17, 0, 0, 0),
(48, 'جهاد جابر', 5, 0, 0, 5, NULL, 'ديسك', 'لا يوجد غاز، براد، اثياب', '3385569', 18, 0, 0, 0),
(49, 'جهاد بيضون', 4, 0, 0, 4, NULL, 'لا يوجد', NULL, '3301012', 19, 0, 0, 0),
(50, 'حسن بيضون', 2, 0, 0, 2, NULL, 'قلب', NULL, '71697417', 19, 0, 0, 0),
(51, 'حسن عبدالمنعم', 4, 0, 2, 2, NULL, 'لا يوجد', 'حفاضات للراشدين', '3707318', 19, 0, 0, 0),
(52, 'وسام الأسعد', 5, 0, 0, 5, NULL, 'غسيل كلى', NULL, '70607667', 20, 0, 0, 0),
(53, 'يوسف عباس', 16, 0, 3, 13, NULL, 'لا يوجد', NULL, '3695238', 21, 0, 0, 0),
(54, 'حسن قاسم قري', 3, 0, 0, 3, NULL, 'سكري - قلب - ضغط', NULL, '3060130', 22, 0, 0, 0),
(55, 'رويدة حسن قري', 4, 0, 0, 4, NULL, 'لا يوجد', NULL, '71452439', 22, 0, 0, 0),
(56, 'منال حسن قري', 3, 0, 2, 1, NULL, 'لا يوجد', NULL, NULL, 22, 0, 0, 0),
(57, 'فادي وهبة', 5, 0, 0, 5, NULL, 'لا يوجد', NULL, '3312481', 22, 0, 0, 0),
(58, 'شوقي رحال', 4, 0, 0, 4, NULL, 'ضغط', NULL, '3642084', 23, 0, 0, 0),
(59, 'حاموش', 4, 0, 0, 4, NULL, 'لا يوجد', NULL, 'تواصل مع شوقي رحال', 23, 0, 0, 0),
(60, 'نهاد حمود ', 3, 0, 0, 3, NULL, 'ضغط - سكري - صرع', NULL, '76002564', 24, 0, 0, 0),
(61, 'طرفى رحال', 5, 0, 0, 5, NULL, 'ضغط - سكري', 'امراض اخرى', 'تواصل مع نهاد', 25, 0, 0, 0),
(62, 'احمد ابو علي مروة', 2, 0, 0, 2, NULL, 'سرطان', NULL, '3958179', 26, 0, 0, 0),
(63, 'ندى ياسين', 4, 2, 1, 1, NULL, 'لا يوجد', 'طفل عمره سنة و 11 شهر، طفل عمره 11 شهر', 'تواصل مع احمد مروة', 26, 0, 0, 0),
(64, 'ابراهيم دياب', 4, 0, 0, 4, NULL, 'ضغط - جلد (صدفية)', NULL, '71884649', 27, 0, 0, 0),
(65, 'عمر مزرعاني', 4, 0, 2, 2, NULL, 'لا يوجد', NULL, '3264750', 27, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE `houses` (
  `id` int(11) NOT NULL,
  `house_label` varchar(255) NOT NULL,
  `total_people` int(11) DEFAULT NULL,
  `under_two_years` int(11) DEFAULT NULL,
  `under_thirteen_years` int(11) DEFAULT NULL,
  `over_thirteen_years` int(11) DEFAULT NULL,
  `current_residence` varchar(255) DEFAULT NULL,
  `displacement_location` varchar(255) DEFAULT NULL,
  `furnished_home` tinyint(1) DEFAULT NULL,
  `gas` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `houses`
--

INSERT INTO `houses` (`id`, `house_label`, `total_people`, `under_two_years`, `under_thirteen_years`, `over_thirteen_years`, `current_residence`, `displacement_location`, `furnished_home`, `gas`) VALUES
(1, 'جومانة مزرعاني', 15, 1, 0, 14, 'عبرا - فرن أبو رشيد - الطابق 4', 'قضاء النبطية| صور', 1, 0),
(2, 'سلام اسماعيل', 10, 0, 5, 5, 'جادة بري - نجد ماضي 21 - طابق 1', 'كفرسريان', 0, 0),
(3, 'رماس فقيه', 15, 0, 1, 14, 'شرحبيل - بناية الأمل 5 - طابق 3', 'انصاريه', 1, 0),
(4, 'علي ياسين عبود', 11, 1, 2, 8, 'شرحبيل - بناية شمّا 9 - طابق 4', 'عدلون|عيتا الشعب', 1, 1),
(5, 'حسن عمار', 8, 1, 2, 5, 'قرب مستشفى غسان حمود', 'قضاء صور', 1, 0),
(6, 'محسن غنام', 23, 0, 11, 12, 'حي البرغوت - بناية سكاكيني - ارضي (محل حدادة - نسب)', 'منصوري|مروحين|جبين', 0, 0),
(7, 'فرح عقيل', 8, NULL, NULL, 4, 'شرحبيل - مقابل سوبرماركت وفير - طابق 3', 'زوطر الشرقية', 0, 0),
(8, 'وفيق رمال', 6, 0, 2, 6, 'مبنى حمدان وبدير - صابق 2', 'الدوير', 0, 0),
(9, 'علي صوان', 4, 1, 1, 2, 'غسان حمود - بناية نايف معروف - طابق 7', 'كفرملكي', 1, 0),
(10, 'حنان زين الرين', 22, 0, 5, 17, 'شارع دلاعة - بناية الزين - طابق 2 ', 'انصاريه', 1, 0),
(11, 'مصطفى علي عبود', 28, 0, 2, 26, 'حي الاسكندراني - بناية العقيل - طابق 9', 'عدلون', 1, 0),
(12, 'شذا حمزة', 16, 0, 3, 13, 'قرب صيدلية الشرحبيل - بناية وهبة رقم 14', 'كفرحتى', 0, 0),
(13, 'مالك شلهوب', 39, 1, 3, 36, 'شارع دلاعة - قرب zero3', 'عدلون - بيسارية - قضاء صور', 0, 0),
(14, 'محمود خشان', 5, 0, 1, 4, 'فوار - الطلعة مقابل الملحمة (لدى الأقارب)', 'صور', 0, 0),
(15, 'حمزة عمرو', 8, 0, 3, 5, 'علاءالدين (في الشارع)', 'غازية|صور', 0, 0),
(16, 'صدرالدين بداح ', 15, 0, 4, 11, 'قرب الجامعة اليسوعية - طابق تحت ارضي', 'صور', 0, 0),
(17, 'يوسف سلامة', 5, 0, 0, 5, 'حارة صيدا', 'شويفات|عيترون', 0, 0),
(18, 'جهاد جابر', 5, 0, 0, 5, 'بوابة الفوقا - بنك الثروات - بناية علي احمد - طابق 1', 'كفرتبنيت', 0, 0),
(19, 'جهاد بيضون', 10, 0, 2, 8, 'شارع غسان حمود - عطارات نور - طابق 2', 'عيترون/ نبطية', 1, 0),
(20, 'وسام الأسعد', 5, 0, 0, 5, 'الفيلات', 'اللوبية', 1, 0),
(21, 'يوسف عباس', 16, 0, 3, 13, 'عين الدلب', 'عيترون ', 1, 0),
(22, 'رويدة قرّي', 15, 0, 2, 13, 'مجدليون', 'بابلية', 0, 0),
(23, 'شوقي رحال', 8, 0, 0, 8, 'جادة بري - طلعة الشماع - محطة مي - بناية وهاب طابق 3', 'كفرحمام|كفرحتى', 0, 0),
(24, 'نهاد حمود', 3, 0, 0, 3, 'مية ومية - حي اسماعيلية - بناية اسماعيل - طابق 3', 'كفرحمام ', 1, 0),
(25, 'طرفى رحال', 5, 0, 0, 5, 'جارة نهاد - طابق 2', 'كفرحمام', 1, 0),
(26, 'احمد ابو علي مروة', 6, 2, 0, 4, 'حارة صيدا - تلة مار الياس - مشاريع الحمد - طابق 2', 'زرارية|بازورية', 0, 0),
(27, 'ابراهيم دياب', 8, 0, 2, NULL, 'الصالحية - مقابل pipes - طابق 1', 'حولا|بازورية', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `individuals`
--

CREATE TABLE `individuals` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('house_contact','family_head') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `needs`
--

CREATE TABLE `needs` (
  `id` int(11) NOT NULL,
  `individual_id` int(11) DEFAULT NULL,
  `family_id` int(11) DEFAULT NULL,
  `food_aid` tinyint(1) DEFAULT NULL,
  `medicine` tinyint(1) DEFAULT NULL,
  `furniture` tinyint(1) DEFAULT NULL,
  `clothes` tinyint(1) DEFAULT NULL,
  `cleaning_supplies` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `needs`
--

INSERT INTO `needs` (`id`, `individual_id`, `family_id`, `food_aid`, `medicine`, `furniture`, `clothes`, `cleaning_supplies`) VALUES
(1, NULL, NULL, 0, 0, 0, 0, 0),
(2, NULL, NULL, 0, 0, 0, 0, 0),
(3, NULL, NULL, 0, 0, 0, 0, 0),
(4, NULL, NULL, 0, 0, 0, 0, 0),
(5, NULL, NULL, 0, 0, 0, 0, 0),
(6, NULL, NULL, 0, 0, 0, 0, 0),
(7, NULL, NULL, 0, 0, 0, 0, 0),
(8, NULL, NULL, 0, 0, 0, 0, 0),
(9, NULL, NULL, 0, 0, 0, 0, 0),
(10, NULL, NULL, 0, 0, 0, 0, 0),
(11, NULL, NULL, 0, 0, 0, 0, 0),
(12, NULL, NULL, 0, 0, 0, 0, 0),
(13, NULL, NULL, 0, 0, 0, 0, 0),
(14, NULL, NULL, 0, 0, 0, 0, 0),
(15, NULL, NULL, 0, 0, 0, 0, 0),
(16, NULL, NULL, 0, 0, 0, 0, 0),
(17, NULL, NULL, 0, 0, 0, 0, 0),
(18, NULL, NULL, 0, 0, 0, 0, 0),
(19, NULL, NULL, 0, 0, 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `families`
--
ALTER TABLE `families`
  ADD PRIMARY KEY (`id`),
  ADD KEY `house_id` (`house_id`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `individuals`
--
ALTER TABLE `individuals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `needs`
--
ALTER TABLE `needs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `individual_id` (`individual_id`),
  ADD KEY `family_id` (`family_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `families`
--
ALTER TABLE `families`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `individuals`
--
ALTER TABLE `individuals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `needs`
--
ALTER TABLE `needs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `families`
--
ALTER TABLE `families`
  ADD CONSTRAINT `families_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`);

--
-- Constraints for table `needs`
--
ALTER TABLE `needs`
  ADD CONSTRAINT `needs_ibfk_1` FOREIGN KEY (`individual_id`) REFERENCES `individuals` (`id`),
  ADD CONSTRAINT `needs_ibfk_2` FOREIGN KEY (`family_id`) REFERENCES `families` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
