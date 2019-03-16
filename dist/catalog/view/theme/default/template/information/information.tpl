<!-- information.tpl -->
<?php echo $header; ?>

<!-- breadcrumbs -->
<?php require_once(DIR_TEMPLATE.'/default/template/inc.breadcrumbs.html'); ?>

<?php echo $content_top; ?>

<div class="uk-section uk-padding-remove uk-margin-small">
	<div class="uk-container">

		<article class="uk-article">

			<h1 class="uk-article-title uk-margin-medium-top uk-margin-medium-bottom uk-text-center">
				<?php echo $heading_title; ?>
			</h1>

			<p class="uk-text-lead">
				<?php echo $description; ?>
			</p>

		</article>

	</div>
</div>

<?php echo $content_bottom; ?>

<?php echo $footer; ?>
<!-- /information.tpl -->