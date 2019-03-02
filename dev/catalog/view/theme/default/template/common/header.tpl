<!-- header.tpl -->
<!DOCTYPE html>

<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">

	<head>

		<meta charset="utf-8">
		<meta http-equiv="x-ua-compatible" content="ie=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<title><?php echo $title; ?></title>

		<?php if ($robots) { ?>
			<meta name="robots" content="<?php echo $robots; ?>">
		<?php } ?>

		<base href="<?php echo $base; ?>">

		<?php if ($description) { ?>
			<meta name="description" content="<?php echo $description; ?>">
		<?php } ?>

		<!-- canonical & icon -->
		<?php foreach ($links as $link) { ?>
			<link rel="<?php echo $link['rel']; ?>" href="<?php echo $link['href']; ?>">
		<?php } ?>

		<!-- stelysheets -->
		<?php foreach ($stylespreload as $stylepreload) { ?>
			<link rel="<?php echo $stylepreload['rel']; ?>" href="<?php echo $stylepreload['href']; ?>" as="style">
		<?php } ?>

		<?php foreach ($styles as $style) { ?>
			<link rel="<?php echo $style['rel']; ?>" href="<?php echo $style['href']; ?>" media="screen">
		<?php } ?>

		<!-- scripts -->
		<?php foreach ($scriptsasync as $scriptasync) { ?>
			<script src="<?php echo $scriptasync; ?>" async></script>
		<?php } ?>

		<?php foreach ($scriptsdefer as $scriptdefer) { ?>
			<script src="<?php echo $scriptdefer; ?>" defer></script>
		<?php } ?>

		<?php foreach ($scripts as $script) { ?>
			<script src="<?php echo $script; ?>"></script>
		<?php } ?>

	</head>

	<body class="<?php echo $class; ?>">

		<div class="uk-offcanvas-content">

			<div id="cc_main_menu" uk-offcanvas="overlay: true">
				<div class="uk-offcanvas-bar">

					<button class="uk-offcanvas-close" type="button" uk-close></button>

					<div class="uk-margin uk-margin-medium-top">

						<nav class="uk-nav uk-nav-default uk-nav-parent-icon" uk-nav="multiple: true">

							<?php if ($categories) { ?>

								<?php foreach ($categories as $category) { ?>

									<?php if ($category['children']) { ?>

										<li class="uk-parent">

											<a href="<?php echo $category['href']; ?>">
												<?php echo $category['name']; ?>
											</a>

											<ul class="uk-nav-sub">

												<li class="cc_main_menu_show_all">
													<a href="<?php echo $category['href']; ?>">
														<?php echo $text_go_to; ?> <span class="uk-text-lowercase"><?php echo $category['name']; ?></span>
													</a>
												</li>

												<!-- https://forum.opencart.pro/topic/4983-%D0%BB%D0%B0%D0%B9%D1%84%D1%85%D0%B0%D0%BA%D0%B8-%D0%BE%D1%82-buslikdrev/?do=findComment&comment=47432 -->
												<?php foreach (array_chunk($category['children'], $category['column']) as $children) { ?>

													<?php foreach ($children as $child) { ?>
			
														<li>

															<a href="<?php echo $child['href']; ?>">
																<?php echo $child['name']; ?>
															</a>

														</li>
						
													<?php } ?>

												<?php } ?>

											</ul>

										</li>

									<?php } else { ?>

										<li>
											<a href="<?php echo $category['href']; ?>">
												<?php echo $category['name']; ?>
											</a>
										</li>

									<?php } ?>

								<?php } ?>

								<li class="uk-nav-divider"></li>

							<?php } ?>

							<?php echo $menu; ?>

							<li>
								<a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>">
									<?php echo $text_shopping_cart; ?>
								</a>
							</li>

							<li>
								<a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>">
									<?php echo $text_checkout; ?>
								</a>
							</li>

						</nav>

					</div>

				</div>
			</div>

			<header>

				<div class="uk-section uk-padding-remove">
								
					<nav class="uk-navbar-container uk-navbar-transparent uk-container" uk-navbar>

						<div class="uk-navbar-left">
					
							<ul class="uk-navbar-nav">

								<style>
									/* more contacts */
									.cc_header_contacts_more:hover a span {
										background: rgb(228, 228, 228);
										transition: .15s;
									}
										.uk-navbar-nav > li.cc_header_contacts_more > a {
											padding: 0;
										}
											.cc_header_contacts_more span {
												padding: 10px;
											}
											.cc_header_contacts_more_content {
												padding: 0;
												max-width: 250px;
												font-size: 14px;
												text-transform: initial;
												border: 1px solid rgb(212, 212, 212);
												border-top: 1px solid rgb(228, 228, 228);
											}
												.cc_header_contacts_more_content_phone {
													margin-top: 10px;
												}
												.cc_header_contacts_more_content_phone,
												.cc_header_contacts_more_content_time,
												.cc_header_contacts_more_content_map {
													border-bottom: 1px solid rgb(229, 229, 229);
												}
													.cc_header_contacts_more_content_map button {
														margin-left: 50px;
													}
												.cc_header_contacts_more_content_soc {
													margin: 10px 0;
												}
												.cc_header_contacts_more_content_time,
												.cc_header_contacts_more_content_place {
													cursor: default;
												}
													.cc_header_contacts_more_content span {
														position: absolute;
														left: 5px;
														margin-top: 2px;
													}
													.cc_header_contacts_more:hover.cc_header_contacts_more:hover .cc_header_contacts_more_content span {
														background: transparent;
													}
														.cc_header_contacts_more_content .cc_header_contacts_more_content_soc span {
															margin-top: -3px;
														}
													.cc_header_contacts_more_content_soc > div {
														padding: 5px 10px 5px 50px;
													}
													.cc_header_contacts_more_content_phone > div,
													.cc_header_contacts_more_content_time > div,
													.cc_header_contacts_more_content_place > div {
														padding: 10px 10px 10px 50px;
													}
													.cc_header_contacts_more_content_phone > div:hover,
													.cc_header_contacts_more_content_soc > div:hover {
														background: rgb(228, 228, 228);
														transition: .15s;
													}
														.cc_header_contacts_more_content_phone a,
														.cc_header_contacts_more_content_soc a {
															color: rgb(102, 102, 102);
														}
															.cc_header_contacts_more_content_phone a:hover,
															.cc_header_contacts_more_content_soc a:hover {
																text-decoration: none;
															}
									/* phone */
									.cc_header_contacts_phone {
										font-size: 18px;
										margin-left: 5px;
										position: relative;
										top: 1px;
									}
								</style>

								<li class="cc_header_contacts_more">

									<a href="#">
										<span uk-icon="more-vertical"></span>
									</a>
									
									<div class="cc_header_contacts_more_content uk-box-shadow-xlarge" uk-dropdown="mode: click; offset: -20">
			
										<div class="cc_header_contacts_more_content_phone">
											
											<span uk-icon="receiver"></span>

											<div>
												<a href="tel:#">
													+380 (63) 357-53-57
												</a>
											</div>

											<div>
												<a href="tel:#">
													+380 (44) 567-89-00
												</a>
											</div>

										</div>

										<div class="cc_header_contacts_more_content_time">
											
											<span uk-icon="clock"></span>

											<div>
												Пн.-Пт.: 09:00-22:00 <br>
												Сб.-Нд.: Вихідні
											</div>

										</div>

										<div class="cc_header_contacts_more_content_place">

											<span uk-icon="location"></span>

											<div>
												01234, Україна, м.Петропавлівська Борщагівка, б.13, оф.666
											</div>

										</div>

										<div class="cc_header_contacts_more_content_map">
											<!-- https://javascript.ru/forum/dom-window/65695-zagruzka-iframe-po-kliku-v-knopke.html -->
											<div data='<iframe width="100%" height="250" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.openstreetmap.org/export/embed.html?bbox=30.516436100006107%2C50.44645778445593%2C30.53435325622559%2C50.45274974148767&amp;layer=mapnik&amp;marker=50.44960386755845%2C30.525394678115845"></iframe>'></div><button class="uk-button uk-button-default uk-button-small uk-margin-small-top uk-margin-small-bottom uk-text-small" type="button" onclick="LoadMap(this)"><?php echo $text_look_at_map; ?></button>

											<script>
												function LoadMap(map) {
													var div = document.querySelector('.cc_header_contacts_more_content_map > div');
													div.innerHTML = div.getAttribute('data');
													map.style.display = 'none';
												}
											</script>

										</div>

										<div class="cc_header_contacts_more_content_soc">
											
											<span uk-icon="comment"></span>

											<div>
												<a href="#">
													twitter
												</a>
											</div>

											<div>
												<a href="#">
													facebook
												</a>
											</div>

											<div>
												<a href="#">
													skype
												</a>
											</div>

											<div>
												<a href="#">
													email
												</a>
											</div>

										</div>

									</div>

								</li>
		
								<li>
									<a href="tel:<?php echo $telephone; ?>">
										<span uk-icon="receiver"></span>
										<span class="cc_header_contacts_phone uk-visible@s">
											<?php echo $telephone; ?>
										</span>
									</a>
								</li>

							</ul>
					
						</div>
					
						<div class="uk-navbar-center">

							<style>
								.uk-logo img {
									max-height: 40px;
								}
							</style>

							<a class="uk-logo uk-text-center" href="<?php echo $home; ?>">

								<?php if ($logo) { ?>

									<img data-src="<?php echo $logo; ?>" width="" height="" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" uk-img>
	
									<div class="uk-text-small uk-visible@s">
										<?php echo $name; ?>
									</div>

								<?php } else { ?>

									<div class="uk-text-large">
										<?php echo $name; ?>
									</div>

								<?php } ?>

							</a>
							
						</div>

						<div class="uk-navbar-right">
					
							<ul class="uk-navbar-nav">

								<li class="cc_header_account">
									<a class="uk-text-capitalize uk-text-small" href="<?php echo $account; ?>">
										<span uk-icon="user"></span>
										<span class="uk-visible@s">
											<?php echo $text_account; ?>
										</span>
									</a>
									<div uk-dropdown="mode: click; offset: -25; pos: top-right;">
										<ul class="uk-nav uk-dropdown-nav uk-text-right">

											<?php if ($logged) { ?>

												<li>
													<a href="<?php echo $account; ?>">
														<?php echo $text_account; ?>
													</a>
												</li>
										
												<li>
													<a href="<?php echo $order; ?>">
														<?php echo $text_order; ?>
													</a>
												</li>
												
												<li>
													<a href="<?php echo $transaction; ?>">
														<?php echo $text_transaction; ?>
													</a>
												</li>
												
												<li>
													<a href="<?php echo $download; ?>">
														<?php echo $text_download; ?>
													</a>
												</li>
												
												<li>
													<a href="<?php echo $logout; ?>">
														<?php echo $text_logout; ?>
													</a>
												</li>
										
											<?php } else { ?>
												
												<li>
													<a href="<?php echo $register; ?>">
														<?php echo $text_register; ?>
													</a>
												</li>
												
												<li>
													<a href="<?php echo $login; ?>">
														<?php echo $text_login; ?>
													</a>
												</li>
										
											<?php } ?>

										</ul>
									</div>
								</li>
									
							</ul>
					
						</div>
					
					</nav>

				</div>

				<div class="uk-section uk-section-muted uk-padding-small uk-padding-remove-left uk-padding-remove-right">
					<div class="uk-container">

						<div class="uk-flex" uk-grid>

							<div class="cc_main_menu uk-width-1-2 uk-width-1-4@s uk-width-1-5@m uk-width-1-6@l uk-width-1-6@xl">
								<?php if ($categories) { ?>
									<button class="uk-button uk-button-primary uk-text-capitalize" uk-toggle="target: #cc_main_menu" type="button">
										<span uk-icon="menu"></span>
										<span>
											<?php echo $text_main_menu; ?>
										</span>
									</button>
								<?php } ?>
							</div>

							<div class="uk-width-1-2 uk-width-1-4@s uk-width-1-5@m uk-width-1-6@l uk-width-1-6@xl uk-flex-last@s">
								<?php echo $cart; ?>
							</div>

							<div class="uk-width-1-1 uk-width-1-2@s uk-width-3-5@m uk-width-2-3@l uk-width-2-3@xl">
								<?php echo $search; ?>
							</div>

						</div>

					</div>
				</div>

			</header>

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

			<!-- <script>
				function getURLVar(key) {
					var value = [];

					var query = String(document.location).split('?');

					if (query[1]) {
						var part = query[1].split('&');

						for (i = 0; i < part.length; i++) {
							var data = part[i].split('=');

							if (data[0] && data[1]) {
								value[data[0]] = data[1];
							}
						}

						if (value[key]) {
							return value[key];
						} else {
							return '';
						}
					}
				}

			</script> -->
			<!-- /header.tpl -->