-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2024 at 02:53 PM
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
(2, 'جومانة مزرعاني', 2, 0, 0, 2, NULL, 'مزمنة', 'بحاجة لأدوية', '71680056', 1, 3, 3, NULL),
(3, 'جومانة مزرعاني', 2, NULL, 0, 2, NULL, 'مزمنة', 'بحاجة لأدوية', '71680056', 1, 0, 0, 0),
(4, 'علي مغنية', 4, NULL, 0, 4, NULL, 'لا يوجد', NULL, '79106373', 1, 0, 0, 0),
(5, 'محمد بدران', 2, NULL, 0, 1, NULL, 'لا يوجد', NULL, '81688575', 1, 0, 0, 0),
(6, 'فوزي بدران', 2, NULL, 0, 2, NULL, 'لا يوجد', NULL, '71877678', 1, 0, 0, 0),
(7, 'سلية كريم', 1, NULL, 0, 1, NULL, 'مزمنة', 'بحاجة لأدوية', 'تواصل مع مغنية  79106373', 1, 0, 0, 0),
(8, 'زهراء كريم', 1, NULL, 0, 1, NULL, 'مزمنة', 'بحاجة لأدوية', 'تواصل مع مغنية 79106373', 1, 0, 0, 0),
(9, 'نهلاء كريم', 1, NULL, 0, 1, NULL, 'مزمنة', 'بحاجة لأدوية', '3559434', 1, 0, 0, 0),
(10, 'سلام اسماعيل', 3, NULL, 2, 1, NULL, 'لا يوجد', 'أيتام', '70884679', 2, 0, 0, 0),
(11, 'علي كريم', 5, NULL, 3, 2, NULL, 'لا يوجد', 'كسر باليد لدى احد الأطفال', '70323822', 2, 0, 0, 0),
(12, 'ابراهيم ناصر', 2, NULL, 0, 2, NULL, 'سكري', 'عجز', '78866712', 2, 0, 0, 0),
(13, 'محمد حسين فقيه', 10, NULL, NULL, NULL, NULL, 'لا يوجد', NULL, '71907386', 3, 0, 0, 0),
(14, 'بنت علي ياسين عبود', 3, NULL, 0, 2, NULL, 'لا يوجد', 'حفاضات', 'تواصل مع علي ياسين عبود 3487112', 4, 0, 0, 0),
(15, 'علي ياسين عبود', 4, NULL, 0, 4, NULL, 'ضغط - سكري', NULL, '3487112', 4, 0, 0, 0),
(16, 'علي ابراهيم عبود', 4, NULL, 1, 3, NULL, 'لا يوجد', NULL, '3929984', 4, 0, 0, 0),
(17, 'حسن عمار', 5, NULL, 2, 2, NULL, 'لا يوجد', NULL, '71579092', 5, 0, 0, 0),
(18, 'مصطفى عمار', 3, NULL, 0, 3, NULL, 'لا يوجد', NULL, '3180507', 5, 0, 0, 0),
(19, 'محسن غنام', 7, NULL, 3, 4, NULL, 'لا يوجد', 'فرش', '71396472', 6, 0, 0, 0),
(20, 'قاسم يوسف', 7, NULL, 5, 2, NULL, 'لا يوجد', 'فرش', 'تواصل مع غنام 71396472', 6, 0, 0, 0),
(21, 'علي غانم', 6, NULL, 2, 4, NULL, 'لا يوجد', 'فرش', 'تواصل مع غنام 71396472', 6, 0, 0, 0),
(22, 'علي غنام', 4, NULL, 1, 3, NULL, 'لا يوجد', 'فرش', 'تواصل مع غنام 71396472', 6, 0, 0, 0),
(23, 'فرح عقيل', 3, NULL, 0, 3, NULL, 'لا يوجد', NULL, '71422541', 7, 0, 0, 0),
(24, 'وفيق رمال', 6, NULL, 2, 4, NULL, 'امراض قلب', 'بحاجة لكرسي نقال|فوط صحية', '70603525', 8, 0, 0, 0),
(25, 'علي صوان', 3, NULL, 1, 1, NULL, 'لا يوجد', 'حفاضات|panadol للأطفال', '81608673', 9, 0, 0, 0),
(26, 'اناس اسماعيل', 3, NULL, 1, 1, NULL, 'لا يوجد', NULL, '81715363', 9, 0, 0, 0),
(27, 'رائف رمضان', 3, NULL, 0, 3, NULL, 'ضغط', NULL, '76848749', 10, 0, 0, 0),
(28, 'عبدالاله فقيه', 3, NULL, 0, 3, NULL, 'ضغط - قلب ', NULL, '71678972', 10, 0, 0, 0),
(29, 'يوسف شحادة', 5, NULL, 2, 3, NULL, 'قلب', NULL, '70060712', 10, 0, 0, 0),
(30, 'محمد نورالدين', 5, NULL, 3, 2, NULL, 'لا يوجد', 'طفل لديه كهرباء في الرأس وكسر في اليد|ملاقط للغسيل', '78830397', 10, 0, 0, 0),
(31, 'احمد نورالدين', 3, NULL, 0, 3, NULL, 'لا يوجد', NULL, '78830397', 10, 0, 0, 0),
(32, 'سلمان فقيه', 3, NULL, 0, 3, NULL, 'لا يوجد', NULL, '3727597', 10, 0, 0, 0),
(33, 'مصطفى علي عبود', 6, NULL, 0, 6, NULL, 'لا يوجد', NULL, '70976576', 11, 0, 0, 0),
(34, 'عبدالله علي عبود', 7, NULL, 1, 6, NULL, 'ضغط - حماية', NULL, '70721921', 11, 0, 0, 0),
(35, 'حسن علي عبود', 5, NULL, 1, 4, NULL, 'لا يوجد', NULL, '70110350', 11, 0, 0, 0),
(36, 'سمير طحان', 5, NULL, 0, 5, NULL, 'ضغط - حماية', 'حاجة خاصة (خرس|طرش)', '70102757', 11, 0, 0, 0),
(37, 'علي عبدالله عبود', 5, NULL, 0, 5, NULL, 'لا يوجد', 'حالة ميل رقم 18 ومقعد', '76480141', 11, 0, 0, 0),
(38, 'شذا حمزة', 16, NULL, 3, 11, 'جيدة', 'قلب - ضغط', NULL, '70600204', 12, 0, 0, 0),
(39, 'احمد شلهوب', 6, NULL, 3, 0, NULL, 'لا يوجد', NULL, '70698612', 13, 0, 0, 0),
(40, 'حسين موسى شلهوب', 5, NULL, 1, 0, NULL, 'سكري', NULL, '3694500', 13, 0, 0, 0),
(41, 'علي شلهوب', 5, NULL, 0, 5, 'سيئة', 'ضغط - سكري', NULL, '3986933', 13, 0, 0, 0),
(42, 'مالك شلهوب', 6, NULL, 3, 2, NULL, 'لا يوجد', 'فرش - مواد غذائية', '3694500', 13, 0, 0, 0),
(43, 'محمود خشان', 3, NULL, 0, 3, NULL, 'انسداد رئة - ضغط - سكري', 'فرش -حرامات ', '3357761', 14, 0, 0, 0),
(44, 'ايناس مرعي', 2, NULL, 1, 1, NULL, 'لا يوجد', NULL, '71091977', 14, 0, 0, 0),
(45, 'حمزة عمرو', 1, NULL, 0, 1, NULL, 'لا يوجد', 'اصابة في الرأس (معالج)', '71064892', 15, 0, 0, 0),
(46, 'زكريا السالم', 7, NULL, 3, 4, NULL, 'قلب - ضغط', 'حساسية - حالة حمل', '78948722', 15, 0, 0, 0),
(47, 'صدرالدين بداح', 5, NULL, 0, 5, NULL, 'لا يوجد', NULL, '71445519', 16, 0, 0, 0),
(48, 'موسى داغر', 6, NULL, 4, 2, NULL, 'لا يوجد', NULL, 'تواصل مع بداح 71445519', 16, 0, 0, 0),
(49, 'يوسف سلامة', 5, NULL, 0, 5, NULL, 'لا يوجد', 'أجار', '3474254', 17, 0, 0, 0),
(50, 'جهاد جابر', 5, NULL, 0, 5, NULL, 'ديسك', 'لا يوجد غاز، براد، اثياب', '3385569', 18, 0, 0, 0),
(51, 'جهاد بيضون', 4, NULL, 0, 4, NULL, 'لا يوجد', NULL, '3301012', 19, 0, 0, 0),
(52, 'حسن بيضون', 2, NULL, 0, 2, NULL, 'قلب', NULL, '71697417', 19, 0, 0, 0),
(53, 'حسن عبدالمنعم', 4, NULL, 2, 2, NULL, 'لا يوجد', 'حفاضات للراشدين شخصين XXL', '3707318', 19, 0, 0, 0),
(54, 'وسام الأسعد', 7, NULL, 0, 5, NULL, 'غسيل كلى', NULL, '70607667', 20, 0, 0, 0),
(55, 'يوسف عباس', 16, NULL, 3, 13, NULL, 'لا يوجد', NULL, '3695238', 21, 0, 0, 0),
(56, 'حسن قاسم قري', 3, NULL, 0, 3, NULL, 'سكري - قلب - ضغط', NULL, '3060130', 22, 0, 0, 0),
(57, 'رويدة حسن قري', 4, NULL, 0, 4, NULL, 'لا يوجد', NULL, '71452439', 22, 0, 0, 0),
(58, 'منال حسن قري', 3, NULL, 2, 1, NULL, 'لا يوجد', NULL, '71452439', 22, 0, 0, 0),
(59, 'فادي وهبة', 5, NULL, 0, 5, NULL, 'لا يوجد', NULL, '3312481', 22, 0, 0, 0),
(60, 'شوقي رحال', 4, NULL, 0, 4, NULL, 'ضغط', NULL, '3642084', 23, 0, 0, 0),
(61, 'حاموش', 4, NULL, 0, 4, NULL, 'لا يوجد', NULL, 'تواصل مع شوقي رحال 3642084', 23, 0, 0, 0),
(62, 'نهاد حمود ', 3, NULL, 0, 3, NULL, 'ضغط - سكري - صرع', NULL, '76002564', 24, 0, 0, 0),
(63, 'طرفى رحال', 5, NULL, 0, 5, NULL, 'ضغط - سكري', 'امراض اخرى', 'تواصل مع نهاد 76002564', 25, 0, 0, 0),
(64, 'احمد ابو علي مروة', 2, NULL, 0, 2, NULL, 'سرطان', NULL, '3958179', 26, 0, 0, 0),
(65, 'ندى ياسين', 4, NULL, 1, 1, NULL, 'لا يوجد', 'طفل عمره سنة و 11 شهر، طفل عمره 11 شهر', 'تواصل مع احمد مروة 3958179', 26, 0, 0, 0),
(66, 'ابراهيم دياب', 4, NULL, 0, 4, NULL, 'ضغط - جلد (صدفية)', NULL, '71884649', 27, 0, 0, 0),
(67, 'عمر مزرعاني', 4, NULL, 2, 3, NULL, 'لا يوجد', NULL, '3264750', 27, 0, 0, 0),
(68, 'فادي المصري', 4, NULL, 1, 3, NULL, 'ضغط - سكري', 'يوجد ممرضين يتابعون الامراض', '76083606', 28, 0, 0, 0),
(69, 'زينب نجدي', 3, NULL, 0, 3, NULL, 'ضغط - سكري', NULL, '71127519', 28, 0, 0, 0),
(70, 'احمد تركيا', 4, NULL, 0, 4, NULL, 'لا يوجد', NULL, '71277563', 28, 0, 0, 0),
(71, 'عامر خليفة', 4, NULL, 1, 3, NULL, 'لا يوجد', NULL, '71360062', 28, 0, 0, 0),
(72, 'خالد مشلب', 3, NULL, 0, 3, NULL, 'لا يوجد', NULL, '70116143', 29, 0, 0, 0),
(73, 'ام ايمن مروة', 1, NULL, 0, 1, NULL, 'لا يوجد', NULL, '70500781', 30, 0, 0, 0),
(74, 'باسم جواد', 5, NULL, 2, 3, NULL, 'حساسية', 'تم تطبيبه في مستوصف النجدة (حساسية)|دواء حساسية', '70310987', 31, 0, 0, 0),
(75, 'لطفي جوني 1963', 2, NULL, 0, 3, NULL, 'لا يوجد', NULL, '70310987', 31, 0, 0, 0),
(76, 'محمد ضاهر 56 سنة', 2, NULL, 0, 3, NULL, 'لا يوجد', NULL, '70310987', 31, 0, 0, 0),
(77, 'عفيف اسماعيل', 6, NULL, 0, 6, NULL, 'قلب', NULL, '3818646', 32, 0, 0, 0),
(78, 'سامي نورا', 3, NULL, 0, 3, NULL, NULL, NULL, '76699433', 33, 0, 0, 0),
(79, 'نادر اسعد ', 4, NULL, 0, 4, NULL, 'غسيل كلى', NULL, '3925598', 34, 0, 0, 0),
(80, 'وسام اسعد ', 4, NULL, 0, 4, NULL, 'غسيل كلى (بنت عمر 20)', NULL, 'تواصل مع نادر 3925598', 35, 0, 0, 0),
(81, 'يوسف مشلب', 18, NULL, 0, 18, NULL, NULL, NULL, '3009612', 36, 0, 0, 0),
(82, 'داهش اسماعيل', 5, NULL, 4, 1, NULL, NULL, NULL, '76648207', 37, 0, 0, 0),
(83, 'سليمان علي فقيه', 7, NULL, 1, 6, NULL, 'ضغط سكري', 'زوجته لديها تصلب لويحي', '70160937', 38, 0, 0, 0),
(84, 'وائل عباس', 6, NULL, 3, 4, NULL, NULL, NULL, '70686333', 39, 0, 0, 0),
(85, 'اسامة عباس', 2, NULL, 0, 2, NULL, NULL, NULL, 'تواصل مع وائل عباس 70686333', 39, 0, 0, 0),
(86, 'حفيظة الخالد', 1, NULL, 0, 1, NULL, 'تكسير دم', NULL, 'تواصل مع وائل عباس 70686333', 39, 0, 0, 0),
(87, 'ريناد عباس', 2, NULL, 0, 2, NULL, NULL, NULL, 'تواصل مع وائل عباس 70686333', 39, 0, 0, 0),
(88, 'محمد علي فقيه', 4, NULL, 0, 2, NULL, NULL, NULL, '70928241', 40, 0, 0, 0),
(89, 'محمود علي حاوي', 5, NULL, 0, 5, NULL, NULL, NULL, '71802784', 41, 0, 0, 0),
(90, 'حسين علي حاوي', 5, NULL, 1, 4, NULL, NULL, NULL, '71802784', 41, 0, 0, 0),
(91, 'سامر احمد حاوي', 8, NULL, 3, 4, NULL, NULL, NULL, '71802784', 42, 0, 0, 0),
(92, 'حسين احمد حاوي', 5, NULL, 0, 5, NULL, NULL, NULL, '71802784', 42, 0, 0, 0),
(93, 'محمود عباس', 7, NULL, NULL, NULL, NULL, NULL, NULL, '76420869', 43, 0, 0, 0),
(94, 'شادي قطيش', 16, NULL, NULL, NULL, NULL, NULL, NULL, '70150260', 44, 0, 0, 0),
(95, 'احمد ابو زيد', 2, NULL, 0, 2, NULL, NULL, NULL, '71823876', 45, 0, 0, 0),
(96, 'عباس حوماني', 4, NULL, 2, 2, NULL, NULL, NULL, '3494476', 45, 0, 0, 0),
(97, 'امين حسن حسن', 3, NULL, 1, 1, NULL, NULL, NULL, '76425168', 46, 0, 0, 0),
(98, 'علي فرحات', 5, NULL, 2, 2, NULL, 'الابن ربو', 'حرامات ', '76425168', 46, 0, 0, 0),
(99, 'ليلى حسن حسين', 2, NULL, 0, 0, NULL, 'سكري, ضغط, دهن', NULL, '76425168', 46, 0, 0, 0),
(100, 'اكرم باقر', 5, NULL, 3, 2, NULL, 'ضغط', NULL, '70941377', 47, 0, 0, 0),
(101, 'قاسم حريري', 5, NULL, 3, 2, NULL, NULL, NULL, '70941377', 47, 0, 0, 0),
(102, 'ليلى غادر ', 4, NULL, NULL, NULL, NULL, 'ترقق عظم', NULL, '71319508', 48, 0, 0, 0),
(103, 'عباس ترحيني', 5, NULL, NULL, NULL, NULL, 'تأخر عقلي', NULL, '3407485', 48, 0, 0, 0),
(104, 'جنان غادر', 3, NULL, NULL, NULL, NULL, NULL, NULL, '70651909', 48, 0, 0, 0),
(105, 'احمد علي جمعه', 4, NULL, NULL, NULL, NULL, NULL, NULL, '81754105', 49, 0, 0, 0),
(106, 'عبس حشسن الزين', 4, NULL, NULL, NULL, NULL, NULL, NULL, '70146912', 49, 0, 0, 0),
(107, 'محمود مروه', 5, NULL, NULL, NULL, NULL, NULL, NULL, '70036520', 49, 0, 0, 0),
(108, 'نضال ابو زيد', 4, NULL, 0, 4, NULL, NULL, 'حرامات ', '71434665', 50, 0, 0, 0),
(109, 'عماد ابو زيد', 6, NULL, 0, 6, NULL, NULL, 'حرامات ', '71434665', 50, 0, 0, 0),
(110, 'عدنان ابو زيد', 3, NULL, NULL, 3, NULL, 'دوا قلب - ضغط', NULL, '3145847', 51, 0, 0, 0),
(111, 'حسن علي احمد', 4, NULL, 2, 2, NULL, NULL, NULL, '3145847', 51, 0, 0, 0),
(112, 'حبيب ابو زيد', 3, NULL, 1, 2, NULL, NULL, NULL, '3864939', 51, 0, 0, 0),
(113, 'منال ابو دلة ', 2, NULL, NULL, 2, NULL, NULL, NULL, '71396472', 6, 0, 0, 0);

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
(1, 'جومانة مزرعاني', 15, 1, 0, 14, 'عبرا - فرن أبو رشيد - الطابق 4', 'قضاء النبطية| صور', NULL, NULL),
(2, 'سلام اسماعيل', 10, 0, 5, 5, 'جادة بري - نجد ماضي 21 - طابق 1', 'كفرسريان', NULL, NULL),
(3, 'رماس فقيه', 15, 0, 1, 14, 'شرحبيل - بناية الأمل 5 - طابق 3', 'انصاريه', NULL, NULL),
(4, 'علي ياسين عبود', 11, 1, 2, 8, 'شرحبيل - بناية شمّا 9 - طابق 4', 'عدلون|عيتا الشعب', NULL, NULL),
(5, 'حسن عمار', 8, 1, 2, 5, 'قرب مستشفى غسان حمود', 'قضاء صور', NULL, NULL),
(6, 'محسن غنام', 23, 0, 11, 12, 'حي البرغوت - بناية سكاكيني - ارضي (محل حدادة - نسب)', 'منصوري|مروحين|جبين', NULL, NULL),
(7, 'فرح عقيل', 8, NULL, NULL, 4, 'شرحبيل - مقابل سوبرماركت وفير - طابق 3', 'زوطر الشرقية', NULL, NULL),
(8, 'وفيق رمال', 6, 0, 2, 6, 'مبنى حمدان وبدير - صابق 2', 'الدوير', NULL, NULL),
(9, 'علي صوان', 4, 1, 1, 2, 'غسان حمود - بناية نايف معروف - طابق 7', 'كفرملكي', NULL, NULL),
(10, 'حنان زين الرين', 22, 0, 5, 17, 'شارع دلاعة - بناية الزين - طابق 2 ', 'انصاريه', NULL, NULL),
(11, 'مصطفى علي عبود', 28, 0, 2, 26, 'حي الاسكندراني - بناية العقيل - طابق 9', 'عدلون', NULL, NULL),
(12, 'شذا حمزة', 16, 0, 3, 13, 'قرب صيدلية الشرحبيل - بناية وهبة رقم 14', 'كفرحتى', NULL, NULL),
(13, 'مالك شلهوب', 39, 1, 3, 36, 'شارع دلاعة - قرب zero3', 'عدلون - بيسارية - قضاء صور', NULL, NULL),
(14, 'محمود خشان', 5, 0, 1, 4, 'الفوار - الطلعة مقابل الملحمة (لدى الأقارب)', 'صور', NULL, NULL),
(15, 'حمزة عمرو', 8, 0, 3, 5, 'جبانة اليهود', 'غازية|صور', NULL, NULL),
(16, 'صدرالدين بداح ', 15, 0, 4, 11, 'قرب الجامعة اليسوعية - طابق تحت ارضي', 'صور', NULL, NULL),
(17, 'يوسف سلامة', 5, 0, 0, 5, 'حارة صيدا', 'شويفات|عيترون', NULL, NULL),
(18, 'جهاد جابر', 5, 0, 0, 5, 'بوابة الفوقا - بنك الثروات - بناية علي احمد - طابق 1', 'كفرتبنيت', NULL, NULL),
(19, 'جهاد بيضون', 10, 0, 2, 8, 'شارع غسان حمود - عطارات نور - طابق 2', 'عيترون/ نبطية', NULL, NULL),
(20, 'وسام الأسعد', 5, 0, 0, 5, 'الفيلات', 'اللوبية', NULL, NULL),
(21, 'يوسف عباس', 16, 0, 3, 13, 'القريّة', 'عيترون ', NULL, NULL),
(22, 'رويدة قرّي', 15, 0, 2, 13, 'مجدليون', 'بابلية', NULL, NULL),
(23, 'شوقي رحال', 8, 0, 0, 8, 'جادة بري - طلعة الشماع - محطة مي - بناية وهاب طابق 3', 'كفرحمام|كفرحتى', NULL, NULL),
(24, 'نهاد حمود', 3, 0, 0, 3, 'حي اسماعيلية  - قرب حاجز الجيش- بناية اسماعيل - طابق 3', 'كفرحمام ', NULL, NULL),
(25, 'طرفى رحال', 5, 0, 0, 5, 'جارة نهاد - طابق 2', 'كفرحمام', NULL, NULL),
(26, 'احمد ابو علي مروة', 6, 2, 0, 4, 'حارة صيدا - تلة مار الياس - مشاريع الحمد - طابق 2', 'زرارية|بازورية', NULL, NULL),
(27, 'ابراهيم دياب', 8, 0, 2, 6, 'الصالحية - مقابل pipes - طابق 1', 'حولا|بازورية', NULL, NULL),
(28, 'فادي المصري', 15, 0, 2, 13, 'الفوار - قرب التايغر - طابق ارضي', 'صريفا|القنطرة', NULL, NULL),
(29, 'خالد مشلب', 3, 0, 0, 3, 'شرحبيل', 'انصاريه', NULL, NULL),
(30, 'ام ايمن مروة', 1, 0, 0, 1, 'شرحبيل', 'زرارية', NULL, NULL),
(31, 'باسم جواد', 9, 1, 2, 6, 'سكة', NULL, NULL, NULL),
(32, 'عفيف اسماعيل', 6, 0, 0, 6, 'جادة بري', 'برعشيت', NULL, NULL),
(33, 'سامي نورا', 3, 0, 0, 3, 'عبرا', 'بلاط', NULL, NULL),
(34, 'نادر اسعد', 4, 0, 0, 4, 'مشتل ورد - قرب المستشار', 'اللوبية', NULL, NULL),
(35, 'نادر اسعد', 4, 0, 0, 4, 'الفيلات', 'اللوبية', NULL, NULL),
(36, 'يوسف مشلب', 18, 0, 0, 18, 'تعمير الحارة', 'انصاريه', NULL, NULL),
(37, 'داهش اسماعيل', 5, 0, 4, 1, 'عبرا القديمة - منزل حمزة البزري', 'زوطر الشرقية', NULL, NULL),
(38, 'سليمان علي فقيه', NULL, NULL, NULL, NULL, 'عبرا - فوق فرن الرشيد', 'القليلة', NULL, NULL),
(39, 'وائل عباس', NULL, NULL, NULL, NULL, 'مقبرة اليهود - مستودع بقرب مفروشات ارقدان', 'الغازية', NULL, NULL),
(40, 'محمد علي فقيه ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'محمود علي حاوي ', NULL, NULL, NULL, NULL, 'بيت كمال موسى - الفوار ', NULL, NULL, NULL),
(42, 'سامر احمد حاوي ', NULL, NULL, NULL, NULL, 'بيت كمال موسى - الفوار ', NULL, NULL, NULL),
(43, 'محمود عباس ', NULL, NULL, NULL, NULL, 'صيدا - نادي المعني', 'صرفند ', NULL, NULL),
(44, 'شادي قطيش ', NULL, NULL, NULL, NULL, 'السعديات ', 'حولا', NULL, NULL),
(45, 'احمد ابو زيد ', NULL, NULL, NULL, NULL, 'البستان الكبير ', 'كفررمان ', NULL, NULL),
(46, 'ليلى حسين ', NULL, NULL, NULL, NULL, 'اوتوستراد الشماع ', 'عدلون و انصارية ', NULL, NULL),
(47, 'اكرم باقر ', NULL, NULL, NULL, NULL, 'سيروب ', 'ديرقانون', NULL, NULL),
(48, 'جنان غادر ', NULL, NULL, NULL, NULL, 'قرب سبينس فوق مطعم التركي ', 'كفررمان ', NULL, NULL),
(49, 'احمد علي جمعة ', NULL, NULL, NULL, NULL, 'دلاعة - قرب وقف البيان الطبي', 'الزرارية ', NULL, NULL),
(50, 'نضال ابو زيد ', NULL, NULL, NULL, NULL, 'حي البراد - قرب العقاد ', 'كفررمان ', NULL, NULL),
(51, 'عدنان ابو زيد ', NULL, NULL, NULL, NULL, 'الشرحبيل - قرب بلدية البقسطا', 'كفررمان', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `individuals`
--

CREATE TABLE `individuals` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('house_contact','family_head') NOT NULL,
  `house_id` int(11) DEFAULT NULL,
  `family_id` int(11) DEFAULT NULL
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
  `cleaning_supplies` tinyint(1) DEFAULT NULL,
  `fulfilled` tinyint(1) DEFAULT 0,
  `house_id` int(11) DEFAULT NULL,
  `fulfilled_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `needs`
--

INSERT INTO `needs` (`id`, `individual_id`, `family_id`, `food_aid`, `medicine`, `furniture`, `clothes`, `cleaning_supplies`, `fulfilled`, `house_id`, `fulfilled_date`) VALUES
(1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(2, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(3, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(4, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(5, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(6, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(7, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(8, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(9, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(10, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(11, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(12, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(13, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(14, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(15, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(16, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(17, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(18, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(19, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(20, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(21, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(22, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(23, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(24, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(25, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(26, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(27, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(28, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(29, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(30, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(31, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(32, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(33, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(34, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(35, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(36, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(37, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(38, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(39, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(40, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(41, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(42, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(43, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(44, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(45, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(46, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(47, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(48, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(49, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(50, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(51, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(52, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(53, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(54, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(55, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(56, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(57, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(58, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(59, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(60, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(61, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(62, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(63, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(64, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(65, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(66, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(67, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(68, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(69, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(70, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(71, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(72, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(73, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(74, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(75, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(76, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(77, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(78, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(79, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(80, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(81, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(82, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(83, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(84, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(85, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(86, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(87, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(88, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(89, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(90, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(91, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(92, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(93, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(94, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(95, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(96, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(97, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(98, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(99, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(100, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(101, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(102, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(103, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(104, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(105, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(106, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(107, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(108, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(109, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(110, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(111, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(112, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(113, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(114, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(115, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(116, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(117, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(118, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(119, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(120, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(121, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(122, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(123, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(124, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(125, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(126, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(127, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(128, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(129, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(130, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(131, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(132, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_individual_house` (`house_id`),
  ADD KEY `fk_individual_family` (`family_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `individuals`
--
ALTER TABLE `individuals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `needs`
--
ALTER TABLE `needs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `families`
--
ALTER TABLE `families`
  ADD CONSTRAINT `families_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`);

--
-- Constraints for table `individuals`
--
ALTER TABLE `individuals`
  ADD CONSTRAINT `fk_individual_family` FOREIGN KEY (`family_id`) REFERENCES `families` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_individual_house` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE SET NULL;

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
