<?php
/******************************************************************************
newdsb
===============================================================================
File:                       admin/processors/rate_limiter_delete.php
$Revision: 91 $
Software by:                DateMill (http://www.datemill.com)
Copyright by:               DateMill (http://www.datemill.com)
Support at:                 http://forum.datemill.com
*******************************************************************************
* See the "softwarelicense.txt" file for license.                             *
******************************************************************************/

require_once '../../includes/sessions.inc.php';
require_once '../../includes/vars.inc.php';
db_connect(_DBHOSTNAME_,_DBUSERNAME_,_DBPASSWORD_,_DBNAME_);
require_once '../../includes/classes/phemplate.class.php';
require_once '../../includes/admin_functions.inc.php';
allow_dept(DEPT_ADMIN);

$qs='';
$qs_sep='';
$topass=array();
$rate_id=isset($_GET['rate_id']) ? (int)$_GET['rate_id'] : 0;

$query="DELETE FROM `{$dbtable_prefix}rate_limiter` WHERE `rate_id`='$rate_id'";
if (!($res=@mysql_query($query))) {trigger_error(mysql_error(),E_USER_ERROR);}
regenerate_langstrings_array();

$topass['message']['type']=MESSAGE_INFO;
$topass['message']['text']='Limit removed successfully.';

redirect2page('admin/rate_limiter.php',$topass,$qs);
?>