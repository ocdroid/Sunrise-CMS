<!-- settings.tpl -->
<?php echo $header; ?>

<?php echo $column; ?>

<!-- breadcrumbs -->
<div class="uk-section uk-padding-small uk-background-muted">
	<div class="uk-container">

		<ul class="uk-breadcrumb">

			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li>
					<a href="<?php echo $breadcrumb['href']; ?>">
						<?php echo $breadcrumb['text']; ?>
					</a>
				</li>
			<?php } ?>

			<!-- heading in breadcrumbs -->
			<li class="uk-text-bold">
				<?php echo $text_edit; ?>
			</li>
			<!-- /heading in breadcrumbs -->

		</ul>

	</div>
</div>
<!-- /breadcrumbs -->

<?php if ($success) { ?>
	<div class="uk-alert-success" uk-alert>
		<a class="uk-alert-close" uk-close></a>
		<p class="uk-text-center">
			<?php echo $success; ?>
		</p>
	</div>
<?php } ?>

<?php if ($error_warning) { ?>
	<div class="uk-alert-warning" uk-alert>
		<a class="uk-alert-close" uk-close></a>
		<p class="uk-text-center">
			<?php echo $error_warning; ?>
		</p>
	</div>
<?php } ?>

<div class="uk-section uk-padding-medium-bottom uk-padding-remove">
	<div 
		class="uk-container uk-background-default" 
		uk-height-viewport="expand: true"
	>

		<form 
			action="<?php echo $action; ?>" 
			method="post" 
			enctype="multipart/form-data" 
			id="form-setting" 
			class="uk-form-stacked"
		>

			<div class="uk-flex" uk-grid>
				
				<div class="uk-width-1-1 uk-width-1-1@s uk-width-1-1@m uk-width-4-5@l uk-width-5-6@xl uk-margin-medium-top uk-margin-small-bottom">

					<ul uk-tab="media: @s; connect: #ci_admin_tabs">

						<li class="uk-active">
							<a href="#">
								<?php echo $tab_general; ?>
							</a>
						</li>

						<li>
							<a href="#">
								<?php echo $tab_store; ?>
							</a>
						</li>

						<li>
							<a href="#">
								<?php echo $tab_local; ?>
							</a>
						</li>

						<li>
							<a href="#">
								<?php echo $tab_option; ?>
							</a>
						</li>

						<li>
							<a href="#">
								<?php echo $tab_image; ?>
							</a>
						</li>

						<li>
							<a href="#">
								<?php echo $tab_ftp; ?>
							</a>
						</li>

						<li>
							<a href="#">
								<?php echo $tab_mail; ?>
							</a>
						</li>

						<li>
							<a href="#">
								<?php echo $tab_server; ?>
							</a>
						</li>

					</ul>

					<ul 
						id="ci_admin_tabs" 
						class="uk-switcher uk-margin"
					>

						<li>





								<div class="uk-margin">
									<label class="uk-form-label" for="input-meta-title"><?php echo $entry_meta_title; ?></label>
									<div class="uk-form-controls">
										<input type="text" name="config_meta_title" value="<?php echo $config_meta_title; ?>" placeholder="<?php echo $entry_meta_title; ?>" id="input-meta-title" class="uk-input">
										<?php if ($error_meta_title) { ?>
										<div class="text-danger"><?php echo $error_meta_title; ?></div>
										<?php } ?>
									</div>
								</div>

								<div class="uk-margin">
									<label class="uk-form-label" for="input-meta-description"><?php echo $entry_meta_description; ?></label>
									<div class="uk-form-controls">
										<input type="text" name="config_meta_description" value="<?php echo $config_meta_description; ?>" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description" class="uk-input">
									</div>
								</div>

								<div class="uk-margin">
									<label class="uk-form-label" for="input-theme"><?php echo $entry_theme; ?></label>
									<div class="uk-form-controls">
										<select name="config_theme" id="input-theme" class="uk-select">
											<?php foreach ($themes as $theme) { ?>
											<?php if ($theme['value'] == $config_theme) { ?>
											<option value="<?php echo $theme['value']; ?>" selected="selected"><?php echo $theme['text']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $theme['value']; ?>"><?php echo $theme['text']; ?></option>
											<?php } ?>
											<?php } ?>
										</select>
										<br />
										<img src="" alt="" id="theme" class="img-thumbnail"></div>
								</div>

								<div class="uk-margin">
									<label class="uk-form-label" for="input-layout"><?php echo $entry_layout; ?></label>
									<div class="uk-form-controls">
										<select name="config_layout_id" id="input-layout" class="uk-select">
											<?php foreach ($layouts as $layout) { ?>
											<?php if ($layout['layout_id'] == $config_layout_id) { ?>
											<option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
											<?php } ?>
											<?php } ?>
										</select>
									</div>
								</div>







						</li>
						<li>

						

								<div class="uk-margin">
									<label class="uk-form-label" for="input-name"><?php echo $entry_name; ?></label>
									<div class="uk-form-controls">
										<input type="text" name="config_name" value="<?php echo $config_name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="uk-input">
										<?php if ($error_name) { ?>
										<div class="text-danger"><?php echo $error_name; ?></div>
										<?php } ?>
									</div>
								</div>
								<div class="uk-margin">
									<label class="uk-form-label" for="input-owner"><?php echo $entry_owner; ?></label>
									<div class="uk-form-controls">
										<input type="text" name="config_owner" value="<?php echo $config_owner; ?>" placeholder="<?php echo $entry_owner; ?>" id="input-owner" class="uk-input">
										<?php if ($error_owner) { ?>
										<div class="text-danger"><?php echo $error_owner; ?></div>
										<?php } ?>
									</div>
								</div>
								<div class="uk-margin">
									<label class="uk-form-label" for="input-address"><?php echo $entry_address; ?></label>
									<div class="uk-form-controls">
										<textarea name="config_address" placeholder="<?php echo $entry_address; ?>" rows="5" id="input-address" class="uk-textarea"><?php echo $config_address; ?></textarea>
										<?php if ($error_address) { ?>
										<div class="text-danger"><?php echo $error_address; ?></div>
										<?php } ?>
									</div>
								</div>
								<div class="uk-margin">
									<label class="uk-form-label" for="input-geocode"><span data-toggle="tooltip" data-container="#tab-general" title="<?php echo $help_geocode; ?>"><?php echo $entry_geocode; ?></span></label>
									<div class="uk-form-controls">
										<input type="text" name="config_geocode" value="<?php echo $config_geocode; ?>" placeholder="<?php echo $entry_geocode; ?>" id="input-geocode" class="uk-input">
									</div>
								</div>
								<div class="uk-margin">
									<label class="uk-form-label" for="input-email"><?php echo $entry_email; ?></label>
									<div class="uk-form-controls">
										<input type="text" name="config_email" value="<?php echo $config_email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="uk-input">
										<?php if ($error_email) { ?>
										<div class="text-danger"><?php echo $error_email; ?></div>
										<?php } ?>
									</div>
								</div>
								<div class="uk-margin">
									<label class="uk-form-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
									<div class="uk-form-controls">
										<input type="text" name="config_telephone" value="<?php echo $config_telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="uk-input">
										<?php if ($error_telephone) { ?>
										<div class="text-danger"><?php echo $error_telephone; ?></div>
										<?php } ?>
									</div>
								</div>
								<div class="uk-margin">
									<label class="uk-form-label" for="input-fax"><?php echo $entry_fax; ?></label>
									<div class="uk-form-controls">
										<input type="text" name="config_fax" value="<?php echo $config_fax; ?>" placeholder="<?php echo $entry_fax; ?>" id="input-fax" class="uk-input">
									</div>
								</div>
								<div class="uk-margin">
									<label class="uk-form-label" for="input-image"><?php echo $entry_image; ?></label>
									<div class="uk-form-controls"><a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>"></a>
										<input type="hidden" name="config_image" value="<?php echo $config_image; ?>" id="input-image">
									</div>
								</div>
								<div class="uk-margin">
									<label class="uk-form-label" for="input-open"><span data-toggle="tooltip" data-container="#tab-general" title="<?php echo $help_open; ?>"><?php echo $entry_open; ?></span></label>
									<div class="uk-form-controls">
										<textarea name="config_open" rows="5" placeholder="<?php echo $entry_open; ?>" id="input-open" class="uk-textarea"><?php echo $config_open; ?></textarea>
									</div>
								</div>
								<div class="uk-margin">
									<label class="uk-form-label" for="input-comment"><span data-toggle="tooltip" data-container="#tab-general" title="<?php echo $help_comment; ?>"><?php echo $entry_comment; ?></span></label>
									<div class="uk-form-controls">
										<textarea name="config_comment" rows="5" placeholder="<?php echo $entry_comment; ?>" id="input-comment" class="uk-textarea"><?php echo $config_comment; ?></textarea>
									</div>
								</div>
								<?php if ($locations) { ?>
								<div class="uk-margin">
									<label class="uk-form-label"><span data-toggle="tooltip" data-container="#tab-general" title="<?php echo $help_location; ?>"><?php echo $entry_location; ?></span></label>
									<div class="uk-form-controls">
										<?php foreach ($locations as $location) { ?>
										<div class="checkbox">
											<label>
												<?php if (in_array($location['location_id'], $config_location)) { ?>
												<input type="checkbox" name="config_location[]" value="<?php echo $location['location_id']; ?>" checked="checked">
												<?php echo $location['name']; ?>
												<?php } else { ?>
												<input type="checkbox" name="config_location[]" value="<?php echo $location['location_id']; ?>">
												<?php echo $location['name']; ?>
												<?php } ?>
											</label>
										</div>
										<?php } ?>
									</div>
								</div>
								<?php } ?>



						</li>
						<li>

						

								<div class="uk-margin">
									<label class="uk-form-label" for="input-country"><?php echo $entry_country; ?></label>
									<div class="uk-form-controls">
										<select name="config_country_id" id="input-country" class="uk-select">
											<?php foreach ($countries as $country) { ?>
											<?php if ($country['country_id'] == $config_country_id) { ?>
											<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
											<?php } ?>
											<?php } ?>
										</select>
									</div>
								</div>
								<div class="uk-margin">
									<label class="uk-form-label" for="input-zone"><?php echo $entry_zone; ?></label>
									<div class="uk-form-controls">
										<select name="config_zone_id" id="input-zone" class="uk-select">
										</select>
									</div>
								</div>
								<div class="uk-margin">
									<label class="uk-form-label" for="input-language"><?php echo $entry_language; ?></label>
									<div class="uk-form-controls">
										<select name="config_language" id="input-language" class="uk-select">
											<?php foreach ($languages as $language) { ?>
											<?php if ($language['code'] == $config_language) { ?>
											<option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
											<?php } ?>
											<?php } ?>
										</select>
									</div>
								</div>
								<div class="uk-margin">
									<label class="uk-form-label" for="input-admin-language"><?php echo $entry_admin_language; ?></label>
									<div class="uk-form-controls">
										<select name="config_admin_language" id="input-admin-language" class="uk-select">
											<?php foreach ($languages as $language) { ?>
											<?php if ($language['code'] == $config_admin_language) { ?>
											<option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
											<?php } ?>
											<?php } ?>
										</select>
									</div>
								</div>
								<div class="uk-margin">
									<label class="uk-form-label" for="input-currency"><span data-toggle="tooltip" title="<?php echo $help_currency; ?>"><?php echo $entry_currency; ?></span></label>
									<div class="uk-form-controls">
										<select name="config_currency" id="input-currency" class="uk-select">
											<?php foreach ($currencies as $currency) { ?>
											<?php if ($currency['code'] == $config_currency) { ?>
											<option value="<?php echo $currency['code']; ?>" selected="selected"><?php echo $currency['title']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?></option>
											<?php } ?>
											<?php } ?>
										</select>
									</div>
								</div>
								<div class="uk-margin">
									<label class="uk-form-label"><span data-toggle="tooltip" title="<?php echo $help_currency_auto; ?>"><?php echo $entry_currency_auto; ?></span></label>
									<div class="uk-form-controls">
										<label class="radio-inline">
											<?php if ($config_currency_auto) { ?>
											<input type="radio" name="config_currency_auto" value="1" checked="checked">
											<?php echo $text_yes; ?>
											<?php } else { ?>
											<input type="radio" name="config_currency_auto" value="1">
											<?php echo $text_yes; ?>
											<?php } ?>
										</label>
										<label class="radio-inline">
											<?php if (!$config_currency_auto) { ?>
											<input type="radio" name="config_currency_auto" value="0" checked="checked">
											<?php echo $text_no; ?>
											<?php } else { ?>
											<input type="radio" name="config_currency_auto" value="0">
											<?php echo $text_no; ?>
											<?php } ?>
										</label>
									</div>
								</div>


						</li>
						<li>

						

								<fieldset class="uk-fieldset">
									<legend class="uk-legend"><?php echo $text_product; ?></legend>
									<div class="uk-margin">
										<label class="uk-form-label"><span data-toggle="tooltip" title="<?php echo $help_product_count; ?>"><?php echo $entry_product_count; ?></span></label>
										<div class="uk-form-controls">
											<label class="radio-inline">
												<?php if ($config_product_count) { ?>
												<input type="radio" name="config_product_count" value="1" checked="checked">
												<?php echo $text_yes; ?>
												<?php } else { ?>
												<input type="radio" name="config_product_count" value="1">
												<?php echo $text_yes; ?>
												<?php } ?>
											</label>
											<label class="radio-inline">
												<?php if (!$config_product_count) { ?>
												<input type="radio" name="config_product_count" value="0" checked="checked">
												<?php echo $text_no; ?>
												<?php } else { ?>
												<input type="radio" name="config_product_count" value="0">
												<?php echo $text_no; ?>
												<?php } ?>
											</label>
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label" for="input-admin-limit"><span data-toggle="tooltip" title="<?php echo $help_limit_admin; ?>"><?php echo $entry_limit_admin; ?></span></label>
										<div class="uk-form-controls">
											<input type="text" name="config_limit_admin" value="<?php echo $config_limit_admin; ?>" placeholder="<?php echo $entry_limit_admin; ?>" id="input-admin-limit" class="uk-input">
											<?php if ($error_limit_admin) { ?>
											<div class="text-danger"><?php echo $error_limit_admin; ?></div>
											<?php } ?>
										</div>
									</div>
								</fieldset>
								<fieldset class="uk-fieldset">
									<legend class="uk-legend"><?php echo $text_review; ?></legend>
									<div class="uk-margin">
										<label class="uk-form-label"><span data-toggle="tooltip" title="<?php echo $help_review; ?>"><?php echo $entry_review; ?></span></label>
										<div class="uk-form-controls">
											<label class="radio-inline">
												<?php if ($config_review_status) { ?>
												<input type="radio" name="config_review_status" value="1" checked="checked">
												<?php echo $text_yes; ?>
												<?php } else { ?>
												<input type="radio" name="config_review_status" value="1">
												<?php echo $text_yes; ?>
												<?php } ?>
											</label>
											<label class="radio-inline">
												<?php if (!$config_review_status) { ?>
												<input type="radio" name="config_review_status" value="0" checked="checked">
												<?php echo $text_no; ?>
												<?php } else { ?>
												<input type="radio" name="config_review_status" value="0">
												<?php echo $text_no; ?>
												<?php } ?>
											</label>
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label"><span data-toggle="tooltip" title="<?php echo $help_review_guest; ?>"><?php echo $entry_review_guest; ?></span></label>
										<div class="uk-form-controls">
											<label class="radio-inline">
												<?php if ($config_review_guest) { ?>
												<input type="radio" name="config_review_guest" value="1" checked="checked">
												<?php echo $text_yes; ?>
												<?php } else { ?>
												<input type="radio" name="config_review_guest" value="1">
												<?php echo $text_yes; ?>
												<?php } ?>
											</label>
											<label class="radio-inline">
												<?php if (!$config_review_guest) { ?>
												<input type="radio" name="config_review_guest" value="0" checked="checked">
												<?php echo $text_no; ?>
												<?php } else { ?>
												<input type="radio" name="config_review_guest" value="0">
												<?php echo $text_no; ?>
												<?php } ?>
											</label>
										</div>
									</div>
								</fieldset>
								<fieldset class="uk-fieldset">
									<legend class="uk-legend"><?php echo $text_tax; ?></legend>
									<div class="uk-margin">
										<label class="uk-form-label"><?php echo $entry_tax; ?></label>
										<div class="uk-form-controls">
											<label class="radio-inline">
												<?php if ($config_tax) { ?>
												<input type="radio" name="config_tax" value="1" checked="checked">
												<?php echo $text_yes; ?>
												<?php } else { ?>
												<input type="radio" name="config_tax" value="1">
												<?php echo $text_yes; ?>
												<?php } ?>
											</label>
											<label class="radio-inline">
												<?php if (!$config_tax) { ?>
												<input type="radio" name="config_tax" value="0" checked="checked">
												<?php echo $text_no; ?>
												<?php } else { ?>
												<input type="radio" name="config_tax" value="0">
												<?php echo $text_no; ?>
												<?php } ?>
											</label>
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label" for="input-tax-default"><span data-toggle="tooltip" title="<?php echo $help_tax_default; ?>"><?php echo $entry_tax_default; ?></span></label>
										<div class="uk-form-controls">
											<select name="config_tax_default" id="input-tax-default" class="uk-select">
												<option value=""><?php echo $text_none; ?></option>
												<?php  if ($config_tax_default == 'shipping') { ?>
												<option value="shipping" selected="selected"><?php echo $text_shipping; ?></option>
												<?php } else { ?>
												<option value="shipping"><?php echo $text_shipping; ?></option>
												<?php } ?>
												<?php  if ($config_tax_default == 'payment') { ?>
												<option value="payment" selected="selected"><?php echo $text_payment; ?></option>
												<?php } else { ?>
												<option value="payment"><?php echo $text_payment; ?></option>
												<?php } ?>
											</select>
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label" for="input-tax-customer"><span data-toggle="tooltip" title="<?php echo $help_tax_customer; ?>"><?php echo $entry_tax_customer; ?></span></label>
										<div class="uk-form-controls">
											<select name="config_tax_customer" id="input-tax-customer" class="uk-select">
												<option value=""><?php echo $text_none; ?></option>
												<?php  if ($config_tax_customer == 'shipping') { ?>
												<option value="shipping" selected="selected"><?php echo $text_shipping; ?></option>
												<?php } else { ?>
												<option value="shipping"><?php echo $text_shipping; ?></option>
												<?php } ?>
												<?php  if ($config_tax_customer == 'payment') { ?>
												<option value="payment" selected="selected"><?php echo $text_payment; ?></option>
												<?php } else { ?>
												<option value="payment"><?php echo $text_payment; ?></option>
												<?php } ?>
											</select>
										</div>
									</div>
								</fieldset>
								<fieldset class="uk-fieldset">
									<legend class="uk-legend"><?php echo $text_account; ?></legend>
									<div class="uk-margin">
										<label class="uk-form-label" for="input-customer-group"><span data-toggle="tooltip" title="<?php echo $help_customer_group; ?>"><?php echo $entry_customer_group; ?></span></label>
										<div class="uk-form-controls">
											<select name="config_customer_group_id" id="input-customer-group" class="uk-select">
												<?php foreach ($customer_groups as $customer_group) { ?>
												<?php if ($customer_group['customer_group_id'] == $config_customer_group_id) { ?>
												<option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
												<?php } ?>
												<?php } ?>
											</select>
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label"><span data-toggle="tooltip" title="<?php echo $help_customer_group_display; ?>"><?php echo $entry_customer_group_display; ?></span></label>
										<div class="uk-form-controls">
											<?php foreach ($customer_groups as $customer_group) { ?>
											<div class="checkbox">
												<label>
													<?php if (in_array($customer_group['customer_group_id'], $config_customer_group_display)) { ?>
													<input type="checkbox" name="config_customer_group_display[]" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked">
													<?php echo $customer_group['name']; ?>
													<?php } else { ?>
													<input type="checkbox" name="config_customer_group_display[]" value="<?php echo $customer_group['customer_group_id']; ?>">
													<?php echo $customer_group['name']; ?>
													<?php } ?>
												</label>
											</div>
											<?php } ?>
											<?php if ($error_customer_group_display) { ?>
											<div class="text-danger"><?php echo $error_customer_group_display; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label"><span data-toggle="tooltip" title="<?php echo $help_customer_price; ?>"><?php echo $entry_customer_price; ?></span></label>
										<div class="uk-form-controls">
											<label class="radio-inline">
												<?php if ($config_customer_price) { ?>
												<input type="radio" name="config_customer_price" value="1" checked="checked">
												<?php echo $text_yes; ?>
												<?php } else { ?>
												<input type="radio" name="config_customer_price" value="1">
												<?php echo $text_yes; ?>
												<?php } ?>
											</label>
											<label class="radio-inline">
												<?php if (!$config_customer_price) { ?>
												<input type="radio" name="config_customer_price" value="0" checked="checked">
												<?php echo $text_no; ?>
												<?php } else { ?>
												<input type="radio" name="config_customer_price" value="0">
												<?php echo $text_no; ?>
												<?php } ?>
											</label>
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label" for="input-login-attempts"><span data-toggle="tooltip" title="<?php echo $help_login_attempts; ?>"><?php echo $entry_login_attempts; ?></span></label>
										<div class="uk-form-controls">
											<input type="text" name="config_login_attempts" value="<?php echo $config_login_attempts; ?>" placeholder="<?php echo $entry_login_attempts; ?>" id="input-login-attempts" class="uk-input">
											<?php if ($error_login_attempts) { ?>
											<div class="text-danger"><?php echo $error_login_attempts; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label" for="input-account"><span data-toggle="tooltip" title="<?php echo $help_account; ?>"><?php echo $entry_account; ?></span></label>
										<div class="uk-form-controls">
											<select name="config_account_id" id="input-account" class="uk-select">
												<option value="0"><?php echo $text_none; ?></option>
												<?php foreach ($informations as $information) { ?>
												<?php if ($information['information_id'] == $config_account_id) { ?>
												<option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
												<?php } ?>
												<?php } ?>
											</select>
										</div>
									</div>
								</fieldset>
								<fieldset class="uk-fieldset">
									<legend class="uk-legend"><?php echo $text_checkout; ?></legend>
									<div class="uk-margin">
										<label class="uk-form-label" for="input-invoice-prefix"><span data-toggle="tooltip" title="<?php echo $help_invoice_prefix; ?>"><?php echo $entry_invoice_prefix; ?></span></label>
										<div class="uk-form-controls">
											<input type="text" name="config_invoice_prefix" value="<?php echo $config_invoice_prefix; ?>" placeholder="<?php echo $entry_invoice_prefix; ?>" id="input-invoice-prefix" class="uk-input">
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label"><span data-toggle="tooltip" title="<?php echo $help_checkout_guest; ?>"><?php echo $entry_checkout_guest; ?></span></label>
										<div class="uk-form-controls">
											<label class="radio-inline">
												<?php if ($config_checkout_guest) { ?>
												<input type="radio" name="config_checkout_guest" value="1" checked="checked">
												<?php echo $text_yes; ?>
												<?php } else { ?>
												<input type="radio" name="config_checkout_guest" value="1">
												<?php echo $text_yes; ?>
												<?php } ?>
											</label>
											<label class="radio-inline">
												<?php if (!$config_checkout_guest) { ?>
												<input type="radio" name="config_checkout_guest" value="0" checked="checked">
												<?php echo $text_no; ?>
												<?php } else { ?>
												<input type="radio" name="config_checkout_guest" value="0">
												<?php echo $text_no; ?>
												<?php } ?>
											</label>
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label" for="input-checkout"><span data-toggle="tooltip" title="<?php echo $help_checkout; ?>"><?php echo $entry_checkout; ?></span></label>
										<div class="uk-form-controls">
											<select name="config_checkout_id" id="input-checkout" class="uk-select">
												<option value="0"><?php echo $text_none; ?></option>
												<?php foreach ($informations as $information) { ?>
												<?php if ($information['information_id'] == $config_checkout_id) { ?>
												<option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
												<?php } ?>
												<?php } ?>
											</select>
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label" for="input-order-status"><span data-toggle="tooltip" title="<?php echo $help_order_status; ?>"><?php echo $entry_order_status; ?></span></label>
										<div class="uk-form-controls">
											<select name="config_order_status_id" id="input-order-status" class="uk-select">
												<?php foreach ($order_statuses as $order_status) { ?>
												<?php if ($order_status['order_status_id'] == $config_order_status_id) { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
												<?php } ?>
												<?php } ?>
											</select>
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label" for="input-process-status"><span data-toggle="tooltip" title="<?php echo $help_processing_status; ?>"><?php echo $entry_processing_status; ?></span></label>
										<div class="uk-form-controls">
											<div class="well well-sm" style="height: 150px; overflow: auto;">
												<?php foreach ($order_statuses as $order_status) { ?>
												<div class="checkbox">
													<label>
														<?php if (in_array($order_status['order_status_id'], $config_processing_status)) { ?>
														<input type="checkbox" name="config_processing_status[]" value="<?php echo $order_status['order_status_id']; ?>" checked="checked">
														<?php echo $order_status['name']; ?>
														<?php } else { ?>
														<input type="checkbox" name="config_processing_status[]" value="<?php echo $order_status['order_status_id']; ?>">
														<?php echo $order_status['name']; ?>
														<?php } ?>
													</label>
												</div>
												<?php } ?>
											</div>
											<?php if ($error_processing_status) { ?>
											<div class="text-danger"><?php echo $error_processing_status; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label" for="input-complete-status"><span data-toggle="tooltip" title="<?php echo $help_complete_status; ?>"><?php echo $entry_complete_status; ?></span></label>
										<div class="uk-form-controls">
											<div class="well well-sm" style="height: 150px; overflow: auto;">
												<?php foreach ($order_statuses as $order_status) { ?>
												<div class="checkbox">
													<label>
														<?php if (in_array($order_status['order_status_id'], $config_complete_status)) { ?>
														<input type="checkbox" name="config_complete_status[]" value="<?php echo $order_status['order_status_id']; ?>" checked="checked">
														<?php echo $order_status['name']; ?>
														<?php } else { ?>
														<input type="checkbox" name="config_complete_status[]" value="<?php echo $order_status['order_status_id']; ?>">
														<?php echo $order_status['name']; ?>
														<?php } ?>
													</label>
												</div>
												<?php } ?>
											</div>
											<?php if ($error_complete_status) { ?>
											<div class="text-danger"><?php echo $error_complete_status; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label" for="input-api"><span data-toggle="tooltip" title="<?php echo $help_api; ?>"><?php echo $entry_api; ?></span></label>
										<div class="uk-form-controls">
											<select name="config_api_id" id="input-api" class="uk-select">
												<option value="0"><?php echo $text_none; ?></option>
												<?php foreach ($apis as $api) { ?>
												<?php if ($api['api_id'] == $config_api_id) { ?>
												<option value="<?php echo $api['api_id']; ?>" selected="selected"><?php echo $api['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $api['api_id']; ?>"><?php echo $api['name']; ?></option>
												<?php } ?>
												<?php } ?>
											</select>
										</div>
									</div>
								</fieldset>
								<fieldset class="uk-fieldset">
									<legend class="uk-legend"><?php echo $text_stock; ?></legend>
									<div class="uk-margin">
										<label class="uk-form-label"><span data-toggle="tooltip" title="<?php echo $help_stock_display; ?>"><?php echo $entry_stock_display; ?></span></label>
										<div class="uk-form-controls">
											<label class="radio-inline">
												<?php if ($config_stock_display) { ?>
												<input type="radio" name="config_stock_display" value="1" checked="checked">
												<?php echo $text_yes; ?>
												<?php } else { ?>
												<input type="radio" name="config_stock_display" value="1">
												<?php echo $text_yes; ?>
												<?php } ?>
											</label>
											<label class="radio-inline">
												<?php if (!$config_stock_display) { ?>
												<input type="radio" name="config_stock_display" value="0" checked="checked">
												<?php echo $text_no; ?>
												<?php } else { ?>
												<input type="radio" name="config_stock_display" value="0">
												<?php echo $text_no; ?>
												<?php } ?>
											</label>
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label"><span data-toggle="tooltip" title="<?php echo $help_stock_warning; ?>"><?php echo $entry_stock_warning; ?></span></label>
										<div class="uk-form-controls">
											<label class="radio-inline">
												<?php if ($config_stock_warning) { ?>
												<input type="radio" name="config_stock_warning" value="1" checked="checked">
												<?php echo $text_yes; ?>
												<?php } else { ?>
												<input type="radio" name="config_stock_warning" value="1">
												<?php echo $text_yes; ?>
												<?php } ?>
											</label>
											<label class="radio-inline">
												<?php if (!$config_stock_warning) { ?>
												<input type="radio" name="config_stock_warning" value="0" checked="checked">
												<?php echo $text_no; ?>
												<?php } else { ?>
												<input type="radio" name="config_stock_warning" value="0">
												<?php echo $text_no; ?>
												<?php } ?>
											</label>
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label"><span data-toggle="tooltip" title="<?php echo $help_stock_checkout; ?>"><?php echo $entry_stock_checkout; ?></span></label>
										<div class="uk-form-controls">
											<label class="radio-inline">
												<?php if ($config_stock_checkout) { ?>
												<input type="radio" name="config_stock_checkout" value="1" checked="checked">
												<?php echo $text_yes; ?>
												<?php } else { ?>
												<input type="radio" name="config_stock_checkout" value="1">
												<?php echo $text_yes; ?>
												<?php } ?>
											</label>
											<label class="radio-inline">
												<?php if (!$config_stock_checkout) { ?>
												<input type="radio" name="config_stock_checkout" value="0" checked="checked">
												<?php echo $text_no; ?>
												<?php } else { ?>
												<input type="radio" name="config_stock_checkout" value="0">
												<?php echo $text_no; ?>
												<?php } ?>
											</label>
										</div>
									</div>
								</fieldset>
								<fieldset class="uk-fieldset">
									<legend class="uk-legend"><?php echo $text_captcha; ?></legend>
									<div class="uk-margin">
										<label class="uk-form-label"><span data-toggle="tooltip" title="<?php echo $help_captcha; ?>"><?php echo $entry_captcha; ?></span></label>
										<div class="uk-form-controls">
											<select name="config_captcha" id="input-captcha" class="uk-select">
												<option value=""><?php echo $text_none; ?></option>
												<?php foreach ($captchas as $captcha) { ?>
												<?php if ($captcha['value'] == $config_captcha) { ?>
												<option value="<?php echo $captcha['value']; ?>" selected="selected"><?php echo $captcha['text']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $captcha['value']; ?>"><?php echo $captcha['text']; ?></option>
												<?php } ?>
												<?php } ?>
											</select>
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label"><?php echo $entry_captcha_page; ?></label>
										<div class="uk-form-controls">
											<div class="well well-sm" style="height: 150px; overflow: auto;">
												<?php foreach ($captcha_pages as $captcha_page) { ?>
												<div class="checkbox">
													<label>
														<?php if (in_array($captcha_page['value'], $config_captcha_page)) { ?>
														<input type="checkbox" name="config_captcha_page[]" value="<?php echo $captcha_page['value']; ?>" checked="checked">
														<?php echo $captcha_page['text']; ?>
														<?php } else { ?>
														<input type="checkbox" name="config_captcha_page[]" value="<?php echo $captcha_page['value']; ?>">
														<?php echo $captcha_page['text']; ?>
														<?php } ?>
													</label>
												</div>
												<?php } ?>
											</div>
										</div>
									</div>
								</fieldset>



						</li>
						<li>

						

								<div class="uk-margin">
									<label class="uk-form-label" for="input-logo"><?php echo $entry_logo; ?></label>
									<div class="uk-form-controls"><a href="" id="thumb-logo" data-toggle="image" class="img-thumbnail"><img src="<?php echo $logo; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>"></a>
										<input type="hidden" name="config_logo" value="<?php echo $config_logo; ?>" id="input-logo">
									</div>
								</div>
								<div class="uk-margin">
									<label class="uk-form-label" for="input-icon"><span data-toggle="tooltip" title="<?php echo $help_icon; ?>"><?php echo $entry_icon; ?></span></label>
									<div class="uk-form-controls"><a href="" id="thumb-icon" data-toggle="image" class="img-thumbnail"><img src="<?php echo $icon; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>"></a>
										<input type="hidden" name="config_icon" value="<?php echo $config_icon; ?>" id="input-icon">
									</div>
								</div>



						</li>
						<li>

						

								<div class="uk-margin">
									<label class="uk-form-label" for="input-ftp-host"><?php echo $entry_ftp_hostname; ?></label>
									<div class="uk-form-controls">
										<input type="text" name="config_ftp_hostname" value="<?php echo $config_ftp_hostname; ?>" placeholder="<?php echo $entry_ftp_hostname; ?>" id="input-ftp-host" class="uk-input">
										<?php if ($error_ftp_hostname) { ?>
										<div class="text-danger"><?php echo $error_ftp_hostname; ?></div>
										<?php } ?>
									</div>
								</div>
								<div class="uk-margin">
									<label class="uk-form-label" for="input-ftp-port"><?php echo $entry_ftp_port; ?></label>
									<div class="uk-form-controls">
										<input type="text" name="config_ftp_port" value="<?php echo $config_ftp_port; ?>" placeholder="<?php echo $entry_ftp_port; ?>" id="input-ftp-port" class="uk-input">
										<?php if ($error_ftp_port) { ?>
										<div class="text-danger"><?php echo $error_ftp_port; ?></div>
										<?php } ?>
									</div>
								</div>
								<div class="uk-margin">
									<label class="uk-form-label" for="input-ftp-username"><?php echo $entry_ftp_username; ?></label>
									<div class="uk-form-controls">
										<input type="text" name="config_ftp_username" value="<?php echo $config_ftp_username; ?>" placeholder="<?php echo $entry_ftp_username; ?>" id="input-ftp-username" class="uk-input">
										<?php if ($error_ftp_username) { ?>
										<div class="text-danger"><?php echo $error_ftp_username; ?></div>
										<?php } ?>
									</div>
								</div>
								<div class="uk-margin">
									<label class="uk-form-label" for="input-ftp-password"><?php echo $entry_ftp_password; ?></label>
									<div class="uk-form-controls">
										<input type="text" name="config_ftp_password" value="<?php echo $config_ftp_password; ?>" placeholder="<?php echo $entry_ftp_password; ?>" id="input-ftp-password" class="uk-input">
										<?php if ($error_ftp_password) { ?>
										<div class="text-danger"><?php echo $error_ftp_password; ?></div>
										<?php } ?>
									</div>
								</div>
								<div class="uk-margin">
									<label class="uk-form-label" for="input-ftp-root"><span data-toggle="tooltip" data-html="true" title="<?php echo htmlspecialchars($help_ftp_root); ?>"><?php echo $entry_ftp_root; ?></span></label>
									<div class="uk-form-controls">
										<input type="text" name="config_ftp_root" value="<?php echo $config_ftp_root; ?>" placeholder="<?php echo $entry_ftp_root; ?>" id="input-ftp-root" class="uk-input">
									</div>
								</div>
								<div class="uk-margin">
									<label class="uk-form-label"><?php echo $entry_ftp_status; ?></label>
									<div class="uk-form-controls">
										<label class="radio-inline">
											<?php if ($config_ftp_status) { ?>
											<input type="radio" name="config_ftp_status" value="1" checked="checked">
											<?php echo $text_yes; ?>
											<?php } else { ?>
											<input type="radio" name="config_ftp_status" value="1">
											<?php echo $text_yes; ?>
											<?php } ?>
										</label>
										<label class="radio-inline">
											<?php if (!$config_ftp_status) { ?>
											<input type="radio" name="config_ftp_status" value="0" checked="checked">
											<?php echo $text_no; ?>
											<?php } else { ?>
											<input type="radio" name="config_ftp_status" value="0">
											<?php echo $text_no; ?>
											<?php } ?>
										</label>
									</div>
								</div>



						</li>
						<li>

						

								<fieldset class="uk-fieldset">
									<legend class="uk-legend"><?php echo $text_general; ?></legend>
									<div class="uk-margin">
										<label class="uk-form-label" for="input-mail-protocol"><span data-toggle="tooltip" title="<?php echo $help_mail_protocol; ?>"><?php echo $entry_mail_protocol; ?></span></label>
										<div class="uk-form-controls">
											<select name="config_mail_protocol" id="input-mail-protocol" class="uk-select">
												<?php if ($config_mail_protocol == 'mail') { ?>
												<option value="mail" selected="selected"><?php echo $text_mail; ?></option>
												<?php } else { ?>
												<option value="mail"><?php echo $text_mail; ?></option>
												<?php } ?>
												<?php if ($config_mail_protocol == 'smtp') { ?>
												<option value="smtp" selected="selected"><?php echo $text_smtp; ?></option>
												<?php } else { ?>
												<option value="smtp"><?php echo $text_smtp; ?></option>
												<?php } ?>
											</select>
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label" for="input-mail-parameter"><span data-toggle="tooltip" title="<?php echo $help_mail_parameter; ?>"><?php echo $entry_mail_parameter; ?></span></label>
										<div class="uk-form-controls">
											<input type="text" name="config_mail_parameter" value="<?php echo $config_mail_parameter; ?>" placeholder="<?php echo $entry_mail_parameter; ?>" id="input-mail-parameter" class="uk-input">
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label" for="input-mail-smtp-hostname"><span data-toggle="tooltip" title="<?php echo $help_mail_smtp_hostname; ?>"><?php echo $entry_mail_smtp_hostname; ?></span></label>
										<div class="uk-form-controls">
											<input type="text" name="config_mail_smtp_hostname" value="<?php echo $config_mail_smtp_hostname; ?>" placeholder="<?php echo $entry_mail_smtp_hostname; ?>" id="input-mail-smtp-hostname" class="uk-input">
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label" for="input-mail-smtp-username"><?php echo $entry_mail_smtp_username; ?></label>
										<div class="uk-form-controls">
											<input type="text" name="config_mail_smtp_username" value="<?php echo $config_mail_smtp_username; ?>" placeholder="<?php echo $entry_mail_smtp_username; ?>" id="input-mail-smtp-username" class="uk-input">
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label" for="input-mail-smtp-password"><span data-toggle="tooltip" title="<?php echo $help_mail_smtp_password; ?>"><?php echo $entry_mail_smtp_password; ?></span></label>
										<div class="uk-form-controls">
											<input type="text" name="config_mail_smtp_password" value="<?php echo $config_mail_smtp_password; ?>" placeholder="<?php echo $entry_mail_smtp_password; ?>" id="input-mail-smtp-password" class="uk-input">
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label" for="input-mail-smtp-port"><?php echo $entry_mail_smtp_port; ?></label>
										<div class="uk-form-controls">
											<input type="text" name="config_mail_smtp_port" value="<?php echo $config_mail_smtp_port; ?>" placeholder="<?php echo $entry_mail_smtp_port; ?>" id="input-mail-smtp-port" class="uk-input">
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label" for="input-mail-smtp-timeout"><?php echo $entry_mail_smtp_timeout; ?></label>
										<div class="uk-form-controls">
											<input type="text" name="config_mail_smtp_timeout" value="<?php echo $config_mail_smtp_timeout; ?>" placeholder="<?php echo $entry_mail_smtp_timeout; ?>" id="input-mail-smtp-timeout" class="uk-input">
										</div>
									</div>
								</fieldset>
								<fieldset class="uk-fieldset">
									<legend class="uk-legend"><?php echo $text_mail_alert; ?></legend>
									<div class="uk-margin">
										<label class="uk-form-label"><span data-toggle="tooltip" title="<?php echo $help_mail_alert; ?>"><?php echo $entry_mail_alert; ?></span></label>
										<div class="uk-form-controls">
											<div class="well well-sm" style="height: 150px; overflow: auto;">
												<?php foreach ($mail_alerts as $mail_alert) { ?>
												<div class="checkbox">
													<label>
														<?php if (in_array($mail_alert['value'], $config_mail_alert)) { ?>
														<input type="checkbox" name="config_mail_alert[]" value="<?php echo $mail_alert['value']; ?>" checked="checked">
														<?php echo $mail_alert['text']; ?>
														<?php } else { ?>
														<input type="checkbox" name="config_mail_alert[]" value="<?php echo $mail_alert['value']; ?>">
														<?php echo $mail_alert['text']; ?>
														<?php } ?>
													</label>
												</div>
												<?php } ?>
											</div>
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label" for="input-mail-alert-email"><span data-toggle="tooltip" title="<?php echo $help_mail_alert_email; ?>"><?php echo $entry_mail_alert_email; ?></span></label>
										<div class="uk-form-controls">
											<textarea name="config_alert_email" rows="5" placeholder="<?php echo $entry_mail_alert_email; ?>" id="input-alert-email" class="uk-textarea"><?php echo $config_alert_email; ?></textarea>
										</div>
									</div>
								</fieldset>



						</li>
						<li>

						

								<fieldset class="uk-fieldset">
									<legend class="uk-legend"><?php echo $text_general; ?></legend>
									<div class="uk-margin">
										<label class="uk-form-label"><span data-toggle="tooltip" title="<?php echo $help_maintenance; ?>"><?php echo $entry_maintenance; ?></span></label>
										<div class="uk-form-controls">
											<label class="radio-inline">
												<?php if ($config_maintenance) { ?>
												<input type="radio" name="config_maintenance" value="1" checked="checked">
												<?php echo $text_yes; ?>
												<?php } else { ?>
												<input type="radio" name="config_maintenance" value="1">
												<?php echo $text_yes; ?>
												<?php } ?>
											</label>
											<label class="radio-inline">
												<?php if (!$config_maintenance) { ?>
												<input type="radio" name="config_maintenance" value="0" checked="checked">
												<?php echo $text_no; ?>
												<?php } else { ?>
												<input type="radio" name="config_maintenance" value="0">
												<?php echo $text_no; ?>
												<?php } ?>
											</label>
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label"><span data-toggle="tooltip" title="<?php echo $help_seo_url; ?>"><?php echo $entry_seo_url; ?></span></label>
										<div class="uk-form-controls">
											<label class="radio-inline">
												<?php if ($config_seo_url) { ?>
												<input type="radio" name="config_seo_url" value="1" checked="checked">
												<?php echo $text_yes; ?>
												<?php } else { ?>
												<input type="radio" name="config_seo_url" value="1">
												<?php echo $text_yes; ?>
												<?php } ?>
											</label>
											<label class="radio-inline">
												<?php if (!$config_seo_url) { ?>
												<input type="radio" name="config_seo_url" value="0" checked="checked">
												<?php echo $text_no; ?>
												<?php } else { ?>
												<input type="radio" name="config_seo_url" value="0">
												<?php echo $text_no; ?>
												<?php } ?>
											</label>
										</div>


									<div class="uk-margin">
										<label class="uk-form-label"><span data-toggle="tooltip" title="<?php echo $help_seo_url_include_path; ?>"><?php echo $entry_seo_url_include_path; ?></span></label>
										<div class="uk-form-controls">
											<label class="radio-inline">
												<?php if ($config_seo_url_include_path) { ?>
												<input type="radio" name="config_seo_url_include_path" value="1" checked="checked">
												<?php echo $text_yes; ?>
												<?php } else { ?>
												<input type="radio" name="config_seo_url_include_path" value="1">
												<?php echo $text_yes; ?>
												<?php } ?>
											</label>
											<label class="radio-inline">
												<?php if (!$config_seo_url_include_path) { ?>
												<input type="radio" name="config_seo_url_include_path" value="0" checked="checked">
												<?php echo $text_no; ?>
												<?php } else { ?>
												<input type="radio" name="config_seo_url_include_path" value="0">
												<?php echo $text_no; ?>
												<?php } ?>
											</label>
										</div>
									</div>

					<div class="uk-margin">
									<label class="uk-form-label"><span data-toggle="tooltip" title="<?php echo $help_seo_url_postfix; ?>"><?php echo $entry_seo_url_postfix; ?></span></label>
					<div class="uk-form-controls">
						<input class="uk-input" type="text" name="config_seo_url_postfix" value="<?php echo $config_seo_url_postfix; ?>">
					</div>
								</div>

								<div class="uk-margin">
									<label class="uk-form-label" for="input-file-max-size"><span data-toggle="tooltip" title="<?php echo $help_file_max_size; ?>"><?php echo $entry_file_max_size; ?></span></label>
									<div class="uk-form-controls">
										<input type="text" name="config_file_max_size" value="<?php echo $config_file_max_size; ?>" placeholder="<?php echo $entry_file_max_size; ?>" id="input-file-max-size" class="uk-input">
									</div>
					</div>

									<div class="uk-margin">
										<label class="uk-form-label" for="input-robots"><span data-toggle="tooltip" title="<?php echo $help_robots; ?>"><?php echo $entry_robots; ?></span></label>
										<div class="uk-form-controls">
											<textarea name="config_robots" rows="5" placeholder="<?php echo $entry_robots; ?>" id="input-robots" class="uk-textarea"><?php echo $config_robots; ?></textarea>
										</div>
									</div>

								</fieldset>

								<fieldset class="uk-fieldset">
									<legend class="uk-legend"><?php echo $text_security; ?></legend>
									<div class="uk-margin">
										<label class="uk-form-label"><span data-toggle="tooltip" title="<?php echo $help_secure; ?>"><?php echo $entry_secure; ?></span></label>
										<div class="uk-form-controls">
											<label class="radio-inline">
												<?php if ($config_secure) { ?>
												<input type="radio" name="config_secure" value="1" checked="checked">
												<?php echo $text_yes; ?>
												<?php } else { ?>
												<input type="radio" name="config_secure" value="1">
												<?php echo $text_yes; ?>
												<?php } ?>
											</label>
											<label class="radio-inline">
												<?php if (!$config_secure) { ?>
												<input type="radio" name="config_secure" value="0" checked="checked">
												<?php echo $text_no; ?>
												<?php } else { ?>
												<input type="radio" name="config_secure" value="0">
												<?php echo $text_no; ?>
												<?php } ?>
											</label>
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label"><span data-toggle="tooltip" title="<?php echo $help_password; ?>"><?php echo $entry_password; ?></span></label>
										<div class="uk-form-controls">
											<label class="radio-inline">
												<?php if ($config_password) { ?>
												<input type="radio" name="config_password" value="1" checked="checked">
												<?php echo $text_yes; ?>
												<?php } else { ?>
												<input type="radio" name="config_password" value="1">
												<?php echo $text_yes; ?>
												<?php } ?>
											</label>
											<label class="radio-inline">
												<?php if (!$config_password) { ?>
												<input type="radio" name="config_password" value="0" checked="checked">
												<?php echo $text_no; ?>
												<?php } else { ?>
												<input type="radio" name="config_password" value="0">
												<?php echo $text_no; ?>
												<?php } ?>
											</label>
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label"><span data-toggle="tooltip" title="<?php echo $help_shared; ?>"><?php echo $entry_shared; ?></span></label>
										<div class="uk-form-controls">
											<label class="radio-inline">
												<?php if ($config_shared) { ?>
												<input type="radio" name="config_shared" value="1" checked="checked">
												<?php echo $text_yes; ?>
												<?php } else { ?>
												<input type="radio" name="config_shared" value="1">
												<?php echo $text_yes; ?>
												<?php } ?>
											</label>
											<label class="radio-inline">
												<?php if (!$config_shared) { ?>
												<input type="radio" name="config_shared" value="0" checked="checked">
												<?php echo $text_no; ?>
												<?php } else { ?>
												<input type="radio" name="config_shared" value="0">
												<?php echo $text_no; ?>
												<?php } ?>
											</label>
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label" for="input-encryption"><span data-toggle="tooltip" title="<?php echo $help_encryption; ?>"><?php echo $entry_encryption; ?></span></label>
										<div class="uk-form-controls">
											<textarea name="config_encryption" rows="5" placeholder="<?php echo $entry_encryption; ?>" id="input-encryption" class="uk-textarea"><?php echo $config_encryption; ?></textarea>
											<?php if ($error_encryption) { ?>
											<div class="text-danger"><?php echo $error_encryption; ?></div>
											<?php } ?>
										</div>
									</div>

								</fieldset>

								<fieldset class="uk-fieldset">

									<legend class="uk-legend"><?php echo $text_upload; ?></legend>
									<div class="uk-margin">
										<label class="uk-form-label" for="input-file-max-size"><span data-toggle="tooltip" title="<?php echo $help_file_max_size; ?>"><?php echo $entry_file_max_size; ?></span></label>
										<div class="uk-form-controls">
											<input type="text" name="config_file_max_size" value="<?php echo $config_file_max_size; ?>" placeholder="<?php echo $entry_file_max_size; ?>" id="input-file-max-size" class="uk-input">
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label" for="input-file-ext-allowed"><span data-toggle="tooltip" title="<?php echo $help_file_ext_allowed; ?>"><?php echo $entry_file_ext_allowed; ?></span></label>
										<div class="uk-form-controls">
											<textarea name="config_file_ext_allowed" rows="5" placeholder="<?php echo $entry_file_ext_allowed; ?>" id="input-file-ext-allowed" class="uk-textarea"><?php echo $config_file_ext_allowed; ?></textarea>
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label" for="input-file-mime-allowed"><span data-toggle="tooltip" title="<?php echo $help_file_mime_allowed; ?>"><?php echo $entry_file_mime_allowed; ?></span></label>
										<div class="uk-form-controls">
											<textarea name="config_file_mime_allowed" rows="5" placeholder="<?php echo $entry_file_mime_allowed; ?>" id="input-file-mime-allowed" class="uk-textarea"><?php echo $config_file_mime_allowed; ?></textarea>
										</div>
									</div>
								</fieldset>

								<fieldset class="uk-fieldset">

									<legend class="uk-legend"><?php echo $text_error; ?></legend>
									<div class="uk-margin">
										<label class="uk-form-label"><?php echo $entry_error_display; ?></label>
										<div class="uk-form-controls">
											<label class="radio-inline">
												<?php if ($config_error_display) { ?>
												<input type="radio" name="config_error_display" value="1" checked="checked">
												<?php echo $text_yes; ?>
												<?php } else { ?>
												<input type="radio" name="config_error_display" value="1">
												<?php echo $text_yes; ?>
												<?php } ?>
											</label>
											<label class="radio-inline">
												<?php if (!$config_error_display) { ?>
												<input type="radio" name="config_error_display" value="0" checked="checked">
												<?php echo $text_no; ?>
												<?php } else { ?>
												<input type="radio" name="config_error_display" value="0">
												<?php echo $text_no; ?>
												<?php } ?>
											</label>
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label"><?php echo $entry_error_log; ?></label>
										<div class="uk-form-controls">
											<label class="radio-inline">
												<?php if ($config_error_log) { ?>
												<input type="radio" name="config_error_log" value="1" checked="checked">
												<?php echo $text_yes; ?>
												<?php } else { ?>
												<input type="radio" name="config_error_log" value="1">
												<?php echo $text_yes; ?>
												<?php } ?>
											</label>
											<label class="radio-inline">
												<?php if (!$config_error_log) { ?>
												<input type="radio" name="config_error_log" value="0" checked="checked">
												<?php echo $text_no; ?>
												<?php } else { ?>
												<input type="radio" name="config_error_log" value="0">
												<?php echo $text_no; ?>
												<?php } ?>
											</label>
										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label" for="input-error-filename"><?php echo $entry_error_filename; ?></label>
										<div class="uk-form-controls">
											<input type="text" name="config_error_filename" value="<?php echo $config_error_filename; ?>" placeholder="<?php echo $entry_error_filename; ?>" id="input-error-filename" class="uk-input">
											<?php if ($error_error_filename) { ?>
											<div class="text-danger"><?php echo $error_error_filename; ?></div>
											<?php } ?>
										</div>
									</div>

								</fieldset>


					

						</li>

					</ul>

				</div>

				<div class="uk-width-1-1 uk-width-1-1@s uk-width-1-1@m uk-width-1-5@l uk-width-1-6@xl uk-margin-large-top">

					<div class="uk-margin uk-margin-small" uk-sticky="offset: 90; media: @m">

						<button 
							type="submit" 
							form="form-setting" 
							title="<?php echo $button_save; ?>" 
							class="uk-button uk-button-primary uk-width-1-1 uk-margin-small-bottom" 
							onclick="suneditor.save();"
						>
							<span uk-icon="pull"></span>
							Save
						</button>

						<a 
							href="<?php echo $cancel; ?>" 
							title="<?php echo $button_cancel; ?>" 
							class="uk-button uk-button-default uk-width-1-1 uk-margin-small-bottom"
						>
							<span uk-icon="reply"></span>
							Cancel
						</a>

					</div>

				</div>

			</div>

		</form>

	</div>

</div>

<script>

$('select[name=\'config_theme\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=setting/setting/theme&token=<?php echo $token; ?>&theme=' + this.value,
		dataType: 'html',
		beforeSend: function() {
			$('select[name=\'config_theme\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(html) {
			$('#theme').attr('src', html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'config_theme\']').trigger('change');
</script> 

<!-- <script>
$('select[name=\'config_country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=localisation/country/country&token=<?php echo $token; ?>&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'config_country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
								html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == '<?php echo $config_zone_id; ?>') {
									html += ' selected="selected"';
					}

					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('select[name=\'config_zone_id\']').html(html);
			
			$('#button-save').prop('disabled', false);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'config_country_id\']').trigger('change');
</script> -->




<?php echo $footer; ?> 
<!-- /settings.tpl -->