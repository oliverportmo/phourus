ALTER TABLE `app_clout`
  ADD CONSTRAINT `app_clout_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `app_orgs` (`id`);

ALTER TABLE `app_comments`
  ADD CONSTRAINT `app_comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`);

ALTER TABLE `app_follows`
  ADD CONSTRAINT `app_follows_ibfk_1` FOREIGN KEY (`target_id`) REFERENCES `app_users` (`id`);

ALTER TABLE `app_orgs`
  ADD CONSTRAINT `app_orgs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`);

ALTER TABLE `app_posts`
  ADD CONSTRAINT `app_posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`);

ALTER TABLE `app_reviews`
  ADD CONSTRAINT `app_reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`);

ALTER TABLE `app_thumbs`
  ADD CONSTRAINT `app_thumbs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`);

ALTER TABLE `app_tokens`
  ADD CONSTRAINT `app_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`);

ALTER TABLE `core_blogs`
  ADD CONSTRAINT `core_blogs_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);

ALTER TABLE `core_events`
  ADD CONSTRAINT `core_events_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);

ALTER TABLE `core_ideas`
  ADD CONSTRAINT `core_ideas_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);

ALTER TABLE `core_links`
  ADD CONSTRAINT `core_links_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);

ALTER TABLE `earth_calculator`
  ADD CONSTRAINT `earth_calculator_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);

ALTER TABLE `earth_checklist`
  ADD CONSTRAINT `earth_checklist_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);

ALTER TABLE `earth_matters`
  ADD CONSTRAINT `earth_matters_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);

ALTER TABLE `mind_answers`
  ADD CONSTRAINT `mind_answers_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);

ALTER TABLE `mind_questions`
  ADD CONSTRAINT `mind_questions_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);

ALTER TABLE `mind_subjects`
  ADD CONSTRAINT `mind_subjects_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);

ALTER TABLE `self_beliefs`
  ADD CONSTRAINT `self_beliefs_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);

ALTER TABLE `self_quotes`
  ADD CONSTRAINT `self_quotes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);

ALTER TABLE `self_timeline`
  ADD CONSTRAINT `self_timeline_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);

ALTER TABLE `voice_bills`
  ADD CONSTRAINT `voice_bills_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);

ALTER TABLE `voice_debates`
  ADD CONSTRAINT `voice_debates_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);

ALTER TABLE `voice_votes`
  ADD CONSTRAINT `voice_votes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `app_posts` (`id`);