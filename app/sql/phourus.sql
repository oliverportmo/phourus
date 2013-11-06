SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

DROP TABLE IF EXISTS `app_address`;
CREATE TABLE `app_address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `org_id` int(11) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `street` varchar(60) DEFAULT NULL,
  `city` varchar(40) NOT NULL DEFAULT '',
  `state` varchar(2) NOT NULL DEFAULT '',
  `country` varchar(2) NOT NULL DEFAULT '',
  `zip` varchar(5) NOT NULL DEFAULT '',
  `type` varchar(20) DEFAULT NULL,
  `county` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO `app_address` VALUES(1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, '80 Clay Road', 'Gorham', 'ME', 'US', '04038', 'primary', NULL);
INSERT INTO `app_address` VALUES(2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 0, '76 Montgomery St', 'Savannah', 'GA', 'US', '31401', 'primary', NULL);
INSERT INTO `app_address` VALUES(3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 0, '68 University Ave', 'Des Moines', 'IA', 'US', '50314', 'primary', NULL);
INSERT INTO `app_address` VALUES(4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 0, '23 Woodward Ave', 'Detroit', 'MI', 'US', '48226', 'primary', NULL);
INSERT INTO `app_address` VALUES(5, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 0, '154 Main St', 'Sandy', 'UT', 'US', '84070', 'business', NULL);
INSERT INTO `app_address` VALUES(6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 6, 0, '234 Maple St', 'Danvers', 'MA', 'US', '01923', 'business', NULL);
INSERT INTO `app_address` VALUES(7, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 0, '561 Broadway Blvd', 'Kansas City', 'MO', 'US', '64105', 'residential', NULL);
INSERT INTO `app_address` VALUES(8, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 8, 0, '8543 6th Ave', 'Birmingham', 'AL', 'US', '35206', 'mailing', NULL);
INSERT INTO `app_address` VALUES(9, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 0, '618 Collins Ave', 'Miami', 'FL', 'US', '33139', 'residential', NULL);
INSERT INTO `app_address` VALUES(10, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 10, 0, '71 Ocean Ave', 'Amityville', 'NY', 'US', '11701', 'residential', NULL);
INSERT INTO `app_address` VALUES(11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 11, 0, '501 Franklin St', 'Sand Springs', 'OK', 'US', '74063', 'mailing', NULL);
INSERT INTO `app_address` VALUES(12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 12, 0, '400 Vine St', 'Cincinnati', 'OH', 'US', '45202', 'residential', NULL);
INSERT INTO `app_address` VALUES(13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 13, 0, '680 8th Ave', 'Seattle', 'WA', 'US', '98104', 'mailing', NULL);
INSERT INTO `app_address` VALUES(14, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 14, 0, '156 Oak St', 'Hood River', 'OR', 'US', '97031', 'residential', NULL);
INSERT INTO `app_address` VALUES(15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 15, 0, '90 Atlantic Rd', 'Big Lake', 'MN', 'US', '55309', 'residential', NULL);
INSERT INTO `app_address` VALUES(16, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 16, 0, '760 Glenwood Ave', 'Raleigh', 'NC', 'US', '27605', 'residential', NULL);
INSERT INTO `app_address` VALUES(17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, '650 Watertown Ave', 'Waterbury', 'CT', 'US', '06708', 'mailing', NULL);
INSERT INTO `app_address` VALUES(18, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 2, '480 Sherman Rd', 'Springfield', 'PA', 'US', '19064', 'mailing', NULL);
INSERT INTO `app_address` VALUES(19, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 3, '267 Reed St', 'Lakewood', 'CO', 'US', '80226', 'mailing', NULL);
INSERT INTO `app_address` VALUES(20, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 4, '102 Ash Rd', 'Louisa', 'VA', 'US', '23093', 'mailing', NULL);

DROP TABLE IF EXISTS `app_clout`;
CREATE TABLE `app_clout` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `org_id` int(11) unsigned NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT '',
  `title` varchar(60) NOT NULL DEFAULT '',
  `date` date NOT NULL,
  `content` varchar(240) DEFAULT NULL,
  `image` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `org_id` (`org_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO `app_clout` VALUES(1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'press', 'New York Times', '2012-03-03', 'Prima ancillae per ut, ne deseruisse omittantur eum, ipsum commodo tincidunt ut est. At amet facilis mnesarchum eam.', NULL);
INSERT INTO `app_clout` VALUES(2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'press', 'L.A. Times', '2012-05-01', 'Usu sint accusata ne. Noluisse legendos philosophia vis ne, nulla mucius oblique eum an. Usu malis fierent propriae cu. Sa', NULL);
INSERT INTO `app_clout` VALUES(3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'press', 'CNN', '2012-07-09', 'Ei sonet nobis adipisci sed, vim ad vivendo denique periculis. Sed te melius noluisse evertitur, ocurreret gloriatur in eum. Decore dicunt usu te, vim te putent mediocritatem, affert deserunt cum ne.', NULL);
INSERT INTO `app_clout` VALUES(4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'press', 'Washington Post', '2013-09-22', 'Iudico tollit iriure his te. No eam graecis mediocritatem, pro ut putent accusata, tempor integre lobortis ne vel. ', NULL);
INSERT INTO `app_clout` VALUES(5, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'award', '1st place: ADA Design contest', '2012-08-13', 'At mei civibus blandit, adhuc consequuntur te eam, eu sed mazim perfecto efficiantur.', NULL);
INSERT INTO `app_clout` VALUES(6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'award', 'Top 10 new apps', '2012-11-15', 'Dolorum convenire explicari ei sit, mei at propriae forensibus dissentiet, phaedrum ocurreret constituto ad sea. Cum cu iuvaret eruditi percipitur, veritus noluisse abhorreant id per. Te vis autem vivendo, eu quo diceret ornatus?', NULL);
INSERT INTO `app_clout` VALUES(7, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'award', 'Y-Combinator Finalist', '2013-02-14', 'Cum cu iuvaret eruditi percipitur, veritus noluisse abhorreant id per. ', NULL);
INSERT INTO `app_clout` VALUES(8, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'award', 'Best in Class: JDD Power & Associates', '2013-06-09', 'Id sint epicurei concludaturque sit, an qui errem deserunt dissentiunt. Ut usu primis assentior. Est viris clita ex, ut odio menandri mea, te eum dicit facilisis theophrastus. An quo mundi appareat, vivendo civibus eligendi vis an.', NULL);

DROP TABLE IF EXISTS `app_comments`;
CREATE TABLE `app_comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) unsigned NOT NULL,
  `post_id` int(11) unsigned NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO `app_comments` VALUES(1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 1, 'Phasellus cursus auctor ante, at tincidunt purus commodo ut.');
INSERT INTO `app_comments` VALUES(2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 1, 'Cras venenatis malesuada erat.');
INSERT INTO `app_comments` VALUES(3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 2, 'Sed ut tincidunt metus, vitae lobortis eros. Phasellus rhoncus magna vel justo egestas venenatis. Cras lobortis gravida justo et laoreet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.');
INSERT INTO `app_comments` VALUES(4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 2, 'Praesent pretium ultricies sem, non porttitor velit lacinia non. Vestibulum porttitor molestie dolor in cursus.');
INSERT INTO `app_comments` VALUES(5, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 1, 'Fusce dolor sapien, sagittis ut varius at, dignissim a nunc. Donec vel erat vitae magna aliquet commodo non non magna.');
INSERT INTO `app_comments` VALUES(6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 1, 'Curabitur mollis feugiat justo, vel posuere diam ultricies euismod. Mauris ullamcorper vitae lectus id volutpat. ');

DROP TABLE IF EXISTS `app_follows`;
CREATE TABLE `app_follows` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) unsigned NOT NULL,
  `target_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `target_id` (`target_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO `app_follows` VALUES(1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 1);
INSERT INTO `app_follows` VALUES(2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 1);
INSERT INTO `app_follows` VALUES(3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 1);
INSERT INTO `app_follows` VALUES(4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 3);
INSERT INTO `app_follows` VALUES(5, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 5);
INSERT INTO `app_follows` VALUES(6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 4);
INSERT INTO `app_follows` VALUES(7, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 8);
INSERT INTO `app_follows` VALUES(8, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 1);

DROP TABLE IF EXISTS `app_members`;
CREATE TABLE `app_members` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `org_id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT '',
  `approved` tinyint(1) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

INSERT INTO `app_members` VALUES(1, 1, 'rep', 1, 1);
INSERT INTO `app_members` VALUES(2, 9, 'student', 1, 8);
INSERT INTO `app_members` VALUES(3, 5, 'executive', 1, 2);
INSERT INTO `app_members` VALUES(4, 13, 'leader', 1, 2);
INSERT INTO `app_members` VALUES(5, 9, 'student', 1, 3);
INSERT INTO `app_members` VALUES(6, 9, 'teacher', 1, 4);
INSERT INTO `app_members` VALUES(7, 13, 'member', 1, 5);
INSERT INTO `app_members` VALUES(8, 5, 'employee', 1, 6);
INSERT INTO `app_members` VALUES(9, 2, 'rep', 0, 7);
INSERT INTO `app_members` VALUES(10, 5, 'employee', 1, 8);

DROP TABLE IF EXISTS `app_orgs`;
CREATE TABLE `app_orgs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) unsigned DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `shortname` varchar(20) NOT NULL,
  `influence` int(2) DEFAULT NULL,
  `about` text,
  `video` varchar(240) DEFAULT NULL,
  `channel` varchar(240) DEFAULT NULL,
  `contact` varchar(240) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `people` int(11) DEFAULT NULL,
  `img` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO `app_orgs` VALUES(1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 'gov', 'Town of Gorham, ME', 'gorham_me', 41, 'Reque falli ne eam, similique efficiendi quo no. Sea id solet phaedrum, sit no partem facilis, impetus eligendi efficiantur et eum! Mea eius persequeris ea, an sed ullum eirmod, vis id etiam lucilius. Mel omnis ubique ad, ad vis labore quidam intellegat? Eu his ferri populo ridens, alienum commune usu et, no primis labores vix. Pro ex modus ubique vidisse?', NULL, NULL, 'Sea id solet phaedrum, sit no partem facilis, impetus eligendi efficiantur et eum! Mea eius persequeris ea, an sed ullum eirmod, vis id etiam lucilius. Mel omnis ubique ad, ad vis labore quidam intellegat? Eu his ferri populo ridens, alienu', '(542)422-1234', '(542)422-1432', 'info@gorhamme.gov', 11345, 'jpg');
INSERT INTO `app_orgs` VALUES(2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 'gov', 'City of Savannah, GA', 'savannah_ga', 39, 'Aliquam id tellus semper, placerat metus sed, venenatis libero.\n\nMaecenas posuere lacinia ante, non aliquet dui placerat vel. Donec id dignissim turpis. Nullam sed arcu eu quam cursus suscipit. Proin posuere enim augue, vel ullamcorper ligula viverra sed. Donec volutpat nisi mi, id porta diam volutpat dignissim. Praesent cursus dui semper, imperdiet odio in, dapibus nunc. Nulla facilisi.', NULL, NULL, 'Donec volutpat nisi mi, id porta diam volutpat dignissim. Praesent cursus dui semper, imperdiet odio in, dapibus nunc. Nulla facilisi. Vestibulum non lacus vehicula, semper odio id, sollicitudin erat. Integer sodales tempor erat, quis tempu', '(675)943-1434', '(313)642-7525', 'contact@savannahga.gov', 48760, 'gif');
INSERT INTO `app_orgs` VALUES(3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 'gov', 'State of Iowa', 'iowa', 50, 'Fusce sit amet velit nec felis blandit adipiscing sit amet a neque. Quisque eu interdum velit. Ut nec erat urna.\n\nMorbi id tempus massa. Etiam non orci hendrerit, interdum mi vitae, ultricies augue. Fusce sit amet nulla sollicitudin, bibendum eros vel, dapibus dui. Aenean sit amet ante nec enim ullamcorper vehicula at vitae nulla. Vivamus a ullamcorper purus. Etiam nibh risus, lacinia accumsan elementum et, ultrices vel est.', NULL, NULL, 'Phasellus adipiscing ipsum at elit vulputate, quis aliquet diam tempus. Aliquam id tellus semper, placerat metus sed, venenatis libero.\n\nMaecenas posuere lacinia ante, non aliquet dui placerat vel. Donec id dignissim turpis. Nullam sed arcu', '(513)542-6948', '(842)538-1532', 'help@iowa.gov', 2095126, 'gif');
INSERT INTO `app_orgs` VALUES(4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 'gov', 'Wayne County, MI', 'wayne_county', 44, 'Fusce nisl tellus, varius non bibendum non, vestibulum id velit. Donec a augue id felis varius dapibus vel eu nulla. Proin id dui vitae nunc luctus pretium. In hac habitasse platea dictumst. Aenean dolor velit, eleifend et dolor a, euismod semper sem. Sed turpis sapien, varius non porttitor sed, scelerisque ut tortor. Morbi vel dui ac neque viverra euismod. Integer vel sem mattis velit placerat interdum. Donec tristique urna ut erat pulvinar, placerat tempor lacus aliquet. Fusce eros arcu, pulvinar sit amet massa sit amet, commodo sollicitudin arcu.', NULL, NULL, 'Vestibulum non lacus vehicula, semper odio id, sollicitudin erat. Integer sodales tempor erat, quis tempus risus feugiat vel. Fusce sit amet velit nec felis blandit adipiscing sit amet a neque. Quisque eu interdum velit. Ut nec erat urna.\n\n', '(842)538-1532', '(143)640-1449', 'waynecounty@gmail.com', 134056, 'gif');
INSERT INTO `app_orgs` VALUES(5, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 'company', 'ABC Company', 'abcco', 42, 'Aenean purus nunc, blandit sed metus quis, pretium rhoncus augue. Ut accumsan ac sem sed rhoncus. Sed pellentesque vulputate tempor. Curabitur augue sapien, sodales ac turpis quis, elementum egestas massa. Suspendisse id sapien augue. Curabitur condimentum ac risus eu viverra. Quisque sit amet dolor mauris. In nec iaculis augue.', NULL, NULL, 'Sed turpis sapien, varius non porttitor sed, scelerisque ut tortor. Morbi vel dui ac neque viverra euismod. Integer vel sem mattis velit placerat interdum. Donec tristique urna ut erat pulvinar, placerat tempor lacus aliquet. Fusce eros arc', '(513)492-4329', '(234)532-6549', 'contact@abcco.com', 22, 'jpg');
INSERT INTO `app_orgs` VALUES(6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 'company', 'XYZ Company', 'xyzco', 27, 'Mauris sed tellus eget ipsum suscipit porta et eu leo. Integer egestas facilisis suscipit. Phasellus tempor nunc a massa lacinia consectetur. Phasellus adipiscing ipsum at elit vulputate, quis aliquet diam tempus. Aliquam id tellus semper, placerat metus sed, venenatis libero.\n\nMaecenas posuere lacinia ante, non aliquet dui placerat vel. Donec id dignissim turpis. Nullam sed arcu eu quam cursus suscipit. Proin posuere enim augue, vel ullamcorper ligula viverra sed. Donec volutpat nisi mi, id porta diam volutpat dignissim. Praesent cursus dui semper, imperdiet odio in, dapibus nunc.', NULL, NULL, 'Aenean in tincidunt tellus. Fusce nisl tellus, varius non bibendum non, vestibulum id velit. Donec a augue id felis varius dapibus vel eu nulla. Proin id dui vitae nunc luctus pretium. In hac habitasse platea dictumst. Aenean dolor velit, e', '(234)532-6549', '(410)514-7742', 'xyz@gmail.com', 5640, 'jpg');
INSERT INTO `app_orgs` VALUES(7, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 'company', 'ACME Corporation', 'acmecorp', 35, 'Nullam auctor posuere mauris, ut dictum velit. Aenean in tincidunt tellus. Fusce nisl tellus, varius non bibendum non, vestibulum id velit. Donec a augue id felis varius dapibus vel eu nulla. Proin id dui vitae nunc luctus pretium. In hac habitasse platea dictumst. Aenean dolor velit, eleifend et dolor a, euismod semper sem.', NULL, NULL, 'Vivamus a ullamcorper purus. Etiam nibh risus, lacinia accumsan elementum et, ultrices vel est. Donec orci nibh, aliquam et odio eget, mattis egestas odio. Fusce non quam tristique, volutpat urna non, malesuada felis. Aliquam dignissim mi v', '(143)640-1449', '(542)422-1234', 'acme@yahoo.com', 563, 'jpg');
INSERT INTO `app_orgs` VALUES(8, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 'company', '123 Inc', '123inc', 38, 'Quisque odio sapien, egestas non turpis eget, fringilla congue nunc. Mauris commodo venenatis facilisis. Proin quis ullamcorper enim, at tincidunt justo. Nulla et dui dictum, condimentum dui sit amet, egestas enim. Proin et ultricies arcu. Nam nibh massa, suscipit quis sapien quis, commodo accumsan mauris. Integer interdum venenatis odio, a congue nunc vulputate at. Suspendisse sit amet purus ut lacus gravida feugiat eu ac massa. Aenean iaculis nibh eget felis ultricies ultrices.', NULL, NULL, 'Nam nibh massa, suscipit quis sapien quis, commodo accumsan mauris. Integer interdum venenatis odio, a congue nunc vulputate at. Suspendisse sit amet purus ut lacus gravida feugiat eu ac massa. Aenean iaculis nibh eget felis ultricies ultri', '(410)514-7742', '(675)943-1434', '123inc@mail.com', 145, 'jpg');
INSERT INTO `app_orgs` VALUES(9, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 'school', 'University of Miami', 'universitymiami', 47, 'Phasellus elementum nisl non urna ultricies, vel accumsan nisi varius. Etiam at pellentesque mi. Mauris et dolor ac orci mollis scelerisque.\n\nAliquam eu dui in sem sollicitudin varius. Aenean purus nunc, blandit sed metus quis, pretium rhoncus augue. Ut accumsan ac sem sed rhoncus. Sed pellentesque vulputate tempor. Curabitur augue sapien, sodales ac turpis quis, elementum egestas massa. Suspendisse id sapien augue.', NULL, NULL, 'Ut nec erat urna.\n\nMorbi id tempus massa. Etiam non orci hendrerit, interdum mi vitae, ultricies augue. Fusce sit amet nulla sollicitudin, bibendum eros vel, dapibus dui. Aenean sit amet ante nec enim ullamcorper vehicula at vitae nulla. V', '(313)642-7525', '(513)492-4329', 'info@umiami.edu', 13473, 'png');
INSERT INTO `app_orgs` VALUES(10, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 'school', 'Amityville High School', 'amityvillehigh', 52, 'Proin id dui vitae nunc luctus pretium. In hac habitasse platea dictumst. Aenean dolor velit, eleifend et dolor a, euismod semper sem. Sed turpis sapien, varius non porttitor sed, scelerisque ut tortor. Morbi vel dui ac neque viverra euismod. Integer vel sem mattis velit placerat interdum. Donec tristique urna ut erat pulvinar, placerat tempor lacus aliquet. Fusce eros arcu, pulvinar sit amet massa sit amet, commodo sollicitudin arcu.', NULL, NULL, 'Donec orci nibh, aliquam et odio eget, mattis egestas odio. Fusce non quam tristique, volutpat urna non, malesuada felis. Aliquam dignissim mi vel mi vulputate, vitae faucibus mauris sodales. Nulla aliquet semper augue, vel feugiat metus eu', '(850)534-5245', '(941)539-0549', 'about@amityvillehigh.edu', 984, 'png');
INSERT INTO `app_orgs` VALUES(11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 'school', 'Sand Springs Community College', 'sandspringscc', 43, 'Proin posuere enim augue, vel ullamcorper ligula viverra sed. Donec volutpat nisi mi, id porta diam volutpat dignissim. Praesent cursus dui semper, imperdiet odio in, dapibus nunc. Nulla facilisi. Vestibulum non lacus vehicula, semper odio id, sollicitudin erat. Integer sodales tempor erat, quis tempus risus feugiat vel.', NULL, NULL, 'Sed a risus odio. Phasellus elementum nisl non urna ultricies, vel accumsan nisi varius. Etiam at pellentesque mi. Mauris et dolor ac orci mollis scelerisque.\n\nAliquam eu dui in sem sollicitudin varius. Aenean purus nunc, blandit sed metus ', '(524)909-4224', '(432)549-4320', 'contact@sscc.edu', 5412, 'png');
INSERT INTO `app_orgs` VALUES(12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 'school', 'Ohio State (Cincinnati)', 'ohiostate_cinci', 36, 'Vestibulum non lacus vehicula, semper odio id, sollicitudin erat. Integer sodales tempor erat, quis tempus risus feugiat vel. Fusce sit amet velit nec felis blandit adipiscing sit amet a neque. Quisque eu interdum velit. Ut nec erat urna.\n\nMorbi id tempus massa. Etiam non orci hendrerit, interdum mi vitae, ultricies augue. Fusce sit amet nulla sollicitudin, bibendum eros vel, dapibus dui. Aenean sit amet ante nec enim ullamcorper vehicula at vitae nulla. Vivamus a ullamcorper purus. Etiam nibh risus, lacinia accumsan elementum et, ultrices vel est.', NULL, NULL, 'In commodo ipsum leo, id pharetra purus sodales a. Vivamus vitae quam quis tortor ullamcorper ullamcorper eget eu nibh. Quisque odio sapien, egestas non turpis eget, fringilla congue nunc. Mauris commodo venenatis facilisis. Proin quis ulla', '(432)549-4320', '(850)534-5245', 'cincinatti@ohiostate.edu', 15447, 'png');
INSERT INTO `app_orgs` VALUES(13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 'group', 'First Orthodox Church', 'firstorthodox', 45, 'Vivamus a ullamcorper purus. Etiam nibh risus, lacinia accumsan elementum et, ultrices vel est. Donec orci nibh, aliquam et odio eget, mattis egestas odio. Fusce non quam tristique, volutpat urna non, malesuada felis. Aliquam dignissim mi vel mi vulputate, vitae faucibus mauris sodales. Nulla aliquet semper augue, vel feugiat metus euismod eget.', NULL, NULL, 'Sed pellentesque vulputate tempor. Curabitur augue sapien, sodales ac turpis quis, elementum egestas massa. Suspendisse id sapien augue. Curabitur condimentum ac risus eu viverra. Quisque sit amet dolor mauris. In nec iaculis augue. Mauris ', '(607)552-6390', '(524)909-4224', 'james@firstorthodox.org', 56, 'png');
INSERT INTO `app_orgs` VALUES(14, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 'group', 'Synagogue of King David', 'synagoguekingdavid', 43, 'Proin id dui vitae nunc luctus pretium. In hac habitasse platea dictumst. Aenean dolor velit, eleifend et dolor a, euismod semper sem. Sed turpis sapien, varius non porttitor sed, scelerisque ut tortor. Morbi vel dui ac neque viverra euismod. Integer vel sem mattis velit placerat interdum. Donec tristique urna ut erat pulvinar, placerat tempor lacus aliquet. Fusce eros arcu, pulvinar sit amet massa sit amet, commodo sollicitudin arcu.', NULL, NULL, 'Vestibulum non lacus vehicula, semper odio id, sollicitudin erat. Integer sodales tempor erat, quis tempus risus feugiat vel. Fusce sit amet velit nec felis blandit adipiscing sit amet a neque. Quisque eu interdum velit. Ut nec erat urna.\n\n', '(941)539-0549', '(513)542-6948', 'info@kingdavidsynagogue.org', 122, 'png');
INSERT INTO `app_orgs` VALUES(15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 'group', 'Center for Alternative Religion', 'centeraltreligion', 51, 'Nam nibh massa, suscipit quis sapien quis, commodo accumsan mauris. Integer interdum venenatis odio, a congue nunc vulputate at. Suspendisse sit amet purus ut lacus gravida feugiat eu ac massa. Aenean iaculis nibh eget felis ultricies ultrices. Sed a risus odio. Phasellus elementum nisl non urna ultricies, vel accumsan nisi varius. Etiam at pellentesque mi. Mauris et dolor ac orci mollis scelerisque.', NULL, NULL, 'Sed pellentesque vulputate tempor. Curabitur augue sapien, sodales ac turpis quis, elementum egestas massa. Suspendisse id sapien augue. Curabitur condimentum ac risus eu viverra. Quisque sit amet dolor mauris. In nec iaculis augue. Mauris ', '(303)740-2433', '(670)404-2425', 'alternativereligion@gmail.com', 431, 'png');
INSERT INTO `app_orgs` VALUES(16, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 'group', 'Temple of Religious Worship', 'templeworship', 33, 'Suspendisse id sapien augue. Curabitur condimentum ac risus eu viverra. Quisque sit amet dolor mauris. In nec iaculis augue. Mauris sed tellus eget ipsum suscipit porta et eu leo. Integer egestas facilisis suscipit. Phasellus tempor nunc a massa lacinia consectetur. ', NULL, NULL, 'Etiam non orci hendrerit, interdum mi vitae, ultricies augue. Fusce sit amet nulla sollicitudin, bibendum eros vel, dapibus dui. Aenean sit amet ante nec enim ullamcorper vehicula at vitae nulla. Vivamus a ullamcorper purus. Etiam nibh risu', '(670)404-2425', '(303)740-2433', 'worship@thetemple.org', 205, 'png');

DROP TABLE IF EXISTS `app_posts`;
CREATE TABLE `app_posts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) unsigned NOT NULL,
  `privacy` varchar(20) NOT NULL DEFAULT '0',
  `influence` tinyint(2) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO `app_posts` VALUES(1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'public', 33, 'debates');
INSERT INTO `app_posts` VALUES(2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'followers', 4, 'blogs');
INSERT INTO `app_posts` VALUES(3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'following', 4, 'subjects');
INSERT INTO `app_posts` VALUES(4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 'public', 49, 'blogs');
INSERT INTO `app_posts` VALUES(5, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'followers', 35, 'debates');
INSERT INTO `app_posts` VALUES(6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'public', 61, 'links');
INSERT INTO `app_posts` VALUES(7, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'following', 41, 'links');
INSERT INTO `app_posts` VALUES(8, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 6, 'following', 23, 'blogs');
INSERT INTO `app_posts` VALUES(9, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'public', 25, 'blogs');
INSERT INTO `app_posts` VALUES(10, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 'following', 12, 'blogs');
INSERT INTO `app_posts` VALUES(11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 6, 'private', 55, 'debates');
INSERT INTO `app_posts` VALUES(12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'followers', 42, 'subjects');
INSERT INTO `app_posts` VALUES(13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 6, 'public', 45, 'events');
INSERT INTO `app_posts` VALUES(14, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 'following', 37, 'timeline');
INSERT INTO `app_posts` VALUES(15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'public', 28, 'subjects');
INSERT INTO `app_posts` VALUES(16, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 'following', 41, 'votes');
INSERT INTO `app_posts` VALUES(17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'following', 29, 'ideas');
INSERT INTO `app_posts` VALUES(18, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'public', 49, 'timeline');
INSERT INTO `app_posts` VALUES(19, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'followers', 21, 'beliefs');
INSERT INTO `app_posts` VALUES(20, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 'private', 52, 'events');
INSERT INTO `app_posts` VALUES(21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'private', 13, 'quotes');
INSERT INTO `app_posts` VALUES(22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'private', 17, 'quotes');
INSERT INTO `app_posts` VALUES(23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'following', 9, 'quotes');
INSERT INTO `app_posts` VALUES(24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'public', 8, 'quotes');
INSERT INTO `app_posts` VALUES(25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 'followers', 15, 'blogs');
INSERT INTO `app_posts` VALUES(26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'following', 36, 'ideas');
INSERT INTO `app_posts` VALUES(27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'public', 51, 'beliefs');
INSERT INTO `app_posts` VALUES(28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'public', 63, 'questions');
INSERT INTO `app_posts` VALUES(29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'public', 34, 'answers');
INSERT INTO `app_posts` VALUES(30, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'private', 53, 'questions');
INSERT INTO `app_posts` VALUES(31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'public', 73, 'matters');
INSERT INTO `app_posts` VALUES(32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 6, 'public', 25, 'blogs');
INSERT INTO `app_posts` VALUES(33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'private', 46, 'ideas');
INSERT INTO `app_posts` VALUES(34, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 'public', 42, 'events');
INSERT INTO `app_posts` VALUES(35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 8, 'private', 27, 'links');
INSERT INTO `app_posts` VALUES(36, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 'following', 16, 'blogs');
INSERT INTO `app_posts` VALUES(37, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 6, 'private', 64, 'links');
INSERT INTO `app_posts` VALUES(38, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'public', 35, 'timeline');
INSERT INTO `app_posts` VALUES(39, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'followers', 15, 'matters');
INSERT INTO `app_posts` VALUES(40, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 'followers', 63, 'blogs');
INSERT INTO `app_posts` VALUES(41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 'private', 43, 'blogs');
INSERT INTO `app_posts` VALUES(42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 6, 'followers', 41, 'ideas');
INSERT INTO `app_posts` VALUES(43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 8, 'private', 32, 'matters');
INSERT INTO `app_posts` VALUES(44, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'public', 22, 'beliefs');
INSERT INTO `app_posts` VALUES(45, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'public', 25, 'quotes');
INSERT INTO `app_posts` VALUES(46, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'following', 16, 'beliefs');
INSERT INTO `app_posts` VALUES(47, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 'following', 25, 'bills');
INSERT INTO `app_posts` VALUES(48, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'followers', 16, 'debates');
INSERT INTO `app_posts` VALUES(49, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 8, 'private', 64, 'answers');
INSERT INTO `app_posts` VALUES(50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 'private', 43, 'matters');
INSERT INTO `app_posts` VALUES(51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'public', 41, 'links');
INSERT INTO `app_posts` VALUES(52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 'public', 35, 'questions');
INSERT INTO `app_posts` VALUES(53, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'followers', 27, 'ideas');
INSERT INTO `app_posts` VALUES(54, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'followers', 31, 'questions');
INSERT INTO `app_posts` VALUES(55, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'private', 25, 'ideas');
INSERT INTO `app_posts` VALUES(56, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'public', 31, 'subjects');
INSERT INTO `app_posts` VALUES(57, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'public', 48, 'subjects');
INSERT INTO `app_posts` VALUES(58, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'public', 52, 'beliefs');
INSERT INTO `app_posts` VALUES(59, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'public', 47, 'quotes');
INSERT INTO `app_posts` VALUES(60, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'public', 26, 'timeline');
INSERT INTO `app_posts` VALUES(61, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'public', 53, 'bills');
INSERT INTO `app_posts` VALUES(62, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'private', 42, 'votes');
INSERT INTO `app_posts` VALUES(63, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'following', 35, 'bills');
INSERT INTO `app_posts` VALUES(64, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'public', 31, 'bills');
INSERT INTO `app_posts` VALUES(65, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 6, 'followers', 53, 'debates');
INSERT INTO `app_posts` VALUES(66, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'followers', 26, 'blogs');
INSERT INTO `app_posts` VALUES(67, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'following', 35, 'blogs');
INSERT INTO `app_posts` VALUES(68, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 'private', 53, 'answers');
INSERT INTO `app_posts` VALUES(69, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 'following', 41, 'events');
INSERT INTO `app_posts` VALUES(70, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'followers', 33, 'blogs');
INSERT INTO `app_posts` VALUES(71, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'followers', 23, 'events');
INSERT INTO `app_posts` VALUES(72, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'public', 37, 'answers');
INSERT INTO `app_posts` VALUES(73, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 8, 'public', 33, 'blogs');
INSERT INTO `app_posts` VALUES(74, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 'following', 24, 'events');
INSERT INTO `app_posts` VALUES(75, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'private', 34, 'answers');
INSERT INTO `app_posts` VALUES(76, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'public', 32, 'answers');
INSERT INTO `app_posts` VALUES(77, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'following', 13, 'answers');
INSERT INTO `app_posts` VALUES(78, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'public', 33, 'events');
INSERT INTO `app_posts` VALUES(79, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'followers', 42, 'answers');
INSERT INTO `app_posts` VALUES(80, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'public', 43, 'events');

DROP TABLE IF EXISTS `app_reviews`;
CREATE TABLE `app_reviews` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `org_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `title` varchar(40) NOT NULL DEFAULT '',
  `content` text,
  `rating` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `org_id` (`org_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO `app_reviews` VALUES(1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 2, 'Great place to live', 'Prima ancillae per ut, ne deseruisse omittantur eum, ipsum commodo tincidunt ut est. At amet facilis mnesarchum eam.\n\nUsu sint accusata ne. Noluisse legendos philosophia vis ne, nulla mucius oblique eum an. Usu malis fierent propriae cu. Saepe officiis liberavisse et nec. Duo electram sententiae eu. Id per suas timeam, tritani alienum cu mei. Te mei aliquid eligendi, mei feugiat efficiendi interpretaris ne, nam labores invenire inciderint no.', 4);
INSERT INTO `app_reviews` VALUES(2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 4, 'Excellent job!', 'Iudico tollit iriure his te. No eam graecis mediocritatem, pro ut putent accusata, tempor integre lobortis ne vel. At mei civibus blandit, adhuc consequuntur te eam, eu sed mazim perfecto efficiantur. Quando laboramus intellegebat ea sea, vel ea saepe impetus senserit? Dolor accusamus nec te, pri in sanctus vulputate comprehensam, ne clita ridens feugait mea!\n\nId sint epicurei concludaturque sit, an qui errem deserunt dissentiunt. Ut usu primis assentior. Est viris clita ex, ut odio menandri mea, te eum dicit facilisis theophrastus. An quo mundi appareat, vivendo civibus eligendi vis an. Ea vix oratio mollis, ad per lucilius maluisset mediocritatem? Errem molestie liberavisse ne sed, cu his habemus molestie.', 5);
INSERT INTO `app_reviews` VALUES(3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 1, 'Need improvement', 'Est sint atomorum an? Te sea malis mediocritatem, et ius consul officiis postulant. Modo oratio aliquando et eam.\n\nIudico tollit iriure his te. No eam graecis mediocritatem, pro ut putent accusata, tempor integre lobortis ne vel. At mei civibus blandit, adhuc consequuntur te eam, eu sed mazim perfecto efficiantur. Quando laboramus intellegebat ea sea, vel ea saepe impetus senserit? Dolor accusamus nec te, pri in sanctus vulputate comprehensam, ne clita ridens feugait mea!', 3);
INSERT INTO `app_reviews` VALUES(4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 2, 'Not happy!', 'Ea vix oratio mollis, ad per lucilius maluisset mediocritatem? Errem molestie liberavisse ne sed, cu his habemus molestie.\n\nDolorum convenire explicari ei sit, mei at propriae forensibus dissentiet, phaedrum ocurreret constituto ad sea. Cum cu iuvaret eruditi percipitur, veritus noluisse abhorreant id per. Te vis autem vivendo, eu quo diceret ornatus? Exerci suscipit disputationi no eos! Vis volutpat pericula ex, ex mei dicam semper integre.', 1);
INSERT INTO `app_reviews` VALUES(5, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 3, 'Loving it!', 'His ceteros noluisse splendide cu, mucius accusamus no eum, sit et probo summo quidam. Ut rebum copiosae voluptatum his! Duo soluta repudiandae ea, sea legimus phaedrum eu, mea nibh bonorum sapientem ne! Et tota velit facilis quo, tale habeo mollis ad cum. Id per insolens assentior, ipsum admodum delicata mel no.\n\nEt sea posse virtute ponderum, noster alienum delicata mea an, vidit similique cu mel! Usu id nostro facilisis. Omnes oportere ei mea, graece officiis definiebas eam ea, an fierent nominati his. Ius altera alienum senserit in. Ei doming menandri tincidunt sit, idque oratio hendrerit id nam?', 4);

DROP TABLE IF EXISTS `app_tags`;
CREATE TABLE `app_tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_id` int(11) NOT NULL,
  `tag` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

INSERT INTO `app_tags` VALUES(1, '2013-10-22 11:19:52', '0000-00-00 00:00:00', 1, 'school');
INSERT INTO `app_tags` VALUES(2, '2013-10-22 11:19:56', '0000-00-00 00:00:00', 1, 'budget');
INSERT INTO `app_tags` VALUES(3, '2013-10-22 11:23:32', '0000-00-00 00:00:00', 52, 'pronouns');
INSERT INTO `app_tags` VALUES(4, '2013-10-22 11:20:53', '0000-00-00 00:00:00', 8, 'taxes');
INSERT INTO `app_tags` VALUES(5, '2013-10-22 11:19:58', '0000-00-00 00:00:00', 1, 'education');
INSERT INTO `app_tags` VALUES(6, '2013-10-22 11:22:34', '0000-00-00 00:00:00', 13, 'growing food');
INSERT INTO `app_tags` VALUES(7, '2013-10-22 11:20:56', '0000-00-00 00:00:00', 8, '2013');
INSERT INTO `app_tags` VALUES(8, '2013-10-22 11:21:54', '0000-00-00 00:00:00', 3, 'american history');
INSERT INTO `app_tags` VALUES(9, '2013-10-22 11:22:33', '0000-00-00 00:00:00', 13, 'sustainability');
INSERT INTO `app_tags` VALUES(10, '2013-10-22 11:23:39', '0000-00-00 00:00:00', 52, 'grammar');

DROP TABLE IF EXISTS `app_thumbs`;
CREATE TABLE `app_thumbs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `positive` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO `app_thumbs` VALUES(1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 2, 0);
INSERT INTO `app_thumbs` VALUES(2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 3, 1);
INSERT INTO `app_thumbs` VALUES(3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 4, 1);
INSERT INTO `app_thumbs` VALUES(4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 1, 1);
INSERT INTO `app_thumbs` VALUES(5, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 5, 0);
INSERT INTO `app_thumbs` VALUES(6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 6, 1);
INSERT INTO `app_thumbs` VALUES(7, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 7, 0);
INSERT INTO `app_thumbs` VALUES(8, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 3, 1);
INSERT INTO `app_thumbs` VALUES(9, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 6, 3, 0);
INSERT INTO `app_thumbs` VALUES(10, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 4, 0);

DROP TABLE IF EXISTS `app_tokens`;
CREATE TABLE `app_tokens` (
  `token` varchar(20) NOT NULL DEFAULT '',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expires` datetime NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`token`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `app_tokens` VALUES('ENlnLTHKlpkr5XYeaS7G', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2014-10-15 00:54:57', 1);
INSERT INTO `app_tokens` VALUES('EUgqeOZn8W18MAJzs1lB', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2013-10-09 00:11:52', 2);
INSERT INTO `app_tokens` VALUES('EuoRKh3ngGFu322Ysnpq', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2013-10-08 23:54:12', 3);
INSERT INTO `app_tokens` VALUES('eZvvXsIKeTFH5zBVUM17', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2013-10-09 20:32:50', 4);
INSERT INTO `app_tokens` VALUES('f0Boc16rPB0LwAtSU3bA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2013-10-08 22:39:33', 5);
INSERT INTO `app_tokens` VALUES('f0CRJ6P6Kh2bNI9g4etI', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2013-10-09 21:37:54', 6);
INSERT INTO `app_tokens` VALUES('F7cz9Yugql0Oz0nar4Dh', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2013-10-08 21:28:55', 7);
INSERT INTO `app_tokens` VALUES('FaQpFdVfII9soz6QNXXq', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2013-10-09 21:47:56', 8);

DROP TABLE IF EXISTS `app_users`;
CREATE TABLE `app_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `first` varchar(40) DEFAULT NULL,
  `last` varchar(40) DEFAULT NULL,
  `email` varchar(60) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `subcategory` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `occupation` varchar(120) DEFAULT NULL,
  `company` varchar(120) DEFAULT NULL,
  `website` varchar(120) DEFAULT NULL,
  `fb` varchar(20) DEFAULT NULL,
  `li` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `notes` text,
  `influence` int(11) DEFAULT NULL,
  `img` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO `app_users` VALUES(1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'davidcruz', 'phourus', 'David', 'Cruz', 'dcruz@ymail.com', '555-555-5555', NULL, NULL, 'active', 0, 'm', 'Software Engineer', 'Intuit', 'www.intuit.com', NULL, NULL, NULL, NULL, 41, 'jpg');
INSERT INTO `app_users` VALUES(2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'kbasil', 'phourus', 'Kelly', 'Basil', 'kbasil@gmail.com', '555-555-5555', NULL, NULL, 'active', 0, 'f', 'Director of Marketing', 'Adobe', 'www.adobe.com', NULL, NULL, NULL, NULL, 52, 'png');
INSERT INTO `app_users` VALUES(3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'bruceisaac', 'phourus', 'Bruce', 'Isaac', 'bruseisaac@hotmail.com', '555-555-5555', NULL, NULL, 'active', 0, 'm', 'CTO', 'Facebook', 'www.facebook.com', NULL, NULL, NULL, NULL, 60, 'jpg');
INSERT INTO `app_users` VALUES(4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'reginawall', 'phourus', 'Regina', 'Wall', 'rwall@ymail.com', '555-555-5555', NULL, NULL, 'active', 0, 'f', 'Customer Support Specialist', 'Google', 'www.intuit.com', NULL, NULL, NULL, NULL, 37, 'jpg');
INSERT INTO `app_users` VALUES(5, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'kendallk', 'phourus', 'Kendall', 'Kennedy', 'kendallk@gmail.com', '555-555-5555', NULL, NULL, 'active', 0, 'm', 'Selectman', 'Town of Plaistow', 'www.kendallkennedy.com', NULL, NULL, NULL, NULL, 44, 'jpg');
INSERT INTO `app_users` VALUES(6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'duncanv', 'phourus', 'Duncan', 'Valentine', 'info@duncanvalentine.com', '555-555-5555', NULL, NULL, 'active', 0, 'm', 'Sales Engineer', 'LinkedIn', 'www.linkedin.com', NULL, NULL, NULL, NULL, 39, 'jpg');
INSERT INTO `app_users` VALUES(7, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'cassidyowen', 'phourus', 'Cassidy', 'Owen', 'cassidyown@hotmail.com', '555-555-5555', NULL, NULL, 'active', 0, 'f', 'State Representative', 'State of NH', 'www.cassidyowen.com', NULL, NULL, NULL, NULL, 55, 'jpg');
INSERT INTO `app_users` VALUES(8, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'buckc', 'phourus', 'Buck', 'Chapman', 'buckchapman@yahoo.com', '555-555-5555', NULL, NULL, 'active', 0, 'm', 'Professor', 'West Virgina State University', 'www.buckshot.com', NULL, NULL, NULL, NULL, 43, 'jpg');

DROP TABLE IF EXISTS `app_views`;
CREATE TABLE `app_views` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(20) DEFAULT '',
  `path` varchar(120) DEFAULT '',
  `user_id` int(11) DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `location` varchar(40) DEFAULT NULL,
  `viewer_id` int(11) DEFAULT NULL,
  `referer` varchar(120) DEFAULT NULL,
  `exit` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO `app_views` VALUES(1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '', NULL, NULL, 1, NULL, 2, NULL, NULL);
INSERT INTO `app_views` VALUES(2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '', NULL, NULL, 1, NULL, 5, NULL, NULL);
INSERT INTO `app_views` VALUES(3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', NULL, NULL, 2, NULL, 1, NULL, NULL);
INSERT INTO `app_views` VALUES(4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', NULL, NULL, 1, NULL, 3, NULL, NULL);
INSERT INTO `app_views` VALUES(5, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', NULL, 1, NULL, NULL, 1, NULL, NULL);
INSERT INTO `app_views` VALUES(6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', 1, NULL, NULL, NULL, 7, NULL, NULL);
INSERT INTO `app_views` VALUES(7, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', 2, NULL, NULL, NULL, 5, NULL, NULL);
INSERT INTO `app_views` VALUES(8, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', NULL, 2, NULL, NULL, 1, NULL, NULL);
INSERT INTO `app_views` VALUES(9, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', 1, NULL, NULL, NULL, 2, NULL, NULL);
INSERT INTO `app_views` VALUES(10, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', NULL, NULL, 2, NULL, 3, NULL, NULL);
INSERT INTO `app_views` VALUES(11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', 2, NULL, NULL, NULL, 6, NULL, NULL);
INSERT INTO `app_views` VALUES(12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', 1, NULL, NULL, NULL, 3, NULL, NULL);
INSERT INTO `app_views` VALUES(13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', NULL, NULL, 3, NULL, 1, NULL, NULL);
INSERT INTO `app_views` VALUES(14, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', NULL, NULL, 4, NULL, 1, NULL, NULL);
INSERT INTO `app_views` VALUES(15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', NULL, 2, NULL, NULL, 5, NULL, NULL);
INSERT INTO `app_views` VALUES(16, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', NULL, 2, NULL, NULL, 6, NULL, NULL);
INSERT INTO `app_views` VALUES(17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', 3, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `app_views` VALUES(18, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', NULL, NULL, 4, NULL, 3, NULL, NULL);
INSERT INTO `app_views` VALUES(19, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', NULL, NULL, 4, NULL, 5, NULL, NULL);
INSERT INTO `app_views` VALUES(20, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', NULL, NULL, 3, NULL, 2, NULL, NULL);
INSERT INTO `app_views` VALUES(35, '2013-10-22 11:35:43', '0000-00-00 00:00:00', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `app_views` VALUES(36, '2013-10-22 11:39:08', '0000-00-00 00:00:00', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `app_views` VALUES(37, '2013-10-22 11:39:30', '0000-00-00 00:00:00', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `app_views` VALUES(38, '2013-10-22 11:44:01', '0000-00-00 00:00:00', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

DROP TABLE IF EXISTS `core_blogs`;
CREATE TABLE `core_blogs` (
  `post_id` int(11) unsigned NOT NULL,
  `title` varchar(40) DEFAULT NULL,
  `element` varchar(10) NOT NULL DEFAULT '',
  `category` varchar(20) NOT NULL DEFAULT '',
  `content` text,
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `core_blogs` VALUES(2, 'Educational shortfall: USA', 'mind', 'facts', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pharetra, libero quis lobortis porta, libero risus pellentesque felis, commodo blandit eros lorem id diam. Aenean ac ipsum id sapien vestibulum fringilla. Aliquam sed dui sit amet nulla eleifend blandit non ut leo.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pharetra, libero quis lobortis porta, libero risus pellentesque felis, commodo blandit eros lorem id diam. Aenean ac ipsum id sapien vestibulum fringilla. Aliquam sed dui sit amet nulla eleifend blandit non ut leo.\r\n\r\nLibero risus pellentesque felis, commodo blandit eros lorem id diam. Aenean ac ipsum id sapien vestibulum fringilla. Aliquam sed dui sit amet nulla eleifend blandit non ut leo.\r\n\r\nAenean ac ipsum id sapien vestibulum fringilla. Aliquam sed dui sit amet nulla eleifend blandit non ut leo.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pharetra, libero quis lobortis porta, libero risus pellentesque felis, commodo blandit eros lorem id diam.', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(4, 'Teachers & Statistics', 'mind', 'facts', 'Et vim utamur postulant, vim tamquam probatus ex? Est sint atomorum an? Te sea malis mediocritatem, et ius consul officiis postulant. Modo oratio aliquando et eam.\n\nIudico tollit iriure his te. No eam graecis mediocritatem, pro ut putent accusata, tempor integre lobortis ne vel. At mei civibus blandit, adhuc consequuntur te eam, eu sed mazim perfecto efficiantur. Quando laboramus intellegebat ea sea, vel ea saepe impetus senserit? Dolor accusamus nec te, pri in sanctus vulputate comprehensam, ne clita ridens feugait mea!', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(8, 'Taxes for 2013', 'voice', 'facts', 'Ei sonet nobis adipisci sed, vim ad vivendo denique periculis. Sed te melius noluisse evertitur, ocurreret gloriatur in eum. Decore dicunt usu te, vim te putent mediocritatem, affert deserunt cum ne.', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(9, 'Better housing options', 'earth', 'humor', 'Iudico tollit iriure his te. No eam graecis mediocritatem, pro ut putent accusata, tempor integre lobortis ne vel. At mei civibus blandit, adhuc consequuntur te eam, eu sed mazim perfecto efficiantur. Quando laboramus intellegebat ea sea, vel ea saepe impetus senserit? Dolor accusamus nec te, pri in sanctus vulputate comprehensam, ne clita ridens feugait mea!\n\nId sint epicurei concludaturque sit, an qui errem deserunt dissentiunt. Ut usu primis assentior. Est viris clita ex, ut odio menandri mea, te eum dicit facilisis theophrastus. An quo mundi appareat, vivendo civibus eligendi vis an. Ea vix oratio mollis, ad per lucilius maluisset mediocritatem? Errem molestie liberavisse ne sed, cu his habemus molestie.', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(10, 'What''s really in your food?', 'earth', 'rant', 'Expetenda accommodare ea nec, in eros perpetua senserit qui? An percipit vulputate cum, erat doming suscipiantur ea est, cum ne maiestatis mediocritatem. Mea democritum neglegentur ad, in erant euismod has, rebum tantas doming nam te. An quo movet indoctum, singulis cotidieque ut eam? Quas tantas quidam cum ne, an qui adhuc tamquam, eam ad vidit affert commune?\n\nHis ceteros noluisse splendide cu, mucius accusamus no eum, sit et probo summo quidam. Ut rebum copiosae voluptatum his! Duo soluta repudiandae ea, sea legimus phaedrum eu, mea nibh bonorum sapientem ne! Et tota velit facilis quo, tale habeo mollis ad cum. Id per insolens assentior, ipsum admodum delicata mel no.\n\nEt sea posse virtute ponderum, noster alienum delicata mea an, vidit similique cu mel! Usu id nostro facilisis. Omnes oportere ei mea, graece officiis definiebas eam ea, an fierent nominati his. Ius altera alienum senserit in. Ei doming menandri tincidunt sit, idque oratio hendrerit id nam?\n\nReque falli ne eam, similique efficiendi quo no. Sea id solet phaedrum, sit no partem facilis, impetus eligendi efficiantur et eum! Mea eius persequeris ea, an sed ullum eirmod, vis id etiam lucilius. Mel omnis ubique ad, ad vis labore quidam intellegat? Eu his ferri populo ridens, alienum commune usu et, no primis labores vix. Pro ex modus ubique vidisse?\n\nEt vim utamur postulant, vim tamquam probatus ex? Est sint atomorum an? Te sea malis mediocritatem, et ius consul officiis postulant. Modo oratio aliquando et eam.', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(25, 'It''s our right!', 'voice', 'rant', 'Est sint atomorum an? Te sea malis mediocritatem, et ius consul officiis postulant. Modo oratio aliquando et eam.\n\nIudico tollit iriure his te. No eam graecis mediocritatem, pro ut putent accusata, tempor integre lobortis ne vel. At mei civibus blandit, adhuc consequuntur te eam, eu sed mazim perfecto efficiantur. Quando laboramus intellegebat ea sea, vel ea saepe impetus senserit? Dolor accusamus nec te, pri in sanctus vulputate comprehensam, ne clita ridens feugait mea!', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(32, 'Protect the American Eagle', 'earth', 'discussion', 'Ei doming menandri tincidunt sit, idque oratio hendrerit id nam?\n\nReque falli ne eam, similique efficiendi quo no. Sea id solet phaedrum, sit no partem facilis, impetus eligendi efficiantur et eum! Mea eius persequeris ea, an sed ullum eirmod, vis id etiam lucilius. Mel omnis ubique ad, ad vis labore quidam intellegat? Eu his ferri populo ridens, alienum commune usu et, no primis labores vix. Pro ex modus ubique vidisse?\n', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(36, 'Religion in the 21st Century', 'faith', 'facts', 'Id sint epicurei concludaturque sit, an qui errem deserunt dissentiunt. Ut usu primis assentior. Est viris clita ex, ut odio menandri mea, te eum dicit facilisis theophrastus. An quo mundi appareat, vivendo civibus eligendi vis an. Ea vix oratio mollis, ad per lucilius maluisset mediocritatem? Errem molestie liberavisse ne sed, cu his habemus molestie.\n\nDolorum convenire explicari ei sit, mei at propriae forensibus dissentiet, phaedrum ocurreret constituto ad sea. Cum cu iuvaret eruditi percipitur, veritus noluisse abhorreant id per. Te vis autem vivendo, eu quo diceret ornatus? Exerci suscipit disputationi no eos! Vis volutpat pericula ex, ex mei dicam semper integre.', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(40, 'Atheist vs. Agnostic?', 'faith', 'discussion', 'No eam graecis mediocritatem, pro ut putent accusata, tempor integre lobortis ne vel. At mei civibus blandit, adhuc consequuntur te eam, eu sed mazim perfecto efficiantur. Quando laboramus intellegebat ea sea, vel ea saepe impetus senserit? Dolor accusamus nec te, pri in sanctus vulputate comprehensam, ne clita ridens feugait mea!', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(41, 'Change is needed', 'mind', 'rant', 'Dolorum convenire explicari ei sit, mei at propriae forensibus dissentiet, phaedrum ocurreret constituto ad sea. Cum cu iuvaret eruditi percipitur, veritus noluisse abhorreant id per. Te vis autem vivendo, eu quo diceret ornatus? Exerci suscipit disputationi no eos! Vis volutpat pericula ex, ex mei dicam semper integre.', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(66, 'To Church or not to Church?', 'faith', 'opinion', 'An quo mundi appareat, vivendo civibus eligendi vis an. Ea vix oratio mollis, ad per lucilius maluisset mediocritatem? Errem molestie liberavisse ne sed, cu his habemus molestie.', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(67, 'Obama vs. Romney', 'voice', 'discussion', 'Ut usu primis assentior. Est viris clita ex, ut odio menandri mea, te eum dicit facilisis theophrastus. An quo mundi appareat, vivendo civibus eligendi vis an. Ea vix oratio mollis, ad per lucilius maluisset mediocritatem? Errem molestie liberavisse ne sed, cu his habemus molestie.', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(70, 'It''s not hard to live greener', 'earth', 'opinion', 'His ceteros noluisse splendide cu, mucius accusamus no eum, sit et probo summo quidam. Ut rebum copiosae voluptatum his! Duo soluta repudiandae ea, sea legimus phaedrum eu, mea nibh bonorum sapientem ne! Et tota velit facilis quo, tale habeo mollis ad cum. Id per insolens assentior, ipsum admodum delicata mel no.\n\nEt sea posse virtute ponderum, noster alienum delicata mea an, vidit similique cu mel! Usu id nostro facilisis. Omnes oportere ei mea, graece officiis definiebas eam ea, an fierent nominati his. Ius altera alienum senserit in. Ei doming menandri tincidunt sit, idque oratio hendrerit id nam?', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(73, 'Federal Reserve policy', 'voice', 'opinion', 'Ad viris hendrerit has, ei soluta quidam mel. Viris tibique in qui. Euismod blandit tincidunt ne eos, sed ea dico libris. Nam ei quando essent malorum, vide duis etiam id est! Vim impedit graecis eu, id sit illud ipsum reprehendunt.\n\nExpetenda accommodare ea nec, in eros perpetua senserit qui? An percipit vulputate cum, erat doming suscipiantur ea est, cum ne maiestatis mediocritatem. Mea democritum neglegentur ad, in erant euismod has, rebum tantas doming nam te. An quo movet indoctum, singulis cotidieque ut eam? Quas tantas quidam cum ne, an qui adhuc tamquam, eam ad vidit affert commune?', '0000-00-00 00:00:00');

DROP TABLE IF EXISTS `core_events`;
CREATE TABLE `core_events` (
  `post_id` int(11) unsigned NOT NULL,
  `title` varchar(40) NOT NULL DEFAULT '',
  `element` varchar(10) NOT NULL DEFAULT '',
  `date` varchar(6) NOT NULL DEFAULT '',
  `time` varchar(6) NOT NULL,
  `content` text NOT NULL,
  `address_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `address_id` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `core_events` VALUES(13, 'Home food growers association', 'earth', '130423', '12:30p', 'Mucius dolorum voluptaria nam an, quo quod atomorum cu, choro platonem id pri. Pri id brute mediocrem, ut electram intellegam nec. Ei vitae consul explicari vis. Te enim senserit ullamcorper vis, deleniti liberavisse complectitur eu vel. Aperiri eloquentiam nec ad, his te civibus pericula maluisset, te illum doctus vis? Ad eam natum liber concludaturque, epicurei nominati mel et, no pro unum eligendi theophrastus!\n\nNatum solet postea nec eu, ut detracto pericula laboramus duo! Semper concludaturque ex has. Ad nulla soleat detraxit cum! Adhuc paulo insolens sit te, ut regione voluptaria scripserit vel. Te veri aliquip similique quo. In vis quis novum, id vel melius similique eloquentiam?', 1);
INSERT INTO `core_events` VALUES(20, 'Proponents of Alternative energy', 'earth', '131006', '08:00p', 'Eum ullum veniam mnesarchum no, audire vidisse reprimique ius no, stet vocibus lobortis sit ex. Ius discere oporteat cu! Ne his dicat appetere disputando, alia torquatos gloriatur cu mea, melius tamquam meliore cu mel. Te duo munere possit interpretaris, nemore fabellas mei et! Natum porro delenit ad duo, ea eirmod omittam epicurei quo!\n\nPopulo laboramus ea usu, ad eum congue accumsan. Tation fabulas accusata qui ad, eos ad quas etiam laudem. Eos ea movet libris nemore. Eum vitae nullam patrioque cu, ne cum postea doming, vis feugiat minimum te. His possim consulatu aliquando no. Atqui suavitate pri ei, oblique recteque convenire te cum!', 1);
INSERT INTO `core_events` VALUES(34, 'Re-learn math for adults', 'mind', '130303', '10:30a', 'Aperiri eloquentiam nec ad, his te civibus pericula maluisset, te illum doctus vis? Ad eam natum liber concludaturque, epicurei nominati mel et, no pro unum eligendi theophrastus!\n\nNatum solet postea nec eu, ut detracto pericula laboramus duo! Semper concludaturque ex has. Ad nulla soleat detraxit cum! Adhuc paulo insolens sit te, ut regione voluptaria scripserit vel. Te veri aliquip similique quo. In vis quis novum, id vel melius similique eloquentiam?', 4);
INSERT INTO `core_events` VALUES(69, 'Democrats of CA meeting', 'voice', '130612', '01:15p', 'Novum scaevola mea ad. Ut idque nihil eruditi mel, te iuvaret legimus his? Nibh commodo vim ei. Pertinax conceptam quo ut. In unum ancillae reformidans sea, eu graeci dictas legendos quo, pri ponderum lucilius ex. Doctus senserit duo ne, ei pro odio nominavi copiosae! Posse decore postea vis ad.\n\nVelit labore civibus cum at. Quo in quidam eruditi? Omnis bonorum pri et, te mea tollit ubique hendrerit, ex vidisse accusam persequeris eos. Sea ei debet aperiri, accumsan recteque scribentur per ei! Ad mutat saperet per, sit no nisl paulo.', 2);
INSERT INTO `core_events` VALUES(71, 'Moses Monday', 'faith', '131122', '09:45a', 'Velit labore civibus cum at. Quo in quidam eruditi? Omnis bonorum pri et, te mea tollit ubique hendrerit, ex vidisse accusam persequeris eos. Sea ei debet aperiri, accumsan recteque scribentur per ei! Ad mutat saperet per, sit no nisl paulo.\n\nEum ullum veniam mnesarchum no, audire vidisse reprimique ius no, stet vocibus lobortis sit ex. Ius discere oporteat cu! Ne his dicat appetere disputando, alia torquatos gloriatur cu mea, melius tamquam meliore cu mel. Te duo munere possit interpretaris, nemore fabellas mei et! Natum porro delenit ad duo, ea eirmod omittam epicurei quo!', 3);
INSERT INTO `core_events` VALUES(74, 'Teachers of Southern VA', 'mind', '130812', '03:25p', 'Populo laboramus ea usu, ad eum congue accumsan. Tation fabulas accusata qui ad, eos ad quas etiam laudem. Eos ea movet libris nemore. Eum vitae nullam patrioque cu, ne cum postea doming, vis feugiat minimum te. His possim consulatu aliquando no. Atqui suavitate pri ei, oblique recteque convenire te cum!\n\nEos novum quando ex, sea cu nusquam offendit vivendum! Falli iusto patrioque an sit, qui id doctus eruditi intellegebat, qui nusquam offendit tincidunt at. Eius impedit accusamus ius ex. Id nostrum lobortis eam, vix aperiri vituperata scriptorem ex, qui aliquip interesset ut! Id duo nostro omittam conclusionemque? Ex dico vero habeo vim, est ex vituperata conclusionemque! Has adipiscing contentiones ne.', 2);
INSERT INTO `core_events` VALUES(78, 'Republicans of NH meeting', 'voice', '140212', '04:00p', 'Nibh denique ocurreret sit ea, est eius movet cu, populo albucius mea eu. Soleat ullamcorper ea duo, no per affert timeam. No vel civibus fierent salutandi, ex exerci primis salutandi eum? Cu eum soluta graeco ocurreret, id nec audire tritani tractatos!\n\nEst prima brute dicunt ex, alii docendi suavitate cu his. Expetenda splendide cu vix, sea eros ludus soluta ne. Homero altera eu eos.', 2);
INSERT INTO `core_events` VALUES(80, 'Advocates for gun control', 'voice', '130606', '06:30p', 'In unum ancillae reformidans sea, eu graeci dictas legendos quo, pri ponderum lucilius ex. Doctus senserit duo ne, ei pro odio nominavi copiosae! Posse decore postea vis ad.\n\nVelit labore civibus cum at. Quo in quidam eruditi? Omnis bonorum pri et, te mea tollit ubique hendrerit, ex vidisse accusam persequeris eos. Sea ei debet aperiri, accumsan recteque scribentur per ei! Ad mutat saperet per, sit no nisl paulo.', 3);

DROP TABLE IF EXISTS `core_ideas`;
CREATE TABLE `core_ideas` (
  `post_id` int(11) unsigned NOT NULL,
  `title` varchar(40) NOT NULL DEFAULT '',
  `element` varchar(10) NOT NULL DEFAULT '',
  `category` varchar(20) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `core_ideas` VALUES(17, 'Online voting system', 'voice', 'innovation', 'Quo ei causae intellegebat, eu novum homero viderer cum! Vix id qualisque voluptaria. Nisl falli vel ne. Ut mel appellantur signiferumque, id sed autem bonorum sapientem? Per choro tantas officiis cu!\n\nAlii quodsi mediocritatem no mel, ei iudico meliore eum? Ea errem dolore mediocrem usu, pro te suavitate assentior, tota lorem pro cu. Te vis inani copiosae! Ad lorem iusto eloquentiam eos, molestie signiferumque duo ne, eam doctus alterum et!');
INSERT INTO `core_ideas` VALUES(26, 'Interesting packaging idea', 'earth', 'interesting', 'Has ne quot bonorum, aliquid euripidis nam no. Mei stet consectetuer ne, alii labores vix et, per noster delenit id? Ne alia nibh vocent nam, splendide signiferumque eu sea, ad quod illud dolorum eum? Dolor clita impedit an mea, has et dolorum delicata, usu ad tollit referrentur. His dicta aeque ne, affert efficiendi cum id. Euismod abhorreant voluptaria ea quo?');
INSERT INTO `core_ideas` VALUES(33, 'Increase US revenues', 'voice', 'improvement', 'Ubique efficiantur liberavisse no usu, has nihil menandri an! Quo labore latine dissentias id? Recusabo voluptatum cu duo, elit dicit everti cum et! No nec omnis intellegat, commodo disputando voluptatibus at sit, et indoctum eloquentiam pro! Apeirian theophrastus an ius.\n\nNe sed causae virtute, ut cum adhuc epicurei. Cetero alienum vis ex, tantas libris nam at, mel eu mutat iudico. Utamur platonem recteque ex mel. Prima nobis has ut, sadipscing persequeris duo cu. Tantas detraxit an vim, has purto nibh omnesque id, per et corrumpit vulputate!');
INSERT INTO `core_ideas` VALUES(42, 'New energy system', 'earth', 'innovation', 'Cetero alienum vis ex, tantas libris nam at, mel eu mutat iudico. Utamur platonem recteque ex mel. Prima nobis has ut, sadipscing persequeris duo cu. Tantas detraxit an vim, has purto nibh omnesque id, per et corrumpit vulputate!\n\nPri assum dicta debet at. Vidit doming delenit eum at, equidem lucilius adversarium te has. Sed at dicam graecis. Id vis voluptua fabellas qualisque, sit omittantur consectetuer ex, ei cum quis omnium consequuntur!');
INSERT INTO `core_ideas` VALUES(53, 'Cool idea to attract new Church members', 'faith', 'interesting', 'Ex postea argumentum pro, eos dicam perfecto et? Ea pro nihil nonumy conceptam, nullam putent persecuti per te. Vim ei ocurreret referrentur! Quot ignota fastidii ex mel?\n\nLaudem intellegam cum an. Numquam percipit eum te, purto ludus copiosae et vim. Ea nec insolens gubergren. Mei vivendum explicari sadipscing an, legimus perfecto intellegebat cum in. Porro detraxit cu ius.\n\nPri eu meis ridens propriae? Id mea commodo corpora. Ea iracundia percipitur mei, mel ut summo accusata sapientem, duo dicam nusquam pertinacia eu. Vis id facer etiam simul.');
INSERT INTO `core_ideas` VALUES(55, 'Improved education system', 'mind', 'improvement', 'Nec at choro possit mollis, at labitur volutpat mel! Meis commodo mandamus per an, eos te oporteat vulputate. Vel aliquando cotidieque ne, ut movet ridens has, ei amet efficiantur necessitatibus vis. Eam probo audiam reformidans id, cum alienum oporteat at. Ad ludus dicant ponderum vix, legere delectus in mei!\n\nAtqui fabulas qui ut! Case reprimique qui at. Pro ad audire senserit, verterem vituperata comprehensam pro id. Nobis recteque repudiare id eum, aliquam vivendum sententiae cu qui. Postea omnesque his ex? Dolore epicuri ad per, detracto efficiendi efficiantur ne mea. Te fabellas splendide vel.');

DROP TABLE IF EXISTS `core_links`;
CREATE TABLE `core_links` (
  `post_id` int(11) unsigned NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `element` varchar(10) NOT NULL DEFAULT '',
  `category` varchar(20) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `core_links` VALUES(6, 'http://www.whitehouse.gov/issues/education', 'mind', 'article', 'Ad mea laoreet apeirian voluptaria, sea cu tempor appellantur, pri consul pericula ad. Persius ornatus splendide vix no, his in repudiare definitiones, pro id meis urbanitas abhorreant. Pro solum nonumy petentium in, in vel iudico sententiae posidonium, clita eligendi honestatis te has. Odio mutat an vis, utinam vocent volumus eu pri.');
INSERT INTO `core_links` VALUES(7, 'http://www.opencongress.org/articles/view/2523-One-Year-Ago-We-Killed-SOPA-Happy-Internet-Freedom-Day-', 'voice', 'policies', 'Harum labitur deseruisse vim ne, dicta bonorum eam ei. Pro eius accusata deseruisse at. Prima ancillae per ut, ne deseruisse omittantur eum, ipsum commodo tincidunt ut est. At amet facilis mnesarchum eam.\n\nUsu sint accusata ne. Noluisse legendos philosophia vis ne, nulla mucius oblique eum an. Usu malis fierent propriae cu. Saepe officiis liberavisse et nec. ');
INSERT INTO `core_links` VALUES(35, 'http://climaterealityproject.org/video/', 'earth', 'video', 'Ex diam civibus sea, eu nam dolor discere oporteat. Percipit ocurreret quo cu, an debet consulatu assueverit sea. Te nec harum accumsan tacimates, an sed tollit elaboraret dissentiunt. Id quo habeo laboramus, idque dictas pertinax no eam, cu adipisci signiferumque has. Eu nam falli animal honestatis. Fuisset dissentiunt eu mei.\n\nAd mea laoreet apeirian voluptaria, sea cu tempor appellantur, pri consul pericula ad. Persius ornatus splendide vix no, his in repudiare definitiones, pro id meis urbanitas abhorreant. Pro solum nonumy petentium in, in vel iudico sententiae posidonium, clita eligendi honestatis te has. Odio mutat an vis, utinam vocent volumus eu pri.');
INSERT INTO `core_links` VALUES(37, 'http://www.religionfacts.com/big_religion_chart.htm', 'faith', 'article', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
INSERT INTO `core_links` VALUES(51, 'http://finance.yahoo.com/news/top-earners-set-pay-most-050001996.html', 'voice', 'article', 'Pro solum nonumy petentium in, in vel iudico sententiae posidonium, clita eligendi honestatis te has. Odio mutat an vis, utinam vocent volumus eu pri.\n\nNe sea liber melius inermis, illud dissentiet mei at, ut dictas dignissim vel. Ad has nullam quaerendum philosophia, vim eirmod oporteat ne. Harum labitur deseruisse vim ne, dicta bonorum eam ei. Pro eius accusata deseruisse at. ');

DROP TABLE IF EXISTS `earth_calculator`;
CREATE TABLE `earth_calculator` (
  `post_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `earth_checklist`;
CREATE TABLE `earth_checklist` (
  `post_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `earth_matters`;
CREATE TABLE `earth_matters` (
  `post_id` int(11) unsigned NOT NULL,
  `title` varchar(60) NOT NULL DEFAULT '',
  `category` varchar(20) NOT NULL,
  `content` text NOT NULL,
  `positive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `earth_matters` VALUES(1, 'Revolutionary battery technology', 'environmental', 'Praesent sed elementum tortor, non auctor eros. Praesent quis adipiscing metus. Nunc nec nisi consectetur, egestas sem et, volutpat ante. Nunc commodo nibh sed accumsan rutrum. Donec quam massa, varius ac tortor non, sodales imperdiet magna. Maecenas semper pharetra ullamcorper. Donec rutrum justo sit amet elit sagittis dictum.', 1);
INSERT INTO `earth_matters` VALUES(2, 'Inhuman working conditions in Chile', 'humanitarian', 'Aenean porttitor leo porta, sollicitudin massa a, sollicitudin justo. Proin purus diam, lacinia id magna sit amet, commodo euismod nunc. Maecenas eget nisi in purus blandit convallis. Maecenas nec sollicitudin nisl. Duis dui mauris, egestas in adipiscing vel, bibendum nec nulla. Nulla dapibus at neque sit amet dictum. Integer vestibulum varius felis, laoreet feugiat massa iaculis eu. Fusce nec odio velit.\n\nAenean varius erat a mi imperdiet viverra. Duis faucibus mattis mi, in malesuada arcu aliquam nec. Phasellus tempor velit facilisis erat auctor rutrum. Morbi nec elit ligula. Fusce suscipit sed orci pretium imperdiet. Aenean vel nibh adipiscing, condimentum lorem non, fringilla turpis. Cras tempor leo nec nisl vehicula feugiat. In a sem vitae purus ultricies sodales. Vestibulum fermentum tincidunt enim, in malesuada augue egestas interdum.', 0);
INSERT INTO `earth_matters` VALUES(3, 'Cost savings of new solar panels', 'economic', 'Fusce eget ornare nisl. Nam eu ligula ligula. Suspendisse nisi lorem, porta gravida pretium sit amet, dictum sit amet nibh. Duis sit amet justo ultrices nunc consequat vulputate. Nunc suscipit hendrerit nisi iaculis molestie. Suspendisse at dolor purus. Curabitur congue vitae ante vulputate placerat. Aenean porttitor leo porta, sollicitudin massa a, sollicitudin justo. Proin purus diam, lacinia id magna sit amet, commodo euismod nunc. Maecenas eget nisi in purus blandit convallis. Maecenas nec sollicitudin nisl. Duis dui mauris, egestas in adipiscing vel, bibendum nec nulla. Nulla dapibus at neque sit amet dictum. Integer vestibulum varius felis, laoreet feugiat massa iaculis eu. Fusce nec odio velit.\n\nAenean varius erat a mi imperdiet viverra. Duis faucibus mattis mi, in malesuada arcu aliquam nec. Phasellus tempor velit facilisis erat auctor rutrum. Morbi nec elit ligula. Fusce suscipit sed orci pretium imperdiet. Aenean vel nibh adipiscing, condimentum lorem non, fringilla turpis. Cras tempor leo nec nisl vehicula feugiat. In a sem vitae purus ultricies sodales. Vestibulum fermentum tincidunt enim, in malesuada augue egestas interdum.\n\nSuspendisse sed metus vitae ligula rutrum congue. Phasellus rutrum faucibus leo a sodales. Cras egestas est ipsum, a hendrerit turpis malesuada sed. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam laoreet egestas dolor ac tincidunt. Etiam in auctor dui. Duis iaculis, elit sit amet molestie hendrerit, felis neque pellentesque ligula, eu interdum justo eros sit amet nibh. Nullam nec pellentesque odio, nec tincidunt lorem. Nunc ac leo et ipsum iaculis dictum a in tellus. Fusce faucibus luctus luctus. Ut eros quam, semper at nibh quis, porttitor convallis sapien.', 1);
INSERT INTO `earth_matters` VALUES(4, 'Oil spill not covered in mainstream media', 'environmental', 'Aenean porttitor leo porta, sollicitudin massa a, sollicitudin justo. Proin purus diam, lacinia id magna sit amet, commodo euismod nunc. Maecenas eget nisi in purus blandit convallis. Maecenas nec sollicitudin nisl. Duis dui mauris, egestas in adipiscing vel, bibendum nec nulla. Nulla dapibus at neque sit amet dictum. Integer vestibulum varius felis, laoreet feugiat massa iaculis eu. Fusce nec odio velit.\n\nAenean varius erat a mi imperdiet viverra. Duis faucibus mattis mi, in malesuada arcu aliquam nec. Phasellus tempor velit facilisis erat auctor rutrum. Morbi nec elit ligula. Fusce suscipit sed orci pretium imperdiet. Aenean vel nibh adipiscing, condimentum lorem non, fringilla turpis. Cras tempor leo nec nisl vehicula feugiat. In a sem vitae purus ultricies sodales. Vestibulum fermentum tincidunt enim, in malesuada augue egestas interdum.', 0);

DROP TABLE IF EXISTS `mind_answers`;
CREATE TABLE `mind_answers` (
  `post_id` int(11) unsigned NOT NULL,
  `question_id` int(11) unsigned NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`post_id`),
  KEY `question_id` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mind_answers` VALUES(29, 1, 'Nulla metus mi, tempor vitae tempor vitae, iaculis nec odio. Suspendisse placerat augue vestibulum, elementum risus quis, egestas est. Sed id condimentum neque. Nunc eget malesuada augue, eu luctus sapien. Suspendisse potenti. Donec elementum volutpat arcu non laoreet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.');
INSERT INTO `mind_answers` VALUES(49, 4, 'Fusce eget ornare nisl. Nam eu ligula ligula. Suspendisse nisi lorem, porta gravida pretium sit amet, dictum sit amet nibh. Duis sit amet justo ultrices nunc consequat vulputate. Nunc suscipit hendrerit nisi iaculis molestie. Suspendisse at dolor purus. Curabitur congue vitae ante vulputate placerat. Aenean porttitor leo porta, sollicitudin massa a, sollicitudin justo. Proin purus diam, lacinia id magna sit amet, commodo euismod nunc. Maecenas eget nisi in purus blandit convallis. Maecenas nec sollicitudin nisl. Duis dui mauris, egestas in adipiscing vel, bibendum nec nulla. Nulla dapibus at neque sit amet dictum. Integer vestibulum varius felis, laoreet feugiat massa iaculis eu. Fusce nec odio velit.\n\nAenean varius erat a mi imperdiet viverra. Duis faucibus mattis mi, in malesuada arcu aliquam nec. Phasellus tempor velit facilisis erat auctor rutrum. Morbi nec elit ligula. Fusce suscipit sed orci pretium imperdiet. Aenean vel nibh adipiscing, condimentum lorem non, fringilla turpis. Cras tempor leo nec nisl vehicula feugiat. In a sem vitae purus ultricies sodales. Vestibulum fermentum tincidunt enim, in malesuada augue egestas interdum.\n\nSuspendisse sed metus vitae ligula rutrum congue. Phasellus rutrum faucibus leo a sodales. Cras egestas est ipsum, a hendrerit turpis malesuada sed. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam laoreet egestas dolor ac tincidunt. Etiam in auctor dui. Duis iaculis, elit sit amet molestie hendrerit, felis neque pellentesque ligula, eu interdum justo eros sit amet nibh. Nullam nec pellentesque odio, nec tincidunt lorem. Nunc ac leo et ipsum iaculis dictum a in tellus. Fusce faucibus luctus luctus. Ut eros quam, semper at nibh quis, porttitor convallis sapien.');
INSERT INTO `mind_answers` VALUES(68, 1, 'Nunc nec nisi consectetur, egestas sem et, volutpat ante. Nunc commodo nibh sed accumsan rutrum. Donec quam massa, varius ac tortor non, sodales imperdiet magna.');
INSERT INTO `mind_answers` VALUES(72, 2, 'Vivamus accumsan felis sem, id tempus magna ornare at. Nam vitae scelerisque dolor. Suspendisse potenti. Nunc hendrerit mollis tellus at blandit. Duis eu molestie ligula, eget consectetur est. Praesent sed elementum tortor, non auctor eros. Praesent quis adipiscing metus. Nunc nec nisi consectetur, egestas sem et, volutpat ante. Nunc commodo nibh sed accumsan rutrum. Donec quam massa, varius ac tortor non, sodales imperdiet magna. Maecenas semper pharetra ullamcorper. Donec rutrum justo sit amet elit sagittis dictum.\n\nFusce eget ornare nisl. Nam eu ligula ligula. Suspendisse nisi lorem, porta gravida pretium sit amet, dictum sit amet nibh. Duis sit amet justo ultrices nunc consequat vulputate. Nunc suscipit hendrerit nisi iaculis molestie. Suspendisse at dolor purus. Curabitur congue vitae ante vulputate placerat. Aenean porttitor leo porta, sollicitudin massa a, sollicitudin justo. Proin purus diam, lacinia id magna sit amet, commodo euismod nunc. Maecenas eget nisi in purus blandit convallis. Maecenas nec sollicitudin nisl. Duis dui mauris, egestas in adipiscing vel, bibendum nec nulla. Nulla dapibus at neque sit amet dictum. Integer vestibulum varius felis, laoreet feugiat massa iaculis eu. Fusce nec odio velit.');
INSERT INTO `mind_answers` VALUES(75, 2, 'Nam eu ligula ligula. Suspendisse nisi lorem, porta gravida pretium sit amet, dictum sit amet nibh. Duis sit amet justo ultrices nunc consequat vulputate. Nunc suscipit hendrerit nisi iaculis molestie. Suspendisse at dolor purus. Curabitur congue vitae ante vulputate placerat. Aenean porttitor leo porta, sollicitudin massa a, sollicitudin justo. Proin purus diam, lacinia id magna sit amet, commodo euismod nunc. ');
INSERT INTO `mind_answers` VALUES(76, 2, 'Aenean varius erat a mi imperdiet viverra. Duis faucibus mattis mi, in malesuada arcu aliquam nec. Phasellus tempor velit facilisis erat auctor rutrum. Morbi nec elit ligula. Fusce suscipit sed orci pretium imperdiet. Aenean vel nibh adipiscing, condimentum lorem non, fringilla turpis. Cras tempor leo nec nisl vehicula feugiat. In a sem vitae purus ultricies sodales. Vestibulum fermentum tincidunt enim, in malesuada augue egestas interdum.\n\nSuspendisse sed metus vitae ligula rutrum congue. Phasellus rutrum faucibus leo a sodales. Cras egestas est ipsum, a hendrerit turpis malesuada sed. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam laoreet egestas dolor ac tincidunt. Etiam in auctor dui. Duis iaculis, elit sit amet molestie hendrerit, felis neque pellentesque ligula, eu interdum justo eros sit amet nibh. Nullam nec pellentesque odio, nec tincidunt lorem. Nunc ac leo et ipsum iaculis dictum a in tellus. Fusce faucibus luctus luctus. Ut eros quam, semper at nibh quis, porttitor convallis sapien.');
INSERT INTO `mind_answers` VALUES(77, 3, 'Praesent sed elementum tortor, non auctor eros. Praesent quis adipiscing metus. Nunc nec nisi consectetur, egestas sem et, volutpat ante. Nunc commodo nibh sed accumsan rutrum. Donec quam massa, varius ac tortor non, sodales imperdiet magna. Maecenas semper pharetra ullamcorper. Donec rutrum justo sit amet elit sagittis dictum.');
INSERT INTO `mind_answers` VALUES(79, 4, 'Aenean porttitor leo porta, sollicitudin massa a, sollicitudin justo. Proin purus diam, lacinia id magna sit amet, commodo euismod nunc. Maecenas eget nisi in purus blandit convallis. Maecenas nec sollicitudin nisl. Duis dui mauris, egestas in adipiscing vel, bibendum nec nulla. Nulla dapibus at neque sit amet dictum. Integer vestibulum varius felis, laoreet feugiat massa iaculis eu. Fusce nec odio velit.\n\nAenean varius erat a mi imperdiet viverra. Duis faucibus mattis mi, in malesuada arcu aliquam nec. Phasellus tempor velit facilisis erat auctor rutrum. Morbi nec elit ligula. ');

DROP TABLE IF EXISTS `mind_questions`;
CREATE TABLE `mind_questions` (
  `post_id` int(11) unsigned NOT NULL,
  `title` varchar(60) NOT NULL DEFAULT '',
  `category` varchar(20) NOT NULL DEFAULT '',
  `subcategory` varchar(20) NOT NULL DEFAULT '',
  `difficulty` varchar(10) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mind_questions` VALUES(28, 'Need help with 2 + 2', 'math', 'arithmetic', 'easy', 'Praesent pretium ultricies sem, non porttitor velit lacinia non. Vestibulum porttitor molestie dolor in cursus. Duis tempus odio nec enim commodo adipiscing. Sed auctor est et venenatis hendrerit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut euismod sollicitudin urna non viverra.\n\nMorbi nec lectus tincidunt, tristique neque at, cursus urna. Phasellus consequat, lacus nec varius tempor, massa turpis imperdiet massa, id semper felis nibh in risus. Sed viverra pellentesque felis vitae dictum. Quisque vitae nulla risus. Suspendisse at sapien nec felis lacinia dictum posuere sed arcu. Suspendisse aliquet vehicula felis. Nullam est tortor, fermentum in magna sit amet, porttitor faucibus justo. Sed ut tincidunt metus, vitae lobortis eros. Phasellus rhoncus magna vel justo egestas venenatis. Cras lobortis gravida justo et laoreet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla consectetur enim eu ante sodales semper. Quisque ante eros, rhoncus ut blandit nec, varius et felis. Suspendisse egestas molestie felis eget varius. Vestibulum eu ornare magna. Donec semper odio laoreet semper fringilla.\n\nNunc euismod vel sem at aliquet. Morbi ut porta lacus. Sed egestas interdum eleifend. Aliquam a nulla elit. Aenean non egestas nisi, ut volutpat felis. Quisque purus sapien, ullamcorper nec suscipit at, adipiscing eget dolor. Fusce pellentesque velit in nunc rhoncus placerat.');
INSERT INTO `mind_questions` VALUES(30, 'Pythagorean Theorem question', 'math', 'trigonometry', 'medium', 'Maecenas consectetur condimentum tellus, eu lobortis mauris tincidunt eu. Praesent accumsan ultrices mauris vitae viverra. Nullam consequat venenatis pharetra. Morbi vitae lectus luctus, euismod tellus eu, lobortis tellus. Vestibulum sapien urna, eleifend nec arcu ac, tincidunt tempus lectus. Curabitur mollis feugiat justo, vel posuere diam ultricies euismod. Mauris ullamcorper vitae lectus id volutpat. Donec dolor nisl, pulvinar non cursus vel, fermentum nec ante.\n\nSed vitae nunc et nisl dapibus consequat. Integer eu tempus dolor, cursus laoreet risus. Etiam et mauris vulputate, posuere neque et, pellentesque velit. Vivamus ornare, risus at interdum consectetur, ligula nisl interdum enim, vel bibendum mauris felis eu enim. Cras felis nunc, porttitor sit amet magna sit amet, condimentum porttitor tortor. Nullam vel congue mauris. Vestibulum sollicitudin arcu nec leo malesuada convallis.');
INSERT INTO `mind_questions` VALUES(52, 'Pronouns help ', 'english', 'grammar', 'medium', 'Phasellus purus augue, consequat a elit interdum, tempus commodo libero. Ut blandit elit vitae tortor mollis, eget gravida ligula ornare. Praesent pretium ultricies sem, non porttitor velit lacinia non. Vestibulum porttitor molestie dolor in cursus. Duis tempus odio nec enim commodo adipiscing. Sed auctor est et venenatis hendrerit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut euismod sollicitudin urna non viverra.');
INSERT INTO `mind_questions` VALUES(54, 'Physics gravity question', 'physics', 'gravity', 'hard', 'In hac habitasse platea dictumst. Maecenas lacinia ligula in lacus blandit porta. Aliquam at tempus orci. Donec arcu mauris, rhoncus id semper sed, gravida vitae enim. Aliquam luctus gravida nulla, in eleifend erat commodo at. Sed laoreet rhoncus leo quis scelerisque. Phasellus purus augue, consequat a elit interdum, tempus commodo libero. Ut blandit elit vitae tortor mollis, eget gravida ligula ornare.');

DROP TABLE IF EXISTS `mind_subjects`;
CREATE TABLE `mind_subjects` (
  `post_id` int(11) unsigned NOT NULL,
  `title` varchar(40) NOT NULL DEFAULT '',
  `category` varchar(20) NOT NULL DEFAULT '',
  `subcategory` varchar(20) NOT NULL DEFAULT '',
  `difficulty` varchar(20) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mind_subjects` VALUES(3, 'American History 101', 'history', 'american', 'easy', 'Mea democritum neglegentur ad, in erant euismod has, rebum tantas doming nam te. An quo movet indoctum, singulis cotidieque ut eam? Quas tantas quidam cum ne, an qui adhuc tamquam, eam ad vidit affert commune?');
INSERT INTO `mind_subjects` VALUES(12, 'Introductory Algebra', 'math', 'algebra', 'easy', 'Lorem ipsum dolor sit amet, quo elit mazim aliquid at, delenit fierent insolens sea cu? Ius errem feugait accusam id, brute inciderint sea eu, ex quas fierent pro? Ei sonet nobis adipisci sed, vim ad vivendo denique periculis. Sed te melius noluisse evertitur, ocurreret gloriatur in eum. Decore dicunt usu te, vim te putent mediocritatem, affert deserunt cum ne.\n\nAd viris hendrerit has, ei soluta quidam mel. Viris tibique in qui. Euismod blandit tincidunt ne eos, sed ea dico libris. Nam ei quando essent malorum, vide duis etiam id est! Vim impedit graecis eu, id sit illud ipsum reprehendunt.\n\nExpetenda accommodare ea nec, in eros perpetua senserit qui? An percipit vulputate cum, erat doming suscipiantur ea est, cum ne maiestatis mediocritatem. Mea democritum neglegentur ad, in erant euismod has, rebum tantas doming nam te. An quo movet indoctum, singulis cotidieque ut eam? Quas tantas quidam cum ne, an qui adhuc tamquam, eam ad vidit affert commune?');
INSERT INTO `mind_subjects` VALUES(15, 'How to do your taxes', 'personal', 'financial', 'intermediate', 'Expetenda accommodare ea nec, in eros perpetua senserit qui? An percipit vulputate cum, erat doming suscipiantur ea est, cum ne maiestatis mediocritatem. Mea democritum neglegentur ad, in erant euismod has, rebum tantas doming nam te. An quo movet indoctum, singulis cotidieque ut eam? Quas tantas quidam cum ne, an qui adhuc tamquam, eam ad vidit affert commune?\n\nHis ceteros noluisse splendide cu, mucius accusamus no eum, sit et probo summo quidam. Ut rebum copiosae voluptatum his! Duo soluta repudiandae ea, sea legimus phaedrum eu, mea nibh bonorum sapientem ne! Et tota velit facilis quo, tale habeo mollis ad cum. Id per insolens assentior, ipsum admodum delicata mel no.\n\nEt sea posse virtute ponderum, noster alienum delicata mea an, vidit similique cu mel! Usu id nostro facilisis. Omnes oportere ei mea, graece officiis definiebas eam ea, an fierent nominati his. Ius altera alienum senserit in. Ei doming menandri tincidunt sit, idque oratio hendrerit id nam?\n\nReque falli ne eam, similique efficiendi quo no. Sea id solet phaedrum, sit no partem facilis, impetus eligendi efficiantur et eum! Mea eius persequeris ea, an sed ullum eirmod, vis id etiam lucilius. Mel omnis ubique ad, ad vis labore quidam intellegat? Eu his ferri populo ridens, alienum commune usu et, no primis labores vix. Pro ex modus ubique vidisse?\n\nEt vim utamur postulant, vim tamquam probatus ex? Est sint atomorum an? Te sea malis mediocritatem, et ius consul officiis postulant. Modo oratio aliquando et eam.\n\nIudico tollit iriure his te. No eam graecis mediocritatem, pro ut putent accusata, tempor integre lobortis ne vel. At mei civibus blandit, adhuc consequuntur te eam, eu sed mazim perfecto efficiantur. Quando laboramus intellegebat ea sea, vel ea saepe impetus senserit? Dolor accusamus nec te, pri in sanctus vulputate comprehensam, ne clita ridens feugait mea!');
INSERT INTO `mind_subjects` VALUES(56, 'Circuit Design', 'science', 'electricity', 'hard', 'Ad viris hendrerit has, ei soluta quidam mel. Viris tibique in qui. Euismod blandit tincidunt ne eos, sed ea dico libris. Nam ei quando essent malorum, vide duis etiam id est! Vim impedit graecis eu, id sit illud ipsum reprehendunt.\n\nExpetenda accommodare ea nec, in eros perpetua senserit qui? An percipit vulputate cum, erat doming suscipiantur ea est, cum ne maiestatis mediocritatem. Mea democritum neglegentur ad, in erant euismod has, rebum tantas doming nam te. An quo movet indoctum, singulis cotidieque ut eam? Quas tantas quidam cum ne, an qui adhuc tamquam, eam ad vidit affert commune?\n\nHis ceteros noluisse splendide cu, mucius accusamus no eum, sit et probo summo quidam. Ut rebum copiosae voluptatum his! Duo soluta repudiandae ea, sea legimus phaedrum eu, mea nibh bonorum sapientem ne! Et tota velit facilis quo, tale habeo mollis ad cum. Id per insolens assentior, ipsum admodum delicata mel no.\n\nEt sea posse virtute ponderum, noster alienum delicata mea an, vidit similique cu mel! Usu id nostro facilisis. Omnes oportere ei mea, graece officiis definiebas eam ea, an fierent nominati his. Ius altera alienum senserit in. Ei doming menandri tincidunt sit, idque oratio hendrerit id nam?\n\nReque falli ne eam, similique efficiendi quo no. Sea id solet phaedrum, sit no partem facilis, impetus eligendi efficiantur et eum! Mea eius persequeris ea, an sed ullum eirmod, vis id etiam lucilius. Mel omnis ubique ad, ad vis labore quidam intellegat? Eu his ferri populo ridens, alienum commune usu et, no primis labores vix. Pro ex modus ubique vidisse?\n\nEt vim utamur postulant, vim tamquam probatus ex? Est sint atomorum an? Te sea malis mediocritatem, et ius consul officiis postulant. Modo oratio aliquando et eam.\n\nIudico tollit iriure his te. No eam graecis mediocritatem, pro ut putent accusata, tempor integre lobortis ne vel. At mei civibus blandit, adhuc consequuntur te eam, eu sed mazim perfecto efficiantur. Quando laboramus intellegebat ea sea, vel ea saepe impetus senserit? Dolor accusamus nec te, pri in sanctus vulputate comprehensam, ne clita ridens feugait mea!\n\nId sint epicurei concludaturque sit, an qui errem deserunt dissentiunt. Ut usu primis assentior. Est viris clita ex, ut odio menandri mea, te eum dicit facilisis theophrastus. An quo mundi appareat, vivendo civibus eligendi vis an. Ea vix oratio mollis, ad per lucilius maluisset mediocritatem? Errem molestie liberavisse ne sed, cu his habemus molestie.');
INSERT INTO `mind_subjects` VALUES(57, 'Common Grammar Mistakes', 'english', 'grammar', 'intermediate', 'Reque falli ne eam, similique efficiendi quo no. Sea id solet phaedrum, sit no partem facilis, impetus eligendi efficiantur et eum! Mea eius persequeris ea, an sed ullum eirmod, vis id etiam lucilius. Mel omnis ubique ad, ad vis labore quidam intellegat? Eu his ferri populo ridens, alienum commune usu et, no primis labores vix. Pro ex modus ubique vidisse?\n\nEt vim utamur postulant, vim tamquam probatus ex? Est sint atomorum an? Te sea malis mediocritatem, et ius consul officiis postulant. Modo oratio aliquando et eam.\n\nIudico tollit iriure his te. No eam graecis mediocritatem, pro ut putent accusata, tempor integre lobortis ne vel. At mei civibus blandit, adhuc consequuntur te eam, eu sed mazim perfecto efficiantur. Quando laboramus intellegebat ea sea, vel ea saepe impetus senserit? Dolor accusamus nec te, pri in sanctus vulputate comprehensam, ne clita ridens feugait mea!\n\nId sint epicurei concludaturque sit, an qui errem deserunt dissentiunt. Ut usu primis assentior. Est viris clita ex, ut odio menandri mea, te eum dicit facilisis theophrastus. An quo mundi appareat, vivendo civibus eligendi vis an. Ea vix oratio mollis, ad per lucilius maluisset mediocritatem? Errem molestie liberavisse ne sed, cu his habemus molestie.');

DROP TABLE IF EXISTS `self_beliefs`;
CREATE TABLE `self_beliefs` (
  `post_id` int(11) unsigned NOT NULL,
  `title` varchar(40) NOT NULL DEFAULT '',
  `category` varchar(20) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `self_beliefs` VALUES(19, 'The way of the Buddha', 'buddhism', 'Verti delicata vel? Erant labore dignissim est at, ius ex essent aperiam oporteat. Vitae tempor invenire est ut, id mea primis discere appareat? Perfecto dissentiet per et, vidit brute eu mei, mel fierent salutatus in.\n\nCum an choro placerat philosophia, ei agam paulo ocurreret vix! Est fuisset mandamus cu, cu pri perpetua adipiscing. Molestie voluptua duo ad, te assum recteque scribentur vix! Habeo nullam cu usu, pri ea civibus persequeris consectetuer, usu ei persecuti deseruisse.');
INSERT INTO `self_beliefs` VALUES(27, 'Modern Islam', 'islam', 'Audiam legimus in cum, populo pericula assueverit ne nam, nam habemus convenire vituperatoribus te. Eu malis graeco vituperatoribus mea, est ne splendide intellegebat, ei natum vitae vim. Eam no suas putant inciderint, qui an dicunt labores, dicta referrentur in vix. Ius ullum ubique essent cu. Te ius laoreet nominavi, in saperet accumsan omnesque eos, option latine cu duo. Sanctus postulant qualisque eos te, atqui pertinacia ex sit.\n\nAn quem justo viderer vix, dico ridens sed id, ea aperiam definitionem eos. Oratio scripta eloquentiam id duo, te altera quaeque sadipscing sea! Ex eam mazim intellegam quaerendum, reque imperdiet at mel? Dolores praesent et eam? Ne iusto scribentur eos.');
INSERT INTO `self_beliefs` VALUES(44, 'King David', 'judaism', 'Probo ubique cu cum. Audire iuvaret voluptatum ut his, pro illud audiam concludaturque ne.\n\nAudiam legimus in cum, populo pericula assueverit ne nam, nam habemus convenire vituperatoribus te. Eu malis graeco vituperatoribus mea, est ne splendide intellegebat, ei natum vitae vim. Eam no suas putant inciderint, qui an dicunt labores, dicta referrentur in vix. Ius ullum ubique essent cu. Te ius laoreet nominavi, in saperet accumsan omnesque eos, option latine cu duo. Sanctus postulant qualisque eos te, atqui pertinacia ex sit.');
INSERT INTO `self_beliefs` VALUES(46, 'Jesus & The Last Supper', 'christianity', 'Sanctus postulant qualisque eos te, atqui pertinacia ex sit.\n\nAn quem justo viderer vix, dico ridens sed id, ea aperiam definitionem eos. Oratio scripta eloquentiam id duo, te altera quaeque sadipscing sea! Ex eam mazim intellegam quaerendum, reque imperdiet at mel? Dolores praesent et eam? Ne iusto scribentur eos.');
INSERT INTO `self_beliefs` VALUES(58, 'Why I don''t believe in God', 'atheism', 'Option accusamus ei per! Ut vis veri iudico erroribus. Quo cu quot purto simul?\n\nSimilique sadipscing pro in, mei no primis lobortis, oratio consul incorrupte ad nec. Hinc facer aeterno eu duo. Ei mea justo choro nostrud, vitae quaeque corrumpit sea ad? Ei ius natum nobis iudicabit, mei alienum phaedrum expetenda te, mel tota veri debet cu. Te vix quodsi quaestio, sit placerat deseruisse te, nam error zril fastidii at? Te quot officiis pri, mea ea vivendo oporteat');

DROP TABLE IF EXISTS `self_quotes`;
CREATE TABLE `self_quotes` (
  `post_id` int(11) unsigned NOT NULL,
  `quote` varchar(240) NOT NULL DEFAULT '',
  `author` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `self_quotes` VALUES(21, 'Even if you’re on the right track, you’ll get run over if you just sit there.', 'Will Rogers');
INSERT INTO `self_quotes` VALUES(22, 'You can do anything, but not everything.', 'David Allen');
INSERT INTO `self_quotes` VALUES(23, 'Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away.', 'Antoine de Saint-Exupéry');
INSERT INTO `self_quotes` VALUES(24, 'The richest man is not he who has the most, but he who needs the least.', NULL);
INSERT INTO `self_quotes` VALUES(45, 'You miss 100 percent of the shots you never take.', 'Wayne Gretzky');
INSERT INTO `self_quotes` VALUES(59, 'People often say that motivation doesn’t last. Well, neither does bathing – that’s why we recommend it daily.', 'Zig Ziglar');

DROP TABLE IF EXISTS `self_timeline`;
CREATE TABLE `self_timeline` (
  `post_id` int(11) unsigned NOT NULL,
  `title` varchar(40) NOT NULL DEFAULT '',
  `category` varchar(20) NOT NULL DEFAULT '',
  `date` varchar(6) NOT NULL DEFAULT '',
  `time` varchar(6) DEFAULT NULL,
  `content` text NOT NULL,
  `address_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `address_id` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `self_timeline` VALUES(14, 'Reclaim Faith', 'reaffirm', '110901', NULL, 'Semper periculis imperdiet ne per. Menandri suavitate no cum, ea lorem movet dignissim nec, mutat senserit percipitur cu sit. Id sea ludus omnium labitur, ei his nonumes democritum, vim cu omnium quaestio scripserit. Vix ei commune dissentiunt ullamcorper. Iisque iuvaret eos te, sit habemus partiendo comprehensam in.\n\nEst scaevola pertinacia eloquentiam et? Et his noluisse molestiae persecuti, at dicant feugiat urbanitas eos. Vix assentior constituto scripserit ne. Et mei labores delectus menandri, ne platonem persecuti pri. Vel quem sint dissentiunt ad! Vim duis accusamus ne.', 8);
INSERT INTO `self_timeline` VALUES(18, 'First day of Church', 'change', '080430', '01:00p', 'Vel solum reprehendunt in, nam eu decore facilis indoctum. Omnes albucius per et? Eum ut ocurreret voluptaria! Purto maluisset ea vis, ex simul ancillae eum, graece iisque percipit ad nec!\n\nDuo cetero imperdiet in, admodum phaedrum dissentiunt pri ex. Ne vis soluta consulatu concludaturque. Id integre omittam offendit cum, no nisl tincidunt eos, oblique aliquam eligendi te eos. Agam probo atqui per eu, aeque ornatus constituto mea ad.', 5);
INSERT INTO `self_timeline` VALUES(38, 'Quit drinking alcohol', 'epiphany', '990312', NULL, 'Ne vis soluta consulatu concludaturque. Id integre omittam offendit cum, no nisl tincidunt eos, oblique aliquam eligendi te eos. Agam probo atqui per eu, aeque ornatus constituto mea ad.\n\nQui fugit propriae noluisse ne, qui vivendum rationibus id, te insolens necessitatibus mea. Est ad assum fuisset, est eruditi tibique insolens id? Diam illum signiferumque ea nam, per solum primis honestatis ut, ut diam copiosae mnesarchum eam? Nam ad sone', 6);
INSERT INTO `self_timeline` VALUES(60, 'Questioned God', 'doubt', '050715', '03:00a', 'Quando nonumes ex quo, expetenda abhorreant eu mei, ut maiorum phaedrum mea. Docendi forensibus nam at, id aeterno ullamcorper est, odio adhuc aliquando usu cu. No usu eros magna dolores, his sint ornatus gloriatur ad, vis verear laoreet singulis in. Habemus adipisci reprimique quo an, veri quidam causae at quo?\n\nNe aeque denique repudiare eos! Velit melius no nam. Ut usu facer vitae reprehendunt. Id modo sale rebum est. Sea in prima oratio assentior, per libris forensibus constituto no. Per id sint mollis signiferumque, ea modus sanctus qui?', 7);

DROP TABLE IF EXISTS `voice_bills`;
CREATE TABLE `voice_bills` (
  `post_id` int(11) unsigned NOT NULL,
  `debate_id` int(11) unsigned NOT NULL,
  `rep_id` int(11) unsigned NOT NULL,
  `content` text NOT NULL,
  `question` varchar(80) NOT NULL DEFAULT '',
  `deadline` datetime NOT NULL,
  PRIMARY KEY (`post_id`),
  KEY `debate_id` (`debate_id`),
  KEY `rep_id` (`rep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `voice_bills` VALUES(47, 1, 1, 'Sint rebum in mea, case facilis dissentiet eu nec! Invenire dissentiunt vim at. Vis error sonet no. Apeirian scriptorem ut duo? Unum augue in his, sed ut consulatu laboramus, omnesque probatus principes mei ut. No decore molestiae similique qui, ea vel bonorum fierent!\n\nQuot errem primis pro ut, congue definiebas eum ut, usu sumo audiam neglegentur ex? Usu te deleniti scaevola? Ius in ferri harum. Ubique indoctum hendrerit eam ne. Eu soluta putent vis.', 'Should we spend $1.2 Million on the High School?', '2013-02-15 01:00:00');
INSERT INTO `voice_bills` VALUES(61, 2, 1, 'Curabitur justo orci, rhoncus nec mauris ac, vulputate hendrerit orci. Nam interdum porttitor pulvinar. Aenean nisi tellus, euismod vel tempor ut, suscipit sit amet erat. In egestas luctus neque. Aliquam commodo dui nec tortor suscipit, nec dapibus lorem volutpat. Vestibulum convallis vestibulum enim, hendrerit fermentum ante lobortis ac. Vivamus nec elit ipsum. Cras non sollicitudin leo, non vehicula velit. Duis a bibendum eros, vitae vulputate sapien. ', 'Should we expand local police department for $160k?', '2013-05-12 04:00:00');
INSERT INTO `voice_bills` VALUES(63, 3, 2, 'Pellentesque enim urna, dapibus in vehicula interdum, placerat eu elit. Sed vitae tortor in sapien consectetur vulputate. Nulla in tincidunt ante. Suspendisse quis ante nec neque faucibus imperdiet. Etiam scelerisque non eros viverra semper. Proin laoreet tincidunt magna a porta. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Should we add stop lights to the Broad st intersection for $1.2k?', '2013-07-04 10:00:00');
INSERT INTO `voice_bills` VALUES(64, 5, 2, 'Duis adipiscing massa ut quam mollis fringilla. Duis sapien diam, mollis ac odio et, tincidunt fringilla metus. Nullam fringilla, dui ac commodo iaculis, erat nisl rutrum elit, et varius nunc est et leo. Fusce nec lobortis risus, blandit commodo justo. Suspendisse suscipit, dui ac tristique gravida, velit erat consectetur dolor, at dictum purus metus ut nisi.', 'Should looser restrictions be imposed on parking downtown?', '2013-09-23 12:00:00');

DROP TABLE IF EXISTS `voice_debates`;
CREATE TABLE `voice_debates` (
  `post_id` int(11) unsigned NOT NULL,
  `title` varchar(40) NOT NULL DEFAULT '',
  `scope` varchar(10) NOT NULL DEFAULT '',
  `category` varchar(20) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `zip` varchar(5) NOT NULL DEFAULT '',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `voice_debates` VALUES(1, 'Increase school budget: $1.2 Million', 'local', 'fiscal', 'No eam graecis mediocritatem, pro ut putent accusata, tempor integre lobortis ne vel. At mei civibus blandit, adhuc consequuntur te eam, eu sed mazim perfecto efficiantur. Quando laboramus intellegebat ea sea, vel ea saepe impetus senserit? Dolor accusamus nec te, pri in sanctus vulputate comprehensam, ne clita ridens feugait mea!', '03826');
INSERT INTO `voice_debates` VALUES(5, 'Federal Reserve Reform', 'national', 'regulation', 'Te sea malis mediocritatem, et ius consul officiis postulant. Modo oratio aliquando et eam.\n\nIudico tollit iriure his te. No eam graecis mediocritatem, pro ut putent accusata, tempor integre lobortis ne vel. At mei civibus blandit, adhuc consequuntur te eam, eu sed mazim perfecto efficiantur. Quando laboramus intellegebat ea sea, vel ea saepe impetus senserit? Dolor accusamus nec te, pri in sanctus vulputate comprehensam, ne clita ridens feugait mea!\n\nId sint epicurei concludaturque sit, an qui errem deserunt dissentiunt. Ut usu primis assentior. Est viris clita ex, ut odio menandri mea, te eum dicit facilisis theophrastus. An quo mundi appareat, vivendo civibus eligendi vis an. Ea vix oratio mollis, ad per lucilius maluisset mediocritatem? Errem molestie liberavisse ne sed, cu his habemus molestie.', '94041');
INSERT INTO `voice_debates` VALUES(11, 'Lower the tolls: I93', 'state', 'taxes', 'Errem molestie liberavisse ne sed, cu his habemus molestie.\n\nDolorum convenire explicari ei sit, mei at propriae forensibus dissentiet, phaedrum ocurreret constituto ad sea. Cum cu iuvaret eruditi percipitur, veritus noluisse abhorreant id per. Te vis autem vivendo, eu quo diceret ornatus? Exerci suscipit disputationi no eos! Vis volutpat pericula ex, ex mei dicam semper integre.', '03826');
INSERT INTO `voice_debates` VALUES(48, 'Remove median Rt 125: $120k', 'local', 'fiscal', 'Reque falli ne eam, similique efficiendi quo no. Sea id solet phaedrum, sit no partem facilis, impetus eligendi efficiantur et eum! Mea eius persequeris ea, an sed ullum eirmod, vis id etiam lucilius. Mel omnis ubique ad, ad vis labore quidam intellegat? Eu his ferri populo ridens, alienum commune usu et, no primis labores vix. Pro ex modus ubique vidisse?', '03865');
INSERT INTO `voice_debates` VALUES(65, 'Alternative to stricter gun laws', 'national', 'law', 'Duo soluta repudiandae ea, sea legimus phaedrum eu, mea nibh bonorum sapientem ne! Et tota velit facilis quo, tale habeo mollis ad cum. Id per insolens assentior, ipsum admodum delicata mel no.\n\nEt sea posse virtute ponderum, noster alienum delicata mea an, vidit similique cu mel! Usu id nostro facilisis. Omnes oportere ei mea, graece officiis definiebas eam ea, an fierent nominati his. Ius altera alienum senserit in. Ei doming menandri tincidunt sit, idque oratio hendrerit id nam?', '94041');

DROP TABLE IF EXISTS `voice_votes`;
CREATE TABLE `voice_votes` (
  `post_id` int(11) unsigned NOT NULL,
  `bill_id` int(11) unsigned NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `vote` varchar(1) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  PRIMARY KEY (`post_id`),
  KEY `bill_id` (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `voice_votes` VALUES(16, 1, '2013-10-16 14:19:24', 'y', 'Per error erant at, an modo ludus mea, vel quas ullum minim an? At est quod alii mundi. Indoctum dignissim ne mel. Cu altera repudiandae disputationi sed, no scripta pertinacia repudiandae eos, et solet graeco complectitur quo. Quo augue blandit apeirian ut, nam quem intellegam in?\n\nUt sumo tractatos vim! Per eu elit utinam aliquando, vel ei idque regione recteque. Ne propriae quaestio est! Cu vim purto consectetuer necessitatibus! Nominavi vituperata et nec.');
INSERT INTO `voice_votes` VALUES(62, 2, '2013-10-16 15:10:37', 'n', 'Quot errem primis pro ut, congue definiebas eum ut, usu sumo audiam neglegentur ex? Usu te deleniti scaevola? Ius in ferri harum. Ubique indoctum hendrerit eam ne. Eu soluta putent vis.\n\nVide dolor inciderint his eu, ei prompta nusquam senserit his. Per error erant at, an modo ludus mea, vel quas ullum minim an? At est quod alii mundi. Indoctum dignissim ne mel. Cu altera repudiandae disputationi sed, no scripta pertinacia repudiandae eos, et solet graeco complectitur quo. Quo augue blandit apeirian ut, nam quem intellegam in?\n\nUt sumo tractatos vim! Per eu elit utinam aliquando, vel ei idque regione recteque. Ne propriae quaestio est! Cu vim purto consectetuer necessitatibus! Nominavi vituperata et nec.\n\nDuis delicata definitionem et cum, pri te omnium fabulas tacimates, ex mea brute movet. Erat everti cetero per no, ex ferri dicam timeam per? Cu nobis splendide eos. Quo dicunt feugait senserit at, an quo elit pericula mnesarchum?');


ALTER TABLE `app_clout`
  ADD CONSTRAINT `app_clout_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `app_orgs` (`id`) ON DELETE CASCADE;

ALTER TABLE `app_comments`
  ADD CONSTRAINT `app_comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`) ON DELETE NO ACTION;

ALTER TABLE `app_follows`
  ADD CONSTRAINT `app_follows_ibfk_1` FOREIGN KEY (`target_id`) REFERENCES `app_users` (`id`) ON DELETE CASCADE;

ALTER TABLE `app_orgs`
  ADD CONSTRAINT `app_orgs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`) ON DELETE CASCADE;

ALTER TABLE `app_posts`
  ADD CONSTRAINT `app_posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`) ON DELETE CASCADE;

ALTER TABLE `app_reviews`
  ADD CONSTRAINT `app_reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`) ON DELETE CASCADE;

ALTER TABLE `app_thumbs`
  ADD CONSTRAINT `app_thumbs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`) ON DELETE CASCADE;

ALTER TABLE `app_tokens`
  ADD CONSTRAINT `app_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`) ON DELETE CASCADE;

ALTER TABLE `core_blogs`
  ADD CONSTRAINT `core_blogs_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`) ON DELETE CASCADE;

ALTER TABLE `core_events`
  ADD CONSTRAINT `core_events_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`) ON DELETE CASCADE;

ALTER TABLE `core_ideas`
  ADD CONSTRAINT `core_ideas_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`) ON DELETE CASCADE;

ALTER TABLE `core_links`
  ADD CONSTRAINT `core_links_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`) ON DELETE CASCADE;

ALTER TABLE `earth_calculator`
  ADD CONSTRAINT `earth_calculator_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`) ON DELETE CASCADE;

ALTER TABLE `earth_checklist`
  ADD CONSTRAINT `earth_checklist_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`) ON DELETE CASCADE;

ALTER TABLE `earth_matters`
  ADD CONSTRAINT `earth_matters_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`) ON DELETE CASCADE;

ALTER TABLE `mind_answers`
  ADD CONSTRAINT `mind_answers_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`) ON DELETE CASCADE;

ALTER TABLE `mind_questions`
  ADD CONSTRAINT `mind_questions_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`) ON DELETE CASCADE;

ALTER TABLE `mind_subjects`
  ADD CONSTRAINT `mind_subjects_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`) ON DELETE CASCADE;

ALTER TABLE `self_beliefs`
  ADD CONSTRAINT `self_beliefs_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`) ON DELETE CASCADE;

ALTER TABLE `self_quotes`
  ADD CONSTRAINT `self_quotes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`) ON DELETE CASCADE;

ALTER TABLE `self_timeline`
  ADD CONSTRAINT `self_timeline_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`) ON DELETE CASCADE;

ALTER TABLE `voice_bills`
  ADD CONSTRAINT `voice_bills_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`) ON DELETE CASCADE;

ALTER TABLE `voice_debates`
  ADD CONSTRAINT `voice_debates_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`) ON DELETE CASCADE;

ALTER TABLE `voice_votes`
  ADD CONSTRAINT `voice_votes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`) ON DELETE CASCADE;
