# Postmortem
Upon the release of ALX School's System Engineering & DevOps project 0x19, approximately 00:05 (GMT+1), an outage occurred on an isolated Ubuntu 20.04 container running an Apache web server. GET requests on the server led to`500 Internal Server Error's, when the expected response was an HTML file defining a simple School WordPress site.

## [](https://github.com/Onielcares/alx-system_engineering-devops/tree/main/0x19-postmortem#debugging-process)Debugging Process
Bug debugger, Nathaniel Dehinbo encountered the issue upon opening the project and being, well, instructed to
address it, roughly 21:51 WAT. He promptly proceeded to undergo solving the problem.

1.  Checked running processes using  `ps aux`. Two  `apache2`  processes -  `root`  and  `www-data`  - were properly running.
    
2.  Looked in the  `sites-available`  folder of the  `/etc/apache2/`  directory. Determined that the web server was serving content located in  `/var/www/html/`.
3.  In one terminal, ran  `strace`  on the PID of the  `root`  Apache process. In another, curled the server. Expected great things... only to be disappointed.  `strace`  gave no useful information.
    
4.  Repeated step 3, except on the PID of the  `www-data`  process. Kept expectations lower this time... but was rewarded!  `strace`  revelead an  `-1 ENOENT (No such file or directory)`  error occurring upon an attempt to access the file  `/var/www/html/wp-includes/class-wp-locale.phpp`.
    
5.  Looked through files in the  `/var/www/html/`  directory one-by-one, using Vim pattern matching to try and locate the erroneous  `.phpp`  file extension. Located it in the  `wp-settings.php`  file. (Line 137,  `require_once( ABSPATH . WPINC . '/class-wp-locale.php' );`).
    
6.  Removed the trailing  `p`  from the line.
    
7.  Tested another  `curl`  on the server. 200 A-ok!
    
8.  Wrote a Puppet manifest to automate fixing of the error.
    

## [](https://github.com/Onielcares/alx-system_engineering-devops/tree/main/0x19-postmortem#summation)Summation

In short, a typo. Gotta love'em. In full, the WordPress app was encountering a critical error in  `wp-settings.php`  when tyring to load the file  `class-wp-locale.phpp`. The correct file name, located in the  `wp-content`  directory of the application folder, was  `class-wp-locale.php`.

Patch involved a simple fix on the typo, removing the trailing  `p`.

That was all needed!

![image](https://user-images.githubusercontent.com/99281742/199353032-790aa943-1f02-4cd4-b265-78b7d6421d10.png)