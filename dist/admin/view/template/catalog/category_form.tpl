<!-- category_form.tpl -->
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
				<?php echo $text_form; ?>
			</li>
			<!-- /heading in breadcrumbs -->

		</ul>

	</div>
</div>
<!-- /breadcrumbs -->

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
			id="form-category" 
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
								SEO
							</a>
						</li>

						<li>
							<a href="#">
								<?php echo $tab_data; ?>
							</a>
						</li>

						<li>
							<a href="#">
								<?php echo $tab_related; ?>
							</a>
						</li>

					</ul>

					<ul 
						id="ci_admin_tabs" 
						class="uk-switcher uk-margin"
					>

						<li>

							<ul 
								id="language" 
								uk-tab="connect: #ci_admin_tabs_lang"
							>
				
								<?php foreach ($languages as $language) { ?>

									<li class="uk-active">
										<a href="#language<?php echo $language['language_id']; ?>">
											
											<img 
												src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" 
												title="<?php echo $language['name']; ?>"
											>
												
											<?php echo $language['name']; ?>

										</a>
									</li>
				
								<?php } ?>

							</ul>

							<ul 
								id="ci_admin_tabs_lang" 
								class="uk-switcher uk-margin"
							>
							
								<?php foreach ($languages as $language) { ?>
											
									<div id="language<?php echo $language['language_id']; ?>">

										<div class="uk-margin">

											<label 
												class="uk-form-label uk-text-muted" 
												for="input-name<?php echo $language['language_id']; ?>"
											>
												<?php echo $entry_name; ?>
											
											</label>

											<div class="uk-form-controls">

												<input 
													type="text" 
													name="information_description[<?php echo $language['language_id']; ?>][title]" 
													value="<?php echo isset($information_description[$language['language_id']]) ? $information_description[$language['language_id']]['title'] : ''; ?>" 
													placeholder="<?php echo $entry_name; ?>" 
													id="input-name<?php echo $language['language_id']; ?>" 
													class="uk-input"
												>
												
												<?php if (isset($error_title[$language['language_id']])) { ?>
													
													<?php echo $error_title[$language['language_id']]; ?>
													
												<?php } ?>

											</div>

										</div>

										<div class="uk-margin">
											
											<label 
												class="uk-form-label uk-text-muted" 
												for="input-description<?php echo $language['language_id']; ?>"
											>
												<?php echo $entry_description; ?>
											</label>
											
											<div class="uk-form-controls">
												
												<textarea 
													name="category_description[<?php echo $language['language_id']; ?>][description]" 
													placeholder="<?php echo $entry_description; ?>" 
													id="input-description<?php echo $language['language_id']; ?>" 
													class="sun-editor-editable uk-textarea"
												><?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['description'] : ''; ?></textarea>

												<?php if (isset($error_description[$language['language_id']])) { ?>

													<?php echo $error_description[$language['language_id']]; ?>
													
												<?php } ?>

											</div>

										</div>

									</div>

								<?php } ?>

							</ul>



							<div class="tab-pane active" id="tab-general">
								<ul class="nav nav-tabs" id="language">
									<?php foreach ($languages as $language) { ?>
									<li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>
								<div class="tab-content">
									<?php foreach ($languages as $language) { ?>
									<div class="tab-pane" id="language<?php echo $language['language_id']; ?>">


										
						<div class="form-group">
											<label class="col-sm-2 control-label" for="input-meta-h1<?php echo $language['language_id']; ?>"><?php echo $entry_meta_h1; ?></label>
											<div class="col-sm-10">
												<input type="text" name="category_description[<?php echo $language['language_id']; ?>][meta_h1]" value="<?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['meta_h1'] : ''; ?>" placeholder="<?php echo $entry_meta_h1; ?>" id="input-meta-title<?php echo $language['language_id']; ?>" class="form-control" />
												<?php if (isset($error_meta_h1[$language['language_id']])) { ?>
												<div class="text-danger"><?php echo $error_meta_h1[$language['language_id']]; ?></div>
												<?php } ?>
											</div>
							</div>
							<div class="form-group">
											<label class="col-sm-2 control-label" for="input-meta-title<?php echo $language['language_id']; ?>"><?php echo $entry_meta_title; ?></label>
											<div class="col-sm-10">
												<input type="text" name="category_description[<?php echo $language['language_id']; ?>][meta_title]" value="<?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['meta_title'] : ''; ?>" placeholder="<?php echo $entry_meta_title; ?>" id="input-meta-title<?php echo $language['language_id']; ?>" class="form-control" />
												<?php if (isset($error_meta_title[$language['language_id']])) { ?>
												<div class="text-danger"><?php echo $error_meta_title[$language['language_id']]; ?></div>
												<?php } ?>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
											<div class="col-sm-10">
												<textarea name="category_description[<?php echo $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
											<div class="col-sm-10">
												<textarea name="category_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['description'] : ''; ?></textarea>
											</div>
										</div>
						<div class="form-group">
											<label class="col-sm-2 control-label" for="input-description_bottom<?php echo $language['language_id']; ?>"><?php echo $entry_description_bottom; ?></label>
											<div class="col-sm-10">
												<textarea name="category_description[<?php echo $language['language_id']; ?>][description_bottom]" placeholder="<?php echo $entry_description_bottom; ?>" id="input-description_bottom<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['description_bottom'] : ''; ?></textarea>
											</div>
										</div>
									</div>
									<?php } ?>
								</div>
							</div>
						
						</li>




						<li>


							
						</li>






						<li>

								<div class="tab-pane" id="tab-data">
									<div class="form-group">
										<label class="col-sm-2 control-label" for="input-parent"><?php echo $entry_parent; ?></label>
										<div class="col-sm-10">
											<input type="text" name="path" value="<?php echo $path; ?>" placeholder="<?php echo $entry_parent; ?>" id="input-parent" class="form-control" />
											<input type="hidden" name="parent_id" value="<?php echo $parent_id; ?>" />
											<?php if ($error_parent) { ?>
											<div class="text-danger"><?php echo $error_parent; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="input-filter"><span data-toggle="tooltip" title="<?php echo $help_filter; ?>"><?php echo $entry_filter; ?></span></label>
										<div class="col-sm-10">
											<input type="text" name="filter" value="" placeholder="<?php echo $entry_filter; ?>" id="input-filter" class="form-control" />
											<div id="category-filter" class="well well-sm" style="height: 150px; overflow: auto;">
												<?php foreach ($category_filters as $category_filter) { ?>
												<div id="category-filter<?php echo $category_filter['filter_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $category_filter['name']; ?>
													<input type="hidden" name="category_filter[]" value="<?php echo $category_filter['filter_id']; ?>" />
												</div>
												<?php } ?>
											</div>
										</div>
									</div>


									<div class="form-group">
										<label class="col-sm-2 control-label" for="input-keyword"><span data-toggle="tooltip" title="<?php echo $help_keyword; ?>"><?php echo $entry_keyword; ?></span></label>
										<div class="col-sm-10">
											<input type="text" name="keyword" value="<?php echo $keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control" />
											<?php if ($error_keyword) { ?>
											<div class="text-danger"><?php echo $error_keyword; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $entry_image; ?></label>
										<div class="col-sm-10"><a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
											<input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="input-top"><span data-toggle="tooltip" title="<?php echo $help_top; ?>"><?php echo $entry_top; ?></span></label>
										<div class="col-sm-10">
											<div class="checkbox">
												<label>
													<?php if ($top) { ?>
													<input type="checkbox" name="top" value="1" checked="checked" id="input-top" />
													<?php } else { ?>
													<input type="checkbox" name="top" value="1" id="input-top" />
													<?php } ?>
													&nbsp; </label>
											</div>
										</div>
									</div>





							<div class="form-group">
										<label class="col-sm-2 control-label" for="input-noindex"><span data-toggle="tooltip" title="<?php echo $help_noindex; ?>"><?php echo $entry_noindex; ?></span></label>
										<div class="col-sm-10">
											<select name="noindex" id="input-noindex" class="form-control">
												<?php if ($noindex) { ?>
												<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
												<option value="0"><?php echo $text_disabled; ?></option>
												<?php } else { ?>
												<option value="1"><?php echo $text_enabled; ?></option>
												<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
												<?php } ?>
											</select>
										</div>
									</div>
								</div>
							
							</li>
							

							<li>

									<div class="tab-pane" id="tab-related">
								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-product-related"><?php echo $entry_related_wb; ?></label>
									<div class="col-sm-10">
										<input type="text" name="product_related_input" value="" placeholder="<?php echo $entry_related_wb; ?>" id="input-product-related" class="form-control" />
										<div id="product-related" class="well well-sm" style="height: 150px; overflow: auto;">
											<?php foreach ($product_related as $product_related) { ?>
											<div id="product-related<?php echo $product_related['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_related['name']; ?>
												<input type="hidden" name="product_related[]" value="<?php echo $product_related['product_id']; ?>" />
											</div>
											<?php } ?>
										</div>
								</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-article-related"><?php echo $entry_related_article; ?></label>
									<div class="col-sm-10">
										<input type="text" name="article_related_input" value="" placeholder="<?php echo $entry_related_article; ?>" id="input-article-related" class="form-control" />
										<div id="article-related" class="well well-sm" style="height: 150px; overflow: auto;">
											<?php foreach ($article_related as $article_related) { ?>
											<div id="article-related<?php echo $article_related['article_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $article_related['name']; ?>
												<input type="hidden" name="article_related[]" value="<?php echo $article_related['article_id']; ?>" />
											</div>
											<?php } ?>
										</div>
									</div>
								</div>
									</div>
								
								</li>
								
								

















					</ul>

				</div>

				<div class="uk-width-1-1 uk-width-1-1@s uk-width-1-1@m uk-width-1-5@l uk-width-1-6@xl uk-margin-large-top">

					<div class="uk-margin uk-margin-small uk-padding-small uk-tile-muted">

						<label 
							class="uk-form-label" 
							for="input-status"
						>
							<?php echo $entry_status; ?>
						</label>
						
						<div class="uk-form-controls">

							<select 
								name="status" 
								id="input-status" 
								class="uk-select"
							>

								<?php if ($status) { ?>

									<option value="1" selected>
										<?php echo $text_enabled; ?>
									</option>

									<option value="0">
										<?php echo $text_disabled; ?>
									</option>

								<?php } else { ?>
									
									<option value="1">
										<?php echo $text_enabled; ?>
									</option>

									<option value="0" selected>
										<?php echo $text_disabled; ?>
									</option>
								
								<?php } ?>

							</select>

						</div>

					</div>

					<div class="uk-margin uk-margin-small uk-padding-small uk-tile-muted">

						<label 
							class="uk-form-label" 
							for="input-sort-order"
						>
							<?php echo $entry_sort_order; ?>
						</label>

						<div class="uk-form-controls">
							<input 
								type="text" 
								name="sort_order" 
								value="<?php echo $sort_order; ?>" 
								placeholder="<?php echo $entry_sort_order; ?>" 
								id="input-sort-order" 
								class="uk-input"
							>
						</div>
		
					</div>

					<div class="uk-margin uk-margin-small uk-padding-small uk-tile-muted">

						<label 
							class="uk-form-label" 
							for="input-layout"
						>
							<?php echo $entry_layout; ?>
							(<?php echo $text_default; ?>)
						</label>
					
						<div class="uk-form-controls">
					
							<select 
								name="category_layout[0]" 
								id="input-layout" 
								class="uk-select"
							>
								
								<option value=""></option>
					
								<?php foreach ($layouts as $layout) { ?>
									
									<?php if (isset($category_layout[0]) && $category_layout[0] == $layout['layout_id']) { ?>
										
										<option 
											value="<?php echo $layout['layout_id']; ?>" 
											selected
										>
											<?php echo $layout['name']; ?>
										</option>
					
									<?php } else { ?>
					
										<option value="<?php echo $layout['layout_id']; ?>">
											<?php echo $layout['name']; ?>
										</option>
									
									<?php } ?>
								<?php } ?>
					
							</select>
					
						</div>
					
					</div>
					
					<?php foreach ($stores as $store) { ?>
					
						<div class="uk-margin uk-margin-small uk-padding-small uk-tile-muted">
					
							<label 
								class="uk-form-label" 
								for="category_layout[<?php echo $store['store_id']; ?>]"
							>
								<?php echo $store['name']; ?>
							</label>
					
							<div class="uk-form-controls">
					
								<select 
									name="category_layout[<?php echo $store['store_id']; ?>]" 
									class="uk-select"
								>
									
									<option value=""></option>
					
									<?php foreach ($layouts as $layout) { ?>
					
										<?php if (isset($category_layout[$store['store_id']]) && $category_layout[$store['store_id']] == $layout['layout_id']) { ?>
					
											<option 
												value="<?php echo $layout['layout_id']; ?>" 
												selected
											>
												<?php echo $layout['name']; ?>
											</option>
					
										<?php } else { ?>
					
											<option value="<?php echo $layout['layout_id']; ?>">
												<?php echo $layout['name']; ?>
											</option>
					
										<?php } ?>
					
									<?php } ?>
								</select>
					
							</div>
					
						</div>
					
					<?php } ?>

					<div class="uk-margin uk-margin-small uk-padding-small uk-tile-muted">

						<label 
							class="uk-form-label" 
							for="input-store"
						>
							<?php echo $text_default; ?>
						</label>
					
						<div class="uk-form-controls">
							
							<label>
					
								<?php if (in_array(0, $category_store)) { ?>
									
									<input 
										class="uk-checkbox" 
										id="input-store" 
										type="checkbox" 
										name="category_store[]" 
										value="0" 
										checked
									>
					
								<?php } else { ?>
									
									<input 
										class="uk-checkbox" 
										id="input-store" 
										type="checkbox" 
										name="category_store[]" 
										value="0"
									>
					
								<?php } ?>
					
							</label>
					
						</div>
					
					</div>
					
					<?php foreach ($stores as $store) { ?>
					
						<div class="uk-margin uk-margin-small uk-padding-small uk-tile-muted">
					
							<label 
								class="uk-form-label" 
								for="input-store"
							>
								<?php echo $store['name']; ?>
							</label>
					
							<div class="uk-form-controls">
					
								<label>
					
									<?php if (in_array($store['store_id'], $category_store)) { ?>
										
										<input 
											class="uk-checkbox" 
											id="input-store" 
											type="checkbox" 
											name="category_store[]" 
											value="<?php echo $store['store_id']; ?>" 
											checked
										>
					
									<?php } else { ?>
										
										<input 
											class="uk-checkbox" 
											id="input-store" 
											type="checkbox" 
											name="category_store[]" 
											value="<?php echo $store['store_id']; ?>"
										>
					
									<?php } ?>
					
								</label>
					
							</div>
					
						</div>
					
					<?php } ?>

					<div class="uk-margin uk-margin-small">

						<button 
							type="submit" 
							form="form-category" 
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
	const suneditor = SUNEDITOR.create('input-description<?php echo $language['language_id']; ?>', {
		fontSize : [
			10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38
		],
		font : [
			'Segoe UI',
			'Helvetica Neue,Helvetica',
			'Arial',
			'Tahoma',
			'Trebuchet MS',
			'Verdana'
		],
		width : '100%',
		height : '450',
		videoWidth : 360,
		videoHeight : 115,
		imageWidth : 150,
		popupDisplay : 'local',
		resizingBar : true,
		buttonList : [
			['fullScreen', 'codeView', 'showBlocks'],
			['undo', 'redo'], 
			['removeFormat'], 
			['bold', 'underline', 'italic', 'strike', 'subscript', 'superscript'], 
			['fontColor', 'hiliteColor'], ['outdent', 'indent'], 
			['align', 'horizontalRule', 'list'], 
			['font', 'fontSize', 'formatBlock'], 
			['link', 'image', 'video'],
			['table']
		]
	});
</script>

<script>
		$('input[name=\'path\']').autocomplete({
			'source': function(request, response) {
				$.ajax({
					url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
					dataType: 'json',
					success: function(json) {
						json.unshift({
							category_id: 0,
							name: '<?php echo $text_none; ?>'
						});
		
						response($.map(json, function(item) {
							return {
								label: item['name'],
								value: item['category_id']
							}
						}));
					}
				});
			},
			'select': function(item) {
				$('input[name=\'path\']').val(item['label']);
				$('input[name=\'parent_id\']').val(item['value']);
			}
		});
		</script> 
			<script>
		$('input[name=\'filter\']').autocomplete({
			'source': function(request, response) {
				$.ajax({
					url: 'index.php?route=catalog/filter/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
					dataType: 'json',
					success: function(json) {
						response($.map(json, function(item) {
							return {
								label: item['name'],
								value: item['filter_id']
							}
						}));
					}
				});
			},
			'select': function(item) {
				$('input[name=\'filter\']').val('');
		
				$('#category-filter' + item['value']).remove();
		
				$('#category-filter').append('<div id="category-filter' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="category_filter[]" value="' + item['value'] + '" /></div>');
			}
		});
		
		$('#category-filter').delegate('.fa-minus-circle', 'click', function() {
			$(this).parent().remove();
		});
		</script> 
			<script>
		$('#language a:first').tab('show');
		</script>
		<script>
		$('input[name=\'product_related_input\']').autocomplete({
			source: function(request, response) {
				$.ajax({
					url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
					dataType: 'json',
					success: function(json) {
						response($.map(json, function(item) {
							return {
								label: item['name'],
								value: item['product_id']
							}
						}));
					}
				});
			},
			select: function(item) {
				$('input[name=\'product\']').val('');
				
				$('#product-related' + item['value']).remove();
				
				$('#product-related').append('<div id="product-related' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_related[]" value="' + item['value'] + '" /></div>');	
			}
		});
			
		$('#product-related').delegate('.fa-minus-circle', 'click', function() {
			$(this).parent().remove();
		});
		</script>
		<script>
		$('input[name=\'article_related_input\']').autocomplete({
			source: function(request, response) {
				$.ajax({
					url: 'index.php?route=blog/article/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
					dataType: 'json',
					success: function(json) {
						response($.map(json, function(item) {
							return {
								label: item['name'],
								value: item['article_id']
							}
						}));
					}
				});
			},
			select: function(item) {
				$('input[name=\'product\']').val('');
				
				$('#article-related' + item['value']).remove();
				
				$('#article-related').append('<div id="article-related' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="article_related[]" value="' + item['value'] + '" /></div>');	
			}
		});
			
		$('#article-related').delegate('.fa-minus-circle', 'click', function() {
			$(this).parent().remove();
		});
	</script>


<?php echo $footer; ?>
<!-- /category_form.tpl -->