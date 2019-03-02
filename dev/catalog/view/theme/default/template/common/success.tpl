<!-- success.tpl -->
<?php echo $header; ?>

	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>

	<?php echo $heading_title; ?>

	<?php echo $text_message; ?>

	<?php echo $content_top; ?>
	<?php echo $content_bottom; ?>
	<?php echo $column; ?>
	

	<a href="<?php echo $continue; ?>">
		<?php echo $button_continue; ?>
	</a>

<?php echo $footer; ?>
<!-- /success.tpl -->