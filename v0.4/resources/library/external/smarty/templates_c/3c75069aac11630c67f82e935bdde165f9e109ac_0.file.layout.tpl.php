<?php
/* Smarty version 3.1.28-dev/77, created on 2015-11-28 19:24:13
  from "/home/ubuntu/workspace/v0.4/resources/templates/layout.tpl" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.28-dev/77',
  'unifunc' => 'content_5659ff5da9ebc3_77933682',
  'file_dependency' => 
  array (
    '3c75069aac11630c67f82e935bdde165f9e109ac' => 
    array (
      0 => '/home/ubuntu/workspace/v0.4/resources/templates/layout.tpl',
      1 => 1448738634,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:include/external_links.tpl' => 1,
    'file:include/navbar.tpl' => 1,
    'file:include/footer.tpl' => 1,
  ),
),false)) {
function content_5659ff5da9ebc3_77933682 ($_smarty_tpl) {
$_smarty_tpl->ext->_inheritance->init($_smarty_tpl, false);
?>
<!DOCTYPE html>
<html>
<head>
    <title><?php 
$_smarty_tpl->ext->_inheritance->processBlock($_smarty_tpl, 0, 'title', array (
  0 => 'block_2804686255659ff5da7e867_31239470',
  1 => false,
  3 => 0,
  2 => 0,
));
?>
</title>
    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:include/external_links.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

    <?php 
$_smarty_tpl->ext->_inheritance->processBlock($_smarty_tpl, 0, 'extra_head', array (
  0 => 'block_7765814195659ff5da921d1_29654405',
  1 => false,
  3 => 0,
  2 => 0,
));
?>

</head>
<body>
    <div class="page_container">
        <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:include/navbar.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

        <?php 
$_smarty_tpl->ext->_inheritance->processBlock($_smarty_tpl, 0, 'content', array (
  0 => 'block_12856051245659ff5da98908_38642411',
  1 => false,
  3 => 0,
  2 => 0,
));
?>

        <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:include/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

    </div>
</body>
</html><?php }
/* {block 'title'}  file:layout.tpl */
function block_2804686255659ff5da7e867_31239470($_smarty_tpl, $_blockParentStack) {
?>
COPEapp<?php
}
/* {/block 'title'} */
/* {block 'extra_head'}  file:layout.tpl */
function block_7765814195659ff5da921d1_29654405($_smarty_tpl, $_blockParentStack) {
}
/* {/block 'extra_head'} */
/* {block 'content'}  file:layout.tpl */
function block_12856051245659ff5da98908_38642411($_smarty_tpl, $_blockParentStack) {
?>

        <div class="page_content">
            Missing Content!
        </div>
        <?php
}
/* {/block 'content'} */
}
