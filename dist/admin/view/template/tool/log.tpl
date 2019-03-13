<!-- log.tpl -->
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
				<?php echo $text_list; ?>
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

<div class="uk-section uk-padding-medium-bottom uk-padding-remove">
	<div 
		class="uk-container uk-background-default" 
		uk-height-viewport="expand: true"
	>

		<div class="uk-flex" uk-grid>
			
			<div class="uk-width-1-1 uk-width-1-1@s uk-width-1-1@m uk-width-4-5@l uk-width-5-6@xl uk-margin-medium-top uk-margin-small-bottom">

				<textarea 
					wrap="on" 
					class="uk-textarea uk-text-small" 
					uk-height-viewport="offset-top: true; offset-bottom: 10" 
					readonly
				><?php echo $log; ?></textarea>

			</div>

			<div class="uk-width-1-1 uk-width-1-1@s uk-width-1-1@m uk-width-1-5@l uk-width-1-6@xl uk-margin-medium-top uk-flex-first uk-flex-last@l">

				<div uk-sticky="offset: 90; media: @m">

					<a 
						href="<?php echo $download; ?>" 
						title="<?php echo $button_download; ?>" 
						class="uk-button uk-button-primary uk-width-1-1 uk-margin-small-bottom"
					>
						<span uk-icon="download"></span>
						Download
					</a>
					
					<a 
						onclick="confirm('<?php echo $text_confirm; ?>') ? location.href='<?php echo $clear; ?>' : false;" 
						title="<?php echo $button_clear; ?>" 
						class="uk-button uk-button-danger uk-width-1-1"
					>
						<span uk-icon="trash"></span>
						Clear
					</a>

				</div>

			</div>

		</div>
		
	</div>

</div>

<?php echo $footer; ?>
<!-- /log.tpl -->