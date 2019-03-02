<!-- cart.tpl -->
<button class="uk-button uk-button-default" id="cc_header_cart" type="button" uk-toggle="target: #cc_cart" uk-tooltip="title: <?php echo $products_price; ?>; pos: top">
	<span uk-icon="cart"></span>
	<span class="uk-text-capitalize" id="cart-total">		
		<?php echo $products_count; ?>
		<?php echo $text_items; ?>
	</span>
</button>

<div id="cc_cart" uk-modal>
	<div class="uk-modal-dialog uk-modal-body" id="cc_header_modal_cart">
		
		<h2 class="uk-modal-title">
			<?php echo $text_header_cart; ?>
		</h2>

		<?php if ($products) { ?>
		
			<div class="uk-alert-success" uk-alert>
				<a class="uk-alert-close" uk-close></a>
				<span uk-icon="info"></span>
				<?php echo $text_header_cart_qt_info; ?>
			</div>

			<table class="uk-table uk-table-middle uk-table-hover">

				<?php foreach ($products as $product) { ?>
				
					<tr>

						<td class="cc_cart_info_image uk-table-shrink">

							<?php if ($product['thumb']) { ?>

								<a href="<?php echo $product['href']; ?>">
									<img data-src="<?php echo $product['thumb']; ?>" width="" height="" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" uk-img>
								</a>

							<?php } ?>
							
						</td>

						<td class="cc_cart_info_name">

							<a href="<?php echo $product['href']; ?>">
								<?php echo $product['name']; ?>
							</a>
							
							<?php if ($product['option']) { ?>
								<?php foreach ($product['option'] as $option) { ?>
									<?php echo $option['name']; ?>
									<?php echo $option['value']; ?>
								<?php } ?>
							<?php } ?>

						</td>
						
						<td class="cc_cart_info_price uk-text-right@s">
							<span class="uk-text-meta">
								(Qt: <?php echo $product['quantity']; ?>)
							</span>
							<?php echo $product['total']; ?>
						</td>

						<td class="cc_cart_info_act uk-table-shrink">
							<span onclick="cart.remove('<?php echo $product['cart_id']; ?>');" uk-icon="close" uk-tooltip="title: <?php echo $button_remove; ?>; pos: top"></span>
						</td>

					</tr>

				<?php } ?>

			</table>

			<hr>

			<table class="cc_cart_total uk-table uk-table-small">
				
				<?php foreach ($totals as $total) { ?>
					
					<tr>
						<td>
				
							<div class="uk-grid-small" uk-grid>
						
								<div class="uk-width-expand" uk-leader="media: 320">
									<?php echo $total['title']; ?>
								</div>
						
								<div class="cc_cart_total_price">
									<?php echo $total['text']; ?>
								</div>
						
							</div>
			
						</td>
					</tr>
					
				<?php } ?>
			
			</table>

			<hr>

		<?php } else { ?>

			<p>
				<?php echo $text_empty; ?>
			</p>

			<p class="uk-text-muted">
				<?php echo $text_empty_info; ?>
			</p>

		<?php } ?>

		<p class="uk-text-right">

			<button class="uk-modal-close-default" type="button" uk-close></button>

			<a class="uk-button uk-button-default" type="button" href="<?php echo $cart; ?>">
				<?php echo $text_cart; ?>
			</a>

			<a class="uk-button uk-button-primary" type="button" href="<?php echo $checkout; ?>">
				<?php echo $text_checkout; ?>
			</a>

		</p>

	</div>
</div>

<script>
	var cart = {
		'add': function(product_id, quantity) {
			$.ajax({
				url: 'index.php?route=checkout/cart/add',
				type: 'post',
				data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
				dataType: 'json',
				success: function(json) {
					// +: если добавление в корзину успешно - убираем любые алерты об ошибке или подтверждении, выведенные ранее
					$('.uk-alert-danger, .uk-alert-success').remove();
					
					if (json['redirect']) {
						location = json['redirect'];
					}

					if (json['success']) {
						// при доабвлении в корзину - создание алерта с уведомлением об этом
						// +/-: нужно будет потом сменить к какому элементу будет привязываться алерт, т.к. верстка поменяется да и вобще подумать как более наглядно можно выводить уведомление
						$('#content').parent().before('<div class="uk-alert-success" uk-alert><a class="uk-alert-close" uk-close></a><p> ' + json['success'] + ' </p></div>');
						// Need to set timeout otherwise it wont update the total
						// catalog/controller/chechout/cart.php
						// https://forum.opencart.com/viewtopic.php?t=81663
						setTimeout(function () {
							$('#cc_header_cart').attr('uk-tooltip','title: ' + json['products_price'] + '\n; pos: top');
						}, 25);
						setTimeout(function () {
							$('#cc_header_cart').html('<span uk-icon="cart"></span><span class="uk-text-capitalize" id="cart-total"> ' + json['products_count'] + '  ' + json['text_items'] + ' </span>');
						}, 25);

						$('#cc_cart').load('index.php?route=common/cart/info #cc_header_modal_cart');
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		},
		'update': function(key, quantity) {
			$.ajax({
				url: 'index.php?route=checkout/cart/edit',
				type: 'post',
				data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
				dataType: 'json',
				success: function(json) {
					setTimeout(function () {
						$('#cc_header_cart').attr('uk-tooltip','title: ' + json['products_price'] + '\n; pos: top');
					}, 25);
					setTimeout(function () {
						$('#cc_header_cart').html('<span uk-icon="cart"></span><span class="uk-text-capitalize" id="cart-total"> ' + json['products_count'] + '  ' + json['text_items'] + ' </span>');
					}, 25);
					if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
						location = 'index.php?route=checkout/cart';
					} else {
						$('#cc_cart').load('index.php?route=common/cart/info #cc_header_modal_cart');
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		},
		'remove': function(key) {
			$.ajax({
				url: 'index.php?route=checkout/cart/remove',
				type: 'post',
				data: 'key=' + key,
				dataType: 'json',
				success: function(json) {
					setTimeout(function () {
						$('#cc_header_cart').attr('uk-tooltip','title: ' + json['products_price'] + '\n; pos: top');
					}, 25);
					setTimeout(function () {
						$('#cc_header_cart').html('<span uk-icon="cart"></span><span class="uk-text-capitalize" id="cart-total"> ' + json['products_count'] + '  ' + json['text_items'] + ' </span>');
					}, 25);
					if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
						location = 'index.php?route=checkout/cart';
					} else {
						$('#cc_cart').load('index.php?route=common/cart/info #cc_header_modal_cart');
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}
</script>
<!-- /cart.tpl -->