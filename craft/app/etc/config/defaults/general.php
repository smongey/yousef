<?php

/**
 * Craft by Pixel & Tonic
 *
 * @package   Craft
 * @author    Pixel & Tonic, Inc.
 * @copyright Copyright (c) 2013, Pixel & Tonic, Inc.
 * @license   http://buildwithcraft.com/license Craft License Agreement
 * @link      http://buildwithcraft.com
 */

/**
 * DO NOT EDIT THIS FILE.
 *
 * This file is subject to be overwritten by a Craft update at any time.
 *
 * If you want to change any of these settings, copy it into
 * craft/config/general.php, and make your change there.
 */

return array(

/**
 * Determines whether the system is in dev mode or not.
 */
'devMode' => false,

/**
 * The URL segment to trigger a CP request.
 */
'cpTrigger' => 'admin',

/**
 * The URL segment to trigger a resource request.
 */
'resourceTrigger' => 'resources',

/**
 * The URL segment to trigger a controller action request.
 */
'actionTrigger' => 'actions',

/**
 * The string that precedes the page number in paginated requests.
 */
'pageTrigger' => 'p',

/**
 * The source of the site routes. Possible values are 'file' and 'db'.
 *
 * If set to 'file', Craft will look for routes in craft/config/routes.php
 */
'siteRoutesSource' => 'db',

/**
 * The path to redirect to when accessing a page that requires the user to be logged in.
 */
'loginPath' => 'login',

/**
 * The path Craft will use to set users' passwords.
 */
'setPasswordPath' => 'setpassword',

/**
 * The path Craft will use when activating a user's account.
 */
'activateAccountPath' => 'activate',

/**
 * If this is set, Craft will redirect to here upon successful activation. Otherwise, it defaults to the login page.
 */
'activateSuccessPath' => '',

/**
 * If this is set, Craft will redirect to here if activation was not successful. Otherwise, an exception is thrown.
 */
'activateFailurePath' => '',

/**
 * The path to trigger a user session logout.
 */
'logoutPath' => 'logout',

/**
 * The amount of time to cache stuff in runtime/.
 *
 * Set to '0' to cache things indefinitely.
 *
 * @see http://www.php.net/manual/en/dateinterval.construct.php
 */
'cacheDuration' => 'P1D',

/**
 * Whether generated URLs should omit 'index.php', e.g. http://domain.com/path
 * as opposed to showing it, e.g. http://domain.com/index.php/path
 *
 * This can only be possible if your server is configured to redirect would-be 404's to index.php,
 * for example, with the redirect found in the 'htaccess' file that came with Craft:
 *
 *     RewriteEngine On
 *
 *     RewriteCond %{REQUEST_FILENAME} !-f
 *     RewriteCond %{REQUEST_FILENAME} !-d
 *     RewriteRule (.+) /index.php?p=$1 [QSA,L]
 *
 * Possible values: true, false, 'auto'
 */
'omitScriptNameInUrls' => 'auto',

/**
 * Whether generated URLs should be formatted using PATH_INFO, e.g. http://domain.com/index.php/path/,
 * as opposed to using the query string, e.g. http://domain.com/index.php?p=path
 *
 * Possible values: true, false, 'auto'
 */
'usePathInfo' => 'auto',

/**
 * If you have Apache's mod_xsendfile installed and configured, set this to 'true' and Craft will
 * use xSendFile to transfer files.
 */
'useXSendFile' => false,

/**
 * The amount of time a user stays logged in.
 *
 * If set to '0', the session will expire when the browser is closed.
 *
 * @see http://www.php.net/manual/en/dateinterval.construct.php
 */
'userSessionDuration' => 'PT1H',

/**
 * The amount of time a user stays logged if "Remember Me" is checked.
 *
 * Set to '0' to disable the "Remember Me" feature altogether.
 *
 * @see http://www.php.net/manual/en/dateinterval.construct.php
 */
'rememberedUserSessionDuration' => 'P2W',

/**
 * The amount of time we'll remember usernames.
 *
 * Set to '0' to disable this feature altogether.
 *
 * @see http://www.php.net/manual/en/dateinterval.construct.php
 */
'rememberUsernameDuration' => 'P1Y',

/**
 * The amount of time a newly generated email verification code will last before expiring.
 *
 * @see http://www.php.net/manual/en/dateinterval.construct.php
 */
'verificationCodeDuration' => 'P1D',

/**
 * The number of invalid login attempts within the 'invalidLoginWindowDuration' before the account
 * gets locked.
 */
'maxInvalidLogins' => 5,

/**
 * The amount of time to track invalid login attempts for a user.
 *
 * If someone tries to log in too many times in this window, their account will get locked.
 *
 * @see http://www.php.net/manual/en/dateinterval.construct.php
 */
'invalidLoginWindowDuration' => 'PT1H',

/**
 * The amount of time a user must wait before logging in after their account is locked.
 *
 * Set to '0' to prevent users from ever being able to log back in without an admin unlocking their
 * account first.
 *
 * @see http://www.php.net/manual/en/dateinterval.construct.php
 */
'cooldownDuration' => 'PT5M',

// PHPPass Config
/**
 * Controls the number of iterations for key stretching. A setting of 8 means the hash algorithm
 * will be applied 2^8 = 256 times.
 *
 * This setting should be kept between 4 and 31.
 */
'phpPass-iterationCount' => 8,

/**
 * Controls whether to use the minified and merged JavaScript in the resources/js/uncompressed or
 * the resources/js/compressed folder.
 */
'useCompressedJs' => true,

/**
 * Controls whether to add the @ symbol around translated strings to help during debugging.
 */
'translationDebugOutput' => false,

/**
 * Allowed file upload extensions.
 */
'allowedFileExtensions' => '7z,aiff,asf,avi,bmp,csv,doc,docx,fla,flv,gif,gz,gzip,htm,html,jpeg,jpg,mid,mov,mp3,mp4,m4a,m4v,mpc,mpeg,mpg,ods,odt,ogg,pdf,png,pt,pptx,pxd,qt,ram,rar,rm,rmi,rmvb,rtf,sdc,sitd,swf,sxc,sxw,tar,tgz,tif,tiff,txt,vsd,wav,wma,wmv,xls,xlsx,zip',

/**
 * If set to 'auto', Craft will attempt to detect if PHP is set to save sessions to a distributed cache location (i.e. memcache)
 * Set to true if you want Craft to save PHP session data under it’s storage folder, or false to use the server’s default PHP session data path.
 */
'overridePhpSessionLocation' => 'auto',

/**
 * If set to true, Craft will backup your database before making any schema changes when doing an update.
 */
'backupDbOnUpdate' => true,

/**
 * If set to true and 'backupDbOnUpdate' is true, Craft will restore the last database backup in the event that an update with a migration failed.
 */
'restoreDbOnUpdateFailure' => true,

/**
 * If set to true, when renewing or restoring session from cookie, the current user agent string must exactly match the user agent string saved in the cookie.
 */
'requireMatchingUserAgentForSession' => true,

/**
 * If set to true, when renewing or restoring session from cookie, the current request must present a user agent and IP address.
 */
'requireUserAgentAndIpForSession' => true,

/**
 * Custom ASCII charater mappings.
 *
 * This array is merged into the default one in StringHelper::getAsciiCharMap().
 */
'customAsciiCharMappings' => array(),

/**
 * Search Ignore Words.
 */
'searchIgnoreWords' => array('the', 'and'),

/**
 * The maximum amount of memory Craft will try to reserve during memory intensive operations such as zipping, unzipping, updating, etc.
 */
'phpMaxMemoryLimit' => '256M',

/**
 * If this is set, then any emails sent through the EmailService will go to this address instead of EmailModel->toEmail.
 */
'testToEmailAddress' => '',

/**
 * The default permissions Craft will use when creating a folder on the file system.
 */
'defaultFolderPermissions' => 0755,

/**
 * The permissions Craft will use when creating a folder to ensure that it is writable.
 */
'writableFolderPermissions' => 0777,

/**
 * The permissions Craft will use when creating a file to ensure that it is writable.
 */
'writableFilePermissions' => 0777,

/**
 * Error Path Keys
 * 'errorPath'      => craft.app.templates.errors.error
 * 'error400Path'   => craft.app.templates.errors.400
 * 'error403Path'   => craft.app.templates.errors.403
 * 'error404Path'   => craft.app.templates.errors.404
 * 'error500Path'   => craft.app.templates.errors.500
 * 'error503Path'   => craft.app.templates.errors.503
 * 'exceptionPath'  => craft.app.templates.errors.exception
 */

/**
 * Offline Path Key
 * 'offlinePath'    => craft.app.templates._offline
 */

);
