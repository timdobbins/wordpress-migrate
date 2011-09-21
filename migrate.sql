#Update the crucial options
UPDATE wp_options
  SET option_value = 'http://newdomain.com'
  WHERE option_name in ('siteurl', 'home');
#Make sure search engines can access the deployed site
UPDATE wp_options
  SET option_value = 1
  WHERE option_name = 'blog_public';
#Set the GUIDs to have the correct domain
UPDATE wp_posts
  SET guid = REPLACE(guid, 'olddomain.com', 'newdomain.com');
#Update post content so internal links go to the correct place
UPDATE wp_posts
  SET post_content = REPLACE(post_content, 'olddomain.com', 'newdomain.com');
#Make sure full paths in custom fields are updated.
UPDATE wp_postmeta
  SET meta_value = REPLACE(meta_value, 'olddomain.com', 'newdomain.com');
