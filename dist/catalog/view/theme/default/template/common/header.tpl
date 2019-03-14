<!-- header.tpl -->
<!DOCTYPE html>

<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">

	<head>

		<meta charset="utf-8">
		<meta http-equiv="x-ua-compatible" content="ie=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<title><?php echo $title; ?></title>

		<?php if ($robots) { ?>
			<meta name="robots" content="<?php echo $robots; ?>">
		<?php } ?>

		<base href="<?php echo $base; ?>">

		<?php if ($description) { ?>
			<meta name="description" content="<?php echo $description; ?>">
		<?php } ?>

		<!-- canonical & icon -->
		<?php foreach ($links as $link) { ?>
			<link rel="<?php echo $link['rel']; ?>" href="<?php echo $link['href']; ?>">
		<?php } ?>

		<!-- stelysheets -->
		<?php foreach ($stylespreload as $stylepreload) { ?>
			<link rel="<?php echo $stylepreload['rel']; ?>" href="<?php echo $stylepreload['href']; ?>" as="style">
		<?php } ?>

		<?php foreach ($styles as $style) { ?>
			<link rel="<?php echo $style['rel']; ?>" href="<?php echo $style['href']; ?>" media="screen">
		<?php } ?>

		<?php if(!isMobile || !isTablet) { ?>
			<style>
				/* card effect */
				.uk-card.uk-box-shadow-hover-large {
					transition: 150ms transform;
				}
					.uk-card.uk-box-shadow-hover-large:hover {
						transform: translateY(-5px);
					}
			</style>
		<?php } ?>

		<!-- scripts -->
		<?php foreach ($scriptsasync as $scriptasync) { ?>
			<script src="<?php echo $scriptasync; ?>" async></script>
		<?php } ?>

		<?php foreach ($scriptsdefer as $scriptdefer) { ?>
			<script src="<?php echo $scriptdefer; ?>" defer></script>
		<?php } ?>

		<?php foreach ($scripts as $script) { ?>
			<script src="<?php echo $script; ?>"></script>
		<?php } ?>

	</head>

	<body class="<?php echo $class; ?>">

		<div class="uk-offcanvas-content">

			<!-- inc.main_menu.tpl -->
			<?php require_once(DIR_TEMPLATE.'/default/template/inc.main_menu.tpl'); ?>

			<!-- inc.header.tpl -->
			<?php require_once(DIR_TEMPLATE.'/default/template/inc.header.tpl'); ?>

			<!-- inc.adminbar.tpl -->
			<?php require_once(DIR_TEMPLATE.'/default/template/inc.adminbar.tpl'); ?>

			<!-- /header.tpl -->