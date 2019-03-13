<!-- home.tpl -->
<?php echo $header; ?>

	<?php echo $content_top; ?>
	<?php echo $content_bottom; ?>
	<?php echo $column; ?>

	<?php if(isMobile || isTablet) { ?>
		1/ мобила или планшет
	<?php } ?>

	<?php if(isMobile || isTablet) { ?>
		2/ мобила или планшет
	<?php } else { ?>
		2/ комп
	<?php } ?>

	<?php if(!isMobile) { ?>
		3/ комп или планшет
	<?php } else { ?>
		3/ мобила
	<?php } ?>

	<?php if(!isTablet) { ?>
		4/ комп или мобила
	<?php } else { ?>
		4/ планшет
	<?php } ?>

	<?php if(isMobile) { ?>
		5/ мобила
	<?php } ?>

	<?php if(isTablet) { ?>
		6/ планшет
	<?php } ?>

<?php echo $footer; ?>
<!-- /home.tpl -->