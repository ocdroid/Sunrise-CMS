<!-- category_list.tpl -->
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
				<?php echo $heading_title; ?>
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

<div class="uk-section uk-padding-remove uk-margin-small uk-margin-medium-bottom">
	<div class="uk-container">

		<a 
			href="<?php echo $add; ?>" 
			title="<?php echo $button_add; ?>" 
			class="uk-button uk-button-default"
		>
			<span uk-icon="plus"></span>
		</a> 
		
		<a 
			href="<?php echo $repair; ?>" 
			title="<?php echo $button_rebuild; ?>" 
			class="uk-button uk-button-default"
		>
			<span uk-icon="refresh"></span>
		</a>

		<button 
			type="button" 
			title="<?php echo $button_enable; ?>" 
			class="uk-button uk-button-default" 
			onclick="$('#form-category').attr('action', '<?php echo $enabled; ?>').submit()"
		>
			<span uk-icon="play"></span>
		</button>
		
		<button 
			type="button" 
			title="<?php echo $button_disable; ?>" 
			class="uk-button uk-button-default" 
			onclick="$('#form-category').attr('action', '<?php echo $disabled; ?>').submit()"
		>
			<span uk-icon="ban"></span>
		</button>
		
		<button 
			type="button" 
			title="<?php echo $button_delete; ?>" 
			class="uk-button uk-button-default" 
			onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-category').submit() : false;"
		>
			<span uk-icon="trash"></span>
		</button>

	</div>
</div>

<div class="uk-section uk-padding-remove uk-margin-small uk-margin-medium-bottom">
	<div class="uk-container">

		<?php echo $text_list; ?>

	</div>
</div>

<div class="uk-section uk-padding-remove uk-margin-small uk-margin-medium-bottom">
	<div class="uk-container">

		<form 
			action="<?php echo $delete; ?>" 
			method="post" 
			enctype="multipart/form-data" 
			id="form-category"
		>

			<table class="uk-table uk-table-divider uk-table-striped uk-table-small uk-table-responsive uk-text-break">

				<thead>

					<tr>
				
						<td class="uk-text-small uk-text-bold"
							<input 
								type="checkbox" 
								onclick="$('input[name*=\'selected\']').prop('checked', this.checked);"
							>
						</td>
				
						<td class="uk-text-small uk-text-bold">
							<?php echo $column_action; ?>
						</td>

						<td class="uk-text-small uk-text-bold">
							<?php echo $column_name; ?>
						</td>
				
						<td class="uk-text-small uk-text-bold">
							<?php echo $column_sort_order; ?>
						</td>
				
						<td class="uk-text-small uk-text-bold">
							<?php echo $column_noindex; ?>
						</td>

					</tr>
				
				</thead>

				<tbody>

					<?php if ($categories) { ?>
				
						<?php foreach ($categories as $category) { ?>
						
							<tr>
				
								<td>
									<?php if (in_array($category['category_id'], $selected)) { ?>
										
										<input 
											type="checkbox" 
											name="selected[]" 
											value="<?php echo $category['category_id']; ?>" 
											checked="checked"
										>
				
									<?php } else { ?>
				
										<input 
											type="checkbox" 
											name="selected[]" 
											value="<?php echo $category['category_id']; ?>"
										>
				
									<?php } ?>
								</td>
				
								<td>
									
									<a target="_blank" href="<?php echo $category['href_shop']; ?>" title="<?php echo $button_shop; ?>" class="uk-button uk-button-default uk-button-small">
										<span uk-icon="link"></span>
									</a>
				
									<a href="<?php echo $category['edit']; ?>" title="<?php echo $button_edit; ?>" class="uk-button uk-button-default uk-button-small">
										<span uk-icon="pencil"></span>
									</a>
									
								</td>
				
								<?php if ($category['href']) { ?>
									
									<td>
										
										<?php echo $category['indent']; ?>
				
										<a href="<?php echo $category['href']; ?>">
											<?php echo $category['name']; ?>
										</a>
				
									</td>
				
								<?php } else { ?>
									
									<td>
										<?php echo $category['indent']; ?>
										<?php echo $category['name']; ?>
									</td>
				
								<?php } ?>
				
								<td>
									<?php echo $category['sort_order']; ?>
								</td>
				
								<td>
									<?php echo $category['noindex']; ?>
								</td>

							</tr>

						<?php } ?>
				
					<?php } else { ?>
				
						<?php echo $text_no_results; ?>
				
					<?php } ?>
				
				</tbody>

			</table>

		</form>

	</div>
</div>

<div uk-height-viewport="expand: true"></div>

<!-- pagination -->
<div class="uk-section uk-section-muted uk-padding-small uk-margin-small uk-margin-large-top uk-margin-remove-bottom">
	<div class="uk-container uk-text-center">

		<span class="uk-text-small">
			<?php echo $results; ?>
		</span>

	</div>
</div>
<!-- /pagination -->

<?php echo $footer; ?>
<!-- /category_list.tpl -->