/** NOTES **/
# NULL keys, no FK (address, views)
# Only one FK used in Dual-key instances (members, reviews, events, comments, favorites, thumbs)
# Primary objects, no FK (users, orgs)
# links inactive
# Triple-key (answers, bills, votes)



/** APP **/

# -> app_address: NULL keys, no FK

# app_orgs: primary object, no FK

ALTER TABLE `app_posts`
  ADD CONSTRAINT `app_posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`);

# app_users: primary object, no FK



/** META **/

# -> links: inactive

ALTER TABLE `meta_tags`
  ADD CONSTRAINT `meta_tags_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);



/** ORG **/
ALTER TABLE `org_clout`
  ADD CONSTRAINT `org_clout_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `app_orgs` (`id`);
  
ALTER TABLE `org_members`
  ADD CONSTRAINT `org_members_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `app_orgs` (`id`);
  
/** DISABLED: 2nd key for members (user_id)  
ALTER TABLE `org_members`
  ADD CONSTRAINT `org_members_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`);
*/
  
ALTER TABLE `org_reviews`
  ADD CONSTRAINT `org_reviews_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `app_orgs` (`id`);
  
/** DISABLED: 2nd key for reviews (user_id)  
ALTER TABLE `org_reviews`
  ADD CONSTRAINT `org_reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`);
*/
 
 
 
/** POST **/
ALTER TABLE `post_answers`
  ADD CONSTRAINT `post_answers_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);

/** DISABLED: 2nd key for answers (question_id)  
ALTER TABLE `post_answers`
  ADD CONSTRAINT `post_answers_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `post_questions` (`id`);
*/

/** DISABLED: 3rd key for answers (user_id)  
ALTER TABLE `post_answers`
  ADD CONSTRAINT `post_answers_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`);
*/

ALTER TABLE `post_beliefs`
  ADD CONSTRAINT `post_beliefs_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);
  
ALTER TABLE `post_bills`
  ADD CONSTRAINT `post_bills_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);

/** DISABLED: 2nd key for bills (rep_id)  
ALTER TABLE `post_bills`
  ADD CONSTRAINT `post_bills_ibfk_2` FOREIGN KEY (`rep_id`) REFERENCES `app_users` (`id`);
*/

/** DISABLED: 3rd key for bills (debate_id)  
ALTER TABLE `post_bills`
  ADD CONSTRAINT `post_bills_ibfk_3` FOREIGN KEY (`debate_id`) REFERENCES `post_debates` (`post_id`);
*/
  
ALTER TABLE `post_blogs`
  ADD CONSTRAINT `post_blogs_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);

ALTER TABLE `post_debates`
  ADD CONSTRAINT `post_debates_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);
  
ALTER TABLE `post_events`
  ADD CONSTRAINT `post_events_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);

/** DISABLED: 2nd key for events (address_id)  
ALTER TABLE `post_events`
  ADD CONSTRAINT `post_events_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `app_address` (`id`);
*/

ALTER TABLE `post_questions`
  ADD CONSTRAINT `post_questions_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);

ALTER TABLE `post_quotes`
  ADD CONSTRAINT `post_quotes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);

ALTER TABLE `post_subjects`
  ADD CONSTRAINT `post_subjects_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);

ALTER TABLE `post_timeline`
  ADD CONSTRAINT `post_timeline_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);

/** DISABLED: 2nd key for timeline (address_id)  
ALTER TABLE `post_timeline`
  ADD CONSTRAINT `post_timeline_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `app_address` (`id`);
*/

ALTER TABLE `post_votes`
  ADD CONSTRAINT `post_votes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);

/** DISABLED: 2nd key for votes (bill_id)  
ALTER TABLE `post_bills`
  ADD CONSTRAINT `post_bills_ibfk_2` FOREIGN KEY (`bill_id`) REFERENCES `post_bills` (`id`);
*/

/** DISABLED: 3rd key for votes (user_id)  
ALTER TABLE `post_bills`
  ADD CONSTRAINT `post_bills_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`);
*/

/** SOCIAL **/
ALTER TABLE `social_comments`
  ADD CONSTRAINT `social_comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);

/** DISABLED: 2nd key for comments (user_id)    
ALTER TABLE `social_comments`
  ADD CONSTRAINT `social_comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`);
*/
  
ALTER TABLE `social_favorites`
  ADD CONSTRAINT `social_favorites_ibfk_1` FOREIGN KEY (`target_id`) REFERENCES `app_users` (`id`);

/** DISABLED: 2nd key for favorites (user_id)    
ALTER TABLE `social_favorites`
  ADD CONSTRAINT `social_favorites_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`);
*/

ALTER TABLE `social_thumbs`
  ADD CONSTRAINT `social_thumbs_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);

/** DISABLED: 2nd key for thumbs (user_id)    
ALTER TABLE `social_thumbs`
  ADD CONSTRAINT `social_thumbs_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`);
*/
  
# -> social_views: NULL keys, no FK  
    
    
    
/** USER **/
ALTER TABLE `user_passwords`
  ADD CONSTRAINT `user_passwords_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`);
  
ALTER TABLE `user_tokens`
  ADD CONSTRAINT `user_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`);