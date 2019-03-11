<!-- module.tpl -->
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

<?php if ($extensions) { ?>
	<div uk-filter="target: .cc_filter_extentions">

		<div class="uk-grid-small uk-grid-divider uk-child-width-auto" uk-grid>
			<div>
				<ul class="uk-subnav uk-subnav-pill" uk-margin>
					<li class="uk-active" uk-filter-control><a href="#">All</a></li>
				</ul>
			</div>
			<div>
				<ul class="uk-subnav uk-subnav-pill" uk-margin>
					<li uk-filter-control="filter: [data-filter-installed='installed']; group: data-filter-installed"><a href="#">installed</a></li>
					<li uk-filter-control="filter: [data-filter-installed='uninstalled']; group: data-filter-installed"><a href="#">uninstalled</a></li>
				</ul>
			</div>
			<div>
				<ul class="uk-subnav uk-subnav-pill" uk-margin>
					<li uk-filter-control="filter: [data-filter-ext_level='main']; group: data-filter-ext_level"><a href="#">main</a></li>
					<li uk-filter-control="filter: [data-filter-ext_level='sub']; group: data-filter-ext_level"><a href="#">sub</a></li>
				</ul>
			</div>
		</div>

		<ul class="cc_filter_extentions uk-child-width-1-1 uk-child-width-1-2@m uk-child-width-1-3@l uk-child-width-1-4@xl" uk-grid>

			<?php foreach ($extensions as $extension) { ?>

				<li 
					data-filter-installed="<?php if ($extension['module']) { ?>installed<?php } else { ?>uninstalled<?php } ?>"
					data-filter-ext_level="main" 
					class="uk-margin-remove"
				>

					<div class="uk-card uk-card-default uk-card-small uk-margin-small-bottom <?php if (!$extension['module']) { ?>uk-background-secondary<?php } ?>">
						
						<div class="uk-card-media-top">
							<img src="/image/admin/light.jpg" alt="">
						</div>

						<div class="uk-card-body">
							
							<div class="uk-card-badge uk-label">
								Badge
							</div>
				
							<h3 class="uk-card-title">
								<?php echo $extension['name']; ?>
							</h3>
				
							<p>

								Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.

								<hr>

								<?php if ($extension['installed']) { ?>
										
									<a 
										href="<?php echo $extension['edit']; ?>" 
										title="<?php echo $button_edit; ?>" 
										class="uk-button uk-button-link"
									>
										<?php if ($extension['module']) { ?>Add new<?php } else { ?>Edit<?php } ?>
									</a>
				
									<a 
										href="<?php echo $extension['uninstall']; ?>" 
										title="<?php echo $button_uninstall; ?>" 
										class="uk-button uk-button-link"
									>
										Uninstall
									</a>
				
								<?php } else { ?>
				
									<a 
										href="<?php echo $extension['install']; ?>" 
										title="<?php echo $button_install; ?>" 
										class="uk-button uk-button-link"
									>
										Install
									</a>
				
								<?php } ?>
							</p>
				
						</div>

					</div>

				</li>

				<?php foreach ($extension['module'] as $module) { ?>
					
					<li 
						data-filter-installed="installed" 
						data-filter-ext_level="sub" 
						class="uk-margin-remove"
					>
						
						<div class="uk-card uk-card-default uk-card-small uk-margin-small-bottom <?php if (!$extension['module']) { ?>uk-background-muted<?php } ?>">
												
							<div class="uk-card-media-top">
								<img src="/image/admin/light.jpg" alt="">
							</div>
							
							<div class="uk-card-body">
								
								<div class="uk-card-badge uk-label">
									Badge
								</div>

								<h3 class="uk-card-title">
									_____<?php echo $module['name']; ?>
								</h3>

								<p>

									Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.

									<hr>

									<a 
										href="<?php echo $extension['edit']; ?>" 
										title="<?php echo $button_edit; ?>" 
										class="uk-button uk-button-link"
									>
										Edit
									</a>

									<a 
										href="<?php echo $module['delete']; ?>" 
										title="<?php echo $button_delete; ?>" 
										class="uk-button uk-button-link"
									>
										Delete
									</a>

								</p>

							</div>

						</div>
	
					</li>
	
				<?php } ?>

			<?php } ?>

		</ul>

	</div>

	<div class="uk-alert-primary" uk-alert>
		<a class="uk-alert-close" uk-close></a>
		<p class="uk-text-center">
			<?php echo $text_layout; ?>
		</p>
	</div>

<?php } else { ?>

	<?php echo $text_no_results; ?>

<?php } ?>
<!-- /module.tpl -->