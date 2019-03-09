			<!-- footer.tpl -->
			<div class="uk-margin-large-top uk-text-center cc_to_top">
				<a href="#" uk-totop uk-scroll></a>
			</div>

			<div class="uk-section uk-section-muted uk-dark uk-padding-small">
				<div class="uk-container">

					<footer>
							
						<div class="uk-margin uk-margin-medium-top uk-margin-medium-bottom uk-flex uk-flex-center" uk-grid>

							<div class="uk-width-1-1 uk-width-1-2@s uk-width-1-6@m">
								...
							</div>

							<div class="uk-width-1-1 uk-width-1-2@s uk-width-1-6@m">
								...
							</div>

							<div class="uk-width-1-1 uk-width-1-2@s uk-width-1-6@m">
								
								<?php if ($informations) { ?>

									<h4>
										<?php echo $text_information; ?>
									</h4>
					
									<ul class="uk-list uk-list-bullet">
					
										<?php foreach ($informations as $information) { ?>
											<li>
												<a href="<?php echo $information['href']; ?>">
													<?php echo $information['title']; ?>
												</a>
											</li>
										<?php } ?>
					
									</ul>
											
								<?php } ?>

							</div>
				
							<div class="uk-width-1-1 uk-width-1-2@s uk-width-1-6@m">
								<h4>
									<?php echo $text_service; ?>
								</h4>
					
								<ul class="uk-list uk-list-bullet">
									<li>
										<a href="<?php echo $contact; ?>">
											<?php echo $text_contact; ?>
										</a>
									</li>
								</ul>
							</div>
				
							<div class="uk-width-1-1 uk-width-1-2@s uk-width-1-6@m">
								<h4>
									<?php echo $text_extra; ?>
								</h4>
					
								<ul class="uk-list uk-list-bullet">
									<li>
										<a href="<?php echo $manufacturer; ?>">
											<?php echo $text_manufacturer; ?>
										</a>
									</li>
									<li>
										<a href="<?php echo $special; ?>">
											<?php echo $text_special; ?>
										</a>
									</li>
									<li>
										<a href="<?php echo $mostviewed; ?>">
											<?php echo $text_mostviewed; ?>
										</a>
									</li>
									<li>
										<a href="<?php echo $bestseller; ?>">
											<?php echo $text_bestseller; ?>
										</a>
									</li>
									<li>
										<a href="<?php echo $latest; ?>">
											<?php echo $text_latest; ?>
										</a>
									</li>
								</ul>
							</div>
				
							<div class="uk-width-1-1 uk-width-1-2@s uk-width-1-6@m">
								<h4>
									<?php echo $text_account; ?>
								</h4>
					
								<ul class="uk-list uk-list-bullet">
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
										<a href="<?php echo $newsletter; ?>">
											<?php echo $text_newsletter; ?>
										</a>
									</li>
								</ul>
							</div>

						</div>
						
					</footer>

				</div>
			</div>

			<div class="uk-section uk-section-secondary uk-light uk-padding-small">
				<div class="uk-container">

					<div class="uk-margin uk-padding-remove uk-grid-collapse" uk-grid>
	
						<div class="uk-width-1-1 uk-width-2-3@s uk-width-3-4@m uk-width-4-5@l uk-width-5-6@xl uk-text-left@s uk-text-center">
							<?php echo $powered; ?>
						</div>
					
						<div class="uk-width-1-1 uk-width-1-3@s uk-width-1-4@m uk-width-1-5@l uk-width-1-6@xl uk-text-right@s uk-text-center">
							
							<span>
								From Ukraine with love
							</span>
		
							<img class="cc_footer_image" src="/image/ilu.png" alt="From Ukraine With Love">

						</div>

						<style>
							.cc_footer_image {
								height: 23px;
								margin-left: 5px;
								position: relative;
								top: -2px;
							}
						</style>

					</div>

				</div>
			</div>

		</div>

		<!-- debug-panel -->
		<?php if (defined('IS_DEBUG')) { ?>
			<?php require_once(DIR_TEMPLATE.'/default/template/inc.debug_panel.tpl'); ?>
		<?php } ?>
		
	</body>

</html>
<!-- /footer.tpl -->