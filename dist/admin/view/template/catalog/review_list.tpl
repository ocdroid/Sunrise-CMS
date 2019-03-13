<!-- review_list.tpl -->
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
			title="<?php echo $button_enable; ?>" 
			class="uk-button uk-button-default" 
			onclick="$('#form-review').attr('action', '<?php echo $enabled; ?>').submit()"
		>
			<span uk-icon="play"></span>
		</button>
		
		<button 
			type="button" 
			title="<?php echo $button_disable; ?>" 
			class="uk-button uk-button-default" 
			onclick="$('#form-review').attr('action', '<?php echo $disabled; ?>').submit()"
		>
			<span uk-icon="ban"></span>
		</button>
		
		<button 
			type="button" 
			title="<?php echo $button_delete; ?>" 
			class="uk-button uk-button-default" 
			onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-review').submit() : false;"
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











		<div class="well">
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label class="control-label" for="input-product"><?php echo $entry_product; ?></label>
						<input type="text" name="filter_product" value="<?php echo $filter_product; ?>" placeholder="<?php echo $entry_product; ?>" id="input-product" class="form-control" />
					</div>
					<div class="form-group">
						<label class="control-label" for="input-author"><?php echo $entry_author; ?></label>
						<input type="text" name="filter_author" value="<?php echo $filter_author; ?>" placeholder="<?php echo $entry_author; ?>" id="input-author" class="form-control" />
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label class="control-label" for="input-status"><?php echo $entry_status; ?></label>
						<select name="filter_status" id="input-status" class="form-control">
							<option value="*"></option>
							<?php if ($filter_status) { ?>
							<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
							<?php } else { ?>
							<option value="1"><?php echo $text_enabled; ?></option>
							<?php } ?>
							<?php if (!$filter_status && !is_null($filter_status)) { ?>
							<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
							<?php } else { ?>
							<option value="0"><?php echo $text_disabled; ?></option>
							<?php } ?>
						</select>
					</div>
					<div class="form-group">
						<label class="control-label" for="input-date-added"><?php echo $entry_date_added; ?></label>
						<div class="input-group date">
							<input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" placeholder="<?php echo $entry_date_added; ?>" data-date-format="YYYY-MM-DD" id="input-date-added" class="form-control" />
							<span class="input-group-btn">
							<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
							</span></div>
					</div>
					<button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
				</div>
			</div>
		</div>












		
	</div>
</div>

<div class="uk-section uk-padding-remove uk-margin-small uk-margin-medium-bottom">
	<div class="uk-container">

		<form 
			action="<?php echo $delete; ?>" 
			method="post" 
			enctype="multipart/form-data" 
			id="form-review"
		>

			<table class="uk-table uk-table-divider uk-table-striped uk-table-small uk-table-responsive uk-text-break">

				<thead>

					<tr>

						<td>

							<input 
								type="checkbox" 
								onclick="$('input[name*=\'selected\']').prop('checked', this.checked);"
							>

						</td>
						
						<td>

							<?php if ($sort == 'pd.name') { ?>
								
								<a 
									href="<?php echo $sort_product; ?>" 
									class="<?php echo strtolower($order); ?>"
								>
									<?php echo $column_product; ?>
								</a>
							
							<?php } else { ?>
								
								<a href="<?php echo $sort_product; ?>">
									<?php echo $column_product; ?>
								</a>
							
							<?php } ?>

						</td>

						<td>

							<?php if ($sort == 'r.author') { ?>
							
								<a 
									href="<?php echo $sort_author; ?>" 
									class="<?php echo strtolower($order); ?>"
								>
									<?php echo $column_author; ?>
								</a>
							
							<?php } else { ?>
							
								<a href="<?php echo $sort_author; ?>">
									<?php echo $column_author; ?>
								</a>
							
							<?php } ?>

						</td>

						<td>

							<?php if ($sort == 'r.rating') { ?>
							
								<a 
									href="<?php echo $sort_rating; ?>" 
									class="<?php echo strtolower($order); ?>"
								>
									<?php echo $column_rating; ?>
								</a>
							
							<?php } else { ?>
							
								<a href="<?php echo $sort_rating; ?>">
									<?php echo $column_rating; ?>
								</a>
							
							<?php } ?>

						</td>

						<td>

							<?php if ($sort == 'r.status') { ?>
							
								<a 
									href="<?php echo $sort_status; ?>" 
									class="<?php echo strtolower($order); ?>"
								>
									<?php echo $column_status; ?>
								</a>
							
							<?php } else { ?>
							
									<a href="<?php echo $sort_status; ?>">
										<?php echo $column_status; ?>
									</a>
							
							<?php } ?>

						</td>

						<td>

							<?php if ($sort == 'r.date_added') { ?>
							
								<a 
									href="<?php echo $sort_date_added; ?>" 
									class="<?php echo strtolower($order); ?>"
								>
									<?php echo $column_date_added; ?>
								</a>
							
							<?php } else { ?>
							
								<a href="<?php echo $sort_date_added; ?>">
									<?php echo $column_date_added; ?>
								</a>
							
							<?php } ?>

						</td>

						<td>
							<?php echo $column_action; ?>
						</td>

					</tr>

				</thead>

				<tbody>

					<?php if ($reviews) { ?>

						<?php foreach ($reviews as $review) { ?>

							<tr>

								<td>
									
									<?php if (in_array($review['review_id'], $selected)) { ?>
									
										<input 
											type="checkbox" 
											name="selected[]" 
											value="<?php echo $review['review_id']; ?>" 
											checked="checked"
										>
									
									<?php } else { ?>
									
										<input 
											type="checkbox" 
											name="selected[]" 
											value="<?php echo $review['review_id']; ?>"
										>
									
									<?php } ?>

								</td>

								<td>
									<?php echo $review['name']; ?>
								</td>
								
								<td>
									<?php echo $review['author']; ?>
								</td>
								
								<td>
									<?php echo $review['rating']; ?>
								</td>
								
								<td>
									<?php echo $review['status']; ?>
								</td>
								
								<td>
									<?php echo $review['date_added']; ?>
								</td>
								
								<td>
									
									<a 
										href="<?php echo $review['edit']; ?>" 
										title="<?php echo $button_edit; ?>" 
										class="uk-button uk-button-default uk-button-small"
									>
										<span uk-icon="pencil"></span>
									</a>

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

		<?php echo $pagination; ?>
		
		<span class="uk-text-small">
			<?php echo $results; ?>
		</span>

	</div>
</div>
<!-- /pagination -->

<script>
$('#button-filter').on('click', function() {
	url = 'index.php?route=catalog/review&token=<?php echo $token; ?>';
	
	var filter_product = $('input[name=\'filter_product\']').val();
	
	if (filter_product) {
		url += '&filter_product=' + encodeURIComponent(filter_product);
	}
	
	var filter_author = $('input[name=\'filter_author\']').val();
	
	if (filter_author) {
		url += '&filter_author=' + encodeURIComponent(filter_author);
	}
	
	var filter_status = $('select[name=\'filter_status\']').val();
	
	if (filter_status != '*') {
		url += '&filter_status=' + encodeURIComponent(filter_status); 
	}		
			
	var filter_date_added = $('input[name=\'filter_date_added\']').val();
	
	if (filter_date_added) {
		url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
	}

	location = url;
});
</script> 
<script>
$('.date').datetimepicker({
	pickTime: false
});
</script>

<?php echo $footer; ?>
<!-- /review_list.tpl -->