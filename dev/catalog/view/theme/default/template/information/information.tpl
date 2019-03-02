<!-- information.tpl -->
<?php echo $header; ?>

<div class="uk-section uk-margin-small uk-padding-remove">
	<div class="uk-container">

		<ul class="uk-breadcrumb">

			<?php if(isset($_SERVER['HTTP_REFERER'])) { ?>
				<?php if(strpos($_SERVER['HTTP_REFERER'], $_SERVER["SERVER_NAME"])) { ?>
					<li>
						<span uk-icon="icon: chevron-left; ratio: 0.8;"></span>
						<a class="uk-text-meta uk-link-text" href="<?php echo $_SERVER['HTTP_REFERER'] ?>" rel="nofollow">
							<?php echo $text_go_back; ?>
						</a>
					</li>
				<?php } ?>
			<?php } ?>
	
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li>
					<a href="<?php echo $breadcrumb['href']; ?>">
						<?php echo $breadcrumb['text']; ?>
					</a>
				</li>
			<?php } ?>
		</ul>

	</div>
</div>

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