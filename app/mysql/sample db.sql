-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 13, 2013 at 08:08 PM
-- Server version: 5.5.9
-- PHP Version: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `phourus:dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_comments`
--

CREATE TABLE `app_comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `app_comments`
--


-- --------------------------------------------------------

--
-- Table structure for table `app_follows`
--

CREATE TABLE `app_follows` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(20) NOT NULL DEFAULT '',
  `follows` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `app_follows`
--

INSERT INTO `app_follows` VALUES(1, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `app_media`
--

CREATE TABLE `app_media` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `app_media`
--


-- --------------------------------------------------------

--
-- Table structure for table `app_pages`
--

CREATE TABLE `app_pages` (
  `path` varchar(255) NOT NULL,
  `template` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `excerpt` text NOT NULL,
  KEY `path` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_pages`
--

INSERT INTO `app_pages` VALUES('/earth', 'default', 'Earth', '<h1>Phourus Earth</h1>\r\n<img src="/assets/elements/white/earth.png" />\r\n<p class="summary">Phourus Earth is the element that addresses the Environment and individual responsibility when it comes to the world around us.</p>\r\n<br clear="all" />\r\n\r\n<h2 id="large-earth-calculator"><a href="/earth/calculator">Calculator</a></h2>\r\n<p>The <a href="/earth/calculator">Calculator</a> is what is called a Carbon Calculator. A Carbon Calculator is used to estimate how much Carbon Dioxide an individual creates in the course of a year. This calculation is based on the electricity you use, the car you drive and the flights you take, and gives you approximate CO2 output each year, expressed in tons.</p>\r\n\r\n<p>What is different about the Phourus Earth Calculator is that you can save your results, compare them with other members, and even compare them to the Phourus average. In addition, we can even show you how you can offset your CO2 to become ''Carbon Neutral'', meaning the amount you generate is completely offset by purchasing Carbon Credits.</p>\r\n\r\n<h3>Coming Soon! Alternative Energy Calculator for estimating solar and wind costs and savings.</h3>\r\n\r\n<h2 id="large-earth-checklist"><a href="/earth/checklist">The Checklist</a></h2>\r\n<p>The Checklist is a simple yet powerful tool to reduce your negative impact on the Environment. It is simply a checklist of ways to reduce, reuse and recycle. After signing up, you can scroll through the list, check off any list items that you feel you meet the requirements for, and save your results. When you scroll through again, you can look at whichever boxes are unchecked, and choose some to work on. Over time your Checklist will become more and more complete.</p>\r\n\r\n<p>We work on the honor system, so be honest with yourself and honest with Phourus, because we can use your results to create statistics for the entire Phourus Community. You can easily click the ''Phourus Community'' tab to see the percentage of people who have each item checked off, which will give everyone a better idea of what others are doing.</p>\r\n\r\n<h2 id="large-earth-companies"><a href="/earth/companies">Companies</a></h2>\r\n<p>Businesses and large organizations are the key to moving us forward with sustainable living, as they have the most resources available to promote and encourage these lifestyles. That is why Phourus has given Companies a chance to share their products, services and vision with a community that is passionate about the Environment.</p>\r\n\r\n<p>Qualified organizations can <a href="/contact">register</a> and get listed in the Phourus Earth Companies section. Phourus Earth members can browse that page to find whatever products or services they are looking for, read up about the Company, and even in some cases buy products directly on Phourus. Members find great Companies, Companies find great customers, and <a href="/earth/companies">Companies</a> help support Phourus, it''s just that simple.</p>\r\n<h3><a href="/contact">Click here if you would like to get listed on Phourus Earth Companies</a></h3>', '');
INSERT INTO `app_pages` VALUES('/core', 'default', 'Core', '<h1>Phourus Core</h1>\r\n<img src="/assets/logos/phourus.png" />\r\n<p class="summary">Phourus Core is the basic profile for members of Phourus. Though the Core is not as unique as some of the features found on the ''Elements'' of Phourus (Earth/Mind/Voice/Faith), it does offer a great platform for sharing Links, Blogs, and Ideas in regards to important matters such as politics, environment, religion and the mind.</p>\r\n<br clear="all" />\r\n\r\n<h2 id="large-core-blogs"><a href="/core/blogs">Blogs</a></h2>\r\n<p>Blogs are the most basic post on Phourus. Designed to be a general means of expression, <a href="/core/blogs">Blogs</a> can be used to write articles about virtually any topic, as long as they are relevant to the 4 Elements, meaning they should somewhat relate to the Environment, Education, Politics or Religion in one way or another.</p>\r\n\r\n<p>There are a few other posts on Phourus that are similar to Blogs. Phourus Core <a href="/core/ideas">Ideas</a> follow a similar format, but are specifically for problem-solving ideas. Phourus Mind <a href="/mind/subjects">Subjects</a> are for educating others on a variety of topics, while Phourus Voice <a href="/voice/debates">Debates</a> are for initiating political discussions. Finally, Phourus Faith <a href="/faith/beliefs">Beliefs</a> are for sharing personal beliefs and philosophies. Members should use Blogs whenever there is a need for expression that does not belong in any of those specialized sections.</p>\r\n\r\n<h2 id="large-core-ideas"><a href="/core/ideas">Ideas</a></h2>\r\n<p>Ideas are structured very similarly to Blogs, except should be used to share <a href="/core/ideas">Ideas</a> for solving simple or complex problems that individuals, organizations or even the world faces. Be as detailed or as vague as needed, but the objective of this section is to give great Ideas the exposure they deserve.</p> \r\n\r\n<p>In order to give the best Ideas the most visibility, an algorithm called ''Influence'' has been developed to rank posts on Phourus. Influence is vital because it simplifies the process of finding the best posts, and filtering out the weakest. In addition, the total amount of comments, views, ideas, blogs, etc. can be used to determine a member’s total Influence as well, which gives each and every member incentive to create the best content so as to rise to the top of Phourus, which could mean tremendous networking opportunities and possibilities.</p>\r\n\r\n<h2 id="large-core-links"><a href="/core/links">Links</a></h2>\r\n<p>The Links section of Phourus Core is nothing new. Much likes sites <a href="http://www.digg.com" target="_blank">Digg</a> and <a href="http://www.delicious.com" target="_blank">Delicious</a>, <a href="/core/links">Links</a> is about finding the best resources on the Internet and bookmarking them on a social community for others to see.</p>\r\n\r\n<p>Whenever a Link, Blog or Idea is created, it is assigned an ''Element'', which could be either ''Earth'', ''Mind'', ''Voice'' or ''Faith'', the 4 Elements of Phourus. If it is categorized as ''Earth'', it should relate to the Environment somehow, such as information about alternative energy or pollution issues. If it involves education in some way, or psychology and the mind, it should be marked as ''Mind''. Anything political belongs under ''Voice'', and anything religious, spiritual of philosophical belongs under ''Faith''. Each Element is assigned a color; Earth is green, Mind is blue, Voice is red, and Faith is orange. These colors are used throughout Phourus to visually categorize posts according to their Element.</p>', '');
INSERT INTO `app_pages` VALUES('/', 'home', 'Home', '', '');
INSERT INTO `app_pages` VALUES('/mind', 'default', 'Mind', '<h1>Phourus Mind</h1>\r\n<img src="/assets/elements/white/mind.png" />\r\n<p class="summary">Education is a vital part of our lives, and Phourus Mind is about exploring new ways of educating the world. The best way to describe Phourus Mind is ''Social Education''. Typically, people are educated in a classroom environment; there is a teacher, and there are students. On Phourus Mind however, the teachers are the students, and the students are the teachers. It is about educating each other.</p>\r\n<br clear="all" />\r\n\r\n<h2 id="large-mind-subjects"><a href="/mind/subjects">Subjects</a></h2>\r\n<p>The <a href="/mind">Subjects</a> section is a place to learn and a place to teach. This section is broken up into the main subjects taught in school such as Math, History and English. Members can create articles on any of these subjects and they will become available for anyone to read. Professors, experts and students alike can create educational articles on anything within that subject, as broad or as specialized as they choose.</p>\r\n\r\n<p>Based on the Influence rank, the best educational materials will get the most visibility. This way, learners don''t have to spend time on articles that may not be good at explaining the subject, or that may actually confuse them. In addition, those creating the best articles will get tremendous visibility which could help them seriously expand their network, while also getting the satisfaction of helping others learn.</p>\r\n\r\n<h2 id="large-mind-scores"><a href="/mind/scores">Scores</a></h2>\r\n<p>Learning is one thing, putting knowledge to the test is another. Subjects is about learning, <a href="/mind/scores">Scores</a> is about seeing exactly how much you know. With Scores, members can create multiple-choice questions on a specific subject, and assign a difficulty to the question. Members can then select a Scores subject and user-generated questions will be selected at random for the member to answer.</p>\r\n\r\n<p>When answering questions, the member can skip the question, and therefore won''t get any points. If they answer correctly they will get 1, 2 or 3 points depending on the difficulty. If they answer incorrectly, they lose 1, 2 or 3 points depending on the difficulty (getting an easy question wrong would cost 3 points, whereas a hard question will only cost 1 point). If the member thinks the question is too difficult or too easy based on what the creator of the question considered it, the member can report the question with an explanation why he/she thinks it is too hard or easy. The more questions answered correctly, the more points the member will have in the subject, which will improve his/her overall Influence rank.</p>\r\n\r\n<h2 id="large-mind-courses"><a href="/mind/courses">Courses</a></h2>\r\n<p>No different than Phourus Earth <a href="/earth/companies">Companies</a> and Phourus Voice <a href="/voice/representatives">Representatives</a>, Phourus Mind Courses is a directory for innovative, cutting-edge, or non-traditional educational opportunities. Whether a certification program, a training program, an online education system or experimental system, <a href="/mind/courses">Courses</a> is a great place to find programs outside the traditional degree programs.</p>\r\n\r\n<p>Educational institutions who wish to promote their Course have a variety of options and features to promote their offering. Phourus works with these organizations to communicate the opportunity and engage members. The goal is to give unconventional educators a place to reach intelligent, hard-working individuals passionate about learning.</p>\r\n<h3><a href="/contact">Click here if you would like to learn more about offering a Phourus Mind Course</a></h3>', '');
INSERT INTO `app_pages` VALUES('/voice', 'default', 'Voice', '<h1>Phourus Voice</h1>\r\n<img src="/assets/elements/white/voice.png" />\r\n<p class="summary">The Internet has emerged as one of the most powerful tools humankind has ever conceived, and it''s reach and influence is still expanding. Phourus Voice is about taking the fundamentals of social media and pairing it with politics to increase transparency in Government and give citizens a chance to interact directly with those representing them.</p>\r\n<br clear="all" />\r\n\r\n<h2 id="large-voice-debates"><a href="/voice/debates">Debates</a></h2>\r\n<p>''Scope'' is an important concept to understand in order to use Phourus Voice correctly. There are 3 different Scopes on Phourus Voice: 1. Local, 2. State, and  3. National. The ''Local'' Scope is used for a specific town or state, and would involve matters such as building a new school, repairing certain roads, or cutting spending. The ''State'' Scope, would apply to a statewide matter rather than just a particular town/city, and the ''National'' Scope would apply to the entire Nation.</p>\r\n\r\n<p>Debates can be created in any one of the 3 Scopes. <a href="/voice/debates">Debates</a> are automatically filtered by Zip Code, so you will only have the ability to participate in Debates in your city, state and country. This way, for example, members not living in your city cannot influence decisions in your city because the matters do not concern them.</p>\r\n\r\n<h2 id="large-voice-votes"><a href="/voice/votes">Votes</a></h2>\r\n<p>Debates can be ''elevated'' into a formal Vote by Representatives (explained next). <a href="/voice/votes">Votes</a> can only be created from Debates, and can only by done so by Representatives. A Representative can browse all of the Debates in his/her jurisdiction, and select the most important ones to be officially elevated into a Vote. Once a Debate becomes a Vote, members living within that jurisdiction can review the Vote, read the commentary of the Representative sponsoring the Vote, and choose a simple Yes/No.</p>\r\n\r\n<p>The Debates &amp; Votes system is a great way to collaborate on important political matters regardless of how many people it affects. Whether a small town of 3,000 or a nation of 300 million, Phourus Voice can help Representatives better understand citizens and vice versa.</p>\r\n\r\n<h2 id="large-voice-representatives"><a href="/voice/representatives">Representatives</a></h2>\r\n<p>Representatives are a special kind of member on Phourus Voice. They start by creating a standard Phourus profile, like any other member, but can then apply for Representative status. At that point they will need to prove that they are either currently in office, or will be running in the near future. Once they are approved, their profile is upgraded to a Representative account, which will enable them to elevate Debates into Votes.</p>\r\n\r\n<p>In addition to the ability to elevate Debates, Representatives can also get listed in the <a href="/voice/representatives">Representatives</a> section. Much like <a href="/earth/companies">Phourus Earth Companies</a>, this is a directory specifically for those representing citizens. They can even upgrade their free Representative account to promote their message even better through add-ons such as video, contact forms and additional pages.</p>\r\n<h3><a href="/contact">Click here if you would like to become a Phourus Voice Representative.</a></h3>', '');
INSERT INTO `app_pages` VALUES('/faith', 'default', 'Faith', '<h1>Phourus Faith</h1>\r\n<img src="/assets/elements/white/faith.png" />\r\n<p class="summary">Religion, spirituality, faith and philosophy are topics that generate powerful emotions and passion, and sometimes controversy as well. Regardless, it''s Influence on our lives is hardly debatable, and Phourus Faith acknowledges that and therefore has given people passionate about these subjects a place to express themselves and share with others their thoughts and beliefs.</p>\r\n<br clear="all" />\r\n\r\n<h2 id="large-faith-ranks"><a href="/faith/ranks">Ranks</a></h2>\r\n<p>The opinions of people can vary greatly according to culture, religion, upbringing and personality. <a href="/faith/ranks">Ranks</a> is an easy way to get a snapshot of a person''s viewpoints and how they view the world. Each member can create up to 4 different Rank topics, such as ''Belief in a Higher Power'', and select a number from 1 to 10 to describe how strongly they agree or disagree with the statement.</p>\r\n\r\n<p>Although each member can only create 4 different Rank topics, they can use an unlimited amount of Rank topics created by the Phourus Faith community, and assign their Rank to each of them. This is not only useful for the individual, but is useful to see how the Phourus Faith Community views a topic as a whole.</p>\r\n\r\n<h2 id="large-faith-beliefs"><a href="/faith/beliefs">Beliefs</a></h2>\r\n<p>Ranks are short statements, whereas <a href="/faith/beliefs">Beliefs</a> are a fully-featured opinion. Much like a blog, a Belief is a way to express, in as many words as necessary, how you feel about a certain subject, however light or deep. If you are an atheist, tell the community why. If you are a Christian, tell the community why. If you are pro-life, tell the community why. If you think the world is run by extra-terrestrials, tell the community why.</p>\r\n\r\n<p>Beliefs are supposed to be an outlet for deep-rooted thoughts that have a hard time finding their way into casual conversation. Discussing religion openly can be sometimes considered taboo, so as a result Phourus has created a dedicated place to do just that.</p>\r\n\r\n<h2 id="large-faith-timeline"><a href="/faith/timeline">Timeline</a></h2>\r\n<p>For a lot of people, beliefs are constantly changing and evolving. Personal experiences, increased global awareness and expanding knowledge can play a role in shaping one''s outlook on life, and the Phourus Faith <a href="/faith/timeline">Timeline</a> is used to track that evolution. For some people, there may be significant life experiences that has lead them to their current belief system. With Timeline, they can share these experiences with others, and see how these experiences made them who they are today.</p>\r\n\r\n<p>Like any post on Phourus, privacy settings can be used to change the visibility of a post. Some Beliefs and Timeline Events can be very personal, and Phourus respects each individual''s right to keep that information as private as they would like. They can choose to keep it strictly to themselves until they are ready to share. Once ready to share, a post can be set to ''Friends'' only, which will be made available only to Facebook/LinkedIn friends/connections, or Community Only, so only registered Phourus members can view the post, or Public, which will be available for all to see.</p>', '');
INSERT INTO `app_pages` VALUES('/core/blogs', 'stream', 'Blogs', '', 'Phourus&trade; Blogs are for writing general articles about the environment, education, government, religion and any other related subjects.');
INSERT INTO `app_pages` VALUES('/core/ideas', 'stream', 'Ideas', '', 'Phourus&trade; is about getting valuable Ideas the attention they deserve. Phourus&trade; Influence rank ensures that the best Ideas get in front of the right people with the most visibility.');
INSERT INTO `app_pages` VALUES('/core/links', 'stream', 'Links', '', 'The ''Links'' section of Phourus&trade; Core is setup similar to bookmarking sites such as <a href="http://www.digg.com" target="_blank">Digg</a> or <a href="http://www.delicious.com" target="_blank">Delicious</a>, only with a focus on the 4 elements of Phourus. Other Phourus&trade; members can add comments and share the Links other member''s post as well.');
INSERT INTO `app_pages` VALUES('/earth/calculator', 'stream', 'Calculator', '', 'A Carbon Calculator is used to calculate the approximate amount of carbon dioxide a person, business or organization generates over the course of a year. With the Phourus&trade; Earth Calculator you can save your results and improve them over time, which will also improve your overall Influence&trade; rank.');
INSERT INTO `app_pages` VALUES('/earth/checklist', 'stream', 'Checklist', '', 'The Checklist is a simple list of ways to minimize your personal impact on the Environment. If you feel you meet the requirements of the list item, simply check it off. If not, perhaps it should be the next item to focus on.');
INSERT INTO `app_pages` VALUES('/earth/companies', 'stream', 'Companies', '', 'Phourus&trade; gives Companies that have a meaningful, positive impact on the Environment a chance to showcase their products, personnel or services to the Phourus&trade; Earth Community. ');
INSERT INTO `app_pages` VALUES('/mind/subjects', 'stream', 'Subjects', '', 'Subjects is what Phourus&trade; likes to call ''social education''. Professors and experts can share their knowledge on a variety of different topics and educate the Phourus&trade; Mind community. In return, it improves their overall Influence&trade; rank and opens up great networking opportunities.');
INSERT INTO `app_pages` VALUES('/mind/scores', 'stream', 'Scores', '', 'Scores is about putting the knowledge gained from Subjects to the test. Community members can create quiz questions in any of the topics found on Subjects. The questions get selected at random when the Phourus Mind&trade; Community tests themselves to improve their Influence&trade; rank.');
INSERT INTO `app_pages` VALUES('/mind/courses', 'stream', 'Courses', '', 'Courses is a place for unique educational opportunities, particularly certifications, training or other non-traditional educational avenues. Any organization pushing the envelope of education belongs on Phourus&trade; Mind Courses.');
INSERT INTO `app_pages` VALUES('/voice/debates', 'stream', 'Debates', '', 'The Phourus&trade; Voice Community is a place to discuss fiscal and political policies for local, state and federal issues. Users can contribute in all Federal-level discussions, and the user''s zip code auto-filters Debates according to local and state issues.');
INSERT INTO `app_pages` VALUES('/voice/votes', 'stream', 'Votes', '', 'Representatives can elevate Debates into official Votes, which give much more credibility to the discussion. When this happens, members can vote yes or no for the topic, and the outcome can be very insightful to both the community and the Representative.');
INSERT INTO `app_pages` VALUES('/voice/representatives', 'stream', 'Representatives', '', 'Representatives are actual politicians, verified by Phourus&trade;, that endorse and support the Phourus Voice&trade; Community, and wish to increase transparency between citizens and representatives via social media.');
INSERT INTO `app_pages` VALUES('/faith/ranks', 'stream', 'Ranks', '', 'Using Phourus&trade; Faith Ranks will help you find others of like-mind by matching you based on how you view certain religious/spiritual concepts. ');
INSERT INTO `app_pages` VALUES('/faith/beliefs', 'stream', 'Beliefs', '', 'Beliefs is a place to share one''s personal, religious, spiritual or philosophical thoughts and feelings, however conservative or extreme they may be. As long as posts follow the rules of conduct outlined in the <a href="/terms">Terms & Conditions</a>, members are free to say what they believe. ');
INSERT INTO `app_pages` VALUES('/faith/timeline', 'stream', 'Timeline', '', 'A Timeline is a good way to express the significant milestones in one''s personal journey, and whether public or private, they can be a great way to remind you exactly where you came from.');
INSERT INTO `app_pages` VALUES('/terms', 'default', 'Terms &amp; Conditions', '<div style="padding: 20px;">\r\n<h1>Phourus Terms &amp; Conditions</h1>\r\n<strong><em>Last Modified: 6/20/09</em></strong>\r\n\r\nPhourus, (‘Community’ or ‘We’), is a social community website and division of Donovan & Drelick Enterprises, based out of Derry, NH in the United States of America. \r\n\r\n<strong><em>1. Legal Binding</em></strong>\r\nThis Terms and Conditions Agreement is a legal binding agreement between the ‘User’ (A member or visitor of Community), and Community. By using any of the services or features and/or creating a profile on Community you are bound to the terms outlined in this document, and agree to abide by any applicable laws and the terms of this agreement. If you do not agree and/or refuse to follow these terms you should discontinue use of our service and/or terminate your account. When creating a profile, you are automatically required to express your acceptance of these terms, and thus are bound to these terms once your profile has been created. This agreement supersedes any previous versions, and this current document overrides any previous policies.\r\n\r\n<strong><em>2. Modifications</em></strong>\r\nThe date at the top of this document states the date of the latest revision to this agreement. Community maintains the right to change, modify, revise or remove any part of this document at any time. Changes to this agreement will be communicated in at least one of several ways including 1.) Changing the date of modification on this Terms and Conditions Agreement, 2.) Email to members who have not opted-out of our News/Updates Mailing list (New members are automatically enrolled, and if they wish not to receive mailing they must opt-out), or 3.) Post notification of change on home page of Community, in a highly visible section of that page.\r\n\r\n<strong><em>3. Definitions</em></strong>\r\n<ol>\r\n<li>By Phourus, we are referring to the Website Community as well as any branded features and services offered through the brand name/website url Phourus.com , a division of Donovan & Drelick Enterprises.</li>\r\n<li>By ‘Community’ or ‘We’, we are referring to Phourus and/or any affiliates or sister/child companies.</li>\r\n<li>By ‘Visitor’, we are referring to a public, un-registered user of Community. This could simply be a person previewing the Site before creating or profile. By ‘Member’ we are referring to a registered user of our services. By  ‘User’ we are referring to both ‘Visitors’ and ‘Members’ of Community.</li>\r\n<li>By ‘Content’ we are referring to any material posted by a User through their own profile or in response to Content posted by other Users. Content can be considered text in the form of blogs, comments, description, captions etc., video and audio files created and uploaded to Community, and all Images uploaded to Community.</li>\r\n<li>By ‘Post’ we are referring to the action of making Content readily available to public visitors and or private members.</li>\r\n<li>By ‘Use’ we mean use, copy, publicly perform or display, distribute, modify, translate, and create derivative works of.</li>\r\n</ol>\r\n\r\n<strong><em>4. Registration</em></strong>\r\n<ol>\r\n<li><strong>Eligibility-</strong> In order to legally register for Community, you 1.) Must be at least 13 years old, 2.) Must NOT be a convicted sex offender, 3.) Must agree to maintain accurate personal information, 4.) Abide by all applicable laws and 5.) Agree to ALL Terms of this Agreement. Failure to conform to these requirements could result in the termination of your Account by Community with or without prior notice or warning. You agree that all information Posted on Community is truthful and accurate. You also agree not to transfer ownership of your account to any person or group without our written expressed permission. In the case of creating a profile on behalf of another individual or group, you agree you have written, expressed permission to represent the profile you are creating</li>\r\n<li><strong>Term-</strong> This Terms and Conditions Agreement shall remain in full force for the duration of your use of Community, and the duration of your profile’s active status. You are bound to these terms until you 1.) Discontinue use of Community AND 2.) Terminate your profile, though you may still be bound to certain terms of this agreement even after termination. Community also reserves the right to terminate or suspend Member’s accounts and/or prohibit certain Visitors with any or no reason, notice or explanation.</li>\r\n<li><strong>Fees-</strong> Community is currently a free service. However, Community reserves the right to charge members for use in the future, at which point Members and or Users may choose 1.) To terminate account and choose to no longer use services or, 2.) Continue use for fee structure defined by Community. Community is not responsible for any damages to any User or 3rd Party who is affected by Fee Structure change. If User has breached any part of Agreement and his/her account has consequently been terminated, Community is not liable for refunds for any fees incurred during use of Community.</li>\r\n<li><strong>Password-</strong> After registration, Members will receive a confirmation email containing a randomly-generated password, which will be required to access Member’s account. This password can be changed at any time within the Member’s Profile Editor. Members agree, however, never to share Password information with any other Users or Individuals/Organizations outside of Community. If you suspect unauthorized  use of your account, please notify Community immediately. You also agree not use the Account, Username or Password of any other Member,  and acknowledge that your are the sole party responsible for the confidentiality of your Password, and Community is not liable for any damages incurred by exposure of your Password.</li>\r\n<li><strong>Safety-</strong> Community is dedicated to creating a safe environment for all Members and Visitors of Community, as well as 3rd parties, affiliates and advertisers. By registering and agreeing to these Terms And Conditions, you agree you will not create or solicit spam, use bots, robots or programs to collect user information, nor upload/initiate viruses or other malicious software/code. You also agree never to access other Member’s accounts without their expressed written permission.</li>\r\n<li><strong>Privacy Policy-</strong> To protect your privacy, we have created a Privacy Policy that we are bound to when you create your Profile or use our website. A link to this policy is provided at the footer of each page of our Community under the link title ‘Privacy Policy’.</li>\r\n</ol>\r\n\r\n<strong><em>7. Prohibitive Activity</em></strong>\r\nCommunity does not permit the following activity/behaviors on Community. Violation of these rules could result in the suspension or termination of your account with or without prior notice, and we will pursue the appropriate legal actions due to violation of applicable laws to the full extent of the law. \r\n\r\n<ol>\r\n<li>You will not harass, intimidate or bully other members or groups, nor defame or discriminate other members or groups. You will not post hateful, bigoted, racist, sexist material, nor post anything pornographic or violent in nature.</li>\r\n<li>You also shall not post anything inappropriate for persons under the age of 13, nor solicit personal information of persons under the age of 18.</li>\r\n<li>You will not encourage the violation of these Terms and Conditions.</li>\r\n<li>You will not commit or permit any illegal activity through your Profile or Community.</li>\r\n<li>You will not exploit anyone in a sexual or violent manner.</li>\r\n<li>You will not link to adult websites.</li>\r\n<li>You will not publicly post any information that threatens the privacy or security of another individual or group, nor post financially sensitive or identification information.</li>\r\n<li>You will not post false or misleading information.</li>\r\n<li>You will not promote illegal activity or conduct that is abusive, threatening, obscene, or libelous.</li>\r\n<li>Violate our Copyright Policy (see section 8 ‘Copyright Policy’)</li>\r\n<li>You will not transmit Spam, Junk Mail, Chain Letters or unsolicited mass mailings.</li>\r\n<li>You will not promote any torturous  criminal activity or provide information about illegal activities such buying or making illegal weapons, creating computer viruses, computer hacking or violating someone’s privacy.</li>\r\n<li>You will not add photos or videos of other people without their consent.</li>\r\n<li>You will not post or link to or promote child pornography.</li>\r\n<li>You will not commit fraud, or stalk other members.</li>\r\n<li>You will not use Community to gamble, deal drugs or distribute viruses or malicious software programs.</li>\r\n<li>You will not attempt of aide another in the process of hack and/or altering and/or gain unauthorized access of Community.</li>\r\n<li>You will not impersonate another user, group nor impersonate Community.</li>\r\n<li>You are solely responsible for member disputes, though Community has the right to but is not obligated to interfere.</li>\r\n<li>You will not violate the Commercial Policy restrictions as outlined in section 9, ‘Commercial Policy’.</li>\r\n</ol>\r\n	\r\nCommunity relies heavily on the participation and cooperation of it’s Members to report any activity in violation of the terms. There are several ways to report violations throughout Community including but not limited to 1.) Using contact form on page to submit violation information, and 2.) The use of ‘Report This’ buttons throughout profiles. Community will research all reported material and take the necessary action to rectify the violation.\r\n\r\n<strong><em>8. Copyright Policy</em></strong>\r\n\r\nCommunity is committed to the protection of intellectual property. As a large directory of Content including but not limited to Images/Photographs, Music, Videos and Text, it is impractical for Community to review and govern all Content uploaded and/or created by Users. Consequently, is up to Users to report material they believe may be in violation of Copyright laws. In order to offer multimedia such as music and video, Community must be sure that Content Posted by User is the rightful property of User, or is legally licensed by User. The following rules apply to all Content Posted by all Users.\r\n\r\n<ol>\r\n<li>By Posting Content on your Profile, you agree that you are the rightful copyright owner of the Content Posted, which includes Images, Videos and Audio.</li>\r\n<li>If you are a musician, you will post only the Music that you rightfully own to your profile. Any publishing rights for ''Cover'' songs should be obtained before Posting these recordings to your Profile.</li>\r\n<li>If you are an artist/photographer, you will only post material you have rights to Post, which includes original works, licensed works, or contracted work where permission has been granted by employer.</li>\r\n<li> If you are a producer/director of video content, you will only post videos that you have rights to Post, and fulfill any contractual obligations in displaying credits for work done for video.</li>\r\n<li>If you are a basic User, who does not create Videos, Art or Music of your own, you may not upload any of these works unless you have the expressed written permission of the rightful copyright owner.</li>\r\n<li>If you Post Images of other people or containing other people, you must have their consent before Posting.</li>\r\n<li>You will not plagiarize or duplicate written articles and claim as your own.</li>\r\n</ol> \r\n	\r\nIf you believe your copyrighted Content is being misrepresented, used illegally, being infringed upon innocently, maliciously or unknowingly, or your writing is being plagiarized, please notify us immediately. Most of the time Users will not realize they are infringing upon a copyright, aka ''Innocent'' infringement. In this case we shall notify the User and remove the content. If the problem persists, we shall suspend or terminate the User''s account. Community is in no way held responsible for Copyright Infringement of Copyrighted works, but works hard to minimize infringement. Should a rightful copyright owner wish to pursue legal action against a particular User, Community will work with Prosecuting party to identify the offending individual. However, Community is not in any way responsible for infringement of Users and will not be liable for any damages incurred by infringement cases.\r\n  \r\n<strong><em>9. Commercial Policy</em></strong>\r\n\r\nCommunity has a dedicated ''Professional'' Sphere, created primarily for business, professionals and commercial or non-profit organizations. By creating a Professional profile, you are bound to the following terms.\r\n\r\n<ol>\r\n<li>As a business/organization or professional, you must create a Professional profile, and cannot create a Social or Personal profile approaching Users as such to deceive them.</li>\r\n<li>You may link to your Website as long as it meets the requirements outlined in section 7 ''Prohibitive Activity''.</li>\r\n<li>You may Post advertisements and commercial notices on your Profile, but not on others without their expressed permission.</li>\r\n<li>You may not send ''Mass Mailings'', or bulk messages to Users for any reason.</li>\r\n<li>You must have permission to create profile on behalf of your company/organization.</li>\r\n</ol>\r\n	\r\nThe Creative and Professional Spheres both offer an E-Commerce Solution for it''s Users. In order to use this Store you must obey the following rules.\r\n\r\n<ol>\r\n<li>You must supply accurate company information including customer support and contact information.</li>\r\n<li>In the event of e-commerce disputes, Community has the right but is not obligated to interfere. Repeated disputes will reduce your credibility and Community has the right to add a notification on your Profile warning Users of your past dispute history, which could hurt your reputation and affect sales negatively.</li>\r\n<li>To ensure your good name, make sure you are easily reachable by customers to resolve issues, and you ship products promptly and on time.</li> \r\n<li>Community is not in any way liable for losses incurred by any disputes, or negative product reviews.</li>\r\n<li>You will be provided a platform for maintaining product information.</li>\r\n</ol>\r\n\r\nIf you are a consumer who plans on making purchases on Community, you must be aware of the following policies.\r\n<ol>\r\n<li>All purchases are as is unless negotiated otherwise between supplier and customer.</li>\r\n<li>Make purchases only from Members you trust. Community is not responsible for unfulfilled orders or misrepresented products or false advertising.</li>\r\n<li>You may report issues with vendors using the Contact Form on the Contact Page. We will review the dispute and if enough Disputes from a particular company are collected we shall take action to notify consumers of their inconsistent order fulfillment history.</li>\r\n</ol>\r\n\r\n<strong><em>10. Other</em></strong>\r\n\r\n<ol>\r\n<li>You will not use any Community Intellectual property including but not limited to Trademarks, Copyrights and Patents, without expressed written permission.</li>\r\n<li>In no event, Community will not be held Liable for any damages including lost profits, even if Community has been advised of possibility of such damages. Any liabilities paid will not exceed the total paid to Community for services.</li>\r\n<li>This agreement shall be governed by the law and practices of the State of New Hampshire. Community and Users agree to resolve any legal disputes in the State of New Hampshire.</li>\r\n<li>You agree to indemnify Community and affiliates and persons part of Community and affiliates harmless from loss, liability, claim or demand including reasonable attorney’s fees.</li>\r\n<li>Community is not responsible nor makes any warranties to the validity of User created content.</li>\r\n</ol> \r\n\r\nBy using Community, as either a Visitor or Member, you are bound to all of the terms above.\r\n\r\nCopyright 2009 Phourus. All Rights Reserved.\r\n</div>', '');
INSERT INTO `app_pages` VALUES('/privacy', 'default', 'Privacy Policy', '<div style="padding: 20px">\r\n<h1>Phourus.com Privacy Policy</h1>\r\n\r\nThis page explains how we use the personal information we collect while you use this Site. For those of you without law degrees, a brief overview is provided below, followed by the actual legal documentation.\r\n\r\n<ul>\r\n<li>You must be at least 13 years old to create a profile, in accordance with the COPPA Act.</li>\r\n<li>Compliant with the California Online Privacy Act.</li>\r\n<li>We do not collect credit card/social security information.</li>\r\n<li>We do use cookies, but primarily to store your login information.</li>\r\n<li>We do not disclose your personal info to outside parties.</li>\r\n<li>Policy only applies to information collected through this Website, Phourus.com.</li>\r\n<li>When you signup for a profile, you are automatically added to our mailing list.</li>\r\n<li>You can unsubscribe from our mailing list by modifying your account.</li>\r\n<li>If you unsubscribe from our mailing list, you will not receive email notifications of any Privacy Policy changes.</li>\r\n<li>The latest date of modification to Privacy Policy will be contained in the Policy</li>\r\n</ul>\r\n\r\n<h3>Privacy Policy</h3>\r\n<strong>What information do we collect?</strong>\r\n\r\nWe collect information from you when you register on our site, place an order, subscribe to our newsletter, respond to a survey or fill out a form. \r\n\r\nWhen ordering or registering on our site, as appropriate, you may be asked to enter your: name, e-mail address, mailing address or phone number. You may, however, visit our site anonymously.\r\n\r\n<strong>What do we use your information for?</strong>\r\n\r\nAny of the information we collect from you may be used in one of the following ways: \r\n\r\n<ul>\r\n<li>To personalize your experience (your information helps us to better respond to your individual needs)</li>\r\n<li>To improve our website (we continually strive to improve our website offerings based on the information and feedback we receive from you)</li>\r\n<li>To improve customer service (your information helps us to more effectively respond to your customer service requests and support needs)</li>\r\n<li>To process transactions</li>\r\n<li>To administer a contest, promotion, survey or other site feature</li>\r\n<li>To send periodic emails</li>\r\n</ul>\r\n\r\nYour information, whether public or private, will not be sold, exchanged, transferred, or given to any other company for any reason whatsoever, without your consent, other than for the express purpose of delivering the purchased product or service requested. \r\n\r\nThe email address you provide for order processing, will only be used to send you information and updates pertaining to your order.\r\n\r\nWhen you signup for a profile, you will be automatically added to our mailing list, and you will receive emails that may include company news, updates, related product or service information, etc.\r\n\r\nNote: If at any time you would like to unsubscribe from receiving future emails, If at any time you would like to unsubscribe from receiving future emails, you may do so within your profile editor under the ''Settings'' page and the ''Privacy'' section. There are several features you may customize to meet your privacy needs and mailing list preferences..\r\n\r\n<strong>How do we protect your information?</strong>\r\n\r\nWe implement a variety of security measures to maintain the safety of your personal information when you access your personal information. \r\n\r\n<strong>Do we use cookies?</strong>\r\n\r\nYes (Cookies are small files that a site or its service provider transfers to your computers hard drive through your Web browser (if you allow) that enables the sites or service providers systems to recognize your browser and capture and remember certain information\r\n\r\nWe use cookies to understand and save your preferences for future visits and compile aggregate data about site traffic and site interaction so that we can offer better site experiences and tools in the future. We may contract with third-party service providers to assist us in better understanding our site visitors. These service providers are not permitted to use the information collected on our behalf except to help us conduct and improve our business.\r\n\r\n<strong>Do we disclose any information to outside parties?</strong>\r\n\r\nWe do not sell, trade, or otherwise transfer to outside parties your personally identifiable information. This does not include trusted third parties who assist us in operating our website, conducting our business, or servicing you, so long as those parties agree to keep this information confidential. We may also release your information when we believe release is appropriate to comply with the law, enforce our site policies, or protect ours or others rights, property, or safety. However, non-personally identifiable visitor information may be provided to other parties for marketing, advertising, or other uses.\r\n\r\n<strong>Third party links</strong>\r\n\r\nOccasionally, at our discretion, we may include or offer third party products or services on our website. These third party sites have separate and independent privacy policies. We therefore have no responsibility or liability for the content and activities of these linked sites. Nonetheless, we seek to protect the integrity of our site and welcome any feedback about these sites.\r\n\r\n<strong>California Online Privacy Protection Act Compliance</strong>\r\n\r\nBecause we value your privacy we have taken the necessary precautions to be in compliance with the California Online Privacy Protection Act. We therefore will not distribute your personal information to outside parties without your consent.\r\n\r\n<strong>Childrens Online Privacy Protection Act Compliance</strong>\r\n\r\nWe are in compliance with the requirements of COPPA (Childrens Online Privacy Protection Act), we do not collect any information from anyone under 13 years of age. Our website, products and services are all directed to people who are at least 13 years old or older.\r\n\r\n<strong>PayPal</strong>\r\n\r\nWe do not collect, store or view any credit card or social security information used by PayPal to complete any transactions on our Website. PayPal is a third-party payment processing organization that handles all vital information required for e-commerce sales. We merely send them your basic contact information and orded information. They then process the information securely and send us a confirmation containing the details of the Order. This confirmation, however, does not contain any vital information such as a credit card number or social security number. To learn more about PayPal, go to <a href="http://www.paypal.com" target="_blank">http://www.paypal.com</a>.\r\n\r\n<strong>Online Privacy Policy Only</strong>\r\n\r\nThis online privacy policy applies only to information collected through our website and not to information collected offline.\r\n\r\n<strong>Terms and Conditions</strong>\r\n\r\nPlease also visit our Terms and Conditions section establishing the use, disclaimers, and limitations of liability governing the use of our website at http://www.phourus.com/Terms.\r\n\r\n<strong>Your Consent</strong>\r\n\r\nBy using our site, you consent to our privacy policy.\r\n\r\n<strong>Changes to our Privacy Policy</strong>\r\n\r\nIf we decide to change our privacy policy, we will send an email notifying you of any changes, and/or update the Privacy Policy modification date below. \r\n\r\n<strong><em>This policy was last modified on 6/18/09</em></strong>\r\n\r\n<strong>Contacting Us</strong>\r\n\r\nIf there are any questions regarding this privacy policy you may contact us using the contact page.\r\n</div>', '');
INSERT INTO `app_pages` VALUES('/profile', 'default', 'Profile', '', '');
INSERT INTO `app_pages` VALUES('/me', 'default', 'Me', '', '');
INSERT INTO `app_pages` VALUES('/contact', 'contact', 'Contact', '', '');
INSERT INTO `app_pages` VALUES('/logout', 'default', 'Logout', '', '');
INSERT INTO `app_pages` VALUES('/stream', 'stream', 'Stream', 'Stream', 'Stream');

-- --------------------------------------------------------

--
-- Table structure for table `app_stream`
--

CREATE TABLE `app_stream` (
  `_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `stream_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `privacy` tinyint(1) NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL,
  `comments` int(11) NOT NULL,
  `shares` int(11) NOT NULL,
  `likes` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `influence` tinyint(2) NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `record` (`stream_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Dumping data for table `app_stream`
--

INSERT INTO `app_stream` VALUES(1, 'DEB-120701-001-A', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'USE-120403-001-A', 0, 27, 3, 1, 7, 120, 33, 'debates', 'add');
INSERT INTO `app_stream` VALUES(2, 'BLO-120701-006-A', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'USE-120812-001-A', 0, 47, 12, 3, 22, 145, 4, 'blogs', 'edit');
INSERT INTO `app_stream` VALUES(3, 'SUB-120701-001-A', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'USE-120403-002-A', 0, 125, 43, 12, 55, 176, 4, 'subjects', 'add');
INSERT INTO `app_stream` VALUES(4, 'BLO-120704-002-A', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'USE-120812-002-A', 0, 624, 241, 110, 431, 132, 49, 'blogs', 'add');
INSERT INTO `app_stream` VALUES(5, 'DEB-120701-002-A', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'USE-120403-001-A', 0, 145, 33, 41, 86, 244, 35, 'debates', 'add');
INSERT INTO `app_stream` VALUES(6, 'LIN-120229-001-A', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'USE-120704-001-A', 0, 7871, 1432, 776, 5129, 78, 61, 'links', 'add');
INSERT INTO `app_stream` VALUES(7, 'LIN-120325-001-A', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'USE-120812-001-A', 0, 10231, 341, 231, 560, 43, 41, 'links', 'add');
INSERT INTO `app_stream` VALUES(8, 'BLO-120226-001-A', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'USE-120505-001-A', 0, 346, 42, 22, 56, 67, 23, 'blogs', 'add');
INSERT INTO `app_stream` VALUES(9, 'BLO-120226-002-A', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'USE-120403-002-A', 0, 424, 56, 45, 43, 69, 25, 'blogs', 'add');
INSERT INTO `app_stream` VALUES(10, 'BLO-120224-003-A', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'USE-120618-001-A', 0, 540, 68, 2, 13, 44, 12, 'blogs', 'add');
INSERT INTO `app_stream` VALUES(11, 'DEB-120229-003-A', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'USE-120505-001-A', 0, 8933, 475, 543, 435, 67, 55, 'debates', 'add');
INSERT INTO `app_stream` VALUES(12, 'SUB-120701-002-A', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'USE-120403-002-A', 0, 432, 545, 767, 345, 54, 42, 'subjects', 'add');
INSERT INTO `app_stream` VALUES(13, 'EVE-130627-001-A', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'USE-120505-001-A', 0, 543, 657, 276, 42, 45, 45, 'events', 'add');
INSERT INTO `app_stream` VALUES(14, 'TIM-120701-003-A', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'USE-120812-002-A', 0, 987, 567, 23, 43, 45, 37, 'timeline', 'add');
INSERT INTO `app_stream` VALUES(15, 'SUB-120229-003-A', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'USE-120704-001-A', 0, 1534, 433, 256, 125, 53, 28, 'subjects', 'add');
INSERT INTO `app_stream` VALUES(16, 'VOT-130119-001-A', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'USE-120618-001-A', 0, 6345, 236, 87, 542, 76, 41, 'votes', 'add');
INSERT INTO `app_stream` VALUES(17, 'IDE-120229-001-A', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'USE-120812-001-A', 0, 2575, 567, 224, 178, 54, 29, 'ideas', 'add');
INSERT INTO `app_stream` VALUES(18, 'TIM-120803-001-A', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'USE-120505-001-A', 0, 18632, 786, 134, 1356, 23, 49, 'timeline', 'add');
INSERT INTO `app_stream` VALUES(19, 'BEL-120709-001-A', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'USE-120403-001-A', 0, 5373, 453, 56, 499, 75, 21, 'beliefs', 'add');
INSERT INTO `app_stream` VALUES(20, 'EVE-130301-001-A', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'USE-120618-001-A', 0, 12553, 967, 45, 1123, 34, 52, 'events', 'add');

-- --------------------------------------------------------

--
-- Table structure for table `app_tags`
--

CREATE TABLE `app_tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `record` varchar(20) NOT NULL DEFAULT '',
  `tag` varchar(20) NOT NULL DEFAULT '',
  `target` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `app_tags`
--


-- --------------------------------------------------------

--
-- Table structure for table `app_thumbs`
--

CREATE TABLE `app_thumbs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `app_thumbs`
--


-- --------------------------------------------------------

--
-- Table structure for table `app_tokens`
--

CREATE TABLE `app_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `record` varchar(20) DEFAULT NULL,
  `token` varchar(20) DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `app_tokens`
--


-- --------------------------------------------------------

--
-- Table structure for table `app_users`
--

CREATE TABLE `app_users` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `level` int(11) NOT NULL DEFAULT '0',
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `first` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `category` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subcategory` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `gender` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `occupation` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fb` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `li` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rank` tinyint(2) NOT NULL,
  `dob` date DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `record` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=194 ;

--
-- Dumping data for table `app_users`
--

INSERT INTO `app_users` VALUES(1, 'USE-120403-001-A', '2012-04-03 23:08:14', '0000-00-00 00:00:00', 0, 'davidcruz', 'phourus', 'David', 'Cruz', 'dcruz@ymail.com', '555-555-5555', 'ADD-120908-001-A', NULL, NULL, 'active', 0, 'm', 'Software Engineer', 'Intuit', 'www.intuit.com', NULL, NULL, 40, NULL, NULL);
INSERT INTO `app_users` VALUES(2, 'USE-120403-002-A', '2012-04-03 23:08:14', '0000-00-00 00:00:00', 0, 'kbasil', 'phourus', 'Kelly', 'Basil', 'kbasil@gmail.com', '555-555-5555', 'ADD-120908-002-A', NULL, NULL, 'active', 0, 'f', 'Director of Marketing', 'Adobe', 'www.adobe.com', NULL, NULL, 39, NULL, NULL);
INSERT INTO `app_users` VALUES(6, 'USE-120505-001-A', '2012-04-03 23:08:14', '0000-00-00 00:00:00', 0, 'bruceisaac', 'phourus', 'Bruce', 'Isaac', 'bruseisaac@hotmail.com', '555-555-5555', 'ADD-120908-003-A', NULL, NULL, 'active', 0, 'm', 'CTO', 'Facebook', 'www.facebook.com', NULL, NULL, 39, NULL, NULL);
INSERT INTO `app_users` VALUES(7, 'USE-120618-001-A', '2012-04-03 23:08:14', '0000-00-00 00:00:00', 0, 'reginawall', 'phourus', 'Regina', 'Wall', 'rwall@ymail.com', '555-555-5555', 'ADD-120908-004-A', NULL, NULL, 'active', 0, 'f', 'Customer Support Specialist', 'Google', 'www.intuit.com', NULL, NULL, 39, NULL, NULL);
INSERT INTO `app_users` VALUES(8, 'USE-120704-001-A', '2012-04-03 23:08:14', '0000-00-00 00:00:00', 0, 'kendallk', 'phourus', 'Kendall', 'Kennedy', 'kendallk@gmail.com', '555-555-5555', 'ADD-121022-001-A', NULL, NULL, 'active', 0, 'm', 'Selectman', 'Town of Plaistow', 'www.kendallkennedy.com', NULL, NULL, 39, NULL, NULL);
INSERT INTO `app_users` VALUES(9, 'USE-120812-001-A', '2012-04-03 23:08:14', '0000-00-00 00:00:00', 0, 'duncanv', 'phourus', 'Duncan', 'Valentine', 'info@duncanvalentine.com', '555-555-5555', 'ADD-121022-002-A', NULL, NULL, 'active', 0, 'm', 'Sales Engineer', 'LinkedIn', 'www.linkedin.com', NULL, NULL, 39, NULL, NULL);
INSERT INTO `app_users` VALUES(10, 'USE-120812-002-A', '2012-04-03 23:08:14', '0000-00-00 00:00:00', 0, 'cassidyowen', 'phourus', 'Cassidy', 'Owen', 'cassidyown@hotmail.com', '555-555-5555', 'ADD-121022-003-A', NULL, NULL, 'active', 0, 'f', 'State Representative', 'State of NH', 'www.cassidyowen.com', NULL, NULL, 39, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_views`
--

CREATE TABLE `app_views` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `app_views`
--


-- --------------------------------------------------------

--
-- Table structure for table `core_blogs`
--

CREATE TABLE `core_blogs` (
  `_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `element` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `category` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tags` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8_unicode_ci,
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`_id`),
  UNIQUE KEY `record` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Dumping data for table `core_blogs`
--

INSERT INTO `core_blogs` VALUES(1, 'BLO-120223-001-A', 'Educational shortfall: USA', 'mind', 'facts', 'usa, problems, issues', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pharetra, libero quis lobortis porta, libero risus pellentesque felis, commodo blandit eros lorem id diam. Aenean ac ipsum id sapien vestibulum fringilla. Aliquam sed dui sit amet nulla eleifend blandit non ut leo.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pharetra, libero quis lobortis porta, libero risus pellentesque felis, commodo blandit eros lorem id diam. Aenean ac ipsum id sapien vestibulum fringilla. Aliquam sed dui sit amet nulla eleifend blandit non ut leo.\r\n\r\nLibero risus pellentesque felis, commodo blandit eros lorem id diam. Aenean ac ipsum id sapien vestibulum fringilla. Aliquam sed dui sit amet nulla eleifend blandit non ut leo.\r\n\r\nAenean ac ipsum id sapien vestibulum fringilla. Aliquam sed dui sit amet nulla eleifend blandit non ut leo.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pharetra, libero quis lobortis porta, libero risus pellentesque felis, commodo blandit eros lorem id diam.', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(2, 'BLO-120224-001-A', 'The ''Christ'' in Christmas', 'faith', 'opinion', 'christmas', 'Prima ancillae per ut, ne deseruisse omittantur eum, ipsum commodo tincidunt ut est. At amet facilis mnesarchum eam.\n\nUsu sint accusata ne. Noluisse legendos philosophia vis ne, nulla mucius oblique eum an. Usu malis fierent propriae cu. Saepe officiis liberavisse et nec. Duo electram sententiae eu. Id per suas timeam, tritani alienum cu mei. Te mei aliquid eligendi, mei feugiat efficiendi interpretaris ne, nam labores invenire inciderint no.', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(3, 'BLO-120224-002-A', 'Practical classes', 'mind', 'opinion', 'classes, courses', 'Ad mea laoreet apeirian voluptaria, sea cu tempor appellantur, pri consul pericula ad. Persius ornatus splendide vix no, his in repudiare definitiones, pro id meis urbanitas abhorreant. Pro solum nonumy petentium in, in vel iudico sententiae posidonium, clita eligendi honestatis te has. Odio mutat an vis, utinam vocent volumus eu pri.\n\nNe sea liber melius inermis, illud dissentiet mei at, ut dictas dignissim vel. Ad has nullam quaerendum philosophia, vim eirmod oporteat ne. ', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(4, 'BLO-120224-003-A', 'Teachers & Statistics', 'mind', 'facts', 'teachers', 'Et vim utamur postulant, vim tamquam probatus ex? Est sint atomorum an? Te sea malis mediocritatem, et ius consul officiis postulant. Modo oratio aliquando et eam.\n\nIudico tollit iriure his te. No eam graecis mediocritatem, pro ut putent accusata, tempor integre lobortis ne vel. At mei civibus blandit, adhuc consequuntur te eam, eu sed mazim perfecto efficiantur. Quando laboramus intellegebat ea sea, vel ea saepe impetus senserit? Dolor accusamus nec te, pri in sanctus vulputate comprehensam, ne clita ridens feugait mea!', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(5, 'BLO-120226-001-A', 'Religion in the 21st Century', 'faith', 'facts', 'religion', 'Id sint epicurei concludaturque sit, an qui errem deserunt dissentiunt. Ut usu primis assentior. Est viris clita ex, ut odio menandri mea, te eum dicit facilisis theophrastus. An quo mundi appareat, vivendo civibus eligendi vis an. Ea vix oratio mollis, ad per lucilius maluisset mediocritatem? Errem molestie liberavisse ne sed, cu his habemus molestie.\n\nDolorum convenire explicari ei sit, mei at propriae forensibus dissentiet, phaedrum ocurreret constituto ad sea. Cum cu iuvaret eruditi percipitur, veritus noluisse abhorreant id per. Te vis autem vivendo, eu quo diceret ornatus? Exerci suscipit disputationi no eos! Vis volutpat pericula ex, ex mei dicam semper integre.', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(6, 'BLO-120226-002-A', 'Atheist vs. Agnostic?', 'faith', 'discussion', 'atheist, agnostic', 'No eam graecis mediocritatem, pro ut putent accusata, tempor integre lobortis ne vel. At mei civibus blandit, adhuc consequuntur te eam, eu sed mazim perfecto efficiantur. Quando laboramus intellegebat ea sea, vel ea saepe impetus senserit? Dolor accusamus nec te, pri in sanctus vulputate comprehensam, ne clita ridens feugait mea!', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(7, 'BLO-120226-003-A', 'How to live sustainably?', 'earth', 'discussion', 'sustainability', 'Viris tibique in qui. Euismod blandit tincidunt ne eos, sed ea dico libris. Nam ei quando essent malorum, vide duis etiam id est! Vim impedit graecis eu, id sit illud ipsum reprehendunt.\n\nExpetenda accommodare ea nec, in eros perpetua senserit qui? An percipit vulputate cum, erat doming suscipiantur ea est, cum ne maiestatis mediocritatem. Mea democritum neglegentur ad, in erant euismod has, rebum tantas doming nam te. An quo movet indoctum, singulis cotidieque ut eam? Quas tantas quidam cum ne, an qui adhuc tamquam, eam ad vidit affert commune?', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(8, 'BLO-120701-001-A', 'The real energy crisis', 'earth', 'facts', 'energy', 'Et tota velit facilis quo, tale habeo mollis ad cum. Id per insolens assentior, ipsum admodum delicata mel no.\n\nEt sea posse virtute ponderum, noster alienum delicata mea an, vidit similique cu mel! Usu id nostro facilisis. Omnes oportere ei mea, graece officiis definiebas eam ea, an fierent nominati his. Ius altera alienum senserit in. Ei doming menandri tincidunt sit, idque oratio hendrerit id nam?', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(9, 'BLO-120701-002-A', 'Better housing options', 'earth', 'humor', 'housing', 'Iudico tollit iriure his te. No eam graecis mediocritatem, pro ut putent accusata, tempor integre lobortis ne vel. At mei civibus blandit, adhuc consequuntur te eam, eu sed mazim perfecto efficiantur. Quando laboramus intellegebat ea sea, vel ea saepe impetus senserit? Dolor accusamus nec te, pri in sanctus vulputate comprehensam, ne clita ridens feugait mea!\n\nId sint epicurei concludaturque sit, an qui errem deserunt dissentiunt. Ut usu primis assentior. Est viris clita ex, ut odio menandri mea, te eum dicit facilisis theophrastus. An quo mundi appareat, vivendo civibus eligendi vis an. Ea vix oratio mollis, ad per lucilius maluisset mediocritatem? Errem molestie liberavisse ne sed, cu his habemus molestie.', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(10, 'BLO-120701-003-A', 'What''s really in your food?', 'earth', 'rant', 'food', 'Expetenda accommodare ea nec, in eros perpetua senserit qui? An percipit vulputate cum, erat doming suscipiantur ea est, cum ne maiestatis mediocritatem. Mea democritum neglegentur ad, in erant euismod has, rebum tantas doming nam te. An quo movet indoctum, singulis cotidieque ut eam? Quas tantas quidam cum ne, an qui adhuc tamquam, eam ad vidit affert commune?\n\nHis ceteros noluisse splendide cu, mucius accusamus no eum, sit et probo summo quidam. Ut rebum copiosae voluptatum his! Duo soluta repudiandae ea, sea legimus phaedrum eu, mea nibh bonorum sapientem ne! Et tota velit facilis quo, tale habeo mollis ad cum. Id per insolens assentior, ipsum admodum delicata mel no.\n\nEt sea posse virtute ponderum, noster alienum delicata mea an, vidit similique cu mel! Usu id nostro facilisis. Omnes oportere ei mea, graece officiis definiebas eam ea, an fierent nominati his. Ius altera alienum senserit in. Ei doming menandri tincidunt sit, idque oratio hendrerit id nam?\n\nReque falli ne eam, similique efficiendi quo no. Sea id solet phaedrum, sit no partem facilis, impetus eligendi efficiantur et eum! Mea eius persequeris ea, an sed ullum eirmod, vis id etiam lucilius. Mel omnis ubique ad, ad vis labore quidam intellegat? Eu his ferri populo ridens, alienum commune usu et, no primis labores vix. Pro ex modus ubique vidisse?\n\nEt vim utamur postulant, vim tamquam probatus ex? Est sint atomorum an? Te sea malis mediocritatem, et ius consul officiis postulant. Modo oratio aliquando et eam.', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(11, 'BLO-120701-004-A', 'Taxes for 2013', 'voice', 'facts', 'taxes', 'Ei sonet nobis adipisci sed, vim ad vivendo denique periculis. Sed te melius noluisse evertitur, ocurreret gloriatur in eum. Decore dicunt usu te, vim te putent mediocritatem, affert deserunt cum ne.', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(12, 'BLO-120701-005-A', 'It''s our right!', 'voice', 'rant', 'gun control', 'Est sint atomorum an? Te sea malis mediocritatem, et ius consul officiis postulant. Modo oratio aliquando et eam.\n\nIudico tollit iriure his te. No eam graecis mediocritatem, pro ut putent accusata, tempor integre lobortis ne vel. At mei civibus blandit, adhuc consequuntur te eam, eu sed mazim perfecto efficiantur. Quando laboramus intellegebat ea sea, vel ea saepe impetus senserit? Dolor accusamus nec te, pri in sanctus vulputate comprehensam, ne clita ridens feugait mea!', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(13, 'BLO-120701-006-A', 'Protect the American Eagle', 'earth', 'discussion', 'wildlife', 'Ei doming menandri tincidunt sit, idque oratio hendrerit id nam?\n\nReque falli ne eam, similique efficiendi quo no. Sea id solet phaedrum, sit no partem facilis, impetus eligendi efficiantur et eum! Mea eius persequeris ea, an sed ullum eirmod, vis id etiam lucilius. Mel omnis ubique ad, ad vis labore quidam intellegat? Eu his ferri populo ridens, alienum commune usu et, no primis labores vix. Pro ex modus ubique vidisse?\n', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(14, 'BLO-120701-007-A', 'Forestation 101', 'earth', 'facts', 'forests', 'Reque falli ne eam, similique efficiendi quo no. Sea id solet phaedrum, sit no partem facilis, impetus eligendi efficiantur et eum! Mea eius persequeris ea, an sed ullum eirmod, vis id etiam lucilius. Mel omnis ubique ad, ad vis labore quidam intellegat? Eu his ferri populo ridens, alienum commune usu et, no primis labores vix. Pro ex modus ubique vidisse?', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(15, 'BLO-120701-008-A', 'Change is needed', 'mind', 'rant', 'change, reform', 'Dolorum convenire explicari ei sit, mei at propriae forensibus dissentiet, phaedrum ocurreret constituto ad sea. Cum cu iuvaret eruditi percipitur, veritus noluisse abhorreant id per. Te vis autem vivendo, eu quo diceret ornatus? Exerci suscipit disputationi no eos! Vis volutpat pericula ex, ex mei dicam semper integre.', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(16, 'BLO-120702-001-A', 'To Church or not to Church?', 'faith', 'opinion', 'church', 'An quo mundi appareat, vivendo civibus eligendi vis an. Ea vix oratio mollis, ad per lucilius maluisset mediocritatem? Errem molestie liberavisse ne sed, cu his habemus molestie.', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(17, 'BLO-120702-002-A', 'Revolutionary homes', 'earth', 'facts', 'architecture', 'Ea vix oratio mollis, ad per lucilius maluisset mediocritatem? Errem molestie liberavisse ne sed, cu his habemus molestie.\n\nDolorum convenire explicari ei sit, mei at propriae forensibus dissentiet, phaedrum ocurreret constituto ad sea. Cum cu iuvaret eruditi percipitur, veritus noluisse abhorreant id per. Te vis autem vivendo, eu quo diceret ornatus? Exerci suscipit disputationi no eos! Vis volutpat pericula ex, ex mei dicam semper integre.', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(18, 'BLO-120704-001-A', 'Obama vs. Romney', 'voice', 'discussion', 'president', 'Ut usu primis assentior. Est viris clita ex, ut odio menandri mea, te eum dicit facilisis theophrastus. An quo mundi appareat, vivendo civibus eligendi vis an. Ea vix oratio mollis, ad per lucilius maluisset mediocritatem? Errem molestie liberavisse ne sed, cu his habemus molestie.', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(19, 'BLO-120704-002-A', 'It''s not hard to live greener', 'earth', 'opinion', 'lifestyle', 'His ceteros noluisse splendide cu, mucius accusamus no eum, sit et probo summo quidam. Ut rebum copiosae voluptatum his! Duo soluta repudiandae ea, sea legimus phaedrum eu, mea nibh bonorum sapientem ne! Et tota velit facilis quo, tale habeo mollis ad cum. Id per insolens assentior, ipsum admodum delicata mel no.\n\nEt sea posse virtute ponderum, noster alienum delicata mea an, vidit similique cu mel! Usu id nostro facilisis. Omnes oportere ei mea, graece officiis definiebas eam ea, an fierent nominati his. Ius altera alienum senserit in. Ei doming menandri tincidunt sit, idque oratio hendrerit id nam?', '0000-00-00 00:00:00');
INSERT INTO `core_blogs` VALUES(20, 'BLO-120704-003-A', 'Federal Reserve policy', 'voice', 'opinion', 'economy', 'Ad viris hendrerit has, ei soluta quidam mel. Viris tibique in qui. Euismod blandit tincidunt ne eos, sed ea dico libris. Nam ei quando essent malorum, vide duis etiam id est! Vim impedit graecis eu, id sit illud ipsum reprehendunt.\n\nExpetenda accommodare ea nec, in eros perpetua senserit qui? An percipit vulputate cum, erat doming suscipiantur ea est, cum ne maiestatis mediocritatem. Mea democritum neglegentur ad, in erant euismod has, rebum tantas doming nam te. An quo movet indoctum, singulis cotidieque ut eam? Quas tantas quidam cum ne, an qui adhuc tamquam, eam ad vidit affert commune?', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `core_events`
--

CREATE TABLE `core_events` (
  `_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL DEFAULT '',
  `title` varchar(40) NOT NULL DEFAULT '',
  `element` varchar(10) NOT NULL DEFAULT '',
  `tags` varchar(40) DEFAULT NULL,
  `date` varchar(6) NOT NULL DEFAULT '',
  `time` varchar(6) NOT NULL,
  `content` text NOT NULL,
  `address` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `core_events`
--

INSERT INTO `core_events` VALUES(1, 'EVE-130301-001-A', 'Home food growers association', 'earth', 'grow, food, organic', '130423', '12:30p', 'Mucius dolorum voluptaria nam an, quo quod atomorum cu, choro platonem id pri. Pri id brute mediocrem, ut electram intellegam nec. Ei vitae consul explicari vis. Te enim senserit ullamcorper vis, deleniti liberavisse complectitur eu vel. Aperiri eloquentiam nec ad, his te civibus pericula maluisset, te illum doctus vis? Ad eam natum liber concludaturque, epicurei nominati mel et, no pro unum eligendi theophrastus!\n\nNatum solet postea nec eu, ut detracto pericula laboramus duo! Semper concludaturque ex has. Ad nulla soleat detraxit cum! Adhuc paulo insolens sit te, ut regione voluptaria scripserit vel. Te veri aliquip similique quo. In vis quis novum, id vel melius similique eloquentiam?', 'ADD-121022-004-A');
INSERT INTO `core_events` VALUES(4, 'EVE-130301-002-A', 'Democrats of CA meeting', 'voice', 'democrats, ca', '130612', '01:15p', 'Novum scaevola mea ad. Ut idque nihil eruditi mel, te iuvaret legimus his? Nibh commodo vim ei. Pertinax conceptam quo ut. In unum ancillae reformidans sea, eu graeci dictas legendos quo, pri ponderum lucilius ex. Doctus senserit duo ne, ei pro odio nominavi copiosae! Posse decore postea vis ad.\n\nVelit labore civibus cum at. Quo in quidam eruditi? Omnis bonorum pri et, te mea tollit ubique hendrerit, ex vidisse accusam persequeris eos. Sea ei debet aperiri, accumsan recteque scribentur per ei! Ad mutat saperet per, sit no nisl paulo.', 'ADD-121022-005-A');
INSERT INTO `core_events` VALUES(5, 'EVE-130301-003-A', 'Moses Monday', 'faith', 'judaism, moses', '131122', '09:45a', 'Velit labore civibus cum at. Quo in quidam eruditi? Omnis bonorum pri et, te mea tollit ubique hendrerit, ex vidisse accusam persequeris eos. Sea ei debet aperiri, accumsan recteque scribentur per ei! Ad mutat saperet per, sit no nisl paulo.\n\nEum ullum veniam mnesarchum no, audire vidisse reprimique ius no, stet vocibus lobortis sit ex. Ius discere oporteat cu! Ne his dicat appetere disputando, alia torquatos gloriatur cu mea, melius tamquam meliore cu mel. Te duo munere possit interpretaris, nemore fabellas mei et! Natum porro delenit ad duo, ea eirmod omittam epicurei quo!', 'ADD-121022-006-A');
INSERT INTO `core_events` VALUES(6, 'EVE-130410-001-A', 'Teachers of Southern VA', 'mind', 'teachers, school, union', '130812', '03:25p', 'Populo laboramus ea usu, ad eum congue accumsan. Tation fabulas accusata qui ad, eos ad quas etiam laudem. Eos ea movet libris nemore. Eum vitae nullam patrioque cu, ne cum postea doming, vis feugiat minimum te. His possim consulatu aliquando no. Atqui suavitate pri ei, oblique recteque convenire te cum!\n\nEos novum quando ex, sea cu nusquam offendit vivendum! Falli iusto patrioque an sit, qui id doctus eruditi intellegebat, qui nusquam offendit tincidunt at. Eius impedit accusamus ius ex. Id nostrum lobortis eam, vix aperiri vituperata scriptorem ex, qui aliquip interesset ut! Id duo nostro omittam conclusionemque? Ex dico vero habeo vim, est ex vituperata conclusionemque! Has adipiscing contentiones ne.', 'ADD-121022-007-A');
INSERT INTO `core_events` VALUES(7, 'EVE-130415-001-A', 'Republicans of NH meeting', 'voice', 'republicans, nh', '140212', '04:00p', 'Nibh denique ocurreret sit ea, est eius movet cu, populo albucius mea eu. Soleat ullamcorper ea duo, no per affert timeam. No vel civibus fierent salutandi, ex exerci primis salutandi eum? Cu eum soluta graeco ocurreret, id nec audire tritani tractatos!\n\nEst prima brute dicunt ex, alii docendi suavitate cu his. Expetenda splendide cu vix, sea eros ludus soluta ne. Homero altera eu eos.', 'ADD-121022-008-A');
INSERT INTO `core_events` VALUES(8, 'EVE-130513-001-A', 'Alternative energy customers', 'earth', 'alternative energy', '131006', '08:00p', 'Eum ullum veniam mnesarchum no, audire vidisse reprimique ius no, stet vocibus lobortis sit ex. Ius discere oporteat cu! Ne his dicat appetere disputando, alia torquatos gloriatur cu mea, melius tamquam meliore cu mel. Te duo munere possit interpretaris, nemore fabellas mei et! Natum porro delenit ad duo, ea eirmod omittam epicurei quo!\n\nPopulo laboramus ea usu, ad eum congue accumsan. Tation fabulas accusata qui ad, eos ad quas etiam laudem. Eos ea movet libris nemore. Eum vitae nullam patrioque cu, ne cum postea doming, vis feugiat minimum te. His possim consulatu aliquando no. Atqui suavitate pri ei, oblique recteque convenire te cum!', 'ADD-121022-009-A');
INSERT INTO `core_events` VALUES(9, 'EVE-130513-002-A', 'Advocates for gun control', 'voice', 'gun control', '130606', '06:30p', 'In unum ancillae reformidans sea, eu graeci dictas legendos quo, pri ponderum lucilius ex. Doctus senserit duo ne, ei pro odio nominavi copiosae! Posse decore postea vis ad.\n\nVelit labore civibus cum at. Quo in quidam eruditi? Omnis bonorum pri et, te mea tollit ubique hendrerit, ex vidisse accusam persequeris eos. Sea ei debet aperiri, accumsan recteque scribentur per ei! Ad mutat saperet per, sit no nisl paulo.', 'ADD-121111-001-A');
INSERT INTO `core_events` VALUES(10, 'EVE-130627-001-A', 'Re-learn math for adults', 'mind', 'math, algebra', '130303', '10:30a', 'Aperiri eloquentiam nec ad, his te civibus pericula maluisset, te illum doctus vis? Ad eam natum liber concludaturque, epicurei nominati mel et, no pro unum eligendi theophrastus!\n\nNatum solet postea nec eu, ut detracto pericula laboramus duo! Semper concludaturque ex has. Ad nulla soleat detraxit cum! Adhuc paulo insolens sit te, ut regione voluptaria scripserit vel. Te veri aliquip similique quo. In vis quis novum, id vel melius similique eloquentiam?', 'ADD-121111-002-A');

-- --------------------------------------------------------

--
-- Table structure for table `core_ideas`
--

CREATE TABLE `core_ideas` (
  `_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `element` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `category` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tags` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `record` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `core_ideas`
--

INSERT INTO `core_ideas` VALUES(1, 'IDE-120229-001-A', 'Increase US revenues', 'voice', 'improvement', 'financial, debt, revenue', 'Ubique efficiantur liberavisse no usu, has nihil menandri an! Quo labore latine dissentias id? Recusabo voluptatum cu duo, elit dicit everti cum et! No nec omnis intellegat, commodo disputando voluptatibus at sit, et indoctum eloquentiam pro! Apeirian theophrastus an ius.\n\nNe sed causae virtute, ut cum adhuc epicurei. Cetero alienum vis ex, tantas libris nam at, mel eu mutat iudico. Utamur platonem recteque ex mel. Prima nobis has ut, sadipscing persequeris duo cu. Tantas detraxit an vim, has purto nibh omnesque id, per et corrumpit vulputate!');
INSERT INTO `core_ideas` VALUES(2, 'IDE-120229-002-A', 'New energy system', 'earth', 'innovation', 'energy, power', 'Cetero alienum vis ex, tantas libris nam at, mel eu mutat iudico. Utamur platonem recteque ex mel. Prima nobis has ut, sadipscing persequeris duo cu. Tantas detraxit an vim, has purto nibh omnesque id, per et corrumpit vulputate!\n\nPri assum dicta debet at. Vidit doming delenit eum at, equidem lucilius adversarium te has. Sed at dicam graecis. Id vis voluptua fabellas qualisque, sit omittantur consectetuer ex, ei cum quis omnium consequuntur!');
INSERT INTO `core_ideas` VALUES(3, 'IDE-120229-003-A', 'Cool idea to attract new Church members', 'faith', 'interesting', 'church, attendance', 'Ex postea argumentum pro, eos dicam perfecto et? Ea pro nihil nonumy conceptam, nullam putent persecuti per te. Vim ei ocurreret referrentur! Quot ignota fastidii ex mel?\n\nLaudem intellegam cum an. Numquam percipit eum te, purto ludus copiosae et vim. Ea nec insolens gubergren. Mei vivendum explicari sadipscing an, legimus perfecto intellegebat cum in. Porro detraxit cu ius.\n\nPri eu meis ridens propriae? Id mea commodo corpora. Ea iracundia percipitur mei, mel ut summo accusata sapientem, duo dicam nusquam pertinacia eu. Vis id facer etiam simul.');
INSERT INTO `core_ideas` VALUES(4, 'IDE-120229-004-A', 'Improved education system', 'mind', 'improvement', 'school, education, teaching', 'Nec at choro possit mollis, at labitur volutpat mel! Meis commodo mandamus per an, eos te oporteat vulputate. Vel aliquando cotidieque ne, ut movet ridens has, ei amet efficiantur necessitatibus vis. Eam probo audiam reformidans id, cum alienum oporteat at. Ad ludus dicant ponderum vix, legere delectus in mei!\n\nAtqui fabulas qui ut! Case reprimique qui at. Pro ad audire senserit, verterem vituperata comprehensam pro id. Nobis recteque repudiare id eum, aliquam vivendum sententiae cu qui. Postea omnesque his ex? Dolore epicuri ad per, detracto efficiendi efficiantur ne mea. Te fabellas splendide vel.');
INSERT INTO `core_ideas` VALUES(5, 'IDE-120701-001-A', 'Online voting system', 'voice', 'innovation', 'voting, democracy', 'Quo ei causae intellegebat, eu novum homero viderer cum! Vix id qualisque voluptaria. Nisl falli vel ne. Ut mel appellantur signiferumque, id sed autem bonorum sapientem? Per choro tantas officiis cu!\n\nAlii quodsi mediocritatem no mel, ei iudico meliore eum? Ea errem dolore mediocrem usu, pro te suavitate assentior, tota lorem pro cu. Te vis inani copiosae! Ad lorem iusto eloquentiam eos, molestie signiferumque duo ne, eam doctus alterum et!');
INSERT INTO `core_ideas` VALUES(6, 'IDE-120701-002-A', 'Interesting packaging idea', 'earth', 'interesting', 'packaging, recycle', 'Has ne quot bonorum, aliquid euripidis nam no. Mei stet consectetuer ne, alii labores vix et, per noster delenit id? Ne alia nibh vocent nam, splendide signiferumque eu sea, ad quod illud dolorum eum? Dolor clita impedit an mea, has et dolorum delicata, usu ad tollit referrentur. His dicta aeque ne, affert efficiendi cum id. Euismod abhorreant voluptaria ea quo?');

-- --------------------------------------------------------

--
-- Table structure for table `core_links`
--

CREATE TABLE `core_links` (
  `_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `element` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `category` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tags` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `record` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `core_links`
--

INSERT INTO `core_links` VALUES(1, 'LIN-120229-001-A', 'http://climaterealityproject.org/video/', 'earth', 'video', 'climate, awareness', 'Ex diam civibus sea, eu nam dolor discere oporteat. Percipit ocurreret quo cu, an debet consulatu assueverit sea. Te nec harum accumsan tacimates, an sed tollit elaboraret dissentiunt. Id quo habeo laboramus, idque dictas pertinax no eam, cu adipisci signiferumque has. Eu nam falli animal honestatis. Fuisset dissentiunt eu mei.\n\nAd mea laoreet apeirian voluptaria, sea cu tempor appellantur, pri consul pericula ad. Persius ornatus splendide vix no, his in repudiare definitiones, pro id meis urbanitas abhorreant. Pro solum nonumy petentium in, in vel iudico sententiae posidonium, clita eligendi honestatis te has. Odio mutat an vis, utinam vocent volumus eu pri.');
INSERT INTO `core_links` VALUES(2, 'LIN-120325-001-A', 'http://www.whitehouse.gov/issues/education', 'mind', 'article', 'education, policy', 'Ad mea laoreet apeirian voluptaria, sea cu tempor appellantur, pri consul pericula ad. Persius ornatus splendide vix no, his in repudiare definitiones, pro id meis urbanitas abhorreant. Pro solum nonumy petentium in, in vel iudico sententiae posidonium, clita eligendi honestatis te has. Odio mutat an vis, utinam vocent volumus eu pri.');
INSERT INTO `core_links` VALUES(3, 'LIN-120515-001-A', 'http://www.religionfacts.com/big_religion_chart.htm', 'faith', 'article', 'religions, facts', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
INSERT INTO `core_links` VALUES(4, 'LIN-120605-001-A', 'http://finance.yahoo.com/news/top-earners-set-pay-most-050001996.html', 'voice', 'article', 'taxes', 'Pro solum nonumy petentium in, in vel iudico sententiae posidonium, clita eligendi honestatis te has. Odio mutat an vis, utinam vocent volumus eu pri.\n\nNe sea liber melius inermis, illud dissentiet mei at, ut dictas dignissim vel. Ad has nullam quaerendum philosophia, vim eirmod oporteat ne. Harum labitur deseruisse vim ne, dicta bonorum eam ei. Pro eius accusata deseruisse at. ');
INSERT INTO `core_links` VALUES(5, 'LIN-120701-001-A', 'http://www.opencongress.org/articles/view/2523-One-Year-Ago-We-Killed-SOPA-Happy-Internet-Freedom-Day-', 'voice', 'policies', 'internet, privacy', 'Harum labitur deseruisse vim ne, dicta bonorum eam ei. Pro eius accusata deseruisse at. Prima ancillae per ut, ne deseruisse omittantur eum, ipsum commodo tincidunt ut est. At amet facilis mnesarchum eam.\n\nUsu sint accusata ne. Noluisse legendos philosophia vis ne, nulla mucius oblique eum an. Usu malis fierent propriae cu. Saepe officiis liberavisse et nec. ');

-- --------------------------------------------------------

--
-- Table structure for table `earth_calculator`
--

CREATE TABLE `earth_calculator` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `earth_calculator`
--


-- --------------------------------------------------------

--
-- Table structure for table `earth_checklist`
--

CREATE TABLE `earth_checklist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `earth_checklist`
--


-- --------------------------------------------------------

--
-- Table structure for table `earth_matters`
--

CREATE TABLE `earth_matters` (
  `_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL DEFAULT '',
  `title` varchar(20) NOT NULL DEFAULT '',
  `category` varchar(20) NOT NULL,
  `content` text NOT NULL,
  `positive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `earth_matters`
--


-- --------------------------------------------------------

--
-- Table structure for table `earth_stores`
--

CREATE TABLE `earth_stores` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `earth_stores`
--


-- --------------------------------------------------------

--
-- Table structure for table `meta_address`
--

CREATE TABLE `meta_address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `record` varchar(20) NOT NULL DEFAULT '',
  `street` varchar(60) DEFAULT NULL,
  `city` varchar(40) NOT NULL DEFAULT '',
  `state` varchar(2) NOT NULL DEFAULT '',
  `country` varchar(2) NOT NULL DEFAULT '',
  `zip` varchar(5) NOT NULL DEFAULT '',
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `meta_address`
--

INSERT INTO `meta_address` VALUES(1, 'ADD-120908-001-A', '560-7750 Mauris Street', 'Branson', 'ND', 'US', '09681', 'residential');
INSERT INTO `meta_address` VALUES(2, 'ADD-120908-002-A', '862-3165 Tristique St.', 'Sun Valley', 'HI', 'US', '43737', 'business');
INSERT INTO `meta_address` VALUES(3, 'ADD-120908-003-A', '234-7903 In St.', 'Rock Springs', 'IN', 'US', '31382', 'mailing');
INSERT INTO `meta_address` VALUES(4, 'ADD-120908-004-A', 'Ap #976-9573 Mi Ave', 'Fairfax', 'CT', 'US', '35643', 'business');
INSERT INTO `meta_address` VALUES(5, 'ADD-121022-001-A', '487-5134 Enim, St.', 'Latrobe', 'KY', 'US', '32374', 'business');
INSERT INTO `meta_address` VALUES(6, 'ADD-121022-002-A', 'P.O. Box 243, 778 Elit. Rd.', 'Phoenix', 'IL', 'US', '82325', 'business');
INSERT INTO `meta_address` VALUES(7, 'ADD-121022-003-A', '295-1027 Id, Ave', 'Bradford', 'HI', 'US', '32872', 'residential');
INSERT INTO `meta_address` VALUES(8, 'ADD-121022-004-A', '802-7614 Elit Ave', 'Princeton', 'UT', 'US', '02802', 'mailing');
INSERT INTO `meta_address` VALUES(9, 'ADD-121022-005-A', '5291 Tortor. Av.', 'Saginaw', 'SD', 'US', '04200', 'residential');
INSERT INTO `meta_address` VALUES(10, 'ADD-121022-006-A', 'Ap #566-9371 Cursus Av.', 'Highland Park', 'IL', 'US', '78824', 'residential');
INSERT INTO `meta_address` VALUES(11, 'ADD-121022-007-A', '275-5220 Eget Ave', 'Valparaiso', 'OK', 'US', '51457', 'mailing');
INSERT INTO `meta_address` VALUES(12, 'ADD-121022-008-A', 'Ap #758-414 Amet Rd.', 'Ypsilanti', 'DC', 'US', '63772', 'residential');
INSERT INTO `meta_address` VALUES(13, 'ADD-121022-009-A', 'Ap #666-5691 Tellus Road', 'Valencia', 'AZ', 'US', '40460', 'mailing');
INSERT INTO `meta_address` VALUES(14, 'ADD-121111-001-A', 'P.O. Box 528, 4809 Ligula. Avenue', 'Lynwood', 'VA', 'US', '05993', 'residential');
INSERT INTO `meta_address` VALUES(15, 'ADD-121111-002-A', '814-4869 Ridiculus St.', 'Buena Park', 'ME', 'US', '73413', 'residential');
INSERT INTO `meta_address` VALUES(16, 'ADD-121111-003-A', 'P.O. Box 790, 1716 Erat. St.', 'North Tonawanda', 'SC', 'US', '50840', 'residential');
INSERT INTO `meta_address` VALUES(17, 'ADD-121111-004-A', '348-2082 Neque Ave', 'Hannibal', 'AL', 'US', '69762', 'mailing');
INSERT INTO `meta_address` VALUES(18, 'ADD-121111-005-A', 'P.O. Box 406, 4058 Urna. Street', 'Cedar City', 'SC', 'US', '83860', 'mailing');
INSERT INTO `meta_address` VALUES(19, 'ADD-121111-006-A', 'P.O. Box 467, 3581 Dis Street', 'Isle of Palms', 'SD', 'US', '79231', 'mailing');
INSERT INTO `meta_address` VALUES(20, 'ADD-121111-007-A', '2848 Urna. Ave', 'Walnut', 'AZ', 'US', '39984', 'mailing');
INSERT INTO `meta_address` VALUES(21, 'ADD-121225-001-A', '4934 Sed Av.', 'Sedalia', 'HI', 'US', '33348', 'residential');
INSERT INTO `meta_address` VALUES(22, 'ADD-121225-002-A', '792 Metus St.', 'Enid', 'KS', 'US', '89873', 'mailing');
INSERT INTO `meta_address` VALUES(23, 'ADD-121225-003-A', '126 Lorem St.', 'Springfield', 'NJ', 'US', '83495', 'mailing');
INSERT INTO `meta_address` VALUES(24, 'ADD-121225-004-A', '133-6990 Curabitur Street', 'Mount Vernon', 'WI', 'US', '01812', 'business');
INSERT INTO `meta_address` VALUES(25, 'ADD-130102-001-A', '883-3121 Aliquam Rd.', 'Columbia', 'MS', 'US', '46569', 'business');
INSERT INTO `meta_address` VALUES(26, 'ADD-130102-002-A', '8990 Gravida St.', 'San Jose', 'ND', 'US', '97985', 'residential');
INSERT INTO `meta_address` VALUES(27, 'ADD-130102-003-A', 'Ap #792-7415 Aliquam St.', 'Miami Gardens', 'NC', 'US', '90701', 'residential');
INSERT INTO `meta_address` VALUES(28, 'ADD-130102-004-A', '398-7249 Turpis Ave', 'Decatur', 'OR', 'US', '37070', 'business');
INSERT INTO `meta_address` VALUES(29, 'ADD-130102-005-A', 'P.O. Box 950, 1636 Duis St.', 'Murrieta', 'NY', 'US', '83089', 'mailing');
INSERT INTO `meta_address` VALUES(30, 'ADD-130102-006-A', 'P.O. Box 880, 5646 Laoreet, Av.', 'Martinsburg', 'TN', 'US', '90897', 'mailing');
INSERT INTO `meta_address` VALUES(31, 'ADD-130102-007-A', '5093 Ante. Ave', 'Belpre', 'WI', 'US', '85763', 'residential');
INSERT INTO `meta_address` VALUES(32, 'ADD-130102-008-A', 'P.O. Box 591, 1817 Vel, St.', 'Naperville', 'NE', 'US', '27273', 'residential');
INSERT INTO `meta_address` VALUES(33, 'ADD-130102-009-A', 'P.O. Box 743, 7413 Est, Rd.', 'Rolling Hills', 'NY', 'US', '89971', 'mailing');
INSERT INTO `meta_address` VALUES(34, 'ADD-130102-010-A', '207-1512 Tincidunt Street', 'Paducah', 'ME', 'US', '22890', 'residential');
INSERT INTO `meta_address` VALUES(35, 'ADD-130102-011-A', '526 Magna Ave', 'Sunnyvale', 'NV', 'US', '08238', 'residential');
INSERT INTO `meta_address` VALUES(36, 'ADD-130115-001-A', 'P.O. Box 550, 8587 Cursus Ave', 'Moultrie', 'NC', 'US', '44940', 'mailing');
INSERT INTO `meta_address` VALUES(37, 'ADD-130115-002-A', '6102 Ut Rd.', 'Wichita', 'CO', 'US', '38147', 'business');
INSERT INTO `meta_address` VALUES(38, 'ADD-130115-003-A', 'P.O. Box 456, 1770 Aliquet Rd.', 'Rye', 'AL', 'US', '88494', 'residential');
INSERT INTO `meta_address` VALUES(39, 'ADD-130115-004-A', 'P.O. Box 868, 8559 Phasellus St.', 'Cranston', 'SC', 'US', '86932', 'business');
INSERT INTO `meta_address` VALUES(40, 'ADD-130115-005-A', '568-4074 Massa. St.', 'Charlotte', 'AZ', 'US', '89966', 'business');
INSERT INTO `meta_address` VALUES(41, 'ADD-130115-006-A', '184-3425 Tristique Rd.', 'Moreno Valley', 'NC', 'US', '92987', 'residential');
INSERT INTO `meta_address` VALUES(42, 'ADD-130122-001-A', 'P.O. Box 966, 1567 Orci Street', 'Johnson City', 'MS', 'US', '38025', 'residential');
INSERT INTO `meta_address` VALUES(43, 'ADD-130122-002-A', '237-3429 A, St.', 'Hollister', 'MN', 'US', '78306', 'mailing');
INSERT INTO `meta_address` VALUES(44, 'ADD-130122-003-A', 'P.O. Box 497, 4543 Massa Ave', 'Shelton', 'SC', 'US', '43203', 'business');

-- --------------------------------------------------------

--
-- Table structure for table `meta_countries`
--

CREATE TABLE `meta_countries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `meta_countries`
--


-- --------------------------------------------------------

--
-- Table structure for table `meta_states`
--

CREATE TABLE `meta_states` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `meta_states`
--


-- --------------------------------------------------------

--
-- Table structure for table `mind_answers`
--

CREATE TABLE `mind_answers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `record` varchar(20) NOT NULL DEFAULT '',
  `question` varchar(20) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `mind_answers`
--


-- --------------------------------------------------------

--
-- Table structure for table `mind_questions`
--

CREATE TABLE `mind_questions` (
  `_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL DEFAULT '',
  `title` varchar(20) NOT NULL DEFAULT '',
  `category` int(11) DEFAULT NULL,
  `subcategory` int(11) DEFAULT NULL,
  `difficulty` int(11) DEFAULT NULL,
  `content` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `mind_questions`
--


-- --------------------------------------------------------

--
-- Table structure for table `mind_scores`
--

CREATE TABLE `mind_scores` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `mind_scores`
--


-- --------------------------------------------------------

--
-- Table structure for table `mind_subjects`
--

CREATE TABLE `mind_subjects` (
  `_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `category` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subcategory` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `difficulty` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `tags` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `record` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `mind_subjects`
--

INSERT INTO `mind_subjects` VALUES(1, 'SUB-120229-001-A', 'American History 101', 'history', 'american', 'easy', 'american, 19th Century', 'Mea democritum neglegentur ad, in erant euismod has, rebum tantas doming nam te. An quo movet indoctum, singulis cotidieque ut eam? Quas tantas quidam cum ne, an qui adhuc tamquam, eam ad vidit affert commune?');
INSERT INTO `mind_subjects` VALUES(2, 'SUB-120229-002-A', 'Introductory Algebra', 'math', 'algebra', 'easy', 'algebra', 'Lorem ipsum dolor sit amet, quo elit mazim aliquid at, delenit fierent insolens sea cu? Ius errem feugait accusam id, brute inciderint sea eu, ex quas fierent pro? Ei sonet nobis adipisci sed, vim ad vivendo denique periculis. Sed te melius noluisse evertitur, ocurreret gloriatur in eum. Decore dicunt usu te, vim te putent mediocritatem, affert deserunt cum ne.\n\nAd viris hendrerit has, ei soluta quidam mel. Viris tibique in qui. Euismod blandit tincidunt ne eos, sed ea dico libris. Nam ei quando essent malorum, vide duis etiam id est! Vim impedit graecis eu, id sit illud ipsum reprehendunt.\n\nExpetenda accommodare ea nec, in eros perpetua senserit qui? An percipit vulputate cum, erat doming suscipiantur ea est, cum ne maiestatis mediocritatem. Mea democritum neglegentur ad, in erant euismod has, rebum tantas doming nam te. An quo movet indoctum, singulis cotidieque ut eam? Quas tantas quidam cum ne, an qui adhuc tamquam, eam ad vidit affert commune?');
INSERT INTO `mind_subjects` VALUES(3, 'SUB-120229-003-A', 'Circuit Design', 'science', 'electricity', 'hard', 'electronics, circuits', 'Ad viris hendrerit has, ei soluta quidam mel. Viris tibique in qui. Euismod blandit tincidunt ne eos, sed ea dico libris. Nam ei quando essent malorum, vide duis etiam id est! Vim impedit graecis eu, id sit illud ipsum reprehendunt.\n\nExpetenda accommodare ea nec, in eros perpetua senserit qui? An percipit vulputate cum, erat doming suscipiantur ea est, cum ne maiestatis mediocritatem. Mea democritum neglegentur ad, in erant euismod has, rebum tantas doming nam te. An quo movet indoctum, singulis cotidieque ut eam? Quas tantas quidam cum ne, an qui adhuc tamquam, eam ad vidit affert commune?\n\nHis ceteros noluisse splendide cu, mucius accusamus no eum, sit et probo summo quidam. Ut rebum copiosae voluptatum his! Duo soluta repudiandae ea, sea legimus phaedrum eu, mea nibh bonorum sapientem ne! Et tota velit facilis quo, tale habeo mollis ad cum. Id per insolens assentior, ipsum admodum delicata mel no.\n\nEt sea posse virtute ponderum, noster alienum delicata mea an, vidit similique cu mel! Usu id nostro facilisis. Omnes oportere ei mea, graece officiis definiebas eam ea, an fierent nominati his. Ius altera alienum senserit in. Ei doming menandri tincidunt sit, idque oratio hendrerit id nam?\n\nReque falli ne eam, similique efficiendi quo no. Sea id solet phaedrum, sit no partem facilis, impetus eligendi efficiantur et eum! Mea eius persequeris ea, an sed ullum eirmod, vis id etiam lucilius. Mel omnis ubique ad, ad vis labore quidam intellegat? Eu his ferri populo ridens, alienum commune usu et, no primis labores vix. Pro ex modus ubique vidisse?\n\nEt vim utamur postulant, vim tamquam probatus ex? Est sint atomorum an? Te sea malis mediocritatem, et ius consul officiis postulant. Modo oratio aliquando et eam.\n\nIudico tollit iriure his te. No eam graecis mediocritatem, pro ut putent accusata, tempor integre lobortis ne vel. At mei civibus blandit, adhuc consequuntur te eam, eu sed mazim perfecto efficiantur. Quando laboramus intellegebat ea sea, vel ea saepe impetus senserit? Dolor accusamus nec te, pri in sanctus vulputate comprehensam, ne clita ridens feugait mea!\n\nId sint epicurei concludaturque sit, an qui errem deserunt dissentiunt. Ut usu primis assentior. Est viris clita ex, ut odio menandri mea, te eum dicit facilisis theophrastus. An quo mundi appareat, vivendo civibus eligendi vis an. Ea vix oratio mollis, ad per lucilius maluisset mediocritatem? Errem molestie liberavisse ne sed, cu his habemus molestie.');
INSERT INTO `mind_subjects` VALUES(4, 'SUB-120701-001-A', 'Common Grammar Mistakes', 'english', 'grammar', 'intermediate', 'grammar, mistakes', 'Reque falli ne eam, similique efficiendi quo no. Sea id solet phaedrum, sit no partem facilis, impetus eligendi efficiantur et eum! Mea eius persequeris ea, an sed ullum eirmod, vis id etiam lucilius. Mel omnis ubique ad, ad vis labore quidam intellegat? Eu his ferri populo ridens, alienum commune usu et, no primis labores vix. Pro ex modus ubique vidisse?\n\nEt vim utamur postulant, vim tamquam probatus ex? Est sint atomorum an? Te sea malis mediocritatem, et ius consul officiis postulant. Modo oratio aliquando et eam.\n\nIudico tollit iriure his te. No eam graecis mediocritatem, pro ut putent accusata, tempor integre lobortis ne vel. At mei civibus blandit, adhuc consequuntur te eam, eu sed mazim perfecto efficiantur. Quando laboramus intellegebat ea sea, vel ea saepe impetus senserit? Dolor accusamus nec te, pri in sanctus vulputate comprehensam, ne clita ridens feugait mea!\n\nId sint epicurei concludaturque sit, an qui errem deserunt dissentiunt. Ut usu primis assentior. Est viris clita ex, ut odio menandri mea, te eum dicit facilisis theophrastus. An quo mundi appareat, vivendo civibus eligendi vis an. Ea vix oratio mollis, ad per lucilius maluisset mediocritatem? Errem molestie liberavisse ne sed, cu his habemus molestie.');
INSERT INTO `mind_subjects` VALUES(5, 'SUB-120701-002-A', 'How to do your taxes', 'personal', 'financial', 'intermediate', 'taxes, diy', 'Expetenda accommodare ea nec, in eros perpetua senserit qui? An percipit vulputate cum, erat doming suscipiantur ea est, cum ne maiestatis mediocritatem. Mea democritum neglegentur ad, in erant euismod has, rebum tantas doming nam te. An quo movet indoctum, singulis cotidieque ut eam? Quas tantas quidam cum ne, an qui adhuc tamquam, eam ad vidit affert commune?\n\nHis ceteros noluisse splendide cu, mucius accusamus no eum, sit et probo summo quidam. Ut rebum copiosae voluptatum his! Duo soluta repudiandae ea, sea legimus phaedrum eu, mea nibh bonorum sapientem ne! Et tota velit facilis quo, tale habeo mollis ad cum. Id per insolens assentior, ipsum admodum delicata mel no.\n\nEt sea posse virtute ponderum, noster alienum delicata mea an, vidit similique cu mel! Usu id nostro facilisis. Omnes oportere ei mea, graece officiis definiebas eam ea, an fierent nominati his. Ius altera alienum senserit in. Ei doming menandri tincidunt sit, idque oratio hendrerit id nam?\n\nReque falli ne eam, similique efficiendi quo no. Sea id solet phaedrum, sit no partem facilis, impetus eligendi efficiantur et eum! Mea eius persequeris ea, an sed ullum eirmod, vis id etiam lucilius. Mel omnis ubique ad, ad vis labore quidam intellegat? Eu his ferri populo ridens, alienum commune usu et, no primis labores vix. Pro ex modus ubique vidisse?\n\nEt vim utamur postulant, vim tamquam probatus ex? Est sint atomorum an? Te sea malis mediocritatem, et ius consul officiis postulant. Modo oratio aliquando et eam.\n\nIudico tollit iriure his te. No eam graecis mediocritatem, pro ut putent accusata, tempor integre lobortis ne vel. At mei civibus blandit, adhuc consequuntur te eam, eu sed mazim perfecto efficiantur. Quando laboramus intellegebat ea sea, vel ea saepe impetus senserit? Dolor accusamus nec te, pri in sanctus vulputate comprehensam, ne clita ridens feugait mea!');

-- --------------------------------------------------------

--
-- Table structure for table `self_beliefs`
--

CREATE TABLE `self_beliefs` (
  `_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `category` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tags` varchar(40) COLLATE utf8_unicode_ci DEFAULT '',
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `record` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `self_beliefs`
--

INSERT INTO `self_beliefs` VALUES(1, 'BEL-120701-001-A', 'Modern Islam', 'islam', '21st century', 'Audiam legimus in cum, populo pericula assueverit ne nam, nam habemus convenire vituperatoribus te. Eu malis graeco vituperatoribus mea, est ne splendide intellegebat, ei natum vitae vim. Eam no suas putant inciderint, qui an dicunt labores, dicta referrentur in vix. Ius ullum ubique essent cu. Te ius laoreet nominavi, in saperet accumsan omnesque eos, option latine cu duo. Sanctus postulant qualisque eos te, atqui pertinacia ex sit.\n\nAn quem justo viderer vix, dico ridens sed id, ea aperiam definitionem eos. Oratio scripta eloquentiam id duo, te altera quaeque sadipscing sea! Ex eam mazim intellegam quaerendum, reque imperdiet at mel? Dolores praesent et eam? Ne iusto scribentur eos.');
INSERT INTO `self_beliefs` VALUES(2, 'BEL-120701-002-A', 'King David', 'judaism', 'king david', 'Probo ubique cu cum. Audire iuvaret voluptatum ut his, pro illud audiam concludaturque ne.\n\nAudiam legimus in cum, populo pericula assueverit ne nam, nam habemus convenire vituperatoribus te. Eu malis graeco vituperatoribus mea, est ne splendide intellegebat, ei natum vitae vim. Eam no suas putant inciderint, qui an dicunt labores, dicta referrentur in vix. Ius ullum ubique essent cu. Te ius laoreet nominavi, in saperet accumsan omnesque eos, option latine cu duo. Sanctus postulant qualisque eos te, atqui pertinacia ex sit.');
INSERT INTO `self_beliefs` VALUES(3, 'BEL-120701-003-A', 'Jesus & The Last Supper', 'christianity', 'jesus, last supper', 'Sanctus postulant qualisque eos te, atqui pertinacia ex sit.\n\nAn quem justo viderer vix, dico ridens sed id, ea aperiam definitionem eos. Oratio scripta eloquentiam id duo, te altera quaeque sadipscing sea! Ex eam mazim intellegam quaerendum, reque imperdiet at mel? Dolores praesent et eam? Ne iusto scribentur eos.');
INSERT INTO `self_beliefs` VALUES(4, 'BEL-120709-001-A', 'The way of the Buddha', 'buddhism', 'principles, lifestyle', 'Verti delicata vel? Erant labore dignissim est at, ius ex essent aperiam oporteat. Vitae tempor invenire est ut, id mea primis discere appareat? Perfecto dissentiet per et, vidit brute eu mei, mel fierent salutatus in.\n\nCum an choro placerat philosophia, ei agam paulo ocurreret vix! Est fuisset mandamus cu, cu pri perpetua adipiscing. Molestie voluptua duo ad, te assum recteque scribentur vix! Habeo nullam cu usu, pri ea civibus persequeris consectetuer, usu ei persecuti deseruisse.');
INSERT INTO `self_beliefs` VALUES(5, 'BEL-120709-002-A', 'Why I don''t believe in God', 'atheism', 'god, atheism', 'Option accusamus ei per! Ut vis veri iudico erroribus. Quo cu quot purto simul?\n\nSimilique sadipscing pro in, mei no primis lobortis, oratio consul incorrupte ad nec. Hinc facer aeterno eu duo. Ei mea justo choro nostrud, vitae quaeque corrumpit sea ad? Ei ius natum nobis iudicabit, mei alienum phaedrum expetenda te, mel tota veri debet cu. Te vix quodsi quaestio, sit placerat deseruisse te, nam error zril fastidii at? Te quot officiis pri, mea ea vivendo oporteat');

-- --------------------------------------------------------

--
-- Table structure for table `self_quotes`
--

CREATE TABLE `self_quotes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `self_quotes`
--


-- --------------------------------------------------------

--
-- Table structure for table `self_ranks`
--

CREATE TABLE `self_ranks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `self_ranks`
--


-- --------------------------------------------------------

--
-- Table structure for table `self_timeline`
--

CREATE TABLE `self_timeline` (
  `_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `category` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tags` varchar(40) COLLATE utf8_unicode_ci DEFAULT '',
  `date` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `time` varchar(6) CHARACTER SET utf8 DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `record` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `self_timeline`
--

INSERT INTO `self_timeline` VALUES(1, 'TIM-120701-001-A', 'First day of Church', 'change', 'church', '080430', '01:00p', 'Vel solum reprehendunt in, nam eu decore facilis indoctum. Omnes albucius per et? Eum ut ocurreret voluptaria! Purto maluisset ea vis, ex simul ancillae eum, graece iisque percipit ad nec!\n\nDuo cetero imperdiet in, admodum phaedrum dissentiunt pri ex. Ne vis soluta consulatu concludaturque. Id integre omittam offendit cum, no nisl tincidunt eos, oblique aliquam eligendi te eos. Agam probo atqui per eu, aeque ornatus constituto mea ad.', 'ADD-121111-003-A');
INSERT INTO `self_timeline` VALUES(2, 'TIM-120701-002-A', 'Quit drinking alcohol', 'epiphany', 'alcohol, quit', '990312', NULL, 'Ne vis soluta consulatu concludaturque. Id integre omittam offendit cum, no nisl tincidunt eos, oblique aliquam eligendi te eos. Agam probo atqui per eu, aeque ornatus constituto mea ad.\n\nQui fugit propriae noluisse ne, qui vivendum rationibus id, te insolens necessitatibus mea. Est ad assum fuisset, est eruditi tibique insolens id? Diam illum signiferumque ea nam, per solum primis honestatis ut, ut diam copiosae mnesarchum eam? Nam ad sone', 'ADD-121111-004-A');
INSERT INTO `self_timeline` VALUES(3, 'TIM-120701-003-A', 'Questioned God', 'doubt', 'doubt, god', '050715', '03:00a', 'Quando nonumes ex quo, expetenda abhorreant eu mei, ut maiorum phaedrum mea. Docendi forensibus nam at, id aeterno ullamcorper est, odio adhuc aliquando usu cu. No usu eros magna dolores, his sint ornatus gloriatur ad, vis verear laoreet singulis in. Habemus adipisci reprimique quo an, veri quidam causae at quo?\n\nNe aeque denique repudiare eos! Velit melius no nam. Ut usu facer vitae reprehendunt. Id modo sale rebum est. Sea in prima oratio assentior, per libris forensibus constituto no. Per id sint mollis signiferumque, ea modus sanctus qui?', 'ADD-121111-005-A');
INSERT INTO `self_timeline` VALUES(4, 'TIM-120803-001-A', 'Reclaim Faith', 'reaffirm', 'strengthen, faith', '110901', NULL, 'Semper periculis imperdiet ne per. Menandri suavitate no cum, ea lorem movet dignissim nec, mutat senserit percipitur cu sit. Id sea ludus omnium labitur, ei his nonumes democritum, vim cu omnium quaestio scripserit. Vix ei commune dissentiunt ullamcorper. Iisque iuvaret eos te, sit habemus partiendo comprehensam in.\n\nEst scaevola pertinacia eloquentiam et? Et his noluisse molestiae persecuti, at dicant feugiat urbanitas eos. Vix assentior constituto scripserit ne. Et mei labores delectus menandri, ne platonem persecuti pri. Vel quem sint dissentiunt ad! Vim duis accusamus ne.', 'ADD-121111-006-A');

-- --------------------------------------------------------

--
-- Table structure for table `voice_bills`
--

CREATE TABLE `voice_bills` (
  `_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL DEFAULT '',
  `debate` varchar(20) NOT NULL DEFAULT '',
  `rep` varchar(20) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `question` varchar(80) NOT NULL DEFAULT '',
  `deadline` datetime NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `voice_bills`
--

INSERT INTO `voice_bills` VALUES(1, 'SPO-120812-001-A', 'DEB-120229-001-A', 'USE-120704-001-A', 'Sint rebum in mea, case facilis dissentiet eu nec! Invenire dissentiunt vim at. Vis error sonet no. Apeirian scriptorem ut duo? Unum augue in his, sed ut consulatu laboramus, omnesque probatus principes mei ut. No decore molestiae similique qui, ea vel bonorum fierent!\n\nQuot errem primis pro ut, congue definiebas eum ut, usu sumo audiam neglegentur ex? Usu te deleniti scaevola? Ius in ferri harum. Ubique indoctum hendrerit eam ne. Eu soluta putent vis.', 'Should we spend $1.2 Million on the High School?', '2013-02-15 01:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `voice_budget`
--

CREATE TABLE `voice_budget` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(20) NOT NULL DEFAULT '',
  `scope` varchar(10) NOT NULL DEFAULT '',
  `zip` varchar(5) NOT NULL DEFAULT '',
  `category` varchar(20) NOT NULL DEFAULT '',
  `party` varchar(20) NOT NULL DEFAULT '',
  `status` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `voice_budget`
--

INSERT INTO `voice_budget` VALUES(1, 'USE-120704-001-A', 'local', '03826', 'selectman', 'republican', 'active');
INSERT INTO `voice_budget` VALUES(2, 'USE-120812-002-A', 'state', '03865', 'representative', 'democrat', 'campaigning');
INSERT INTO `voice_budget` VALUES(3, 'USE-120905-002-A', 'national', '94041', 'senator', 'republican', 'inactive');

-- --------------------------------------------------------

--
-- Table structure for table `voice_debates`
--

CREATE TABLE `voice_debates` (
  `_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scope` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `category` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tags` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `zip` varchar(5) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`_id`),
  UNIQUE KEY `record` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `voice_debates`
--

INSERT INTO `voice_debates` VALUES(1, 'DEB-120229-001-A', 'Increase school budget: $1.2 Million', 'local', 'fiscal', 'school', 'No eam graecis mediocritatem, pro ut putent accusata, tempor integre lobortis ne vel. At mei civibus blandit, adhuc consequuntur te eam, eu sed mazim perfecto efficiantur. Quando laboramus intellegebat ea sea, vel ea saepe impetus senserit? Dolor accusamus nec te, pri in sanctus vulputate comprehensam, ne clita ridens feugait mea!', '03826');
INSERT INTO `voice_debates` VALUES(2, 'DEB-120229-002-A', 'Federal Reserve Reform', 'national', 'regulation', 'banking, reform', 'Te sea malis mediocritatem, et ius consul officiis postulant. Modo oratio aliquando et eam.\n\nIudico tollit iriure his te. No eam graecis mediocritatem, pro ut putent accusata, tempor integre lobortis ne vel. At mei civibus blandit, adhuc consequuntur te eam, eu sed mazim perfecto efficiantur. Quando laboramus intellegebat ea sea, vel ea saepe impetus senserit? Dolor accusamus nec te, pri in sanctus vulputate comprehensam, ne clita ridens feugait mea!\n\nId sint epicurei concludaturque sit, an qui errem deserunt dissentiunt. Ut usu primis assentior. Est viris clita ex, ut odio menandri mea, te eum dicit facilisis theophrastus. An quo mundi appareat, vivendo civibus eligendi vis an. Ea vix oratio mollis, ad per lucilius maluisset mediocritatem? Errem molestie liberavisse ne sed, cu his habemus molestie.', '94041');
INSERT INTO `voice_debates` VALUES(3, 'DEB-120229-003-A', 'Lower the tolls: I93', 'state', 'taxes', 'infrastructure, tolls', 'Errem molestie liberavisse ne sed, cu his habemus molestie.\n\nDolorum convenire explicari ei sit, mei at propriae forensibus dissentiet, phaedrum ocurreret constituto ad sea. Cum cu iuvaret eruditi percipitur, veritus noluisse abhorreant id per. Te vis autem vivendo, eu quo diceret ornatus? Exerci suscipit disputationi no eos! Vis volutpat pericula ex, ex mei dicam semper integre.', '03826');
INSERT INTO `voice_debates` VALUES(4, 'DEB-120701-001-A', 'Remove median Rt 125: $120k', 'local', 'fiscal', 'roads, infrastructure', 'Reque falli ne eam, similique efficiendi quo no. Sea id solet phaedrum, sit no partem facilis, impetus eligendi efficiantur et eum! Mea eius persequeris ea, an sed ullum eirmod, vis id etiam lucilius. Mel omnis ubique ad, ad vis labore quidam intellegat? Eu his ferri populo ridens, alienum commune usu et, no primis labores vix. Pro ex modus ubique vidisse?', '03865');
INSERT INTO `voice_debates` VALUES(5, 'DEB-120701-002-A', 'Alternative to stricter gun laws', 'national', 'law', 'issue, rights', 'Duo soluta repudiandae ea, sea legimus phaedrum eu, mea nibh bonorum sapientem ne! Et tota velit facilis quo, tale habeo mollis ad cum. Id per insolens assentior, ipsum admodum delicata mel no.\n\nEt sea posse virtute ponderum, noster alienum delicata mea an, vidit similique cu mel! Usu id nostro facilisis. Omnes oportere ei mea, graece officiis definiebas eam ea, an fierent nominati his. Ius altera alienum senserit in. Ei doming menandri tincidunt sit, idque oratio hendrerit id nam?', '94041');

-- --------------------------------------------------------

--
-- Table structure for table `voice_votes`
--

CREATE TABLE `voice_votes` (
  `_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL DEFAULT '',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `vote` varchar(1) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `source` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `voice_votes`
--

INSERT INTO `voice_votes` VALUES(1, 'VOT-130119-001-A', '2013-01-20 21:54:05', 'y', 'Per error erant at, an modo ludus mea, vel quas ullum minim an? At est quod alii mundi. Indoctum dignissim ne mel. Cu altera repudiandae disputationi sed, no scripta pertinacia repudiandae eos, et solet graeco complectitur quo. Quo augue blandit apeirian ut, nam quem intellegam in?\n\nUt sumo tractatos vim! Per eu elit utinam aliquando, vel ei idque regione recteque. Ne propriae quaestio est! Cu vim purto consectetuer necessitatibus! Nominavi vituperata et nec.', 'SPO-120812-001-A');
INSERT INTO `voice_votes` VALUES(2, 'VOT-130119-002-A', '2013-01-20 21:54:06', 'n', 'Quot errem primis pro ut, congue definiebas eum ut, usu sumo audiam neglegentur ex? Usu te deleniti scaevola? Ius in ferri harum. Ubique indoctum hendrerit eam ne. Eu soluta putent vis.\n\nVide dolor inciderint his eu, ei prompta nusquam senserit his. Per error erant at, an modo ludus mea, vel quas ullum minim an? At est quod alii mundi. Indoctum dignissim ne mel. Cu altera repudiandae disputationi sed, no scripta pertinacia repudiandae eos, et solet graeco complectitur quo. Quo augue blandit apeirian ut, nam quem intellegam in?\n\nUt sumo tractatos vim! Per eu elit utinam aliquando, vel ei idque regione recteque. Ne propriae quaestio est! Cu vim purto consectetuer necessitatibus! Nominavi vituperata et nec.\n\nDuis delicata definitionem et cum, pri te omnium fabulas tacimates, ex mea brute movet. Erat everti cetero per no, ex ferri dicam timeam per? Cu nobis splendide eos. Quo dicunt feugait senserit at, an quo elit pericula mnesarchum?', 'SPO-120812-001-A');
