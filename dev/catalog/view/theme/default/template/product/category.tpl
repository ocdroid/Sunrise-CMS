<!-- category.tpl -->
<?php echo $header; ?>

<!-- breadcrumbs -->
<?php require_once(DIR_TEMPLATE.'/default/template/inc.breadcrumbs.tpl'); ?>

<!-- heading & small description -->
<div class="uk-section uk-padding-remove uk-margin-small uk-margin-medium-bottom">
	<div class="uk-container">

		<article class="uk-article">

			<h1 class="uk-article-title uk-margin-medium-top uk-margin-medium-bottom uk-text-center">
				<?php echo $heading_title; ?>
			</h1>

			<?php if ($description) { ?>
				<div class="uk-column-1-1 uk-column-1-2@s uk-column-1-3@l uk-column-divider uk-dropcap">
					<?php echo $description; ?>
				</div>
			<?php } ?>

		</article>

	</div>
</div>
<!-- /heading & small description -->

<!-- refine search -->
<?php if ($categories) { ?>

	<div class="uk-section uk-section-secondary uk-margin-remove uk-padding-remove">
		<div class="uk-container cc_module cc_module_subcategories" uk-slider="autoplay: true">

			<div class="uk-margin-medium-top uk-margin-medium-bottom">
				<h3 class="uk-heading-line uk-text-center">
					<span>
						<?php echo $text_refine; ?>
					</span>
				</h3>
			</div>

			<div class="uk-position-relative uk-visible-toggle">

				<ul class="uk-slider-items uk-grid">

					<?php foreach ($categories as $category) { ?>

						<li class="cc_module_slider_item uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-width-1-5@l uk-width-1-5@xl">

							<div class="uk-margin-small-top uk-margin-medium-bottom">
	
								<div class="uk-card uk-box-shadow-hover-large">
	
									<div class="uk-card-media-top uk-padding-small uk-position-relative">

										<a href="<?php echo $category['href']; ?>" title="<?php echo $category['name']; ?>">
											
											<img data-src="<?php echo $category['thumb']; ?>" width="" height="" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" uk-img="target: cc_module_subcategories">

											<div class="uk-position-medium uk-position-cover uk-overlay uk-overlay-primary uk-flex uk-flex-center uk-flex-middle uk-text-center">
												<?php echo $category['name']; ?>
											</div>
											
										</a>

									</div>

								</div>

							</div>
		
						</li>

					<?php } ?>

				</ul>
		
				<a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
				<a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slider-item="next"></a>
	
			</div>

		</div>
	</div>

<?php } ?>
<!-- /refine search -->

<?php echo $content_top; ?>

<!-- products -->
<?php if ($products) { ?>

	<!-- sort & limit -->
	<?php require_once(DIR_TEMPLATE.'/default/template/inc.sort_and_limit.tpl'); ?>

	<div class="uk-section uk-padding-remove uk-margin-small">
		<div class="uk-container">

			<div class="uk-flex uk-grid-collapse" uk-grid>

				<div class="cc_cm uk-width-1-1 uk-width-1-1@s uk-width-1-1@m uk-width-4-5@l uk-width-4-5@xl uk-flex uk-grid-collapse" uk-grid>

					<?php foreach ($products as $product) { ?>

						<div class="cc_pci cc_pci_<?php echo $product['product_id']; ?> uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-width-1-4@l uk-width-1-4@xl">

							<!-- product_card -->
							<div class="uk-card uk-box-shadow-hover-large">

								<div class="uk-card-media-top uk-padding-small uk-position-relative">
									
									<!-- stickers -->
									<div class="cc_labels_wrap">

										<?php if ($product['yousave_percent']) { ?>
											<div class="uk-card-badge uk-label uk-label-warning">
												-<?php echo $product['yousave_percent']; ?>%
											</div>
										<?php } ?>
		
										<?php echo $product['sticker']; ?>

									</div>

									<a class="cc_product_image_container" href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>">
										<img data-src="<?php echo $product['thumb']; ?>" width="" height="" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" uk-img="target: .cc_pci_<?php echo $product['product_id']; ?>">
									</a>

									<?php if ($product['benefits']) { ?>

										<a class="cc_product_benefits_open uk-position-absolute" href="#cc_product_benefits_open_<?php echo $product['product_id']; ?>" uk-icon="info" uk-tooltip="title: <?php echo $text_benefits; ?>; pos: top-left" uk-toggle></a>

										<div id="cc_product_benefits_open_<?php echo $product['product_id']; ?>" uk-modal>
											<div class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical uk-padding-small">
												
												<button class="uk-modal-close-default" type="button" uk-close></button>
												
												<div>

													<table class="uk-table uk-table-hover uk-table-small">

														<caption class="uk-margin">
															<?php echo $text_benefits; ?> (<?php echo $product['name']; ?>)
														</caption>

														<tbody>

															<?php foreach ($product['benefits'] as $benefit) { ?>	
																
																<tr>

																	<?php if ($benefit['type'] == 1) { ?>
														
																		<td class="cc_benefits_info_image">

																			<?php if (!$benefit['link']) { ?>
																				
																				<img src="<?php echo $benefit['thumb']; ?>" alt="<?php echo $benefit['name']; ?>">

																			<?php } else { ?>

																				<a href="<?php echo $benefit['link']; ?>" target="_blank" rel="noopener" title="<?php echo $benefit['name']; ?>">
																					<img src="<?php echo $benefit['thumb']; ?>" alt="<?php echo $benefit['name']; ?>">
																				</a>

																			<?php } ?>
														
																		</td>

																		<td>

																			<?php if ($benefit['description']) { ?>
																				<?php echo $benefit['description']; ?>
																			<?php } ?>
														
																		</td>

																	<?php } ?>

																</tr>
													
															<?php } ?>
													
															<?php foreach ($product['benefits'] as $benefit) { ?>	
																
																<tr>

																	<?php if ($benefit['type'] == 0) { ?>
														
																		<td>

																			<?php if (!$benefit['link']) { ?>

																				<img src="<?php echo $benefit['thumb']; ?>" alt="<?php echo $benefit['name']; ?>">

																			<?php } else { ?>

																				<a href="<?php echo $benefit['link']; ?>" target="_blank" rel="noopener" title="<?php echo $benefit['name']; ?>">
																					<img src="<?php echo $benefit['thumb']; ?>" alt="<?php echo $benefit['name']; ?>">
																				</a>

																			<?php } ?>
														
																		</td>

																	<?php } ?>

																</tr>

															<?php } ?>
											
														</tbody>

													</table>

												</div>

											</div>
										</div>

									<?php } ?>

								</div>

								<!-- product_card_info -->
								<div class="uk-card-body uk-padding-small uk-text-left">
					
									<h3 class="uk-card-title uk-text-truncate">
										<a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>" uk-tooltip="title: <?php echo $product['name']; ?>; pos: top-left">
											<?php echo $product['name']; ?>
										</a>
									</h3>
					
									<div class="uk-text-meta uk-text-truncate">
										<?php echo $product['description']; ?>
									</div>

									<span class="uk-text-large">

										<?php if ($product['special']) { ?>
											<?php echo $product['special']; ?>
										<?php } else { ?>
											<?php echo $product['price']; ?>
										<?php } ?>

									</span>

									<div class="uk-margin-small-top uk-text-left">
					
										<button class="uk-button uk-button-primary uk-button-small" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');">
					
											<span uk-icon="icon: cart"></span>
					
											<span>
												<?php echo $button_buy_it; ?>
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

<?php } elseif (!$categories && !$products) { ?>
		
	<div class="uk-section uk-padding-remove uk-margin-small">
		<div class="uk-container">

			<?php echo $text_empty; ?>
			
			<a class="uk-button uk-button-default" href="<?php echo $continue; ?>">
				<?php echo $button_continue; ?>
			</a>

		</div>
	</div>

<?php } ?>
<!-- /products -->

<!-- pagination -->
<div class="uk-section uk-section-secondary uk-padding-small uk-margin-small uk-margin-large-top uk-margin-remove-bottom">
	<div class="uk-container uk-text-center">

		<?php echo $pagination; ?>
		
		<span class="uk-text-small">
			<?php echo $results; ?>
		</span>

	</div>
</div>
<!-- /pagination -->

<!-- main description -->
<div class="uk-section uk-section-muted uk-dark uk-margin-remove uk-padding-remove">
	<div class="uk-container uk-margin-small uk-margin-medium-top uk-padding uk-column-1-1 uk-column-1-2@s uk-column-1-3@l uk-column-divider uk-dropcap">

		<article class="uk-article">

			<?php if ($thumb) { ?>
				<img class="uk-align-left uk-margin-remove-adjacent" data-src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" width="" height="" uk-img="target: .uk-article">
			<?php } ?>

			<?php if ($description_bottom) { ?>
				<?php echo $description_bottom; ?>
			<?php } ?>

		</article>

	</div>
</div>
<!-- /main description -->

<?php echo $content_bottom; ?>

<?php echo $footer; ?>
<!-- /category.tpl -->