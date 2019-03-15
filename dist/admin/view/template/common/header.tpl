<!-- header.tpl -->
<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">

	<head>
		
		<meta charset="utf-8">
		<meta http-equiv="x-ua-compatible" content="ie=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<title><?php echo $title; ?></title>

		<base href="<?php echo $base; ?>">
		
		<?php if ($description) { ?>
			<meta name="description" content="<?php echo $description; ?>">
		<?php } ?>

		<!-- icon -->
		<?php foreach ($links as $link) { ?>
			<link rel="<?php echo $link['rel']; ?>" href="<?php echo $link['href']; ?>">
		<?php } ?>

		<!-- stelysheet -->
		<?php foreach ($styles as $style) { ?>
			<link rel="<?php echo $style['rel']; ?>" href="<?php echo $style['href']; ?>">
		<?php } ?>

		<?php foreach ($scripts as $script) { ?>
			<script src="<?php echo $script; ?>"></script>
		<?php } ?>

	</head>

	<body>

		<div class="uk-offcanvas-content">

			<?php if ($logged) { ?>
				<header class="uk-section uk-section-muted uk-padding-small uk-box-shadow-small uk-background-secondary uk-light" uk-sticky="sel-target: .uk-navbar-container; cls-active: uk-navbar-sticky; media: @m">
					<div class="uk-container">

						<nav class="uk-navbar-container uk-navbar-transparent" uk-navbar>

							<!-- off-canvas menu button -->
							<div class="uk-navbar-left">
						
								<div class="uk-inline">
									<a class="uk-text-emphasis" href="#cc_admin_main_menu" uk-toggle>
										<span uk-icon="icon: menu; ratio: 1"></span>
										<span class="uk-visible@s">
											Menu
										</span>
									</a>
								</div>

								<div class="uk-inline uk-margin-small-left">
									<span uk-icon="icon: plus; ratio: 1"></span>
									<span class="uk-visible@s">
										<?php echo $text_new; ?>
									</span>
								</div>
								
								<div uk-dropdown="mode: click; pos: bottom-justify">
									<ul class="uk-nav uk-navbar-dropdown-nav">
								
										<li>
											<a href="<?php echo $new_product; ?>">
												<?php echo $text_new_product; ?>
											</a>
										</li>
								
										<li>
											<a href="<?php echo $new_category; ?>">
												<?php echo $text_new_category; ?>
											</a>
										</li>
								
										<li>
											<a href="<?php echo $new_manufacturer; ?>">
												<?php echo $text_new_manufacturer; ?>
											</a>
										</li>
								
										<li>
											<a href="<?php echo $new_customer; ?>">
												<?php echo $text_new_customer; ?>
											</a>
										</li>
								
										<li>
											<a href="<?php echo $new_download; ?>">
												<?php echo $text_new_download; ?>
											</a>
										</li>
								
									</ul>
								</div>

							</div>

							<div class="uk-navbar-center">
								<a 
									class="uk-logo" 
									href="<?php echo $home; ?>"
								>
									<img 
										class="cc_admin_header_logo" 
										data-src="/images/catalog/logos/logo-small.png" 
										uk-img
									>
									<img 
										class="cc_admin_header_logo uk-logo-inverse" 
										data-src="/images/catalog/logos/logo-small-inversed.png" 
										uk-img
									>
								</a>
							</div>

							<div class="uk-navbar-right">

								<?php //if ($alerts > 0) { ?>

									<div class="uk-inline">
										<span uk-icon="icon: warning; ratio: 1"></span>
										<span class="uk-visible@s">
											<?php echo $alerts; ?>
										</span>
									</div>
											
									<div uk-dropdown="mode: click; pos: bottom-justify">
										<ul class="uk-nav uk-navbar-dropdown-nav">
									
											<li>

												<?php echo $text_order; ?>

												<?php echo $text_customer; ?>

												<?php echo $text_product; ?>

											</li>
											
											<!-- покупатели / ожидают одобрения -->
											<li>
												<a href="<?php echo $customer_approval; ?>">
													<?php echo $customer_total; ?>
													<?php echo $text_approval; ?>
												</a>
											</li>
											
											
											<!-- наличие товаров -->
											<li>
												<a href="<?php echo $product; ?>">
													<?php echo $product_total; ?>
													<?php echo $text_stock; ?>
												</a>
											</li>
											
											<!-- отзывы о товарах -->
											<li>
												<a href="<?php echo $review; ?>">
													<?php echo $review_total; ?>
													<?php echo $text_review; ?>
												</a>
											</li>
										
										</ul>
									</div>
									
								<?php //} ?>
	
								<div class="uk-inline uk-margin-small-left">
									<span uk-icon="icon: trash; ratio: 1"></span>
									<span class="uk-visible@s">
										Clear
									</span>
								</div>
								
								<div uk-dropdown="mode: click; pos: bottom-justify">
									<ul class="uk-nav uk-navbar-dropdown-nav">
								
										<li>
											<a href="<?php echo $clearcache; ?>">
												<?php echo $button_clearcache; ?>
											</a>
										</li>
										
										<li>
											<a href="<?php echo $clearsystemcache; ?>">
												<?php echo $button_clearsystemcache; ?>
											</a>
										</li>
										
										<li>
											<a href="<?php echo $clearallcache; ?>">
												<?php echo $button_clearallcache; ?>
											</a>
										</li>
								
									</ul>
								</div>

								<div class="uk-inline uk-margin-small-left">
									<span uk-icon="icon: home; ratio: 1"></span>
									<span class="uk-visible@s">
										<?php echo $text_store; ?>
									</span>
								</div>
										
								<div uk-dropdown="mode: click; pos: bottom-justify">

									<ul class="uk-nav uk-dropdown-nav">

										<?php foreach ($stores as $store) { ?>
											<li>
												<a href="<?php echo $store['href']; ?>" target="_blank">
													<?php echo $store['name']; ?>
												</a>
											</li>
										<?php } ?>

									</ul>

								</div>

								<div class="uk-inline uk-margin-small-left">
									<a class="uk-text-emphasis" href="<?php echo $logout; ?>">
										<span uk-icon="icon: sign-out; ratio: 1"></span>
										<span class="uk-visible@s">
											<?php echo $text_logout; ?>
										</span>
									</a>
								</div>

							</div>

						</nav>
					</div>
				</header>
			<?php } ?>
			<!-- /header.tpl -->
