<!-- store_list -->
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

<!-- heading -->
<div class="uk-section uk-padding-remove uk-margin-small uk-margin-medium-bottom">
	<div class="uk-container">

		<article class="uk-article">

			<h1 class="uk-article-title uk-margin-medium-top uk-margin-medium-bottom uk-text-center">
				<?php echo $heading_title; ?>
			</h1>

		</article>

	</div>
</div>
<!-- /heading -->

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

		<button 
			type="button" 
			title="<?php echo $button_delete; ?>" 
			class="uk-button uk-button-default" 
			onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-store').submit() : false;"
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

		<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-store">
				
			<table class="uk-table uk-table-divider uk-table-striped uk-table-small uk-table-responsive uk-text-break">
				
				<thead>

					<tr>

						<td class="uk-text-small uk-text-bold">

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
							<?php echo $column_url; ?>
						</td>
						
					</tr>

				</thead>

				<tbody>

					<?php if ($stores) { ?>
						
						<?php foreach ($stores as $store) { ?>

							<tr>

								<td>

									<?php if (in_array($store['store_id'], $selected)) { ?>

										<input 
											type="checkbox" 
											name="selected[]" 
											value="<?php echo $store['store_id']; ?>" 
											checked
										>

									<?php } else { ?>

										<input 
											type="checkbox" 
											name="selected[]" 
											value="<?php echo $store['store_id']; ?>"
										>

									<?php } ?>

								</td>

								<td>

									<a 
										href="<?php echo $store['edit']; ?>" 
										title="<?php echo $button_edit; ?>" 
										class="uk-button uk-button-default"
									>
										<span uk-icon="pencil"></span>
									</a>

								</td>

								<td>
									<?php echo $store['name']; ?>
								</td>

								<td>
									<?php echo $store['url']; ?>
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

<?php echo $footer; ?>
<!-- /store_list -->