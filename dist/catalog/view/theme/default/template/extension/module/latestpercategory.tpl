<!-- latestpercategory.tpl -->
<?php if (isset($products) && count($products)) { ?>
	<div class="uk-section uk-margin-remove-top uk-margin-medium-bottom uk-padding-remove">
		<div class="uk-container cc_module cc_module_latestpercategory cc_module_latestpercategory_<?php echo $module_id; ?>" uk-slider="autoplay: true">

			<div class="uk-margin-medium-top uk-margin-medium-bottom">
				<h3 class="uk-heading-line uk-text-center">
					<span>
						<?php echo $heading_title; ?>
					</span>
				</h3>
			</div>

			<div class="uk-position-relative uk-visible-toggle">

				<ul class="uk-slider-items uk-grid">

					<?php foreach ($products as $product) { ?>
					
						<li class="cc_module_slider_item uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-width-1-5@l uk-width-1-5@xl">

							<div class="uk-margin-small-top uk-margin-medium-bottom">

								<div class="uk-card uk-box-shadow-hover-large">

									<div class="uk-card-media-top uk-padding-small uk-position-relative">

										<div class="cc_labels_wrap">
	
											<?php if ($product['yousave_percent']) { ?>
												<div class="uk-card-badge uk-label uk-label-warning">
													-<?php echo $product['yousave_percent']; ?>%
												</div>
											<?php } ?>
			
											<?php echo $product['sticker']; ?>
	
										</div>
	
										<a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>">
											<img data-src="<?php echo $product['thumb']; ?>" width="" height="" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" uk-img="target: .cc_module_latestpercategory_<?php echo $module_id; ?>">
										</a>
	
										<?php if ($product['benefits']) { ?>
	
											<a class="cc_product_benefits_open uk-position-absolute" href="#cc_product_benefits_open_<?php echo $product['product_id']; ?>" uk-icon="info" uk-tooltip="title: <?php echo $text_benefits; ?>; pos: top-left" uk-toggle></a>
	
											<div id="cc_product_benefits_open_<?php echo $product['product_id']; ?>" uk-modal>
												<div class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical">
													
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

									<div class="uk-card-body uk-padding-small">

										<h3 class="uk-card-title uk-text-truncate uk-text-left">
											<a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>" uk-tooltip="title: <?php echo $product['name']; ?>; pos: top-left">
												<?php echo $product['name']; ?>
											</a>
										</h3>

										<div class="uk-text-meta uk-text-truncate uk-text-left">
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

												<span class="uk-visible@s">
													<?php echo $button_buy_it; ?>
												</span>

											</button>

										</div>

									</div>

								</div>

							</div>
		
						</li>

					<?php } ?>

				</ul>
			
				<a class="uk-position-center-left-out uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
				<a class="uk-position-center-right-out uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slider-item="next"></a>

			</div>

			<ul class="uk-slider-nav uk-dotnav uk-flex-center uk-margin"></ul>

		</div>
	</div>
<?php } ?>
<!-- /latestpercategory.tpl -->