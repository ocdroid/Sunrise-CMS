			<!-- adminbar -->
			<?php if (isset($token_admin)) { ?>

				<span class="cc_admin_toolbar uk-icon-button uk-margin-small-right uk-box-shadow-medium" uk-icon="settings" uk-tooltip="title: Admin Toolbar; pos: right"></span>

				<div class="uk-margin-small-right uk-width-small uk-width-large@s uk-width-xlarge@m uk-width-xxlarge@l" uk-dropdown="mode: click">
					
					<div class="uk-dropdown-grid uk-child-width-1-1 uk-child-width-1-2@s uk-child-width-1-4@m uk-child-width-1-4@l" uk-grid>

						<div>
							<ul class="uk-nav uk-dropdown-nav">
								
								<li class="uk-nav-header">
									<span uk-icon="icon: plus; ratio: 0.8"></span>
									<?php echo $text_adminbar_add; ?>
								</li>
								<li class="uk-nav-divider"></li>
								<li>
									<a target="_blank" href="<?php echo $category_add_admin; ?>">
										<?php echo $text_adminbar_category; ?>
									</a>
								</li>
								<li>
									<a target="_blank" href="<?php echo $product_add_admin; ?>">
										<?php echo $text_adminbar_product; ?>
									</a>
								</li>
								<li>
									<a target="_blank" href="<?php echo $filter_add_admin; ?>">
										<?php echo $text_adminbar_filter; ?>
									</a>
								</li>
								<li>
									<a target="_blank" href="<?php echo $attribute_add_admin; ?>">
										<?php echo $text_adminbar_attribute; ?>
									</a>
								</li>
								<li>
									<a target="_blank" href="<?php echo $option_add_admin; ?>">
										<?php echo $text_adminbar_option; ?>
									</a>
								</li>
								<li>
									<a target="_blank" href="<?php echo $manufacturer_add_admin; ?>">
										<?php echo $text_adminbar_manufacturer; ?>
									</a>
								</li>
								<li>
									<a target="_blank" href="<?php echo $information_add_admin; ?>">
										<?php echo $text_adminbar_information; ?>
									</a>
								</li>

							</ul>
						</div>

						<div>
							<ul class="uk-nav uk-dropdown-nav">

								<li class="uk-nav-header">
									<span uk-icon="icon: thumbnails; ratio: 0.8"></span>
									<?php echo $text_adminbar_catalog; ?>
								</li>
								<li class="uk-nav-divider"></li>
								<li>
									<a target="_blank" href="<?php echo $category_all_admin; ?>">
										<?php echo $text_adminbar_categories; ?>
									</a>
								</li>
								<li>
									<a target="_blank" href="<?php echo $product_all_admin; ?>">
										<?php echo $text_adminbar_products; ?>
									</a>
								</li>
								<li>
									<a target="_blank" href="<?php echo $filter_all_admin; ?>">
										<?php echo $text_adminbar_filters; ?>
									</a>
								</li>
								<li>
									<a target="_blank" href="<?php echo $attribute_all_admin; ?>">
										<?php echo $text_adminbar_attributes; ?>
									</a>
								</li>
								<li>
									<a target="_blank" href="<?php echo $option_all_admin; ?>">
										<?php echo $text_adminbar_options; ?>
									</a>
								</li>
								<li>
									<a target="_blank" href="<?php echo $manufacturer_all_admin; ?>">
										<?php echo $text_adminbar_manufacturers; ?>
									</a>
								</li>
								<li>
									<a target="_blank" href="<?php echo $review_all_admin; ?>">
										<?php echo $text_adminbar_review; ?>
									</a>
								</li>
								<li>
									<a target="_blank" href="<?php echo $information_all_admin; ?>">
										<?php echo $text_adminbar_informations; ?>
									</a>
								</li>

							</ul>
						</div>

						<div>
							<ul class="uk-nav uk-dropdown-nav">

								<li class="uk-nav-header">
									<span uk-icon="icon: cart; ratio: 0.8"></span>
									<?php echo $text_adminbar_sale; ?>
								</li>
								<li class="uk-nav-divider"></li>
								<li>
									<a target="_blank" href="<?php echo $orders_pending_admin; ?>">
										<?php echo $text_adminbar_orders_pending; ?>
									</a>
								</li>
								<li>
									<a target="_blank" href="<?php echo $orders_processing_admin; ?>">
										<?php echo $text_adminbar_orders_processing; ?>
									</a>
								</li>
								<li>
									<a target="_blank" href="<?php echo $orders_orders_today; ?>">
										<?php echo $text_adminbar_orders_today; ?>
									</a>
								</li>
								<li>
									<a target="_blank" href="<?php echo $all_orders_admin; ?>">
										<?php echo $text_adminbar_all_orders; ?>
									</a>
								</li>
								<li>
									<a target="_blank" href="<?php echo $return_admin; ?>">
										<?php echo $text_adminbar_return; ?>
									</a>
								</li>

							</ul>
						</div>

						<div>
							<ul class="uk-nav uk-dropdown-nav">
								
								<li>
									<a target="_blank" href="<?php echo $dashboard_admin; ?>">
										<span uk-icon="icon: world; ratio: 0.8"></span>
										<?php echo $text_adminbar_dashboard; ?>
									</a>
								</li>

								<li>
									<a href="<?php echo $adminbar_logout; ?>">
										<span uk-icon="icon: sign-out; ratio: 0.8"></span>
										<?php echo $text_adminbar_logout; ?>
									</a>
								</li>

							</ul>
						</div>

					</div>
				</div>

				<!-- <span class="cc_admin_toolbar_template_paths uk-icon-button uk-margin-small-right uk-box-shadow-medium" uk-icon="code" uk-tooltip="title: Template paths; pos: right" uk-toggle="target: #cc_template_path; cls: visible"></span> -->

				<!-- <style>
					.cc_template_path {
						position: absolute;
						display: none;
					}
						.cc_template_path > span {
							background-color: white;
						}
						.cc_template_path.visible {
							text-transform: none;
							display: inline-block;
							opacity: 0.3;
						}
						.cc_template_path + .cc_template_path {
							margin-top: 22px;
						}
						.cc_template_path + .cc_template_path + .cc_template_path {
							margin-top: 44px;
						}
							.cc_template_path + .cc_template_path + .cc_column + .cc_template_path {
								margin-top: 44px;
							}
							.cc_column > .cc_template_path {
								margin-top: 22px;
							}
				</style> -->

				<?php if ($quick_edit_admin <> "") { ?>

					<a class="cc_admin_toolbar_edit uk-icon-button uk-margin-small-right uk-box-shadow-medium" href="<?php echo $quick_edit_admin; ?>" uk-icon="pencil" uk-toggle uk-tooltip="title: <?php echo $text_adminbar_edit; ?>; pos: right"></a>

				<?php } ?>

				<style>
					.cc_admin_toolbar {
						top: 60px;
						left: 12px;
						position: fixed !important;
						z-index: 999;
						cursor: pointer;
					}
					.cc_admin_toolbar_template_paths {
						top: 108px;
						left: 12px;
						position: fixed !important;
						z-index: 999;
						cursor: pointer;
					}
					.cc_admin_toolbar_edit {
						top: 156px;
						left: 12px;
						position: fixed !important;
						z-index: 999;
					}

				</style>

			<?php } ?>