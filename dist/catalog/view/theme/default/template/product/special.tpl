<!-- special.tpl -->
<?php echo $header; ?>

<!-- breadcrumbs -->
<?php require_once(DIR_TEMPLATE.'/default/template/inc.breadcrumbs.tpl'); ?>

<div class="uk-section uk-padding-remove uk-margin-small">
	<div class="uk-container">

		<article class="uk-article">

			<h1 class="uk-article-title uk-margin-medium-top uk-margin-medium-bottom uk-text-center">
				<?php echo $heading_title; ?>
			</h1>

			<?php if ($description) { ?>
				<p class="uk-text-lead">
					<?php echo $description; ?>
				</p>
			<?php } ?>

		</article>

	</div>
</div>

<?php echo $content_top; ?>

<!-- products -->
<?php if ($products) { ?>

	<!-- sort & limit -->
	<?php require_once(DIR_TEMPLATE.'/default/template/inc.sort_and_limit.tpl'); ?>

	<div class="uk-section uk-padding-remove uk-margin-small">
		<div class="uk-container">

			<div class="uk-flex uk-grid-collapse" uk-grid>

				<div class="cc_cm uk-width-1-1 uk-flex uk-grid-collapse" uk-grid>

					<?php foreach ($products as $product) { ?>
						
						<div class="class_cm uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-width-1-4@l uk-width-1-5@xl">

							<div class="uk-card uk-box-shadow-hover-large">
					
								<div class="uk-card-badge uk-label uk-label-success">
									<?php echo $product['sticker']; ?>
								</div>
					
								<div class="uk-card-media-top uk-padding-small uk-position-relative">
									
									<a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>">
										<img data-src="<?php echo $product['thumb']; ?>" width="" height="" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" uk-img>
									</a>

									<?php if ($product['benefits']) { ?>

										<a class="cc_product_benefits_open uk-position-top-left" href="#cc_product_benefits_open_<?php echo $product['product_id']; ?>" uk-icon="info" uk-tooltip="title: <?php echo $text_benefits; ?>; pos: top-left" uk-toggle></a>

									<?php } ?>

								</div>
					
								<div class="uk-card-body uk-padding-small uk-text-left">
					
									<h3 class="uk-card-title uk-text-truncate">
										<a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>" uk-tooltip="title: <?php echo $product['name']; ?>; pos: top-left">
											<?php echo $product['name']; ?>
										</a>
									</h3>
					
									<div class="uk-text-meta uk-text-truncate">
										<?php echo $product['description']; ?>
									</div>

									<?php if ($product['benefits']) { ?>

										<div id="cc_product_benefits_open_<?php echo $product['product_id']; ?>" uk-modal>
											<div class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical">
												<button class="uk-modal-close-default" type="button" uk-close></button>
												<p>

													<?php echo $text_benefits; ?>
											
													<?php foreach ($product['benefits'] as $benefit) { ?>	
														
														<?php if ($benefit['type'] == 1) { ?>
											
																<?php if (!$benefit['link']) { ?>
																	<img src="<?php echo $benefit['thumb']; ?>" alt="<?php echo $benefit['name']; ?>">
																<?php } else { ?> 
																	<a href="<?php echo $benefit['link']; ?>" target="_blank" rel="noopener" title="<?php echo $benefit['name']; ?>">
																		<img src="<?php echo $benefit['thumb']; ?>" alt="<?php echo $benefit['name']; ?>">
																	</a>
																<?php } ?>
											
																<?php if ($benefit['description']) { ?>
																	<?php echo $benefit['description']; ?>
																<?php } ?>
											
														<?php } ?>
											
													<?php } ?>
											
													<?php foreach ($product['benefits'] as $benefit) { ?>	
														<?php if ($benefit['type'] == 0) { ?>
											
																<?php if (!$benefit['link']) { ?>
																	<img src="<?php echo $benefit['thumb']; ?>" alt="<?php echo $benefit['name']; ?>">
																<?php } else { ?> 
																	<a href="<?php echo $benefit['link']; ?>" target="_blank" rel="noopener" title="<?php echo $benefit['name']; ?>">
																		<img src="<?php echo $benefit['thumb']; ?>" alt="<?php echo $benefit['name']; ?>">
																	</a>
																<?php } ?>
											
														<?php } ?> 
													<?php } ?>
											
												</p>
											</div>
										</div>
									
									<?php } ?>

									<div class="uk-text-left">
				
										<?php if ($product['special']) { ?>
											<span class="cc_product_card_special_price">
												<?php echo $product['special']; ?>
											</span>
										<?php } ?>
										
										<span class="uk-text-large">
											<?php echo $product['price']; ?>
										</span>
				
									</div>							
				
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

					<?php } ?>

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

<?php echo $content_bottom; ?>

<div class="uk-section uk-padding-remove uk-margin-small">
	<div class="uk-container uk-text-right">

		<?php echo $pagination; ?>
		<?php echo $results; ?>

	</div>
</div>

<?php echo $footer; ?>
<!-- /special.tpl -->