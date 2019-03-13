<!-- slideshow.tpl -->
<div class="uk-section uk-margin-remove-top uk-margin-medium-bottom uk-padding-remove uk-visible@s">
	<div class="uk-container cc_module cc_modue_slider cc_modue_slider_<?php echo $module; ?> uk-container-expand uk-padding-remove" uk-slider="autoplay: true; autoplay-interval: 7000;">

		<div class="uk-position-relative uk-visible-toggle">

			<ul class="uk-slider-items uk-child-width-1-1">

				<?php foreach ($banners as $banner) { ?>
					<li class="uk-grid-small uk-margin-remove uk-child-width-1-1" uk-grid>

						<img class="uk-padding-remove" data-src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" uk-img="target: .cc_modue_slider_<?php echo $module; ?>">
						
						<div class="uk-position-center">
						<!-- <div class="uk-position-bottom"> -->
							<div class="uk-margin-small-left uk-margin-small-right uk-inline uk-light" uk-slider-parallax="x: 1000, 0, -1000">
							<!-- <div class="uk-overlay uk-overlay-default uk-dark uk-text-center" uk-slider-parallax="x: 1000, 0, -1000"> -->
								
								<h1>Hello!</h1>
								
								<p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Enim placeat voluptates numquam totam, earum tempore odio, quidem, aliquam officiis eaque porro vitae error. Error in reiciendis voluptas nemo voluptatibus vitae.</p>
								
								<?php if ($banner['link']) { ?>
									<a class="uk-button uk-button-secondary" href="<?php echo $banner['link']; ?>">
										Action button
									</a>
								<?php } ?>

							</div>
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
	.cc_modue_slider .uk-position-center {
		width: -webkit-max-content;
		width: -moz-max-content;
		width: max-content;
	}
</style>

<!-- /slideshow.tpl -->