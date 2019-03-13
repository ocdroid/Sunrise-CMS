<!-- categories.tpl -->
<div class="uk-section uk-margin-remove-top uk-margin-medium-bottom uk-padding-remove">
	<div class="uk-container cc_module cc_module_blocksforallcategories">

		<div class="uk-margin-medium-top uk-margin-medium-bottom">
			<h3 class="uk-heading-line uk-text-center">
				<span>
					<?php echo $heading_title; ?>
				</span>
			</h3>
		</div>

		<div class="uk-position-relative uk-visible-toggle" uk-slider="autoplay: true; autoplay-interval: 1500;">

			<ul class="uk-slider-items uk-child-width-1-1 uk-child-width-1-3@s uk-child-width-1-4@m uk-child-width-1-5@l uk-child-width-1-6@xl">

				<?php foreach ($categories as $category) { ?>

					<li class="uk-overflow-hidden">

						<img class="uk-animation-reverse uk-transform-origin-top-right" uk-scrollspy="cls: uk-animation-kenburns; repeat: true" data-src="<?php echo $category['image']; ?>" width="" height="" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" uk-img="target: .cc_module_blocksforallcategories">

						<div class="uk-overlay-primary uk-position-cover"></div>

						<div class="uk-overlay uk-position-center">

							<a class="uk-light" href="<?php echo $category['href']; ?>">

								<h5>
									<?php echo $category['name']; ?>
								</h5>
								
							</a>

							<?php if ($cover_status) { ?>
										
								<div class="cc_bfac_item">

									<?php if ($category['children']) { ?>

										<?php foreach ($category['children'] as $child) { ?>
										
											<a class="uk-text-small" href="<?php echo $child['href']; ?>">
												<?php echo $child['name']; ?><span>, </span>
											</a>

										<?php } ?>
								
									<?php } ?>

								</div>

							<?php } ?> 

						</div>

					</li>

				<?php } ?>

			</ul>

			<a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
			<a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slider-item="next"></a>

		</div>

		<ul class="uk-slider-nav uk-dotnav uk-flex-center uk-margin"></ul>

	</div>
</div>

<style>
	.cc_bfac_item > a:last-child span {
		display: none;
	}
</style>

<!-- /categories.tpl -->