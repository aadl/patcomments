README.txt
==========

Patron Comments Module (patcomments) is a module for collecting, storing, responding to, and publicly displaying comments. Comments are assigned to categories and referred to different email accounts based upon those categories.

All code originally developed by and for the use of the Ann Arbor District Library, Ann Arbor, MI. Some text in the code may be specific to our installation and may need to be modified for other usage.

Licenced under the GPL v2. (See LICENSE.txt)

/* == INSTALLATION == */

1) Create MySQL Database

The patcomments module stores all of its data in a separate MySQL database, which you must create manually. Once created, place the database connection information into your drupal install's settings.php file in the the $db_url section with an index of 'patcomments'. For example, if you had a database on the localhost named 'patron_comments' with a MySQL account "user" and password "pass", you would put the following connection string in the settings.php file:

$db_url['patcomments'] = 'mysqli://user:pass@localhost/patron_comments';

2) Create Database Tables

Run the patcomments.sql commands on your database to create the tables for the patcomments data

3) Populate Tables

You will need to manually enter data into some of the DB tables as follows:

  a) refer_comment: entities to be assigned comments; enter a name and an email address for each entity. Example:

  (Allow DB to auto assign ref_id)
  refer_to = 'IT' (Name of entity)
  refer_value = 'it@ourlib.org' (email address of entity)

  b) type: comment categories to present to the user, specifies a refer id of the entity to which it will be assigned. (*If you wish to use the Suggest a Title feature, you must create a comment type where the type field = 'suggest a title')

  (Allow DB to auto assign ty_id)
  type = 'compliment' (name of category)
  init_refer = 1 (ref_id of entity to assign)
  autoclose = 0 (automatically close this comment, no response needed)
  pub_display = 1 (display this category in the dropdown list for the comment form on the public site)
  pathcode = 'compliment' (if you put this text in the url after 'contactus/', no other category options will display on public site)

  c) regarding: secondary category to group comments, used by the admins

  (Allow DB to auto assign reg_id)
  regarding: 'website' (name of category)

  d) location: assign comments to a location, used by admins. In order to work properly, there needs to be an entry with the loc_name = 'Online'.

  (Allow DB to auto assign loc_id)
  loc_name: 'Online' (name of location)

  e) suggest_categories: Allow different categories of titles to be routed to different selectors. In order to work properly, there needs to be an entry with the description = 'Other'.

  (Allow DB to auto assign id)
  description: 'DVDs' (name of title category)
  email: selector@ourlib.org (email of selector for the category)
  name: John Selector (Full name of selector)

  f) source: comment sources. In order to work properly, there needs to be an entry with the source = 'website'.

  (Allow DB to auto assign sou_id)
  source: 'card' (name of the comment source)

  g) status: comment status descriptions. The install script should have created entries for this table automatically. You may add/modify the entries in this table but the code looks for the following statuses to function properly: 'New', 'AutoClose', and 'Closed-emailed'.

4) Install Drupal Module

Enable the module in the module list and set permissions. In order to create/view patron comments, you need the 'access patcomments' permission. To edit/respond to patcomments, you need the 'administer patcomments' permission.

You'll need to set your Institution name and suggestion reply email address at 'admin/settings/contactus'. Public form drupal path at 'contactus'. Admin interface drupal path is 'admin/contactus'. Look at the patcomments_menu() function for more path names.

/* == CONTACT INFO == */

Maintainer: Eric J. Klooster (ejk@aadl.org, twitter: @ejk)
Administrator: Eli Neiburger (eli@aadl.org)