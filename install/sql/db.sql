DROP TABLE IF EXISTS `dsb_access_levels`;
CREATE TABLE `dsb_access_levels` (
  `level_id` int(10) unsigned NOT NULL auto_increment,
  `level_code` varchar(30) binary NOT NULL default '',
  `level_diz` varchar(255) NOT NULL default '',
  `level` int(10) unsigned NOT NULL default '0',
  `disabled_level` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`level_id`),
  UNIQUE KEY `level_code_2` (`level_code`),
  KEY `level_code` (`level_code`)
) TYPE=MyISAM;

--
-- Dumping data for table `dsb_access_levels`
--

INSERT INTO `dsb_access_levels` (`level_id`, `level_code`, `level_diz`, `level`, `disabled_level`) VALUES
(1, 0x6c6f67696e, 'when someone tries to login', 1, 65534),
(2, 0x70726f66696c655f76696577, 'View a member profile', 7, 0),
(21, 0x7365617263685f70686f746f, 'Search/browse/latest/most commented on photo feature', 7, 0),
(4, 0x6d6573736167655f72656164, 'Read messages', 6, 1),
(5, 0x6d6573736167655f7772697465, 'Write messages', 6, 1),
(6, 0x666c6972745f72656164, 'Read flirts', 6, 1),
(7, 0x666c6972745f73656e64, 'Send flirts', 6, 1),
(8, 0x75706c6f61645f70686f746f73, 'Upload photos', 6, 1),
(9, 0x77726974655f636f6d6d656e7473, 'Post comments on photos, profiles, blogs', 6, 0),
(10, 0x726561645f626c6f6773, 'Read blogs', 7, 0),
(11, 0x77726974655f626c6f6773, 'Write own blogs', 6, 1),
(12, 0x766965775f616c62756d, 'Who''s allowed to view the list of photos in a photo album', 7, 0),
(13, 0x766965775f70686f746f, 'View a single photo with a bigger size and photo comments', 7, 0),
(14, 0x6d616e6167655f666f6c64657273, 'Add/Edit/Delete personal mail folders', 6, 1),
(15, 0x73617665645f6d65737361676573, 'Use the saved responses feature', 6, 1),
(16, 0x7365617263685f6261736963, 'Who is allowed to use the basic search forms to search for other members?', 7, 0),
(17, 0x7365617263685f616476616e636564, 'Who is allowed to use the advanced member search form?', 6, 0),
(18, 0x6d616e6167655f6e6574776f726b73, 'Who is allowed to add/remove members in their networks?', 6, 1),
(19, 0x736176655f7365617263686573, 'Who is allowed to save personal searches?', 6, 1),
(22, 0x696e626f78, 'See the list of messages in inbox or other folders', 6, 1),
(23, 0x7365617263685f626c6f67, 'Search/browse/latest/most commented on blog feature', 6, 0),
(24, 0x636f6e74616374, 'Who can send us messages using the contact form?', 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dsb_admin_accounts`
--

DROP TABLE IF EXISTS `dsb_admin_accounts`;
CREATE TABLE `dsb_admin_accounts` (
  `admin_id` int(3) unsigned NOT NULL auto_increment,
  `user` varchar(20) binary NOT NULL default '',
  `pass` varchar(32) binary NOT NULL default '',
  `name` varchar(50) NOT NULL default '',
  `status` tinyint(2) unsigned NOT NULL default '0',
  `dept_id` tinyint(2) unsigned NOT NULL default '0',
  `email` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`admin_id`),
  UNIQUE KEY `user` (`user`)
) TYPE=MyISAM PACK_KEYS=0;

--
-- Dumping data for table `dsb_admin_accounts`
--

INSERT INTO `dsb_admin_accounts` (`admin_id`, `user`, `pass`, `name`, `status`, `dept_id`, `email`) VALUES
(1, 0x61646d696e, 0x6665303163653261376662616338666166616564376339383261303465323239, 'Adrian', 15, 4, 'adi@sco.ro'),
(2, 0x74696361, 0x6233666437326431396533613834346337363534393531353936343637353231, 'gica', 15, 4, '');

-- --------------------------------------------------------

--
-- Table structure for table `dsb_admin_mtpls`
--

DROP TABLE IF EXISTS `dsb_admin_mtpls`;
CREATE TABLE `dsb_admin_mtpls` (
  `amtpl_id` int(10) unsigned NOT NULL auto_increment,
  `amtpl_name` varchar(40) NOT NULL default '',
  `subject` varchar(100) NOT NULL default '',
  `message_body` text NOT NULL,
  `amtpl_type` tinyint(2) unsigned NOT NULL default '0',
  PRIMARY KEY  (`amtpl_id`),
  KEY `amtpl_type` (`amtpl_type`)
) TYPE=MyISAM;

--
-- Dumping data for table `dsb_admin_mtpls`
--

INSERT INTO `dsb_admin_mtpls` (`amtpl_id`, `amtpl_name`, `subject`, `message_body`, `amtpl_type`) VALUES
(1, 'Reject member profile', 'Your profile was not approved', '<html><head><title>Your profile has not been approved</title>   <link href="{tplvars.baseurl}/skins/def/styles/common.css" media="screen" type="text/css" rel="stylesheet" /> </head><body> <div id="trim"> 	<div id="content"> 		<p>Thank you for joining <a href="{tplvars.baseurl}">{tplvars.sitename}</a>.</p> 		<p>Unfortunately we are unable to publish your profile on the site yet because it doesn''t contain enough information to be of interest to other members.</p><p>Please update your profile with relevant information.<br /></p> 	</div> </div> </body></html>', 1),
(2, 'Reject photo', 'One of your photos was not approved', '<html><head><title>Your photo has not been approved</title>                       <link href="{tplvars.baseurl}/skins/def/styles/common.css" media="screen" type="text/css" rel="stylesheet" />     </head><body spellcheck="false"><p>Unfortunately we are unable to publish your photo on the site yet because</p>         <p>&nbsp;</p>         <p>Regards,<br />{tplvars.sitename} admin</p></body></html>', 2),
(3, 'Reject blog', 'One of your blog posts was not approved', '<html><head><title>Your blog post has not been approved</title>                       <link rel="stylesheet" type="text/css" media="screen" href="{tplvars.baseurl}/skins/def/styles/common.css" />     </head><body spellcheck="false"><p>Unfortunately we are unable to publish your blog post on the site yet because</p>         <p>&nbsp;</p>         <p>Regards,<br />         {tplvars.sitename} admin</p></body></html>', 3),
(4, 'Reject comment', 'One of your comments was not approved', '<html><head><title>Your comment has not been approved</title>                       <link rel="stylesheet" type="text/css" media="screen" href="{tplvars.baseurl}/skins/def/styles/common.css" />     </head><body spellcheck="false"><p>Unfortunately we are unable to publish your comment on the site yet because</p>         <p>&nbsp;</p>         <p>Regards,<br />         {tplvars.sitename} admin</p></body></html>', 4);

-- --------------------------------------------------------

--
-- Table structure for table `dsb_banned_words`
--

DROP TABLE IF EXISTS `dsb_banned_words`;
CREATE TABLE `dsb_banned_words` (
  `word_id` int(5) unsigned NOT NULL auto_increment,
  `word` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`word_id`),
  UNIQUE KEY `word` (`word`)
) TYPE=MyISAM;

--
-- Dumping data for table `dsb_banned_words`
--

INSERT INTO `dsb_banned_words` (`word_id`, `word`) VALUES
(5, 'fuck'),
(6, 'suck'),
(7, 'sucks'),
(8, 'dick'),
(9, 'cock'),
(10, 'penis');

-- --------------------------------------------------------

--
-- Table structure for table `dsb_blog_comments`
--

DROP TABLE IF EXISTS `dsb_blog_comments`;
CREATE TABLE `dsb_blog_comments` (
  `comment_id` int(10) unsigned NOT NULL auto_increment,
  `fk_parent_id` int(10) unsigned NOT NULL default '0',
  `fk_user_id` int(10) unsigned NOT NULL default '0',
  `_user` varchar(48) NOT NULL default '',
  `comment` text NOT NULL,
  `date_posted` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_changed` datetime NOT NULL default '0000-00-00 00:00:00',
  `status` tinyint(2) unsigned NOT NULL default '0',
  `processed` tinyint(2) unsigned NOT NULL default '0',
  PRIMARY KEY  (`comment_id`),
  KEY `fk_user_id` (`fk_user_id`),
  KEY `date_posted` (`date_posted`),
  KEY `key1` (`fk_parent_id`,`status`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS `dsb_blog_posts`;
CREATE TABLE `dsb_blog_posts` (
  `post_id` int(10) unsigned NOT NULL auto_increment,
  `date_posted` datetime NOT NULL default '0000-00-00 00:00:00',
  `fk_user_id` int(10) unsigned NOT NULL default '0',
  `_user` varchar(48) NOT NULL default '',
  `fk_blog_id` int(10) unsigned NOT NULL default '0',
  `is_public` tinyint(1) unsigned NOT NULL default '1',
  `title` varchar(200) NOT NULL default '',
  `post_content` text NOT NULL,
  `allow_comments` tinyint(1) unsigned NOT NULL default '1',
  `status` tinyint(2) unsigned NOT NULL default '0',
  `post_url` text NOT NULL,
  `stat_views` int(5) unsigned NOT NULL default '0',
  `stat_comments` int(5) unsigned NOT NULL default '0',
  `last_changed` datetime NOT NULL default '0000-00-00 00:00:00',
  `reject_reason` text NOT NULL,
  `processed` tinyint(2) unsigned NOT NULL default '0',
  PRIMARY KEY  (`post_id`),
  KEY `is_public` (`is_public`),
  KEY `date_posted` (`date_posted`),
  KEY `key1` (`fk_blog_id`,`is_public`,`status`),
  KEY `key2` (`fk_user_id`,`is_public`,`status`),
  FULLTEXT KEY `text_key` (`title`,`post_content`)
) TYPE=MyISAM PACK_KEYS=0;


DROP TABLE IF EXISTS `dsb_error_log`;
CREATE TABLE `dsb_error_log` (
  `log_id` int(10) unsigned NOT NULL auto_increment,
  `module` varchar(48) NOT NULL default '',
  `error` text NOT NULL,
  `error_date` timestamp(14) NOT NULL,
  PRIMARY KEY  (`log_id`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS `dsb_feed_cache`;
CREATE TABLE `dsb_feed_cache` (
  `module_code` varchar(32) binary NOT NULL default '',
  `feed_xml` text NOT NULL,
  `update_time` timestamp(14) NOT NULL,
  PRIMARY KEY  (`module_code`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS `dsb_flirts`;
CREATE TABLE `dsb_flirts` (
  `flirt_id` int(3) unsigned NOT NULL auto_increment,
  `flirt_text` text NOT NULL,
  `flirt_type` tinyint(2) unsigned NOT NULL default '0',
  PRIMARY KEY  (`flirt_id`),
  KEY `flirt_type` (`flirt_type`)
) TYPE=MyISAM;

--
-- Dumping data for table `dsb_flirts`
--

INSERT INTO `dsb_flirts` (`flirt_id`, `flirt_text`, `flirt_type`) VALUES
(5, 'Hey sexy!', 0),
(6, 'Whaaadddup!', 0),
(4, 'I hope you know CPR, cuz you take my breath away...', 0),
(7, 'Hello? Hello? Anybody there?', 0),
(8, 'In your dreams', 1),
(9, 'Maybe later', 1),
(10, 'Sure, let''s go', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dsb_lang_keys`
--

DROP TABLE IF EXISTS `dsb_lang_keys`;
CREATE TABLE `dsb_lang_keys` (
  `lk_id` int(5) unsigned NOT NULL auto_increment,
  `lk_type` tinyint(1) unsigned NOT NULL default '0',
  `lk_diz` varchar(255) NOT NULL default '',
  `lk_use` tinyint(2) unsigned NOT NULL default '0',
  PRIMARY KEY  (`lk_id`),
  KEY `lk_use` (`lk_use`)
) TYPE=MyISAM;

--
-- Dumping data for table `dsb_lang_keys`
--

INSERT INTO `dsb_lang_keys` (`lk_id`, `lk_type`, `lk_diz`, `lk_use`) VALUES
(1, 2, 'Category name', 1),
(2, 2, 'Category name', 1),
(3, 2, 'Label for f1 field', 1),
(4, 2, 'Search label for f1 field', 1),
(5, 4, 'Help text for f1 field', 1),
(6, 2, 'Field value', 1),
(7, 2, 'Field value', 1),
(8, 2, 'Label for f2 field', 1),
(9, 2, 'Search label for f2 field', 1),
(10, 4, 'Help text for f2 field', 1),
(11, 2, 'Field value', 1),
(12, 2, 'Field value', 1),
(13, 2, 'Label for f3 field', 1),
(14, 2, 'Search label for f3 field', 1),
(15, 4, 'Help text for f3 field', 1),
(46, 2, 'Field value', 1),
(47, 2, 'Field value', 1),
(48, 2, 'Field value', 1),
(49, 2, 'Field value', 1),
(22, 2, 'Label for f4 field', 1),
(23, 2, 'Search label for f4 field', 1),
(24, 4, 'Help text for f4 field', 1),
(25, 2, 'Label for f5 field', 1),
(26, 2, 'Search label for f5 field', 1),
(27, 4, 'Help text for f5 field', 1),
(28, 2, 'Label for f6 field', 1),
(29, 2, 'Search label for f6 field', 1),
(30, 4, 'Help text for f6 field', 1),
(31, 2, 'Category name', 1),
(32, 2, 'Category name', 1),
(33, 2, 'Category name', 1),
(34, 2, 'Field value', 1),
(35, 2, 'Field value', 1),
(36, 2, 'Field value', 1),
(37, 2, 'Field value', 1),
(38, 2, 'Field value', 1),
(39, 2, 'Field value', 1),
(40, 2, 'Field value', 1),
(41, 2, 'Field value', 1),
(42, 2, 'Field value', 1),
(43, 2, 'Label for f7 field', 1),
(44, 2, 'Search label for f7 field', 1),
(45, 4, 'Help text for f7 field', 1),
(50, 2, 'Field value', 1),
(51, 2, 'Field value', 1),
(52, 2, 'Field value', 1),
(53, 2, 'Field value', 1),
(54, 2, 'Field value', 1),
(55, 2, 'Field value', 1),
(106, 2, 'Field value', 1),
(57, 2, 'Field value', 1),
(58, 2, 'Field value', 1),
(59, 2, 'Field value', 1),
(60, 2, 'Field value', 1),
(61, 2, 'Field value', 1),
(62, 2, 'Field value', 1),
(63, 2, 'Field value', 1),
(64, 2, 'Field value', 1),
(65, 2, 'Field value', 1),
(66, 2, 'Field value', 1),
(67, 2, 'Field value', 1),
(68, 2, 'Field value', 1),
(69, 2, 'Field value', 1),
(70, 2, 'Field value', 1),
(71, 2, 'Field value', 1),
(72, 2, 'Field value', 1),
(73, 2, 'Field value', 1),
(74, 2, 'Field value', 1),
(75, 2, 'Field value', 1),
(76, 2, 'Field value', 1),
(77, 2, 'Field value', 1),
(78, 2, 'Field value', 1),
(79, 2, 'Field value', 1),
(80, 2, 'Field value', 1),
(81, 2, 'Field value', 1),
(82, 2, 'Field value', 1),
(83, 2, 'Field value', 1),
(84, 2, 'Field value', 1),
(85, 2, 'Field value', 1),
(86, 2, 'Field value', 1),
(87, 2, 'Field value', 1),
(88, 2, 'Field value', 1),
(89, 2, 'Field value', 1),
(90, 2, 'Field value', 1),
(91, 2, 'Field value', 1),
(92, 2, 'Field value', 1),
(93, 2, 'Field value', 1),
(94, 2, 'Field value', 1),
(95, 2, 'Field value', 1),
(96, 2, 'Field value', 1),
(97, 2, 'Field value', 1),
(98, 2, 'Field value', 1),
(99, 2, 'Field value', 1),
(100, 2, 'Field value', 1),
(101, 2, 'Field value', 1),
(102, 2, 'Field value', 1),
(103, 2, 'Field value', 1),
(104, 2, 'Field value', 1),
(105, 2, 'Field value', 1),
(107, 2, 'Field value', 1),
(108, 2, 'Field value', 1),
(109, 2, 'Field value', 1),
(110, 2, 'Field value', 1),
(111, 2, 'Field value', 1),
(112, 2, 'Field value', 1),
(113, 2, 'Field value', 1),
(114, 2, 'Field value', 1),
(115, 2, 'Field value', 1),
(116, 2, 'Label for f8 field', 1),
(117, 2, 'Search label for f8 field', 1),
(118, 4, 'Help text for f8 field', 1),
(119, 2, 'Field value', 1),
(120, 2, 'Field value', 1),
(121, 2, 'Field value', 1),
(122, 2, 'Field value', 1),
(123, 2, 'Field value', 1),
(124, 2, 'Field value', 1),
(125, 2, 'Label for f9 field', 1),
(126, 2, 'Search label for f9 field', 1),
(127, 4, 'Help text for f9 field', 1),
(128, 2, 'Field value', 1),
(129, 2, 'Field value', 1),
(130, 2, 'Field value', 1),
(131, 2, 'Field value', 1),
(132, 2, 'Field value', 1),
(133, 2, 'Field value', 1),
(134, 2, 'Field value', 1),
(135, 2, 'Field value', 1),
(136, 2, 'Field value', 1),
(137, 2, 'Label for f10 field', 1),
(138, 2, 'Search label for f10 field', 1),
(139, 4, 'Help text for f10 field', 1),
(140, 2, 'Field value', 1),
(141, 2, 'Field value', 1),
(142, 2, 'Field value', 1),
(143, 2, 'Label for f11 field', 1),
(144, 2, 'Search label for f11 field', 1),
(145, 4, 'Help text for f11 field', 1),
(146, 2, 'Field value', 1),
(147, 2, 'Field value', 1),
(148, 2, 'Field value', 1),
(149, 2, 'Label for f12 field', 1),
(150, 2, 'Search label for f12 field', 1),
(151, 4, 'Help text for f12 field', 1),
(152, 2, 'Field value', 1),
(153, 2, 'Field value', 1),
(154, 2, 'Field value', 1),
(155, 2, 'Field value', 1),
(156, 2, 'Field value', 1),
(157, 2, 'Label for f13 field', 1),
(158, 2, 'Search label for f13 field', 1),
(159, 4, 'Help text for f13 field', 1),
(160, 2, 'Field value', 1),
(161, 2, 'Field value', 1),
(162, 2, 'Field value', 1),
(163, 2, 'Field value', 1),
(164, 2, 'Label for f14 field', 1),
(165, 2, 'Search label for f14 field', 1),
(166, 4, 'Help text for f14 field', 1),
(167, 2, 'Field value', 1),
(168, 2, 'Field value', 1),
(169, 2, 'Field value', 1),
(170, 2, 'Field value', 1),
(171, 2, 'Field value', 1),
(172, 2, 'Field value', 1),
(173, 2, 'Field value', 1),
(174, 2, 'Label for f15 field', 1),
(175, 2, 'Search label for f15 field', 1),
(176, 4, 'Help text for f15 field', 1),
(177, 2, 'Field value', 1),
(181, 2, 'Error message for a limit', 0),
(182, 2, 'Error message for a limit', 0),
(183, 2, 'Error message for a limit', 0),
(184, 2, 'Ban reason', 2),
(185, 2, 'Ban reason', 2),
(186, 2, 'Ban reason', 2),
(187, 2, 'Ban reason', 2);

-- --------------------------------------------------------

--
-- Table structure for table `dsb_lang_strings`
--

DROP TABLE IF EXISTS `dsb_lang_strings`;
CREATE TABLE `dsb_lang_strings` (
  `ls_id` int(11) unsigned NOT NULL auto_increment,
  `fk_lk_id` int(5) unsigned NOT NULL default '0',
  `skin` varchar(50) NOT NULL default '',
  `lang_value` text NOT NULL,
  PRIMARY KEY  (`ls_id`),
  UNIQUE KEY `thekey` (`fk_lk_id`,`skin`)
) TYPE=MyISAM;

--
-- Dumping data for table `dsb_lang_strings`
--

INSERT INTO `dsb_lang_strings` (`ls_id`, `fk_lk_id`, `skin`, `lang_value`) VALUES
(1, 1, 'skin_def', 'Basic Info'),
(2, 2, 'skin_def', 'Appearance'),
(217, 3, 'skin_def', 'About me'),
(218, 4, 'skin_def', ''),
(219, 5, 'skin_def', ''),
(6, 6, 'skin_def', 'Man'),
(7, 7, 'skin_def', 'Woman'),
(214, 8, 'skin_def', 'I am a'),
(215, 9, 'skin_def', 'Find a'),
(216, 10, 'skin_def', ''),
(11, 11, 'skin_def', 'Men'),
(12, 12, 'skin_def', 'Women'),
(13, 13, 'skin_def', 'Seeking'),
(14, 14, 'skin_def', 'Seeking'),
(15, 15, 'skin_def', ''),
(49, 49, 'skin_def', '3''3"'),
(50, 50, 'skin_def', '3''4"'),
(51, 51, 'skin_def', '3''5"'),
(52, 52, 'skin_def', '3''6"'),
(22, 22, 'skin_def', 'My height is'),
(23, 23, 'skin_def', 'Height'),
(24, 24, 'skin_def', ''),
(31, 31, 'skin_def', 'Lifestyle'),
(46, 46, 'skin_def', '3''0"'),
(47, 47, 'skin_def', '3''1"'),
(48, 48, 'skin_def', '3''2"'),
(25, 25, 'skin_def', 'Birthdate'),
(26, 26, 'skin_def', 'Age'),
(27, 27, 'skin_def', ''),
(28, 28, 'skin_def', 'Country'),
(29, 29, 'skin_def', 'From'),
(30, 30, 'skin_def', ''),
(32, 32, 'skin_def', 'Home Life'),
(33, 33, 'skin_def', 'Personality'),
(34, 34, 'skin_def', 'African American (black)'),
(35, 35, 'skin_def', 'Asian'),
(36, 36, 'skin_def', 'Caucasian (white)'),
(37, 37, 'skin_def', 'East Indian'),
(38, 38, 'skin_def', 'Hispanic/Latino'),
(39, 39, 'skin_def', 'Middle Eastern'),
(40, 40, 'skin_def', 'Native American'),
(41, 41, 'skin_def', 'Pacific Islander'),
(42, 42, 'skin_def', 'Inter-racial'),
(43, 43, 'skin_def', 'My ethnicity is'),
(44, 44, 'skin_def', 'Having ethnicity'),
(45, 45, 'skin_def', ''),
(53, 53, 'skin_def', '3''7"'),
(54, 54, 'skin_def', '3''8"'),
(55, 55, 'skin_def', '3''9"'),
(106, 106, 'skin_def', '4''0"'),
(57, 57, 'skin_def', '3''10"'),
(58, 58, 'skin_def', '3''11"'),
(59, 59, 'skin_def', '4''1"'),
(60, 60, 'skin_def', '4''2"'),
(61, 61, 'skin_def', '4''3"'),
(62, 62, 'skin_def', '4''4"'),
(63, 63, 'skin_def', '4''5"'),
(64, 64, 'skin_def', '4''6"'),
(65, 65, 'skin_def', '4''7"'),
(66, 66, 'skin_def', '4''8"'),
(67, 67, 'skin_def', '4''9"'),
(68, 68, 'skin_def', '4''10"'),
(69, 69, 'skin_def', '4''11"'),
(70, 70, 'skin_def', '5''0"'),
(71, 71, 'skin_def', '5''1"'),
(72, 72, 'skin_def', '5''2"'),
(73, 73, 'skin_def', '5''3"'),
(74, 74, 'skin_def', '5''4"'),
(75, 75, 'skin_def', '5''5"'),
(76, 76, 'skin_def', '5''6"'),
(77, 77, 'skin_def', '5''7"'),
(78, 78, 'skin_def', '5''8"'),
(79, 79, 'skin_def', '5''9"'),
(80, 80, 'skin_def', '5''10"'),
(81, 81, 'skin_def', '5''11"'),
(82, 82, 'skin_def', '6''0"'),
(83, 83, 'skin_def', '6''1"'),
(84, 84, 'skin_def', '6''2"'),
(85, 85, 'skin_def', '6''3"'),
(86, 86, 'skin_def', '6''4"'),
(87, 87, 'skin_def', '6''5"'),
(88, 88, 'skin_def', '6''6"'),
(89, 89, 'skin_def', '6''7"'),
(90, 90, 'skin_def', '6''8"'),
(91, 91, 'skin_def', '6''9"'),
(92, 92, 'skin_def', '6''10"'),
(93, 93, 'skin_def', '6''11"'),
(94, 94, 'skin_def', '7''0"'),
(95, 95, 'skin_def', '7''1"'),
(96, 96, 'skin_def', '7''2"'),
(97, 97, 'skin_def', '7''3"'),
(98, 98, 'skin_def', '7''4"'),
(99, 99, 'skin_def', '7''5"'),
(100, 100, 'skin_def', '7''6"'),
(101, 101, 'skin_def', '7''7"'),
(102, 102, 'skin_def', '7''8"'),
(103, 103, 'skin_def', '7''9"'),
(104, 104, 'skin_def', '7''10"'),
(105, 105, 'skin_def', '7''11"'),
(107, 107, 'skin_def', 'Slim'),
(108, 108, 'skin_def', 'Slender'),
(109, 109, 'skin_def', 'Average'),
(110, 110, 'skin_def', 'Athletic'),
(111, 111, 'skin_def', 'Fit'),
(112, 112, 'skin_def', 'Thick'),
(113, 113, 'skin_def', 'A few extra pounds'),
(114, 114, 'skin_def', 'Large'),
(115, 115, 'skin_def', 'Voluptous'),
(116, 116, 'skin_def', 'My body type is'),
(117, 117, 'skin_def', 'Body'),
(118, 118, 'skin_def', ''),
(119, 119, 'skin_def', 'Black'),
(120, 120, 'skin_def', 'Blue'),
(121, 121, 'skin_def', 'Brown'),
(122, 122, 'skin_def', 'Gray'),
(123, 123, 'skin_def', 'Green'),
(124, 124, 'skin_def', 'Hazel'),
(125, 125, 'skin_def', 'My eyes are'),
(126, 126, 'skin_def', 'Eyes'),
(127, 127, 'skin_def', ''),
(128, 128, 'skin_def', 'Auburn'),
(129, 129, 'skin_def', 'Black'),
(130, 130, 'skin_def', 'Blonde'),
(131, 131, 'skin_def', 'Light Brown'),
(132, 132, 'skin_def', 'Dark Brown'),
(133, 133, 'skin_def', 'Red'),
(134, 134, 'skin_def', 'White/Gray'),
(135, 135, 'skin_def', 'Bald'),
(136, 136, 'skin_def', 'A little gray'),
(199, 137, 'skin_def', 'My hair is'),
(200, 138, 'skin_def', 'Hair'),
(201, 139, 'skin_def', ''),
(140, 140, 'skin_def', 'No'),
(141, 141, 'skin_def', 'Socially'),
(142, 142, 'skin_def', 'Daily'),
(143, 143, 'skin_def', 'I smoke'),
(144, 144, 'skin_def', 'Smoke'),
(145, 145, 'skin_def', ''),
(146, 146, 'skin_def', 'No'),
(147, 147, 'skin_def', 'Socially'),
(148, 148, 'skin_def', 'Daily'),
(149, 149, 'skin_def', 'I drink'),
(150, 150, 'skin_def', 'Drink'),
(151, 151, 'skin_def', ''),
(152, 152, 'skin_def', 'Some High School'),
(153, 153, 'skin_def', 'High School Grad'),
(154, 154, 'skin_def', 'Some College'),
(155, 155, 'skin_def', 'College Grad'),
(156, 156, 'skin_def', 'Post-Graduate'),
(157, 157, 'skin_def', 'My education is'),
(158, 158, 'skin_def', 'Education'),
(159, 159, 'skin_def', ''),
(160, 160, 'skin_def', 'Single, never married'),
(161, 161, 'skin_def', 'Divorced'),
(162, 162, 'skin_def', 'Widowed'),
(163, 163, 'skin_def', 'Separated'),
(164, 164, 'skin_def', 'My marital status is'),
(165, 165, 'skin_def', 'Marital status'),
(166, 166, 'skin_def', ''),
(167, 167, 'skin_def', 'Alone'),
(168, 168, 'skin_def', 'With kids'),
(169, 169, 'skin_def', 'With parents'),
(170, 170, 'skin_def', 'With pets'),
(171, 171, 'skin_def', 'With roommate(s)'),
(172, 172, 'skin_def', 'Family and friends visit often'),
(173, 173, 'skin_def', 'There is a party every night'),
(174, 174, 'skin_def', 'I am currently living'),
(175, 175, 'skin_def', 'Living');


DROP TABLE IF EXISTS `dsb_locales`;
CREATE TABLE `dsb_locales` (
  `locale_id` int(4) unsigned NOT NULL auto_increment,
  `locale_name` varchar(100) NOT NULL default '',
  `codes` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`locale_id`)
) TYPE=MyISAM;

--
-- Dumping data for table `dsb_locales`
--

INSERT INTO `dsb_locales` (`locale_id`, `locale_name`, `codes`) VALUES
(1, 'Arabic (Algeria)', 'ar_DZ,arabic'),
(2, 'Arabic (Saudi Arabia)', 'ar_SA,arabic'),
(3, 'Bulgarian (Bulgaria)', 'bg_BG,bulgarian'),
(4, 'Chinese, Simplified (China)', 'zh_CN,chinese'),
(5, 'Chinese, Traditional (Hong Kong)', 'zh_HK,chinese'),
(6, 'Chinese, Traditional (Taiwan)', 'zh_TW,chinese'),
(7, 'Czech (Czech Republic)', 'cs_CZ,czech'),
(8, 'Danish (Denmark)', 'da_DK,danish'),
(9, 'Dutch (Netherlands)', 'nl_NL,dutch'),
(10, 'English (United Kingdom)', 'en_GB,english'),
(11, 'English (United States)', 'en_US,english'),
(12, 'Finnish (Finland)', 'fi_FI,finnish'),
(13, 'French (Canada)', 'fr_CA,french'),
(14, 'French (France)', 'fr_FR,french'),
(15, 'German (Germany)', 'de_DE,german'),
(16, 'Greek (Greece)', 'el_GR,greek'),
(17, 'Hebrew (Israel)', 'iw_IL,hebrew'),
(18, 'Hungarian (Hungary)', 'hu_HU,hungarian'),
(19, 'Icelandic (Iceland)', 'is_IS,icelandic'),
(20, 'Italian (Italy)', 'it_IT,italian'),
(21, 'Japanese (Japan)', 'ja_JP,japanese'),
(22, 'Korean (Korea)', 'ko_KR,korean'),
(23, 'Norwegian (Norway)', 'no_NO,norwegian'),
(24, 'Polish (Poland)', 'pl_PL,polish'),
(25, 'Portuguese (Brazil)', 'pt_BR,portuguese'),
(26, 'Portuguese (Portugal)', 'pt_PT,portuguese'),
(27, 'Romanian (Romania)', 'ro_RO,romanian'),
(28, 'Russian (Russia)', 'ru_RU,russian'),
(29, 'Serbocroatian (Croatia)', 'hr_HR,croatian'),
(30, 'Slovak (Slovakia)', 'sk_SK,slovak'),
(31, 'Slovene (Slovenia)', 'sl_SI,sloven'),
(32, 'Spanish (Argentina)', 'es_AR,spanish'),
(33, 'Spanish (Bolivia)', 'es_BO,spanish'),
(34, 'Spanish (Chile)', 'es_CL,spanish'),
(35, 'Spanish (Colombia)', 'es_CO,spanish'),
(36, 'Spanish (Costa Rica)', 'es_CR,spanish'),
(37, 'Spanish (Ecuador)', 'es_EC,spanish'),
(38, 'Spanish (El Salvador)', 'es_SV,spanish'),
(39, 'Spanish (Guatemala)', 'es_GT,spanish'),
(40, 'Spanish (Mexico)', 'es_MX,spanish'),
(41, 'Spanish (Nicaragua)', 'es_NI,spanish'),
(42, 'Spanish (Panama)', 'es_PA,spanish'),
(43, 'Spanish (Paraguay)', 'es_PY,spanish'),
(44, 'Spanish (Peru)', 'es_PE,spanish'),
(45, 'Spanish (Puerto Rico)', 'es_PR,spanish'),
(46, 'Spanish (Spain)', 'es_ES,spanish'),
(47, 'Spanish (Uruguay)', 'es_UY,spanish'),
(48, 'Spanish (Venezuela)', 'es_VE,spanish'),
(49, 'Swedish (Sweden)', 'sv_SE,spanish'),
(50, 'Thai (Thailand)', 'th_TH,thai'),
(51, 'Turkish (Turkey)', 'tr_TR,turkish');

-- --------------------------------------------------------

--
-- Table structure for table `dsb_loc_cities`
--

DROP TABLE IF EXISTS `dsb_loc_cities`;
CREATE TABLE `dsb_loc_cities` (
  `city_id` int(10) unsigned NOT NULL auto_increment,
  `geonameid` int(10) unsigned NOT NULL default '0',
  `city` varchar(200) NOT NULL default '',
  `latitude` float(20,10) NOT NULL default '0.0000000000',
  `longitude` float(20,10) NOT NULL default '0.0000000000',
  `fk_country_id` int(3) unsigned NOT NULL default '0',
  `fk_state_id` int(10) unsigned NOT NULL default '0',
  `feature_code` varchar(10) NOT NULL default '',
  `feature_class` char(1) NOT NULL default '',
  PRIMARY KEY  (`city_id`),
  KEY `geonameid` (`geonameid`),
  KEY `fk_state_id` (`fk_state_id`),
  KEY `fk_country_id` (`fk_country_id`),
  KEY `city` (`city`)
) TYPE=MyISAM;

DROP TABLE IF EXISTS `dsb_loc_countries`;
CREATE TABLE `dsb_loc_countries` (
  `country_id` int(10) unsigned NOT NULL auto_increment,
  `iso3166` char(2) NOT NULL default '',
  `country` varchar(200) NOT NULL default '',
  `prefered_input` enum('z','s') NOT NULL default 's',
  `num_states` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`country_id`),
  KEY `iso3166` (`iso3166`)
) TYPE=MyISAM;

--
-- Dumping data for table `dsb_loc_countries`
--

INSERT INTO `dsb_loc_countries` (`country_id`, `iso3166`, `country`, `prefered_input`, `num_states`) VALUES
(1, 'AF', 'Afghanistan', 's', 0),
(2, 'AL', 'Albania', 's', 0),
(3, 'AG', 'Algeria', 's', 0),
(4, 'AN', 'Andorra', 's', 0),
(5, 'AO', 'Angola', 's', 0),
(6, 'AV', 'Anguilla', 's', 0),
(7, 'AC', 'Antigua and Barbuda', 's', 0),
(8, 'AR', 'Argentina', 's', 0),
(9, 'AM', 'Armenia', 's', 0),
(10, 'AA', 'Aruba', 's', 0),
(11, 'AS', 'Australia', 's', 0),
(12, 'AU', 'Austria', 's', 0),
(13, 'AJ', 'Azerbaijan', 's', 0),
(14, 'BA', 'Bahrain', 's', 0),
(15, 'BG', 'Bangladesh', 's', 0),
(16, 'BB', 'Barbados', 's', 0),
(17, 'BO', 'Belarus', 's', 0),
(18, 'BE', 'Belgium', 's', 0),
(19, 'BH', 'Belize', 's', 0),
(20, 'BN', 'Benin', 's', 0),
(21, 'BD', 'Bermuda', 's', 0),
(22, 'BT', 'Bhutan', 's', 0),
(23, 'BL', 'Bolivia', 's', 0),
(24, 'BK', 'Bosnia and Herzegovina', 's', 0),
(25, 'BC', 'Botswana', 's', 0),
(26, 'BR', 'Brazil', 's', 0),
(27, 'VI', 'British Virgin Islands', 's', 0),
(28, 'BX', 'Brunei', 's', 0),
(29, 'BU', 'Bulgaria', 's', 0),
(30, 'UV', 'Burkina Faso', 's', 0),
(31, 'BY', 'Burundi', 's', 0),
(32, 'CB', 'Cambodia', 's', 0),
(33, 'CM', 'Cameroon', 's', 0),
(34, 'CA', 'Canada', 's', 0),
(35, 'CV', 'Cape Verde', 's', 0),
(36, 'CJ', 'Cayman Islands', 's', 0),
(37, 'CT', 'Central African Republic', 's', 0),
(38, 'CD', 'Chad', 's', 0),
(39, 'CI', 'Chile', 's', 0),
(40, 'CH', 'China', 's', 0),
(41, 'KT', 'Christmas Island', 's', 0),
(42, 'CK', 'Cocos (Keeling) Islands', 's', 0),
(43, 'CO', 'Colombia', 's', 0),
(44, 'CN', 'Comoros', 's', 0),
(45, 'CF', 'Congo (Brazzaville)', 's', 0),
(46, 'CG', 'Congo (Kinshasa)', 's', 0),
(47, 'CW', 'Cook Islands', 's', 0),
(48, 'CS', 'Costa Rica', 's', 0),
(49, 'IV', 'Cote D''Ivoire', 's', 0),
(50, 'HR', 'Croatia', 's', 0),
(51, 'CU', 'Cuba', 's', 0),
(52, 'CY', 'Cyprus', 's', 0),
(53, 'EZ', 'Czech Republic', 's', 0),
(54, 'DA', 'Denmark', 's', 0),
(55, 'DJ', 'Djibouti', 's', 0),
(56, 'DO', 'Dominica', 's', 0),
(57, 'DR', 'Dominican Republic', 's', 0),
(58, 'TT', 'East Timor', 's', 0),
(59, 'EC', 'Ecuador', 's', 0),
(60, 'EG', 'Egypt', 's', 0),
(61, 'ES', 'El Salvador', 's', 0),
(62, 'EK', 'Equatorial Guinea', 's', 0),
(63, 'ER', 'Eritrea', 's', 0),
(64, 'EN', 'Estonia', 's', 0),
(65, 'ET', 'Ethiopia', 's', 0),
(66, 'FK', 'Falkland Islands (Islas Malvinas)', 's', 0),
(67, 'FO', 'Faroe Islands', 's', 0),
(68, 'FJ', 'Fiji', 's', 0),
(69, 'FI', 'Finland', 's', 0),
(70, 'FR', 'France', 's', 0),
(71, 'FG', 'French Guiana', 's', 0),
(72, 'FP', 'French Polynesia', 's', 0),
(73, 'GB', 'Gabon', 's', 0),
(74, 'GZ', 'Gaza Strip', 's', 0),
(75, 'GG', 'Georgia', 's', 0),
(76, 'GM', 'Germany', 's', 0),
(77, 'GH', 'Ghana', 's', 0),
(78, 'GI', 'Gibraltar', 's', 0),
(79, 'GR', 'Greece', 's', 0),
(80, 'GL', 'Greenland', 's', 0),
(81, 'GJ', 'Grenada', 's', 0),
(82, 'GP', 'Guadeloupe', 's', 0),
(83, 'GT', 'Guatemala', 's', 0),
(84, 'GK', 'Guernsey', 's', 0),
(85, 'GV', 'Guinea', 's', 0),
(86, 'PU', 'Guinea-Bissau', 's', 0),
(87, 'GY', 'Guyana', 's', 0),
(88, 'HA', 'Haiti', 's', 0),
(89, 'HO', 'Honduras', 's', 0),
(90, 'HK', 'Hong Kong', 's', 0),
(91, 'HU', 'Hungary', 's', 0),
(92, 'IC', 'Iceland', 's', 0),
(93, 'IN', 'India', 's', 0),
(94, 'ID', 'Indonesia', 's', 0),
(95, 'IR', 'Iran', 's', 0),
(96, 'IZ', 'Iraq', 's', 0),
(97, 'EI', 'Ireland', 's', 0),
(98, 'IM', 'Isle of Man', 's', 0),
(99, 'IS', 'Israel', 's', 0),
(100, 'IT', 'Italy', 's', 0),
(101, 'JM', 'Jamaica', 's', 0),
(102, 'JA', 'Japan', 's', 0),
(103, 'JE', 'Jersey', 's', 0),
(104, 'JO', 'Jordan', 's', 0),
(105, 'KZ', 'Kazakhstan', 's', 0),
(106, 'KE', 'Kenya', 's', 0),
(107, 'KR', 'Kiribati', 's', 0),
(108, 'KU', 'Kuwait', 's', 0),
(109, 'KG', 'Kyrgyzstan', 's', 0),
(110, 'LA', 'Laos', 's', 0),
(111, 'LG', 'Latvia', 's', 0),
(112, 'LE', 'Lebanon', 's', 0),
(113, 'LT', 'Lesotho', 's', 0),
(114, 'LI', 'Liberia', 's', 0),
(115, 'LY', 'Libya', 's', 0),
(116, 'LS', 'Liechtenstein', 's', 0),
(117, 'LH', 'Lithuania', 's', 0),
(118, 'LU', 'Luxembourg', 's', 0),
(119, 'MC', 'Macau', 's', 0),
(120, 'MK', 'Macedonia', 's', 0),
(121, 'MA', 'Madagascar', 's', 0),
(122, 'MI', 'Malawi', 's', 0),
(123, 'MY', 'Malaysia', 's', 0),
(124, 'MV', 'Maldives', 's', 0),
(125, 'ML', 'Mali', 's', 0),
(126, 'MT', 'Malta', 's', 0),
(127, 'MB', 'Martinique', 's', 0),
(128, 'MR', 'Mauritania', 's', 0),
(129, 'MP', 'Mauritius', 's', 0),
(130, 'MF', 'Mayotte', 's', 0),
(131, 'MX', 'Mexico', 's', 0),
(132, 'MD', 'Moldova', 's', 0),
(133, 'MN', 'Monaco', 's', 0),
(134, 'MG', 'Mongolia', 's', 0),
(135, 'MH', 'Montserrat', 's', 0),
(136, 'MO', 'Morocco', 's', 0),
(137, 'MZ', 'Mozambique', 's', 0),
(138, 'BM', 'Myanmar (Burma)', 's', 0),
(139, 'WA', 'Namibia', 's', 0),
(140, 'NR', 'Nauru', 's', 0),
(141, 'NP', 'Nepal', 's', 0),
(142, 'NL', 'Netherlands', 's', 0),
(143, 'NT', 'Netherlands Antilles', 's', 0),
(144, 'NC', 'New Caledonia', 's', 0),
(145, 'NZ', 'New Zealand', 's', 0),
(146, 'NU', 'Nicaragua', 's', 0),
(147, 'NG', 'Niger', 's', 0),
(148, 'NI', 'Nigeria', 's', 0),
(149, 'NE', 'Niue', 's', 0),
(150, 'NF', 'Norfolk Island', 's', 0),
(151, 'KN', 'North Korea', 's', 0),
(152, 'NO', 'Norway', 's', 0),
(153, 'MU', 'Oman', 's', 0),
(154, 'PK', 'Pakistan', 's', 0),
(155, 'PM', 'Panama', 's', 0),
(156, 'PP', 'Papua New Guinea', 's', 0),
(157, 'PA', 'Paraguay', 's', 0),
(158, 'PE', 'Peru', 's', 0),
(159, 'RP', 'Philippines', 's', 0),
(160, 'PC', 'Pitcairn Islands', 's', 0),
(161, 'PL', 'Poland', 's', 0),
(162, 'PO', 'Portugal', 's', 0),
(163, 'QA', 'Qatar', 's', 0),
(164, 'RE', 'Reunion', 's', 0),
(165, 'RO', 'Romania', 's', 0),
(166, 'RS', 'Russia', 's', 0),
(167, 'RW', 'Rwanda', 's', 0),
(168, 'SH', 'Saint Helena', 's', 0),
(169, 'SC', 'Saint Kitts and Nevis', 's', 0),
(170, 'ST', 'Saint Lucia', 's', 0),
(171, 'SB', 'Saint Pierre and Miquelon', 's', 0),
(172, 'VC', 'Saint Vincent and the Grenadines', 's', 0),
(173, 'WS', 'Samoa', 's', 0),
(174, 'SM', 'San Marino', 's', 0),
(175, 'TP', 'Sao Tome and Principe', 's', 0),
(176, 'SA', 'Saudi Arabia', 's', 0),
(177, 'SG', 'Senegal', 's', 0),
(178, 'YI', 'Serbia and Montenegro', 's', 0),
(179, 'SE', 'Seychelles', 's', 0),
(180, 'SL', 'Sierra Leone', 's', 0),
(181, 'SN', 'Singapore', 's', 0),
(182, 'LO', 'Slovakia', 's', 0),
(183, 'SI', 'Slovenia', 's', 0),
(184, 'BP', 'Solomon Islands', 's', 0),
(185, 'SO', 'Somalia', 's', 0),
(186, 'SF', 'South Africa', 's', 0),
(187, 'SX', 'South Georgia and the South Sandw', 's', 0),
(188, 'KS', 'South Korea', 's', 0),
(189, 'SP', 'Spain', 's', 0),
(190, 'PG', 'Spratly Islands', 's', 0),
(191, 'CE', 'Sri Lanka', 's', 0),
(192, 'SU', 'Sudan', 's', 0),
(193, 'NS', 'Suriname', 's', 0),
(194, 'SV', 'Svalbard', 's', 0),
(195, 'WZ', 'Swaziland', 's', 0),
(196, 'SW', 'Sweden', 's', 0),
(197, 'SZ', 'Switzerland', 's', 0),
(198, 'SY', 'Syria', 's', 0),
(199, 'TW', 'Taiwan', 's', 0),
(200, 'TI', 'Tajikistan', 's', 0),
(201, 'TZ', 'Tanzania', 's', 0),
(202, 'TH', 'Thailand', 's', 0),
(203, 'BF', 'The Bahamas', 's', 0),
(204, 'GA', 'The Gambia', 's', 0),
(205, 'TO', 'Togo', 's', 0),
(206, 'TL', 'Tokelau', 's', 0),
(207, 'TN', 'Tonga', 's', 0),
(208, 'TD', 'Trinidad and Tobago', 's', 0),
(209, 'TS', 'Tunisia', 's', 0),
(210, 'TU', 'Turkey', 's', 0),
(211, 'TX', 'Turkmenistan', 's', 0),
(212, 'TK', 'Turks and Caicos Islands', 's', 0),
(213, 'TV', 'Tuvalu', 's', 0),
(214, 'UG', 'Uganda', 's', 0),
(215, 'UP', 'Ukraine', 's', 0),
(216, 'AE', 'United Arab Emirates', 's', 0),
(217, 'UK', 'United Kingdom', 's', 0),
(218, 'US', 'United States', 's', 59),
(219, 'UY', 'Uruguay', 's', 0),
(220, 'UZ', 'Uzbekistan', 's', 0),
(221, 'NH', 'Vanuatu', 's', 0),
(222, 'VE', 'Venezuela', 's', 0),
(223, 'VM', 'Vietnam', 's', 0),
(224, 'WF', 'Wallis and Futuna', 's', 0),
(225, 'WE', 'West Bank', 's', 0),
(226, 'WI', 'Western Sahara', 's', 0),
(227, 'YM', 'Yemen', 's', 0),
(228, 'ZA', 'Zambia', 's', 0),
(229, 'ZI', 'Zimbabwe', 's', 0);


DROP TABLE IF EXISTS `dsb_loc_states`;
CREATE TABLE `dsb_loc_states` (
  `state_id` int(10) unsigned NOT NULL auto_increment,
  `fk_country_id` int(2) unsigned NOT NULL default '0',
  `iso3166` char(2) NOT NULL default '',
  `state` varchar(200) NOT NULL default '',
  `num_cities` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`state_id`),
  KEY `fk_country_id` (`fk_country_id`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS `dsb_loc_zips`;
CREATE TABLE `dsb_loc_zips` (
  `zip_id` int(10) unsigned NOT NULL auto_increment,
  `zipcode` varchar(10) NOT NULL default '0',
  `fk_country_id` int(10) unsigned NOT NULL default '0',
  `fk_state_id` int(10) unsigned NOT NULL default '0',
  `fk_city_id` int(10) unsigned NOT NULL default '0',
  `latitude` double NOT NULL default '0',
  `longitude` double NOT NULL default '0',
  PRIMARY KEY  (`zip_id`),
  KEY `zipcode` (`zipcode`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `dsb_memberships`
--

DROP TABLE IF EXISTS `dsb_memberships`;
CREATE TABLE `dsb_memberships` (
  `m_id` int(2) unsigned NOT NULL auto_increment,
  `m_name` varchar(64) NOT NULL default '',
  `m_value` int(10) unsigned NOT NULL default '0',
  `is_custom` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`m_id`),
  UNIQUE KEY `m_name` (`m_name`),
  UNIQUE KEY `m_value` (`m_value`)
) TYPE=MyISAM PACK_KEYS=0 COMMENT='m_value must be uniq';

--
-- Dumping data for table `dsb_memberships`
--

INSERT INTO `dsb_memberships` (`m_id`, `m_name`, `m_value`, `is_custom`) VALUES
(1, 'Non Members', 1, 0),
(2, 'Free Members', 2, 0),
(3, 'Paid Members', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dsb_message_filters`
--

DROP TABLE IF EXISTS `dsb_message_filters`;
CREATE TABLE `dsb_message_filters` (
  `filter_id` int(10) NOT NULL auto_increment,
  `filter_type` tinyint(2) NOT NULL default '1',
  `fk_user_id` int(10) NOT NULL default '0',
  `field` varchar(32) binary NOT NULL default '',
  `field_value` varchar(255) NOT NULL default '',
  `fk_folder_id` int(10) NOT NULL default '0',
  PRIMARY KEY  (`filter_id`),
  UNIQUE KEY `filter_type` (`filter_type`,`fk_user_id`,`field_value`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS `dsb_modules`;
CREATE TABLE `dsb_modules` (
  `module_code` varchar(32) binary NOT NULL default '',
  `module_name` varchar(100) NOT NULL default '',
  `module_diz` text NOT NULL,
  `module_type` tinyint(1) unsigned NOT NULL default '0',
  `version` float(4,2) unsigned NOT NULL default '0.00',
  PRIMARY KEY  (`module_code`),
  KEY `module_type` (`module_type`)
) TYPE=MyISAM COMMENT='0-regular,1-pg,2-fraud,3-widg,4-skin';

--
-- Dumping data for table `dsb_modules`
--

INSERT INTO `dsb_modules` (`module_code`, `module_name`, `module_diz`, `module_type`, `version`) VALUES
(0x636f7265, 'Basic features', '', 0, 1.00),
(0x636f72655f626c6f67, 'Blogs', '', 0, 1.00),
(0x636f72655f70686f746f, 'Photo Album', '', 0, 1.00),
(0x70617970616c, 'Paypal', '', 1, 1.00),
(0x74776f636865636b6f7574, '2CheckOut', 'Credit card payments', 1, 1.00),
(0x617574686f72697a655f6e6574, 'Authorize.net', '', 1, 1.00),
(0x6d61786d696e64, 'Maxmind', 'Fraud checking module. Compares credit card country with  buyer''s IP country.', 2, 1.00),
(0x6f7369676e616c5f66656564, 'Original Signal Tech Feed', 'Retrieves the latest original signal tech stories', 3, 1.00),
(0x736b696e5f646566, 'Default Skin', 'Official default skin', 4, 0.01),
(0x6465665f757365725f7072656673, 'Default User Preferences', 'The default user preferences', 0, 1.00),
(0x646174656d696c6c5f66656564, 'Datemill Admin Feed', 'Datemill news for administrators', 3, 1.00);

-- --------------------------------------------------------

--
-- Table structure for table `dsb_networks`
--

DROP TABLE IF EXISTS `dsb_networks`;
CREATE TABLE `dsb_networks` (
  `net_id` int(10) unsigned NOT NULL auto_increment,
  `network` varchar(100) NOT NULL default '',
  `is_bidi` tinyint(1) unsigned NOT NULL default '1',
  `max_users` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`net_id`)
) TYPE=MyISAM;

--
-- Dumping data for table `dsb_networks`
--

INSERT INTO `dsb_networks` (`net_id`, `network`, `is_bidi`, `max_users`) VALUES
(1, 'Friends', 1, 0),
(2, 'Blocked Members', 0, 0),
(3, 'Favorites', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dsb_online`
--

DROP TABLE IF EXISTS `dsb_online`;
CREATE TABLE `dsb_online` (
  `fk_user_id` int(10) unsigned NOT NULL default '0',
  `last_activity` timestamp(14) NOT NULL,
  `sess` varchar(32) binary NOT NULL default '',
  UNIQUE KEY `key2` (`fk_user_id`,`sess`),
  UNIQUE KEY `key1` (`sess`),
  KEY `fk_user_id` (`fk_user_id`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS `dsb_payments`;
CREATE TABLE `dsb_payments` (
  `payment_id` int(10) unsigned NOT NULL auto_increment,
  `fk_user_id` int(10) unsigned NOT NULL default '0',
  `_user` varchar(32) NOT NULL default '',
  `gateway` varchar(32) NOT NULL default '',
  `fk_subscr_id` int(2) unsigned NOT NULL default '0',
  `is_recuring` tinyint(1) unsigned NOT NULL default '0',
  `gw_txn` varchar(30) NOT NULL default '',
  `name` varchar(100) NOT NULL default '',
  `country` varchar(200) NOT NULL default '',
  `state` varchar(100) NOT NULL default '',
  `city` varchar(100) NOT NULL default '',
  `zip` varchar(20) NOT NULL default '',
  `street_address` varchar(255) NOT NULL default '',
  `email` varchar(128) NOT NULL default '',
  `phone` varchar(30) NOT NULL default '',
  `m_value_from` int(10) unsigned NOT NULL default '0',
  `m_value_to` int(10) unsigned NOT NULL default '0',
  `amount_paid` float(10,2) unsigned NOT NULL default '0.00',
  `refunded` float(10,2) NOT NULL default '0.00',
  `paid_from` date NOT NULL default '0000-00-00',
  `paid_until` date NOT NULL default '0000-00-00',
  `is_suspect` tinyint(1) unsigned NOT NULL default '0',
  `suspect_reason` text NOT NULL,
  `date` timestamp(14) NOT NULL,
  PRIMARY KEY  (`payment_id`),
  KEY `date` (`date`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS `dsb_photo_comments`;
CREATE TABLE `dsb_photo_comments` (
  `comment_id` int(10) unsigned NOT NULL auto_increment,
  `fk_parent_id` int(10) unsigned NOT NULL default '0',
  `fk_user_id` int(10) unsigned NOT NULL default '0',
  `_user` varchar(48) NOT NULL default '',
  `comment` text NOT NULL,
  `date_posted` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_changed` datetime NOT NULL default '0000-00-00 00:00:00',
  `status` tinyint(2) unsigned NOT NULL default '0',
  `processed` tinyint(2) unsigned NOT NULL default '0',
  PRIMARY KEY  (`comment_id`),
  KEY `fk_user_id` (`fk_user_id`),
  KEY `date_posted` (`date_posted`),
  KEY `key1` (`fk_parent_id`,`status`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `dsb_photo_ratings`
--

DROP TABLE IF EXISTS `dsb_photo_ratings`;
CREATE TABLE `dsb_photo_ratings` (
  `fk_photo_id` int(10) unsigned NOT NULL default '0',
  `fk_user_id` int(10) unsigned NOT NULL default '0',
  `vote` int(2) unsigned NOT NULL default '0',
  `date_voted` datetime NOT NULL default '0000-00-00 00:00:00',
  KEY `fk_photo_id` (`fk_photo_id`),
  KEY `key1` (`fk_user_id`,`date_voted`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS `dsb_profile_categories`;
CREATE TABLE `dsb_profile_categories` (
  `pcat_id` int(5) unsigned NOT NULL auto_increment,
  `fk_lk_id_pcat` int(5) unsigned NOT NULL default '0',
  `access_level` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`pcat_id`),
  KEY `access_level` (`access_level`)
) TYPE=MyISAM;

--
-- Dumping data for table `dsb_profile_categories`
--

INSERT INTO `dsb_profile_categories` (`pcat_id`, `fk_lk_id_pcat`, `access_level`) VALUES
(1, 1, 7),
(2, 2, 7),
(3, 31, 7),
(4, 32, 7),
(5, 33, 7);


DROP TABLE IF EXISTS `dsb_profile_comments`;
CREATE TABLE `dsb_profile_comments` (
  `comment_id` int(10) unsigned NOT NULL auto_increment,
  `fk_parent_id` int(10) unsigned NOT NULL default '0',
  `fk_user_id` int(10) unsigned NOT NULL default '0',
  `_user` varchar(48) NOT NULL default '',
  `comment` text NOT NULL,
  `date_posted` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_changed` datetime NOT NULL default '0000-00-00 00:00:00',
  `status` tinyint(2) unsigned NOT NULL default '0',
  `processed` tinyint(2) unsigned NOT NULL default '0',
  PRIMARY KEY  (`comment_id`),
  KEY `fk_user_id` (`fk_user_id`),
  KEY `date_posted` (`date_posted`),
  KEY `key1` (`fk_parent_id`,`status`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `dsb_profile_fields`
--

DROP TABLE IF EXISTS `dsb_profile_fields`;
CREATE TABLE `dsb_profile_fields` (
  `pfield_id` int(5) unsigned NOT NULL auto_increment,
  `fk_lk_id_label` int(5) unsigned NOT NULL default '0',
  `field_type` tinyint(2) unsigned NOT NULL default '0',
  `searchable` tinyint(1) unsigned NOT NULL default '0',
  `search_type` tinyint(2) unsigned NOT NULL default '0',
  `for_basic` tinyint(1) unsigned NOT NULL default '0',
  `fk_lk_id_search` int(5) unsigned NOT NULL default '0',
  `at_registration` tinyint(1) unsigned NOT NULL default '0',
  `reg_page` tinyint(2) unsigned NOT NULL default '1',
  `required` tinyint(1) unsigned NOT NULL default '0',
  `editable` tinyint(1) unsigned NOT NULL default '0',
  `visible` tinyint(1) unsigned NOT NULL default '0',
  `dbfield` varchar(32) binary NOT NULL default '',
  `fk_lk_id_help` int(5) unsigned NOT NULL default '0',
  `fk_pcat_id` int(5) unsigned NOT NULL default '0',
  `access_level` int(10) unsigned NOT NULL default '0',
  `accepted_values` text NOT NULL,
  `default_value` varchar(255) NOT NULL default '',
  `default_search` varchar(255) NOT NULL default '',
  `fn_on_change` varchar(100) NOT NULL default '',
  `order_num` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`pfield_id`)
) TYPE=MyISAM;

--
-- Dumping data for table `dsb_profile_fields`
--

INSERT INTO `dsb_profile_fields` (`pfield_id`, `fk_lk_id_label`, `field_type`, `searchable`, `search_type`, `for_basic`, `fk_lk_id_search`, `at_registration`, `reg_page`, `required`, `editable`, `visible`, `dbfield`, `fk_lk_id_help`, `fk_pcat_id`, `access_level`, `accepted_values`, `default_value`, `default_search`, `fn_on_change`, `order_num`) VALUES
(1, 3, 4, 0, 1, 0, 4, 1, 1, 0, 1, 1, 0x6631, 5, 1, 0, '', '', '', '', 5),
(2, 8, 3, 1, 10, 1, 9, 1, 1, 1, 1, 1, 0x6632, 10, 1, 0, '|6|7|', '|0|', '|1|', '', 1),
(3, 13, 10, 1, 10, 1, 14, 1, 1, 1, 1, 1, 0x6633, 15, 1, 0, '|11|12|', '|1|', '|0|', '', 2),
(4, 22, 3, 1, 108, 0, 23, 1, 2, 0, 1, 1, 0x6634, 24, 2, 0, '|49|50|51|52|46|47|48|53|54|55|57|58|106|59|60|61|62|63|64|65|66|67|68|69|70|71|72|73|74|75|76|77|78|79|80|81|82|83|84|85|86|87|88|89|90|91|92|93|94|95|96|97|98|99|100|101|102|103|104|105|', '', '|0|59|', '', 7),
(5, 25, 103, 1, 108, 1, 26, 1, 1, 0, 1, 1, 0x6635, 27, 1, 0, '|1930|1989|', '', '|18|75|', '', 3),
(6, 28, 107, 1, 107, 1, 29, 1, 1, 0, 1, 1, 0x6636, 30, 1, 0, '', '|218|', '', 'update_location', 4),
(7, 43, 3, 1, 10, 0, 44, 1, 2, 0, 1, 1, 0x6637, 45, 2, 0, '|34|35|36|37|38|39|40|41|42|', '', '', '', 6),
(8, 116, 3, 1, 10, 0, 117, 1, 2, 0, 1, 1, 0x6638, 118, 2, 0, '|107|108|109|110|111|112|113|114|115|', '', '', '', 8),
(9, 125, 3, 1, 3, 0, 126, 1, 2, 0, 1, 1, 0x6639, 127, 2, 0, '|119|120|121|122|123|124|', '', '', '', 9),
(10, 137, 3, 1, 10, 0, 138, 1, 2, 0, 1, 1, 0x663130, 139, 2, 0, '|128|129|130|131|132|133|134|135|136|', '', '', '', 10),
(11, 143, 3, 1, 10, 0, 144, 1, 2, 0, 1, 1, 0x663131, 145, 3, 0, '|140|141|142|', '', '', '', 11),
(12, 149, 3, 1, 10, 0, 150, 1, 2, 0, 1, 1, 0x663132, 151, 3, 0, '|146|147|148|', '', '', '', 12),
(13, 157, 3, 1, 3, 0, 158, 1, 2, 0, 1, 1, 0x663133, 159, 3, 0, '|152|153|154|155|156|', '', '', '', 13),
(14, 164, 3, 1, 3, 0, 165, 1, 2, 0, 1, 1, 0x663134, 166, 4, 0, '|160|161|162|163|', '', '', '', 14),
(15, 174, 10, 1, 10, 0, 175, 1, 2, 0, 1, 1, 0x663135, 176, 4, 0, '|167|168|169|170|171|172|173|', '', '', '', 15);

-- --------------------------------------------------------

--
-- Table structure for table `dsb_queue_email`
--

DROP TABLE IF EXISTS `dsb_queue_email`;
CREATE TABLE `dsb_queue_email` (
  `mail_id` int(10) unsigned NOT NULL auto_increment,
  `to` varchar(100) NOT NULL default '',
  `subject` varchar(100) NOT NULL default '',
  `message_body` text NOT NULL,
  `date_added` timestamp(14) NOT NULL,
  PRIMARY KEY  (`mail_id`)
) TYPE=MyISAM;

--
-- Dumping data for table `dsb_queue_email`
--


-- --------------------------------------------------------

--
-- Table structure for table `dsb_queue_message`
--

DROP TABLE IF EXISTS `dsb_queue_message`;
CREATE TABLE `dsb_queue_message` (
  `mail_id` int(10) unsigned NOT NULL auto_increment,
  `fk_user_id` int(10) unsigned NOT NULL default '0',
  `fk_user_id_other` int(10) unsigned NOT NULL default '0',
  `_user_other` varchar(48) NOT NULL default '',
  `subject` varchar(100) NOT NULL default '',
  `message_body` text NOT NULL,
  `date_sent` datetime NOT NULL default '0000-00-00 00:00:00',
  `message_type` tinyint(2) unsigned NOT NULL default '0',
  PRIMARY KEY  (`mail_id`),
  KEY `from_id` (`fk_user_id_other`),
  KEY `to_id` (`fk_user_id`)
) TYPE=MyISAM;

--
-- Dumping data for table `dsb_queue_message`
--


DROP TABLE IF EXISTS `dsb_rate_limiter`;
CREATE TABLE `dsb_rate_limiter` (
  `rate_id` int(10) unsigned NOT NULL auto_increment,
  `level_code` varchar(30) binary NOT NULL default '',
  `m_value` int(10) unsigned NOT NULL default '0',
  `limit` int(5) unsigned NOT NULL default '0',
  `interval` int(10) unsigned NOT NULL default '0',
  `punishment` tinyint(1) unsigned NOT NULL default '0',
  `fk_lk_id_error_message` int(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`rate_id`),
  KEY `thekey` (`level_code`,`m_value`)
) TYPE=MyISAM;

--
-- Dumping data for table `dsb_rate_limiter`
--


-- --------------------------------------------------------

--
-- Table structure for table `dsb_site_bans`
--

DROP TABLE IF EXISTS `dsb_site_bans`;
CREATE TABLE `dsb_site_bans` (
  `ban_id` int(5) unsigned NOT NULL auto_increment,
  `ban_type` tinyint(1) unsigned NOT NULL default '0',
  `what` varchar(32) NOT NULL default '',
  `fk_lk_id_reason` int(5) unsigned NOT NULL default '0',
  `since` timestamp(14) NOT NULL,
  PRIMARY KEY  (`ban_id`),
  UNIQUE KEY `key1` (`ban_type`,`what`)
) TYPE=MyISAM;

--
-- Dumping data for table `dsb_site_bans`
--


DROP TABLE IF EXISTS `dsb_site_log`;
CREATE TABLE `dsb_site_log` (
  `log_id` int(10) unsigned NOT NULL auto_increment,
  `fk_user_id` int(10) unsigned NOT NULL default '0',
  `user` varchar(64) NOT NULL default '',
  `m_value` int(10) unsigned NOT NULL default '0',
  `level_code` varchar(30) binary NOT NULL default '',
  `ip` int(12) unsigned NOT NULL default '0',
  `time` datetime NOT NULL default '0000-00-00 00:00:00',
  `sess` varchar(32) binary NOT NULL default '',
  PRIMARY KEY  (`log_id`),
  KEY `user` (`user`),
  KEY `fk_user_id` (`fk_user_id`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS `dsb_site_news`;
CREATE TABLE `dsb_site_news` (
  `news_id` int(10) unsigned NOT NULL auto_increment,
  `news_title` varchar(255) NOT NULL default '',
  `news_body` text NOT NULL,
  `date_posted` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`news_id`)
) TYPE=MyISAM;

--
-- Dumping data for table `dsb_site_news`
--


DROP TABLE IF EXISTS `dsb_site_options3`;
CREATE TABLE `dsb_site_options3` (
  `config_id` int(10) unsigned NOT NULL auto_increment,
  `config_option` varchar(50) binary NOT NULL default '',
  `config_value` varchar(100) NOT NULL default '',
  `config_diz` text NOT NULL,
  `option_type` tinyint(3) unsigned NOT NULL default '0',
  `choices` text NOT NULL,
  `fk_module_code` varchar(32) binary NOT NULL default '',
  `per_user` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`config_id`),
  UNIQUE KEY `thekey` (`config_option`,`fk_module_code`),
  KEY `per_user` (`per_user`),
  KEY `fk_module_code` (`fk_module_code`)
) TYPE=MyISAM COMMENT='0-n/a,9-chkbox,2-tf,4-ta';

--
-- Dumping data for table `dsb_site_options3`
--

INSERT INTO `dsb_site_options3` (`config_id`, `config_option`, `config_value`, `config_diz`, `option_type`, `choices`, `fk_module_code`, `per_user`) VALUES
(1, 0x64626669656c645f696e646578, '16', 'The last index of the custom profile fields (field_xx)', 0, '', 0x636f7265, 0),
(2, 0x7573655f63617074636861, '1', 'Use the dynamic image text (captcha image) to keep spam bots out?', 9, '', 0x636f7265, 0),
(3, 0x6d616e75616c5f70726f66696c655f617070726f76616c, '0', 'New profiles or changes to existing profiles require manual approval from an administrator before being displayed on site?', 9, '', 0x636f7265, 0),
(4, 0x646174655f666f726d6174, '%m/%d/%Y', 'Default date format', 2, '', 0x6465665f757365725f7072656673, 1),
(5, 0x74315f7769647468, '100', 'The width in pixels of the smallest thumbnail generated for each user photo', 104, '', 0x636f72655f70686f746f, 0),
(6, 0x74325f7769647468, '500', 'The width in pixels of the larger thumbnail generated for each user photo', 104, '', 0x636f72655f70686f746f, 0),
(7, 0x7069635f7769647468, '800', 'The maximum width in pixels of any picture uploaded by a member', 104, '', 0x636f72655f70686f746f, 0),
(8, 0x6d616e75616c5f70686f746f5f617070726f76616c, '0', 'New uploaded photos require manual approval before being displayed on the site?', 9, '', 0x636f72655f70686f746f, 0),
(9, 0x6d616e75616c5f626c6f675f617070726f76616c, '0', 'New blog posts or changes to existing posts require manual approval from an administrator before being displayed on site?', 9, '', 0x636f72655f626c6f67, 0),
(10, 0x6d616e75616c5f636f6d5f617070726f76616c, '0', 'Comments to profiles, photos, blogs need approval from admin?', 9, '', 0x636f7265, 0),
(11, 0x77617465726d61726b5f74657874, 'watermark text', 'The text to stamp the user photos with', 2, '', 0x636f72655f70686f746f, 0),
(12, 0x77617465726d61726b5f746578745f636f6c6f72, 'FFFFFF', 'Color of the text watermark', 2, '', 0x636f72655f70686f746f, 0),
(13, 0x6d6f64756c655f616374697665, '1', 'Module active?', 9, '', 0x70617970616c, 0),
(14, 0x70617970616c5f656d61696c, 'dan@sco.ro', 'Your paypal email address', 2, '', 0x70617970616c, 0),
(15, 0x6d6f64756c655f616374697665, '1', 'Is this module active?', 9, '', 0x74776f636865636b6f7574, 0),
(16, 0x736964, '117760', 'Your 2co seller ID', 2, '', 0x74776f636865636b6f7574, 0),
(17, 0x64656d6f5f6d6f6465, '1', 'Enable test mode? Don''t enable this on a live site!', 9, '', 0x74776f636865636b6f7574, 0),
(18, 0x64656d6f5f6d6f6465, '1', 'Enable test mode? Don''t enable this on a live site!', 9, '', 0x70617970616c, 0),
(19, 0x736563726574, 'secret_word', 'The secret word you set in your 2co account', 2, '', 0x74776f636865636b6f7574, 0),
(20, 0x6c6963656e73655f6b6579, '1234', 'Your Maxmind license key', 2, '', 0x6d61786d696e64, 0),
(21, 0x7573655f7175657565, '1', 'Use the message queue (recommended) or send the messages directly?', 9, '', 0x636f7265, 0),
(22, 0x6d61696c5f66726f6d, 'dan@rdsct.ro', 'Email address to send emails from', 2, '', 0x636f7265, 0),
(23, 0x6262636f64655f70726f66696c65, '1', 'Use BBcode in profile fields? (like about me, about you)', 9, '', 0x636f7265, 0),
(24, 0x6262636f64655f636f6d6d656e7473, '1', 'Use BBcode in comments?', 9, '', 0x636f7265, 0),
(32, 0x6d696e5f73697a65, '0', 'Minimum photo file size in bytes (use 0 for not limited).', 104, '', 0x636f72655f70686f746f, 0),
(33, 0x6d61785f73697a65, '0', 'Maximum photo file size in bytes (use 0 for server default).', 104, '', 0x636f72655f70686f746f, 0),
(34, 0x6262636f64655f6d657373616765, '1', 'Allow BBCode in member to member messages?', 9, '', 0x636f7265, 0),
(35, 0x6461746574696d655f666f726d6174, '%m/%d/%Y %I:%M %p', 'Date and time format', 2, '', 0x6465665f757365725f7072656673, 1),
(36, 0x726f756e645f636f726e657273, '1', 'Use round corners for user photos?', 9, '', 0x636f72655f70686f746f, 0),
(37, 0x656e61626c6564, '1', 'Enable this widget?', 9, '', 0x6f7369676e616c5f66656564, 0),
(38, 0x666565645f75726c, 'http://feeds.feedburner.com/OriginalSignal/tech', 'The url of the feed', 2, '', 0x6f7369676e616c5f66656564, 0),
(39, 0x736b696e5f646972, 'def', '', 0, '', 0x736b696e5f646566, 0),
(40, 0x736b696e5f6e616d65, 'Default', '', 0, '', 0x736b696e5f646566, 0),
(41, 0x666b5f6c6f63616c655f6964, '11', '', 0, '', 0x736b696e5f646566, 0),
(42, 0x69735f64656661756c74, '1', '', 0, '', 0x736b696e5f646566, 0),
(43, 0x696e6163746976655f74696d65, '5', 'Time of inactivity in minutes after a member is considered offline', 104, '', 0x636f7265, 0),
(44, 0x6262636f64655f626c6f6773, '1', 'Allow bbcode in blog posts?', 9, '', 0x636f72655f626c6f67, 0),
(45, 0x73656e645f616c6572745f696e74657276616c, '2', 'How often do you want to receive your search matches? (days)', 104, '', 0x6465665f757365725f7072656673, 1),
(47, 0x726174655f6d795f70686f746f73, '1', 'Allow my photos to be rated?', 9, '', 0x6465665f757365725f7072656673, 1),
(48, 0x70757267655f756e7665726966696564, '7', 'Purge unverified accounts after how many days?', 104, '', 0x636f7265, 0),
(50, 0x6e6f746966795f6d65, '1', 'Send me email notifications when I receive messages?', 9, '', 0x6465665f757365725f7072656673, 1),
(51, 0x6d61696c5f63726c66, '1', 'Check or uncheck this option if you can''t send emails out to members', 9, '', 0x636f7265, 0),
(52, 0x7573655f736d696c696573, '1', 'Allow smilies in profile fields?', 9, '', 0x636f7265, 0),
(53, 0x736d696c6965735f636f6d6d, '1', 'Allow smilies in user comments?', 9, '', 0x636f7265, 0),
(54, 0x7573655f736d696c696573, '1', 'Allow smilies in blogs?', 9, '', 0x636f72655f626c6f67, 0),
(55, 0x70726f66696c655f636f6d6d656e7473, '1', 'Allow comments on my profile?', 9, '', 0x6465665f757365725f7072656673, 1),
(56, 0x74615f6c656e, '1000', 'Maximum number of characters users may enter in textareas (use 0 for unlimited)', 104, '', 0x636f7265, 0),
(58, 0x666565645f75726c, 'http://www.datemill.com/remote/feeds/admin.xml', 'The url of the feed', 2, '', 0x646174656d696c6c5f66656564, 0),
(59, 0x70757267655f696e626f78, '30', 'Purge old messages from member inboxes after how many days? (0 for never)', 104, '', 0x636f7265, 0),
(60, 0x70757267655f7472617368, '14', 'Purge old messages from member spam boxes and trash after how many days? (0 for never)', 104, '', 0x636f7265, 0),
(61, 0x70757267655f666f6c64657273, '30', 'Purge old messages from member personal folders after how many days? (0 for never)', 104, '', 0x636f7265, 0),
(62, 0x70757267655f6f7574626f78, '7', 'Purge old messages from member outboxes after how many days? (0 for never)', 104, '', 0x636f7265, 0),
(63, 0x74696d655f6f6666736574, '0', 'Select your timezone (<a href="javascript:;" id="auto_detect_tz">auto detect</a>)', 3, 'a:26:{i:-43200;s:7:"GMT -12";i:-39600;s:7:"GMT -11";i:-36000;s:7:"GMT -10";i:-32400;s:6:"GMT -9";i:-28800;s:6:"GMT -8";i:-25200;s:6:"GMT -7";i:-21600;s:6:"GMT -6";i:-18000;s:6:"GMT -5";i:-14400;s:6:"GMT -4";i:-10800;s:6:"GMT -3";i:-7200;s:6:"GMT -2";i:-3600;s:6:"GMT -1";i:0;s:3:"GMT";i:3600;s:6:"GMT +1";i:7200;s:6:"GMT +2";i:10800;s:6:"GMT +3";i:1440;s:6:"GMT +4";i:18000;s:6:"GMT +5";i:21600;s:6:"GMT +6";i:25200;s:6:"GMT +7";i:28800;s:6:"GMT +8";i:32400;s:6:"GMT +9";i:36000;s:7:"GMT +10";i:39600;s:7:"GMT +11";i:43200;s:7:"GMT +12";i:46800;s:7:"GMT +13";}', 0x6465665f757365725f7072656673, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dsb_site_searches`
--

DROP TABLE IF EXISTS `dsb_site_searches`;
CREATE TABLE `dsb_site_searches` (
  `search_md5` varchar(32) NOT NULL default '',
  `search_type` tinyint(2) unsigned NOT NULL default '0',
  `search` text NOT NULL,
  `results` text NOT NULL,
  `fk_user_id` int(10) unsigned NOT NULL default '0',
  `date_posted` timestamp(14) NOT NULL,
  UNIQUE KEY `search_md5` (`search_md5`,`search_type`),
  KEY `fk_user_id` (`fk_user_id`)
) TYPE=MyISAM;

--
-- Dumping data for table `dsb_site_searches`
--


-- --------------------------------------------------------

--
-- Table structure for table `dsb_stats_dot`
--

DROP TABLE IF EXISTS `dsb_stats_dot`;
CREATE TABLE `dsb_stats_dot` (
  `dot_id` int(10) unsigned NOT NULL auto_increment,
  `dataset` varchar(48) NOT NULL default '',
  `value` int(10) NOT NULL default '0',
  `time` int(8) NOT NULL default '0',
  PRIMARY KEY  (`dot_id`),
  UNIQUE KEY `key1` (`dataset`,`time`),
  KEY `dataset` (`dataset`)
) TYPE=MyISAM;

--
-- Dumping data for table `dsb_stats_dot`
--

-- --------------------------------------------------------

--
-- Table structure for table `dsb_subscriptions`
--

DROP TABLE IF EXISTS `dsb_subscriptions`;
CREATE TABLE `dsb_subscriptions` (
  `subscr_id` int(2) unsigned NOT NULL auto_increment,
  `subscr_name` varchar(200) NOT NULL default '',
  `subscr_diz` text NOT NULL,
  `price` float(10,2) unsigned NOT NULL default '0.00',
  `currency` char(3) NOT NULL default '',
  `is_recurent` tinyint(1) unsigned NOT NULL default '0',
  `m_value_from` int(10) unsigned NOT NULL default '0',
  `m_value_to` int(10) unsigned NOT NULL default '0',
  `duration` int(4) unsigned NOT NULL default '0',
  `duration_units` enum('DAY','MONTH','YEAR') NOT NULL default 'DAY',
  `is_visible` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`subscr_id`),
  KEY `thekey` (`m_value_from`,`is_visible`)
) TYPE=MyISAM;

DROP TABLE IF EXISTS `dsb_subscriptions_auto`;
CREATE TABLE `dsb_subscriptions_auto` (
  `asubscr_id` int(3) unsigned NOT NULL auto_increment,
  `dbfield` varchar(32) NOT NULL default '',
  `field_value` int(5) NOT NULL default '0',
  `fk_subscr_id` int(2) unsigned NOT NULL default '0',
  `date_start` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`asubscr_id`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS `dsb_user_accounts`;
CREATE TABLE `dsb_user_accounts` (
  `user_id` int(10) unsigned NOT NULL auto_increment,
  `user` varchar(32) binary NOT NULL default '',
  `pass` varchar(32) binary NOT NULL default '',
  `status` tinyint(2) unsigned NOT NULL default '0',
  `membership` int(10) unsigned NOT NULL default '0',
  `email` varchar(128) NOT NULL default '',
  `skin` varchar(32) NOT NULL default '',
  `temp_pass` varchar(32) NOT NULL default '',
  `last_activity` timestamp(14) NOT NULL,
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `user` (`user`),
  KEY `key1` (`status`,`temp_pass`),
  KEY `email` (`email`)
) TYPE=MyISAM COMMENT='membership is m_value';

--
-- Dumping data for table `dsb_user_accounts`
--

DROP TABLE IF EXISTS `dsb_user_blogs`;
CREATE TABLE `dsb_user_blogs` (
  `blog_id` int(10) unsigned NOT NULL auto_increment,
  `fk_user_id` int(10) unsigned NOT NULL default '0',
  `blog_name` varchar(100) NOT NULL default '',
  `blog_diz` varchar(255) NOT NULL default '',
  `stat_posts` int(4) unsigned NOT NULL default '0',
  `blog_skin` varchar(32) NOT NULL default '',
  `blog_url` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`blog_id`),
  KEY `fk_user_id` (`fk_user_id`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS `dsb_user_folders`;
CREATE TABLE `dsb_user_folders` (
  `folder_id` int(10) unsigned NOT NULL auto_increment,
  `fk_user_id` int(10) unsigned NOT NULL default '0',
  `folder` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`folder_id`),
  UNIQUE KEY `fk_user_id` (`fk_user_id`,`folder`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS `dsb_user_inbox`;
CREATE TABLE `dsb_user_inbox` (
  `mail_id` int(10) unsigned NOT NULL auto_increment,
  `is_read` tinyint(1) unsigned NOT NULL default '0',
  `fk_user_id` int(10) unsigned NOT NULL default '0',
  `fk_user_id_other` int(10) unsigned NOT NULL default '0',
  `_user_other` varchar(32) NOT NULL default '',
  `subject` varchar(100) NOT NULL default '',
  `message_body` text NOT NULL,
  `date_sent` datetime NOT NULL default '0000-00-00 00:00:00',
  `message_type` tinyint(2) unsigned NOT NULL default '0',
  `fk_folder_id` int(10) unsigned NOT NULL default '0',
  `del` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`mail_id`),
  KEY `from_id` (`fk_user_id_other`),
  KEY `key1` (`fk_user_id`,`fk_folder_id`,`del`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS `dsb_user_mtpls`;
CREATE TABLE `dsb_user_mtpls` (
  `mtpl_id` int(10) unsigned NOT NULL auto_increment,
  `fk_user_id` int(10) unsigned NOT NULL default '0',
  `subject` varchar(100) NOT NULL default '',
  `message_body` text NOT NULL,
  PRIMARY KEY  (`mtpl_id`),
  KEY `fk_user_id` (`fk_user_id`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS `dsb_user_networks`;
CREATE TABLE `dsb_user_networks` (
  `nconn_id` int(10) unsigned NOT NULL auto_increment,
  `fk_user_id` int(10) unsigned NOT NULL default '0',
  `fk_net_id` int(10) unsigned NOT NULL default '0',
  `fk_user_id_other` int(10) unsigned NOT NULL default '0',
  `nconn_status` tinyint(2) unsigned NOT NULL default '0',
  PRIMARY KEY  (`nconn_id`),
  UNIQUE KEY `unique1` (`fk_user_id`,`fk_net_id`,`fk_user_id_other`),
  KEY `index1` (`fk_user_id`,`fk_net_id`,`nconn_status`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `dsb_user_outbox`
--

DROP TABLE IF EXISTS `dsb_user_outbox`;
CREATE TABLE `dsb_user_outbox` (
  `mail_id` int(10) unsigned NOT NULL auto_increment,
  `is_read` tinyint(1) unsigned NOT NULL default '0',
  `fk_user_id` int(10) unsigned NOT NULL default '0',
  `fk_user_id_other` int(10) unsigned NOT NULL default '0',
  `_user_other` varchar(32) NOT NULL default '',
  `subject` varchar(100) NOT NULL default '',
  `message_body` text NOT NULL,
  `date_sent` datetime NOT NULL default '0000-00-00 00:00:00',
  `message_type` tinyint(2) unsigned NOT NULL default '0',
  PRIMARY KEY  (`mail_id`),
  KEY `from_id` (`fk_user_id_other`),
  KEY `user_id_2` (`fk_user_id`)
) TYPE=MyISAM;

--
-- Dumping data for table `dsb_user_outbox`
--

DROP TABLE IF EXISTS `dsb_user_photos`;
CREATE TABLE `dsb_user_photos` (
  `photo_id` int(10) unsigned NOT NULL auto_increment,
  `fk_user_id` int(10) unsigned NOT NULL default '0',
  `_user` varchar(48) NOT NULL default '',
  `photo` varchar(128) NOT NULL default '',
  `is_main` tinyint(1) unsigned NOT NULL default '0',
  `is_private` tinyint(1) unsigned NOT NULL default '0',
  `allow_comments` tinyint(1) unsigned NOT NULL default '0',
  `allow_rating` tinyint(1) unsigned NOT NULL default '0',
  `caption` varchar(255) NOT NULL default '',
  `status` tinyint(2) unsigned NOT NULL default '0',
  `del` tinyint(1) unsigned NOT NULL default '0',
  `flagged` tinyint(1) unsigned NOT NULL default '0',
  `reject_reason` text NOT NULL,
  `stat_views` int(10) unsigned NOT NULL default '0',
  `stat_votes` int(4) unsigned NOT NULL default '0',
  `stat_votes_total` int(5) unsigned NOT NULL default '0',
  `stat_comments` int(5) unsigned NOT NULL default '0',
  `date_posted` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_changed` datetime NOT NULL default '0000-00-00 00:00:00',
  `processed` tinyint(2) unsigned NOT NULL default '0',
  PRIMARY KEY  (`photo_id`),
  KEY `fk_user_id` (`fk_user_id`),
  KEY `is_main` (`is_main`),
  KEY `is_private` (`is_private`),
  KEY `date_posted` (`date_posted`),
  KEY `key1` (`status`,`del`),
  KEY `flagged` (`flagged`),
  FULLTEXT KEY `caption` (`caption`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `dsb_user_profiles`
--

DROP TABLE IF EXISTS `dsb_user_profiles`;
CREATE TABLE `dsb_user_profiles` (
  `profile_id` int(10) unsigned NOT NULL auto_increment,
  `fk_user_id` int(10) unsigned NOT NULL default '0',
  `status` tinyint(2) unsigned NOT NULL default '0',
  `del` tinyint(1) unsigned NOT NULL default '0',
  `last_changed` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `reject_reason` text NOT NULL,
  `_user` varchar(32) NOT NULL default '',
  `_photo` varchar(128) NOT NULL default '',
  `longitude` float(20,10) NOT NULL default '0.0000000000',
  `latitude` float(20,10) NOT NULL default '0.0000000000',
  `score` int(5) unsigned NOT NULL default '0',
  `f1` text NOT NULL,
  `f2` int(5) NOT NULL default '0',
  `f3` text NOT NULL,
  `f4` int(5) NOT NULL default '0',
  `f5` date NOT NULL default '0000-00-00',
  `f6_country` int(3) NOT NULL default '0',
  `f6_state` int(10) NOT NULL default '0',
  `f6_city` int(10) NOT NULL default '0',
  `f6_zip` varchar(10) NOT NULL default '',
  `f7` int(5) NOT NULL default '0',
  `f8` int(5) NOT NULL default '0',
  `f9` int(5) NOT NULL default '0',
  `f10` int(5) NOT NULL default '0',
  `f11` int(5) NOT NULL default '0',
  `f12` int(5) NOT NULL default '0',
  `f13` int(5) NOT NULL default '0',
  `f14` int(5) NOT NULL default '0',
  `f15` text NOT NULL,
  PRIMARY KEY  (`profile_id`),
  KEY `fk_user_id` (`fk_user_id`),
  KEY `_user` (`_user`),
  KEY `score` (`score`),
  KEY `longitude` (`longitude`,`latitude`),
  KEY `key1` (`status`,`del`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS `dsb_user_searches`;
CREATE TABLE `dsb_user_searches` (
  `search_id` int(10) unsigned NOT NULL auto_increment,
  `fk_user_id` int(10) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `is_default` tinyint(1) unsigned NOT NULL default '0',
  `search_qs` text NOT NULL,
  `search` text NOT NULL,
  `alert` tinyint(1) unsigned NOT NULL default '0',
  `alert_last_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`search_id`),
  KEY `key1` (`fk_user_id`,`is_default`),
  KEY `alert` (`alert`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS `dsb_user_settings2`;
CREATE TABLE `dsb_user_settings2` (
  `config_id` int(10) unsigned NOT NULL auto_increment,
  `fk_user_id` int(10) unsigned NOT NULL default '0',
  `config_option` varchar(50) binary NOT NULL default '',
  `config_value` varchar(100) NOT NULL default '',
  `fk_module_code` varchar(32) binary NOT NULL default '',
  PRIMARY KEY  (`config_id`),
  UNIQUE KEY `thekey` (`fk_user_id`,`config_option`,`fk_module_code`),
  KEY `fk_module_code` (`fk_module_code`)
) TYPE=MyISAM COMMENT='0-n/a,1-chkbox,2-tf,3-ta';

-- --------------------------------------------------------

--
-- Table structure for table `dsb_user_spambox`
--

DROP TABLE IF EXISTS `dsb_user_spambox`;
CREATE TABLE `dsb_user_spambox` (
  `mail_id` int(10) unsigned NOT NULL auto_increment,
  `is_read` tinyint(1) unsigned NOT NULL default '0',
  `fk_user_id` int(10) unsigned NOT NULL default '0',
  `fk_user_id_other` int(10) unsigned NOT NULL default '0',
  `_user_other` varchar(32) NOT NULL default '',
  `subject` varchar(100) NOT NULL default '',
  `message_body` text NOT NULL,
  `date_sent` datetime NOT NULL default '0000-00-00 00:00:00',
  `message_type` tinyint(2) unsigned NOT NULL default '0',
  PRIMARY KEY  (`mail_id`),
  KEY `from_id` (`fk_user_id_other`),
  KEY `user_id_2` (`fk_user_id`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS `dsb_user_stats`;
CREATE TABLE `dsb_user_stats` (
  `fk_user_id` int(10) unsigned NOT NULL default '0',
  `stat` varchar(50) NOT NULL default '',
  `value` int(10) NOT NULL default '0',
  UNIQUE KEY `thekey` (`fk_user_id`,`stat`)
) TYPE=MyISAM;
