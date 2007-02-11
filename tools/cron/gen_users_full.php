<?
require_once '../../includes/classes/phemplate.class.php';
require_once '../../includes/vars.inc.php';
require_once '../../includes/user_functions.inc.php';
require_once '../../includes/classes/modman.class.php';
db_connect(_DBHOSTNAME_,_DBUSERNAME_,_DBPASSWORD_,_DBNAME_);

$tpl=new phemplate(_BASEPATH_.'/skins/','remove_nonjs');

$query="SELECT a.`config_value` FROM `{$dbtable_prefix}site_options3` a,`{$dbtable_prefix}modules` b WHERE a.`config_option`='skin_dir' AND a.`fk_module_code`=b.`module_code` AND b.`module_type`='"._MODULE_SKIN_."'";
if (!($res=@mysql_query($query))) {trigger_error(mysql_error(),E_USER_ERROR);}
$skins=array();
for ($i=0;$i<mysql_num_rows($res);++$i) {
	$skins[]=mysql_result($res,$i,0);
}

$config=get_site_option(array('bbcode_profile'),'core');

$modman=new modman();

$query="SELECT * FROM `{$dbtable_prefix}user_profiles` WHERE `status`='".PSTAT_APPROVED."'";
//$query="SELECT * FROM `{$dbtable_prefix}user_profiles` WHERE `status`='".PSTAT_APPROVED."' AND `last_changed`>=DATE_SUB(now(),INTERVAL 12 MINUTE)";
if (!($res=@mysql_query($query))) {trigger_error(mysql_error(),E_USER_ERROR);}
while ($profile=mysql_fetch_assoc($res)) {
// set all the fields to their real (readable) values
	foreach ($_pfields as $field_id=>$field) {
		if ($field['visible']) {
			$profile[$field['dbfield'].'_label']=$field['label'];
			if ($field['html_type']==_HTML_TEXTFIELD_) {
				$profile[$field['dbfield']]=sanitize_and_format($profile[$field['dbfield']],TYPE_STRING,$__html2format[TEXT_DB2DISPLAY]);
			} elseif ($field['html_type']==_HTML_TEXTAREA_) {
				$profile[$field['dbfield']]=sanitize_and_format($profile[$field['dbfield']],TYPE_STRING,$__html2format[TEXT_DB2DISPLAY]);
				if ($config['bbcode_profile']) {
					$profile[$field['dbfield']]=bbcode2html($profile[$field['dbfield']]);
				}
			} elseif ($field['html_type']==_HTML_SELECT_) {
				$profile[$field['dbfield']]=sanitize_and_format($field['accepted_values'][$profile[$field['dbfield']]],TYPE_STRING,$__html2format[TEXT_DB2DISPLAY]);
			} elseif ($field['html_type']==_HTML_CHECKBOX_LARGE_) {
				$profile[$field['dbfield']]=sanitize_and_format(vector2string_str($field['accepted_values'],$profile[$field['dbfield']]),TYPE_STRING,$__html2format[TEXT_DB2DISPLAY]);
			} elseif ($field['html_type']==_HTML_INT_ || $field['html_type']==_HTML_FLOAT_) {
	//			$profile[$field['dbfield']]=$profile[$field['dbfield']];
			} elseif ($field['html_type']==_HTML_DATE_) {
	//			$profile[$field['dbfield']]=$profile[$field['dbfield']];
			} elseif ($field['html_type']==_HTML_LOCATION_) {
				$profile[$field['dbfield']]=db_key2value("`{$dbtable_prefix}loc_countries`",'`country_id`','`country`',$profile[$field['dbfield'].'_country'],'-');
				if (!empty($profile[$field['dbfield'].'_state'])) {
					$profile[$field['dbfield']].=' / '.db_key2value("`{$dbtable_prefix}loc_states`",'`state_id`','`state`',$profile[$field['dbfield'].'_state'],'-');
				}
				if (!empty($profile[$field['dbfield'].'_city'])) {
					$profile[$field['dbfield']].=' / '.db_key2value("`{$dbtable_prefix}loc_cities`",'`city_id`','`city`',$profile[$field['dbfield'].'_city'],'-');
				}
			}
		} else {
			unset($profile[$field['dbfield']]);
		}
	}
	if (empty($profile['_photo']) || !is_file(_BASEPATH_.'/media/pics/t1/'.$profile['_photo']) || !is_file(_BASEPATH_.'/media/pics/t2/'.$profile['_photo']) || !is_file(_BASEPATH_.'/media/pics/'.$profile['_photo'])) {
		$profile['_photo']='no_photo.gif';
	} else {
		$profile['has_photo']=true;
	}

	$tpl->set_var('profile',$profile);
	// create the cache in every skin
	for ($s=0;isset($skins[$s]);++$s) {
		// create the user cache folder if it doesn't exist
		if (!is_dir(_BASEPATH_.'/skins/'.$skins[$s].'/cache/users/'.$profile['fk_user_id']{0}.'/'.$profile['fk_user_id'])) {
			$modman->fileop->mkdir(_BASEPATH_.'/skins/'.$skins[$s].'/cache/users/'.$profile['fk_user_id']{0}.'/'.$profile['fk_user_id']);
		}

		// generate the profile.html page (without the categories loop)
		$tpl->set_file('temp',$skins[$s].'/static/profile.html');
		$towrite=$tpl->process('','temp',TPL_OPTIONAL);
		$modman->fileop->file_put_contents(_BASEPATH_.'/skins/'.$skins[$s].'/cache/users/'.$profile['fk_user_id']{0}.'/'.$profile['fk_user_id'].'/profile.html',$towrite);

		// generate the user details for gallery view
		$tpl->set_file('temp',$skins[$s].'/static/user_gallery.html');
		$towrite=$tpl->process('','temp');
		$modman->fileop->file_put_contents(_BASEPATH_.'/skins/'.$skins[$s].'/cache/users/'.$profile['fk_user_id']{0}.'/'.$profile['fk_user_id'].'/user_gallery.html',$towrite);

		// generate the user details for list view
		$tpl->set_file('temp',$skins[$s].'/static/user_list.html');
		$towrite=$tpl->process('','temp');
		$modman->fileop->file_put_contents(_BASEPATH_.'/skins/'.$skins[$s].'/cache/users/'.$profile['fk_user_id']{0}.'/'.$profile['fk_user_id'].'/user_list.html',$towrite);

		// generate the categories to be used on profile.php page
		$categs=array();
		$tpl->set_file('temp',$skins[$s].'/static/profile_categ.html');
		foreach ($_pcats as $pcat_id=>$pcat) {
			$fields=array();
			$j=0;
			for ($i=0;isset($pcat['fields'][$i]);++$i) {
				$fields[$i]['label']=$_pfields[$pcat['fields'][$i]]['label'];
				$fields[$i]['field']=$profile[$_pfields[$pcat['fields'][$i]]['dbfield']];
			}
			$categs['pcat_name']=$pcat['pcat_name'];
			$categs['pcat_id']=$pcat_id;
			$tpl->set_loop('fields',$fields);
			$tpl->set_var('categs',$categs);
			$towrite=$tpl->process('','temp',TPL_LOOP);
			$modman->fileop->file_put_contents(_BASEPATH_.'/skins/'.$skins[$s].'/cache/users/'.$profile['fk_user_id']{0}.'/'.$profile['fk_user_id'].'/categ_'.$pcat_id.'.html',$towrite);
			$tpl->drop_loop('fields');
			$tpl->drop_var('categs');
		}
	}
	$tpl->drop_var('user');
}
?>