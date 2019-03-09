<div id="cc_main_menu" uk-offcanvas="overlay: true">
	<div class="uk-offcanvas-bar">

		<button class="uk-offcanvas-close" type="button" uk-close></button>

		<div class="uk-margin uk-margin-medium-top">

			<nav class="uk-nav uk-nav-default uk-nav-parent-icon" uk-nav="multiple: true">

				<?php if ($categories) { ?>

					<?php foreach ($categories as $category) { ?>

						<?php if ($category['children']) { ?>

							<li class="uk-parent">

								<a href="<?php echo $category['href']; ?>">
									<?php echo $category['name']; ?>
								</a>

								<ul class="uk-nav-sub">

									<li class="cc_main_menu_show_all">
										<a href="<?php echo $category['href']; ?>">
											<?php echo $text_go_to; ?> <span class="uk-text-lowercase"><?php echo $category['name']; ?></span>
										</a>
									</li>

									<!-- https://forum.opencart.pro/topic/4983-%D0%BB%D0%B0%D0%B9%D1%84%D1%85%D0%B0%D0%BA%D0%B8-%D0%BE%D1%82-buslikdrev/?do=findComment&comment=47432 -->
									<?php foreach (array_chunk($category['children'], $category['column']) as $children) { ?>

										<?php foreach ($children as $child) { ?>

											<li>

												<a href="<?php echo $child['href']; ?>">
													<?php echo $child['name']; ?>
												</a>

											</li>
			
										<?php } ?>

									<?php } ?>

								</ul>

							</li>

						<?php } else { ?>

							<li>
								<a href="<?php echo $category['href']; ?>">
									<?php echo $category['name']; ?>
								</a>
							</li>

						<?php } ?>

					<?php } ?>

					<li class="uk-nav-divider"></li>

				<?php } ?>

				<?php echo $menu; ?>

				<li>
					<a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>">
						<?php echo $text_shopping_cart; ?>
					</a>
				</li>

				<li>
					<a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>">
						<?php echo $text_checkout; ?>
					</a>
				</li>

			</nav>

		</div>

	</div>
</div>