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