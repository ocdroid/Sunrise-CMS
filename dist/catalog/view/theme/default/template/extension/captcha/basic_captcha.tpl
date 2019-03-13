<!-- basic_captcha.tpl -->
<div class="uk-margin">

	<div class="uk-text-large">
		<?php echo $text_captcha; ?>
	</div>

	<div class="">

		<?php if (substr($route, 0, 9) == 'checkout/') { ?>

			<label class="uk-form-label" for="input-payment-captcha">
				<?php echo $entry_captcha; ?>
			</label>

			<input class="uk-input" type="text" name="captcha" id="input-payment-captcha" autocomplete="off">

			<img src="index.php?route=extension/captcha/basic_captcha/captcha" alt="" />
		
		<?php } else { ?>
		
			<label class="uk-form-label" for="input-captcha">
				<?php echo $entry_captcha; ?>
			</label>
			
			<div class="uk-form-controls">

				<input class="uk-input" type="text" name="captcha" id="input-captcha">

				<img src="index.php?route=extension/captcha/basic_captcha/captcha" alt="">

				<?php if ($error_captcha) { ?>
					<?php echo $error_captcha; ?>
				<?php } ?>

			</div>

		<?php } ?>

	</div>

</div>
<!-- /basic_captcha.tpl -->