<!-- b_article.tpl -->
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

			<p class="uk-article-meta">Written by <a href="#">Super User</a> on 19 December 2018. Posted in <a href="#">Blog</a></p>

			<?php if ($description) { ?>
				<div class="uk-column-1-1 uk-column-1-2@s uk-column-1-2@l uk-column-divider uk-dropcap">
					<?php echo $description; ?>
				</div>
			<?php } ?>

		</article>

	</div>
</div>
<!-- /heading & description -->

<?php echo $content_top; ?>

<!-- downloads -->
<?php if ($download_status) { ?>

	<?php if ($downloads) { ?>

		<div class="uk-section uk-section-muted uk-padding-remove uk-margin-small uk-margin-remove-bottom">
			<div class="uk-container">

				<div class="uk-margin-small-top uk-margin-small-bottom">
					<span uk-icon="download"></span>
					Downloads:
				</div>

			</div>
		</div>

		<div class="uk-section uk-section-secondary uk-margin-remove-top uk-margin-medium-bottom uk-padding-remove">
			<div class="uk-container uk-padding-small">

				<?php foreach($downloads as $download) { ?>

					<div class="uk-inline uk-margin-small-right">
						<div class="uk-placeholder uk-margin-remove uk-padding-small">

							<a href="<?php echo $download['href']; ?>">

								<span uk-icon="cloud-download"></span>

								<?php echo $download['name']; ?> - <?php echo $download['size']; ?>

							</a>

						</div>
					</div>

				<?php } ?>

			</div>
		</div>

	<?php } ?> 

<?php } ?>
<!-- /downloads -->

<!-- reviews -->
<?php if ($review_status) { ?>

	<div class="uk-section uk-padding-remove uk-margin-small uk-margin-remove-top uk-margin-medium-bottom">
		<div class="uk-container">

			<div class="uk-margin-remove-top uk-margin-medium-bottom">
				<h3 class="uk-heading-bullet">
					<span>
						<?php echo $text_write; ?>
					</span>
				</h3>
			</div>





		<form class="" id="form-review">
		
			<div id="review"></div>


				


			<?php if ($review_guest) { ?>
			


				<label class="" for="input-name">
					<?php echo $entry_name; ?>
				</label>
				<input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="" />





				<label class="" for="input-review">
					<?php echo $entry_review; ?>
				</label>
				<textarea name="text" rows="5" id="input-review" class=""></textarea>
				<?php echo $text_note; ?>


				<button type="button" id="button-review">
					<?php echo $button_continue; ?>
				</button>
				<!-- <?php //echo $text_loading; ?> -->


			<?php } else { ?>
				<?php echo $text_login; ?>
			<?php } ?>

		</form>








		</div>
	</div>

<?php } ?>
<!-- /reviews -->

<!-- articles -->
<?php if ($articles) { ?>

	<div class="uk-section uk-margin-remove-top uk-margin-medium-bottom uk-padding-remove">
		<div class="uk-container cc_module" uk-slider="autoplay: true">
	
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

					<?php foreach ($articles as $article) { ?>
					
						<li class="cc_module_slider_item uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-width-1-5@l uk-width-1-5@xl">
	
							<div class="uk-margin-small-top uk-margin-medium-bottom">
	
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
<!-- /articles -->

<!-- related products -->
<?php if ($products) { ?>

	<div class="uk-section uk-margin-remove-top uk-margin-medium-bottom uk-padding-remove">
		<div class="uk-container cc_module cc_module_related" uk-slider="autoplay: true">

			<div class="uk-margin-medium-top uk-margin-medium-bottom">
				<h3 class="uk-heading-line uk-text-center">
					<span>
						<?php echo $text_related_product; ?>
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
<!-- /related products -->






<?php echo $column; ?>








<script>

$('#button-cart').ready(function() {
$('#button-cart').click(function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'date\'], #product input[type=\'datetime-local\'], #product input[type=\'time\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		
		success: function(json) {
			$('.alert, .text-danger').remove();
			
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#input-option' + i).after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
					}
				}
			} 
			
			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				$('#cart').load('index.php?route=module/cart' + ' #cart > *');    
				//$('#cart-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}   
		}
	});
});
});





$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;
	
	$('#form-upload').remove();
	
	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	$('#form-upload input[name=\'file\']').on('change', function() {
		$.ajax({
			url: 'index.php?route=product/product/upload',
			type: 'post',		
			dataType: 'json',
			data: new FormData($(this).parent()[0]),
			cache: false,
			contentType: false,
			processData: false,		
			beforeSend: function() {
				$(node).find('i').replaceWith('<i class="fa fa-spinner fa-spin"></i>');
				$(node).prop('disabled', true);
			},
			complete: function() {
				$(node).find('i').replaceWith('<i class="fa fa-upload"></i>');
				$(node).prop('disabled', false);			
			},		
			success: function(json) {
				if (json['error']) {
					$(node).parent().find('input[name^=\'option\']').after('<div class="text-danger">' + json['error'] + '</div>');
				}
							
				if (json['success']) {
					alert(json['success']);
					
					$(node).parent().find('input[name^=\'option\']').attr('value', json['file']);
				}
			},			
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});
});






$('#review').delegate('.pagination a', 'click', function(e) {
	e.preventDefault();

	$('#review').fadeOut('slow');

	$('#review').load(this.href);

	$('#review').fadeIn('slow');
});






$('#review').load('index.php?route=blog/article/review&article_id=<?php echo $article_id; ?>');






$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=blog/article/write&article_id=<?php echo $article_id; ?>',
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














<?php echo $content_bottom; ?>

<?php echo $footer; ?>
<!-- b_article.tpl -->