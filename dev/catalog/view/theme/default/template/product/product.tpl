<!-- product.tpl -->
<?php echo $header; ?>

<!-- breadcrumbs -->
<?php require_once(DIR_TEMPLATE.'/default/template/inc.breadcrumbs.tpl'); ?>

<div class="uk-section uk-padding-remove uk-margin-small">
	<div class="uk-container">

		<article class="uk-article uk-text-center">

			<h1 class="uk-article-title uk-margin-medium-top uk-margin-small-bottom">
				<?php echo $heading_title; ?>
			</h1>

			<div class="uk-margin uk-margin-remove-top uk-margin-medium-bottom">
				<?php if ($manufacturer) { ?>
					<span class="uk-text-meta">
						<?php echo $text_manufacturer; ?>: 
					</span>
					<a class="uk-text-meta uk-link-text" href="<?php echo $manufacturers; ?>">
						<?php echo $manufacturer; ?>
					</a>
				<?php } ?>
			</div>

		</article>

	</div>
</div>

<?php echo $content_top; ?>

<div class="uk-section uk-padding-remove uk-margin-small">
	<div class="uk-container">

		<ul class="uk-margin-small-bottom" uk-tab>
			
			<li class="uk-active">
				<a href="#">
					<?php echo $tab_gen_information; ?>
				</a>
			</li>
	
			<?php if ($attribute_groups) { ?>
				<li>
					<a href="#">
						<?php echo $tab_attribute; ?>
					</a>
				</li>
			<?php } ?>
	
			<?php foreach ($product_tabs as $key => $tab) { ?>
				<li class="<?php echo $product_id ?> - <?php echo $tab['product_tab_id']; ?>">
					<a href="#">
						<?php echo $tab['title']; ?>
					</a>
				</li>
			<?php } ?>
	
			<?php if ($review_status) { ?>
				<li>
					<a href="#">
						<?php echo $tab_review; ?>
					</a>
				</li>
			<?php } ?>
	
		</ul>
		
		<ul class="uk-switcher uk-margin">
	
			<li>

				<div class="uk-flex" uk-grid>

					<div class="cc_pcl uk-width-1-1 uk-width-1-1@s uk-width-2-3@m uk-width-1-2@l uk-width-1-2@xl@xl">

						<h3 class="uk-heading-bullet">
							Photo
						</h3>

						<?php if ($thumb || $images) { ?>
						
							<div class="uk-margin uk-margin-medium-bottom uk-position-relative" uk-slider="autoplay: true; autoplay-interval: 7000; draggable: false;">

								<div class="uk-slider-container uk-position-relative uk-transition-toggle">
							
									<?php echo $sticker; ?>
							
									<div class="cc_plg uk-slider-items uk-child-width-1-1" uk-lightbox>

										<?php if ($thumb) { ?>
									
											<a href="<?php echo $popup; ?>" data-alt="<?php echo $heading_title; ?>" data-caption="<?php echo $heading_title; ?>">
							
												<img class="cc_product_main_image" src="<?php echo $thumb; ?>" data-zoom="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>">
							
											</a>
									
										<?php } ?>
									
										<?php if ($images) { ?>
									
											<?php foreach ($images as $image) { ?>
									
												<a href="<?php echo $image['popup']; ?>" data-alt="<?php echo $heading_title; ?>" data-caption="<?php echo $heading_title; ?>">
										
													<img class="cc_product_additional_image_<?php echo $image['image_id']; ?>" src="<?php echo $image['thumb']; ?>" data-zoom="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>">
							
												</a>

											<?php } ?>

										<?php } ?>
							
									</div>
							
									<a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
									<a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slider-item="next"></a>

								</div>
							
								<ul class="uk-slider-nav uk-dotnav uk-flex-center uk-margin"></ul>

							</div>

						<?php } ?>
					
						<?php if ($benefits) { ?>

							<h3 class="uk-heading-bullet">
								<?php echo $text_benefits; ?>
							</h3>

							<div class="uk-margin">

								<table class="uk-table uk-table-hover uk-table-small">

									<tbody>
								
										<?php foreach ($benefits as $benefit) { ?>
											
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
								
										<?php foreach ($benefits as $benefit) { ?>
											
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

						<?php } ?>

						<h3 class="uk-heading-bullet">
							<?php echo $text_description; ?>
						</h3>

						<div class="uk-margin uk-column-1-1 uk-column-1-2@s uk-column-divider uk-dropcap">

							<?php echo $description; ?>

						</div>

					</div>
				
					<div class="cc_pcr uk-width-1-1 uk-width-1-1@s uk-width-1-3@m uk-width-1-2@l uk-width-1-2@xl">

						<div class="cc_pmi_zoom uk-box-shadow-medium"></div>

						<div class="uk-margin uk-margin-remove-top uk-flex uk-grid-collapse" uk-grid uk-sticky="offset: 15; bottom: true">

							<div class="cc_pcrc uk-margin uk-flex uk-width-1-1">

								<div class="cc_pmi_stock">

									<span class="uk-text-meta">
										<?php echo $text_stock; ?>: 
									</span>

									<span class="uk-text-bold">
										<?php echo $stock; ?>
									</span>

								</div>

								<div class="cc_pmi_model">

									<span class="uk-text-meta">
										<?php echo $text_model; ?>: 
									</span>

									<span class="uk-text-bold">
										<?php echo $model; ?>
									</span>

								</div>

							</div>

							<div class="cc_pcrl uk-width-1-1 uk-width-1-2@s uk-width-1-1@m uk-width-1-2@l uk-width-1-2@xl">

								<?php if ($price) { ?>

									<div class="uk-margin uk-padding uk-padding-small uk-background-muted">

										<ul class="cc_product_price uk-margin-remove-bottom" uk-accordion>

											<li>

												<div class="uk-accordion-title">

													<?php if (!$special) { ?>
											
														<div class="cc_product_price uk-text-lead uk-text-bold">

															<?php echo $price; ?>

														</div>

													<?php } else { ?>
											
														<div class="cc_product_price_common uk-text-meta uk-margin-small-right">
															<?php echo $price; ?>
														</div>

														<div class="cc_product_price_special uk-text-lead uk-text-bold">
															
															<?php echo $special; ?>

														</div>

														<div class="cc_product_price_save uk-text-meta uk-margin-small-right">
															<?php echo $text_you_save; ?> <?php echo $yousave_money; ?> (<?php echo $yousave_percent; ?>%)
														</div>

													<?php } ?>
												
												</div>

												<div class="uk-accordion-content uk-margin-small-top">
													
													<div class="uk-margin uk-text-small">

														<?php if ($discounts) { ?>

															<hr>
												
															<?php foreach ($discounts as $discount) { ?>
																
																<div class="uk-grid-small uk-margin-remove-top" uk-grid>
																	
																	<div class="uk-width-expand" uk-leader>
																		<?php echo $discount['quantity']; ?>
																		<?php echo $text_discount; ?>
																	</div>

																	<div>
																		<?php echo $discount['price']; ?>
																	</div>

																</div>

															<?php } ?>

														<?php } ?>

														<?php if ($points) { ?>

															<hr>

															<div class="uk-grid-small uk-margin-remove-top" uk-grid>
																
																<div class="uk-width-expand" uk-leader>
																	<?php echo $text_points; ?>
																</div>

																<div>
																	<?php echo $points; ?>
																</div>

															</div>

														<?php } ?>

														<?php if ($reward) { ?>

															<hr>

															<div class="uk-grid-small uk-margin-remove-top" uk-grid>
																
																<div class="uk-width-expand" uk-leader>
																	<?php echo $text_reward; ?>
																</div>

																<div>
																	<?php echo $reward; ?>
																</div>

															</div>

														<?php } ?>

													</div>

												</div>


												<!-- доделать -->
												<?php if ($tax || $discounts || $points || $reward) { ?>



												<?php } else { ?>
													


												<?php } ?>


											</li>

										</ul>

									</div>

								<?php } ?>

								<?php if ($options) { ?>

									<div class="uk-margin uk-padding uk-padding-small uk-background-muted">
										
										<span class="uk-heading-bullet">
											<?php echo $text_option; ?>:
											<span uk-icon="icon: question; ratio: 0.65;" uk-tooltip="title: <?php echo $text_help_options; ?>; pos: top-right;"></span>
										</span>

										<ul class="cc_product_options uk-margin-remove-bottom" uk-accordion="multiple: true">

											<?php foreach ($options as $option) { ?>

												<?php if ($option['type'] == 'select') { ?>

													<li class="<?php echo ($option['required'] ? ' cc_por uk-open' : ''); ?>">

														<label class="uk-form-label uk-accordion-title <?php echo ($option['required'] ? 'uk-text-bold' : ''); ?>" for="input-option<?php echo $option['product_option_id']; ?>">
															<span class="uk-text-small">
																<?php echo $option['name']; ?><?php echo ($option['required'] ? ' *' : ''); ?>
															</span>
														</label>

														<div class="uk-form-controls uk-accordion-content">

															<select class="uk-select" id="input-option<?php echo $option['product_option_id']; ?>" name="option[<?php echo $option['product_option_id']; ?>]">

																<option value="">
																	<?php echo $text_select; ?>
																</option>

																<?php foreach ($option['product_option_value'] as $option_value) { ?>
																	
																	<option value="<?php echo $option_value['product_option_value_id']; ?>">
																		
																		<?php echo $option_value['name']; ?>

																		<?php if ($option_value['price']) { ?>
																			<span class="uk-text-small">
																				(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
																			</span>
																		<?php } ?>

																	</option>

																<?php } ?>

															</select>

														</div>
														
													</li>

												<?php } ?>

												<?php if ($option['type'] == 'radio') { ?>

													<li class="<?php echo ($option['required'] ? ' cc_por uk-open' : ''); ?>">

														<label class="uk-form-label uk-accordion-title <?php echo ($option['required'] ? 'uk-text-bold' : ''); ?>">
															<span class="uk-text-small">
																<?php echo $option['name']; ?><?php echo ($option['required'] ? ' *' : ''); ?>
															</span>
														</label>

														<div class="uk-form-controls uk-accordion-content" id="input-option<?php echo $option['product_option_id']; ?>">

															<?php foreach ($option['product_option_value'] as $option_value) { ?>
															
																<label class="uk-display-block uk-margin">

																	<input class="uk-radio" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>">

																	<?php echo $option_value['name']; ?>

																	<?php if ($option_value['image']) { ?>
																		<span class="uk-icon uk-icon-image" style="background-image: url(<?php echo $option_value['image']; ?>);"></span>
																	<?php } ?>

																	<?php if ($option_value['price']) { ?>
																		<span class="cc_pop uk-text-emphasis uk-text-small uk-margin-small-left">
																			<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
																		</span>
																	<?php } ?>

																</label>

															<?php } ?>

														</div>

													</li>

												<?php } ?>

												<?php if ($option['type'] == 'checkbox') { ?>

													<li class="<?php echo ($option['required'] ? ' cc_por uk-open' : ''); ?>">
														
														<label class="control-label uk-accordion-title <?php echo ($option['required'] ? 'uk-text-bold' : ''); ?>">
															<span class="uk-text-small">
																<?php echo $option['name']; ?><?php echo ($option['required'] ? ' *' : ''); ?>
															</span>
														</label>

														<div class="uk-form-controls uk-accordion-content" id="input-option<?php echo $option['product_option_id']; ?>">

															<?php foreach ($option['product_option_value'] as $option_value) { ?>

																<label class="uk-display-block uk-margin">

																	<input class="uk-checkbox" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>">

																	<?php echo $option_value['name']; ?>

																	<?php if ($option_value['image']) { ?>
																		<span class="uk-icon uk-icon-image" style="background-image: url(<?php echo $option_value['image']; ?>);"></span>
																	<?php } ?>

																	<?php if ($option_value['price']) { ?>
																		<span class="cc_pop uk-text-emphasis uk-text-small uk-margin-small-left">
																			<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
																		</span>
																	<?php } ?>

																</label>

															<?php } ?>

														</div>

													</li>

												<?php } ?>

											<?php } ?>

										</ul>

									</div>

								<?php } ?>

								<div class="uk-margin uk-margin-remove-top uk-button-group uk-width-1-1 uk-position-relative">

									<input type="hidden" name="product_id" value="<?php echo $product_id; ?>">
						
									<button class="uk-button uk-button-primary uk-button-large uk-width-3-4 uk-box-shadow-small uk-box-shadow-hover-large" id="button-cart" type="button" data-loading-text="<?php echo $text_loading; ?>">
						
										<span uk-icon="icon: cart"></span>
						
										<span>
											<?php echo $button_buy_it; ?>
										</span>
						
									</button>

									<input class="uk-input uk-form-large <?php echo (($minimum > 1) ? 'uk-form-danger' : ''); ?> uk-width-1-4 uk-text-center" id="input-quantity" type="text" name="quantity" placeholder="<?php echo $entry_qty; ?>" value="<?php echo $minimum; ?>" <?php if ($minimum > 1) { ?>uk-tooltip="title: <?php echo $text_minimum; ?>; pos: top-right;"<?php } ?>>

								</div>

								<div class="uk-margin uk-margin-remove-top">

									<span uk-icon="icon: lock; ratio: 0.7"></span>

									<a class="uk-link uk-link-text" href="#cc_book_item" uk-toggle>
										Book this item
									</a>

									<div id="cc_book_item" uk-modal>
										<div class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical">
											
											<button class="uk-modal-close-default" type="button" uk-close></button>

											<span class="uk-modal-title">
												Headline
											</span>
											
											<div>
												...
											</div>

										</div>
									</div>

								</div>

							</div>

							<div class="cc_pcrr uk-width-1-1 uk-width-1-2@s uk-width-1-1@m uk-width-1-2@l uk-width-1-2@xl">

								<div class="uk-margin-small-left">

									<ul class="uk-tab-bottom" uk-tab>
										
										<li class="uk-active">
											<a href="#">
												<span uk-icon="icon: credit-card; ratio: 0.7;"></span>
												Payment
											</a>
										</li>

										<li>
											<a href="#">
												<span uk-icon="icon: home; ratio: 0.7;"></span>
												Delivery
											</a>
										</li>

									</ul>

									<ul class="uk-switcher uk-margin">
										
										<li>
											Lorem ipsum dolor sit amet consectetur adipisicing elit.
											<br>
											<hr>
											<br>
											Ratione consectetur possimus ut inventore quidem optio facere.
										</li>

										<li>
											Ratione consectetur possimus ut inventore quidem optio facere.
											<br>
											<hr>
											<br>
											Lorem ipsum dolor sit amet consectetur adipisicing elit.
										</li>

									</ul>

								</div>

							</div>

						</div>

					</div>
				
				</div>

			</li>
	
			<?php if ($attribute_groups) { ?>
				<li>
	
					<div class="uk-flex" uk-grid>

						<div class="cc_pcl uk-width-1-1 uk-width-1-1@s uk-width-1-2@m uk-width-2-3@l uk-width-2-3@xl">

							<?php foreach ($attribute_groups as $attribute_group) { ?>

								<table class="uk-table uk-table-divider uk-table-striped uk-table-small uk-table-responsive uk-text-break">

									<thead>
										<tr>
											<td class="uk-text-small uk-text-bold">
												<?php echo $attribute_group['name']; ?>
											</td>
										</tr>
									</thead>

									<tbody>

										<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
											
											<tr>

												<td class="uk-width-small">
													<?php echo $attribute['name']; ?>
												</td>

												<td class="uk-table-expand">
													<?php echo $attribute['text']; ?>
												</td>

											</tr>

										<?php } ?>

									</tbody>

								</table>
								
							<?php } ?>
		
						</div>
							
						<div class="cc_pcr uk-width-1-1 uk-width-1-1@s uk-width-1-2@m uk-width-1-3@l uk-width-1-3@xl uk-visible@s">
					
							<div class="uk-margin" uk-sticky="offset: 15; bottom: true">

								...

							</div>
							
						</div>
					
					</div>

				</li>
			<?php } ?>
	
			<?php foreach ($product_tabs as $key => $tab) { ?>
				<li class="<?php echo $product_id ?> - <?php echo $tab['product_tab_id']; ?>">
					<?php echo $tab['description']; ?>
				</li>
			<?php } ?>

			<?php if ($review_status) { ?>
				<li>

					<form class="uk-form-horizontal" id="form-review">

						<?php echo $text_write; ?>
					
						<?php if ($review_guest) { ?>
					
							<label class="uk-form-label" for="input-name">
								<?php echo $entry_name; ?>
							</label>

							<div class="uk-form-controls">
					
								<input class="uk-input" id="input-name" type="text" name="name" value="<?php echo $customer_name; ?>">
					
							</div>
					
							<label class="uk-form-label" for="input-review">
								<?php echo $entry_review; ?>
							</label>
					
							<div class="uk-form-controls">

								<textarea class="uk-textarea" id="input-review" name="text" rows="5"></textarea>
					
								<div class="">
									<?php echo $text_note; ?>
								</div>
					
							</div>
					
							<?php echo $captcha; ?>
					
							<button class="" id="button-review" type="button" data-loading-text="<?php echo $text_loading; ?>">
								<?php echo $button_continue; ?>
							</button>
					
						<?php } else { ?>
					
							<?php echo $text_login; ?>
					
						<?php } ?>
					
					</form>

				</li>
			<?php } ?>

		</ul>

	</div>
</div>

<div class="uk-section uk-padding-remove uk-margin-small uk-margin-medium-top">
	<div class="cc_palc uk-container">

		<h3 class="uk-heading-bullet">
			Additional links
		</h3>

		<?php if ($tags) { ?>

			<div class="uk-margin uk-margin-small-bottom">

				<span>
					<span uk-icon="tag"></span>
					<?php echo $text_tags; ?>: 
				</span>
								
				<?php for ($i = 0; $i < count($tags); $i++) { ?>
					<?php if ($i < (count($tags) - 1)) { ?>

						<a href="<?php echo $tags[$i]['href']; ?>">
							<?php echo $tags[$i]['tag']; ?>
						</a>, 

					<?php } else { ?>

						<a href="<?php echo $tags[$i]['href']; ?>">
							<?php echo $tags[$i]['tag']; ?>
						</a>

					<?php } ?>
				<?php } ?>

			</div>

		<?php } ?>

		<?php if ($categories) { ?>

			<div class="uk-margin uk-margin-small-top">

				<span>
					<span uk-icon="link"></span>
					<?php echo $text_all_linked_categories; ?>: 
				</span>

				<?php foreach ($categories as $category) { ?>

					<a href="<?php echo $category['href']; ?>">
						<?php echo $category['name']; ?><span>,</span>
					</a>

				<?php } ?>

			</div>

		<?php } ?>

	</div>
</div>

<div class="uk-section uk-margin uk-margin-large-top uk-padding-remove uk-background-muted">
	<div class="uk-container cc_module cc_module_product_kit">

		product_kit

	</div>
</div>

<?php if ($products) { ?>

	<div class="uk-section uk-margin-remove-top uk-margin-medium-bottom uk-padding-remove">
		<div class="uk-container cc_module cc_module_related" uk-slider="autoplay: true">

			<div class="uk-margin-medium-top uk-margin-medium-bottom">
				<h3 class="uk-heading-line uk-text-center">
					<span>
						<?php echo $text_related; ?>
					</span>
				</h3>
			</div>

			<div class="uk-position-relative uk-visible-toggle">

				<ul class="uk-slider-items uk-grid">

					<?php $i = 0; ?>

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
											<img data-src="<?php echo $product['thumb']; ?>" width="" height="" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" uk-img="target: .cc_module_related" >
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

											<button class="uk-button uk-button-default uk-button-small" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">
						
												<span uk-icon="icon: cart"></span>
									
												<span>
													<?php echo $button_buy_it; ?>
												</span>
									
											</button>


										</div>

									</div>

								</div>

							</div>
		
						</li>

						<?php $i++; ?>

					<?php } ?>

				</ul>
			
				<a class="uk-position-center-left-out uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
				<a class="uk-position-center-right-out uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slider-item="next"></a>

			</div>

			<ul class="uk-slider-nav uk-dotnav uk-flex-center uk-margin"></ul>

		</div>
	</div>

<?php } ?>

<?php echo $content_bottom; ?>



























<script>
		//Добавление в корзину. в категориях было добавления проcто онкликом, но тут немного другой механизм, подтягивающий и опции товара. это нужно убрать, а скрипт в корзине модифицировать и добавить туда обработку опций товара, при этом кнопку на этой странице тоже сделать по онклику.
		$('#button-cart').on('click', function() {
			$.ajax({
				url: 'index.php?route=checkout/cart/add',
				type: 'post',
				data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
				dataType: 'json',
				beforeSend: function() {
					$('#button-cart').button('loading');
				},
				complete: function() {
					$('#button-cart').button('reset');
				},
				success: function(json) {
					$('.alert, .text-danger').remove();
					$('.form-group').removeClass('has-error');
		
					if (json['error']) {
						if (json['error']['option']) {
							for (i in json['error']['option']) {
								var element = $('#input-option' + i.replace('_', '-'));
		
								if (element.parent().hasClass('input-group')) {
									element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
								} else {
									element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
								}
							}
						}
		
						// Highlight any found errors
						$('.text-danger').parent().addClass('has-error');
					}
		
					if (json['success']) {
						$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
		
						$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
		
						$('html, body').animate({ scrollTop: 0 }, 'slow');
		
						$('#cart > ul').load('index.php?route=common/cart/info ul li');
					}
				},
						error: function(xhr, ajaxOptions, thrownError) {
								alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
						}
			});
		});
		</script>
		
		
		
		
		
		
		
		
		
		
		

		
		
		
		
		
		
		
		
		
		
		<script>
			// загрузка отзывов
		$('#review').delegate('.pagination a', 'click', function(e) {
				e.preventDefault();
		
				$('#review').fadeOut('slow');
		
				$('#review').load(this.href);
		
				$('#review').fadeIn('slow');
		});
		
		$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');
		
		$('#button-review').on('click', function() {
			$.ajax({
				url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
				type: 'post',
				dataType: 'json',
				data: $("#form-review").serialize(),
				beforeSend: function() {
					$('#button-review').button('loading');
				},
				complete: function() {
					$('#button-review').button('reset');
				},
				success: function(json) {
					$('.alert-success, .alert-danger').remove();
		
					if (json['error']) {
						$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
					}
		
					if (json['success']) {
						$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
		
						$('input[name=\'name\']').val('');
						$('textarea[name=\'text\']').val('');
					}
				}
			});
		});
	
	
	
	
	
	</script>




















<?php if ($thumb || $images) { ?>

	<script>
		$(document).ready(function () {
			$('.uk-slider-container img').hover(
				function(){ $('.cc_pmi_zoom').addClass('cc_zi-up') },
				function(){ $('.cc_pmi_zoom').removeClass('cc_zi-up') }
			)
		});
	</script>

	<script>
		var drift_options = {
			paneContainer: document.querySelector('.cc_pmi_zoom'),
			inlinePane: 959,
			inlineOffsetY: -100,
			containInline: true,
			hoverBoundingBox: true,
			touchBoundingBox: false,
			zoomFactor: 3
		}
	</script>

<?php } ?>

<?php if ($thumb) { ?>

	<script>
			new Drift(document.querySelector('.cc_product_main_image'), drift_options);
	</script>

<?php } ?>

<?php if ($images) { ?>
									
	<?php foreach ($images as $image) { ?>

		<script>
			new Drift(document.querySelector('.cc_product_additional_image_<?php echo $image['image_id']; ?>'), drift_options);
		</script>

	<?php } ?>

<?php } ?>

<?php echo $footer; ?>
<!-- /product.tpl -->