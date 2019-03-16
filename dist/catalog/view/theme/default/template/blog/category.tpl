<!-- b_category.tpl -->
<?php echo $header; ?>

<!-- breadcrumbs -->
<?php require_once(DIR_TEMPLATE.'/default/template/inc.breadcrumbs.html'); ?>
	
<!-- heading & description -->
<div class="uk-section uk-padding-remove uk-margin-small uk-margin-medium-bottom">
	<div class="uk-container">

		<article class="uk-article">

			<h1 class="uk-article-title uk-margin-medium-top uk-margin-medium-bottom uk-text-center">
				<?php echo $heading_title; ?>
			</h1>

			<?php if ($thumb || $description) { ?>

				<div class="uk-column-1-1 uk-column-1-2@s uk-column-1-3@l uk-column-divider uk-dropcap">
					
					<?php if ($thumb) { ?>
						<img class="uk-align-left uk-margin-remove-adjacent" data-src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" width="" height="" uk-img="target: .uk-article">
					<?php } ?>
				
					<?php echo $description; ?>

				</div>

			<?php } ?>

		</article>

	</div>
</div>
<!-- /heading & description -->

<?php echo $content_top; ?>

<!-- articles -->
<?php if ($articles) { ?>

	<!-- sort & limit -->
	<?php require_once(DIR_TEMPLATE.'/default/template/inc.sort_and_limit.html'); ?>

	<div class="uk-section uk-padding-remove uk-margin-small">
		<div class="uk-container">

			<div class="uk-flex uk-grid-collapse" uk-grid>

				<div class="cc_cm uk-width-1-1 uk-width-1-1@s uk-width-1-1@m uk-width-4-5@l uk-width-4-5@xl uk-flex uk-grid-collapse" uk-grid>

					<?php foreach ($articles as $article) { ?>
		
						<div class="cc_pci uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-width-1-4@l uk-width-1-4@xl">

							<div class="uk-card uk-box-shadow-hover-large">

								<div class="uk-card-media-top uk-padding-small uk-position-relative">
									<a href="<?php echo $article['href']; ?>" title="<?php echo $article['name']; ?>">
										<img data-src="<?php echo $article['thumb']; ?>" width="" height="" alt="<?php echo $article['name']; ?>" title="<?php echo $article['name']; ?>" uk-img>
									</a>
								</div>

								<div class="uk-card-body uk-padding-small">

									<h3 class="uk-card-title uk-text-truncate uk-text-left">
										<a href="<?php echo $article['href']; ?>" title="<?php echo $article['name']; ?>" uk-tooltip="title: <?php echo $article['name']; ?>; pos: top-left">
											<?php echo $article['name']; ?>
										</a>
									</h3>

									<div class="uk-text-meta uk-text-truncate uk-text-left">
										<?php echo $article['description']; ?>
									</div>
									
									<div class="uk-margin-small-top uk-text-left">

										<button class="uk-button uk-button-primary uk-button-small" type="button" onclick="location.href = ('<?php echo $article['href']; ?>');">

											<span uk-icon="icon: more"></span>

											<span class="uk-visible@s">
												<?php echo $button_more; ?>
											</span>

										</button>

									</div>

								</div>

							</div>
	
						</div>

					<?php } ?>
			
				</div>

				<div class="cc_cl uk-margin-large-bottom uk-width-1-1 uk-width-1-1@s uk-width-1-1@m uk-width-1-5@l uk-width-1-5@xl uk-flex-first@l">
					
					<div class="uk-margin uk-background-muted" uk-sticky="offset: 0; bottom: true">
						<?php echo $column; ?>
					</div>

				</div>

			</div>

		</div>
	</div>

<?php } else { ?>

	<div class="uk-section uk-padding-remove uk-margin-small">
		<div class="uk-container">

			<?php echo $text_empty; ?>
			
			<a class="uk-button uk-button-default" href="<?php echo $continue; ?>">
				<?php echo $button_continue; ?>
			</a>

		</div>
	</div>

<?php } ?>
<!-- /articles -->

<!-- pagination -->
<?php if ($pagination) { ?>
	<div class="uk-section uk-section-secondary uk-padding-small uk-margin-small uk-margin-large-top uk-margin-remove-bottom">
		<div class="uk-container uk-text-center">

			<?php echo $pagination; ?>
			
		</div>
	</div>
<?php } ?>
<!-- /pagination -->

<?php echo $content_bottom; ?>

<?php echo $footer; ?>
<!-- b_category.tpl -->