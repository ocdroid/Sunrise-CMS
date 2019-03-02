<!-- html.tpl -->
<div class="uk-section uk-margin-remove-top uk-margin-medium-bottom uk-padding-remove">
	<div class="uk-container cc_module cc_module_html cc_module_html_<?php echo $module_id; ?>">

		<?php if($heading_title) { ?>
			<div class="uk-margin-medium-top uk-margin-medium-bottom">
				<h3 class="uk-heading-line uk-text-center">
					<span>
						<?php echo $heading_title; ?>
					</span>
				</h3>
			</div>
		<?php } ?>

		<?php echo $html; ?>

	</div>
</div>
<!-- /html.tpl -->