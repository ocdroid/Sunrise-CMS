<!-- contact.tpl -->
<?php echo $header; ?>

<!-- breadcrumbs -->
<?php require_once(DIR_TEMPLATE.'/default/template/inc.breadcrumbs.tpl'); ?>

<?php echo $content_top; ?>

<div class="uk-section uk-padding-remove uk-margin-small">
	<div class="uk-container">

		<article class="uk-article">

			<h1 class="uk-article-title uk-margin-medium-top uk-margin-medium-bottom uk-text-center">
				<?php echo $heading_title; ?>
			</h1>

		</article>

	</div>
</div>

<div class="uk-section uk-padding-remove uk-margin">
	<div class="uk-container">

		<div class="uk-margin-medium-bottom">
			<h3 class="uk-heading-line uk-text-center">
				<span>
					<?php echo $text_location; ?>
				</span>
			</h3>
		</div>

		<div class="uk-flex" uk-grid>

			<div class="cc_contact_cl uk-width-1-1 <?php if ($locations) { ?>uk-width-1-1@s uk-width-1-1@m uk-width-1-2@l uk-width-2-3@xl<?php } ?>">
			
				<div class="uk-text-large">
					<?php echo $store; ?>
				</div>

				<div class="uk-margin-small">
					<?php if ($image) { ?>
						<img src="<?php echo $image; ?>" alt="<?php echo $store; ?>" title="<?php echo $store; ?>">
					<?php } ?>
				</div>

				<div class="uk-text-meta">
					<?php echo $address; ?>
				</div>
					
				<div class="uk-margin-small">
					<?php if ($geocode) { ?>
		
						<a href="https://maps.google.com/maps?q=<?php echo urlencode($geocode); ?>&hl=<?php echo $geocode_hl; ?>&t=m&z=15" target="_blank" rel="noopener" class="btn btn-info">
							<?php echo $button_map; ?>
						</a>
		
					<?php } ?>
				</div>
		
				<div class="uk-margin-small">
					<span class="uk-text-meta"><?php echo $text_telephone; ?></span>: <?php echo $telephone; ?>
				</div>
	
				<div class="uk-margin-small">
					<?php if ($fax) { ?>
						<span class="uk-text-meta"><?php echo $text_fax; ?></span>: <?php echo $fax; ?>
					<?php } ?>
				</div>
	
				<div class="uk-margin-small">
					<?php if ($open) { ?>
						<span class="uk-text-meta"><?php echo $text_open; ?></span>: <?php echo $open; ?>
					<?php } ?>
				</div>
	
				<div class="uk-margin-small">
					<?php if ($comment) { ?>
						<span class="uk-text-meta"><?php echo $text_comment; ?></span>: <?php echo $comment; ?>
					<?php } ?>
				</div>

				<iframe width="100%" height="450" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.openstreetmap.org/export/embed.html?bbox=30.516436100006107%2C50.44645778445593%2C30.53435325622559%2C50.45274974148767&amp;layer=mapnik&amp;marker=50.44960386755845%2C30.525394678115845"></iframe>
				
			</div>

			<?php if ($locations) { ?>

				<div class="cc_contact_cr uk-width-1-1 uk-width-1-1@s uk-width-1-1@m uk-width-1-2@l uk-width-1-3@xl">

					<div class="uk-margin">
						<?php echo $text_store; ?>:
					</div>
		
					<?php foreach ($locations as $location) { ?>

						<div class="uk-text-large">
							<?php echo $location['name']; ?> (<?php echo $location['location_id']; ?>)
						</div>

						<div class="uk-margin-small">
							<?php if ($location['image']) { ?>
								<img src="<?php echo $location['image']; ?>" alt="<?php echo $location['name']; ?>" title="<?php echo $location['name']; ?>">
							<?php } ?>
						</div>

						<div class="uk-margin-small">
							<span class="uk-text-meta"><?php echo $location['name']; ?></span>: <?php echo $location['address']; ?>
						</div>

						<div class="uk-margin-small">
							<?php if ($location['geocode']) { ?>
								
								<a href="https://maps.google.com/maps?q=<?php echo urlencode($location['geocode']); ?>&hl=<?php echo $geocode_hl; ?>&t=m&z=15" target="_blank" rel="noopener" class="">
									<?php echo $button_map; ?>
								</a>

							<?php } ?>
						</div>

						<div class="uk-margin-small">
							<span class="uk-text-meta"><?php echo $text_telephone; ?></span>: <?php echo $location['telephone']; ?>
						</div>

						<div class="uk-margin-small">
							<?php if ($location['fax']) { ?>
								<span class="uk-text-meta"><?php echo $text_fax; ?></span>: <?php echo $location['fax']; ?>
							<?php } ?>
						</div>

						<div class="uk-margin-small">
							<?php if ($location['open']) { ?>
								<span class="uk-text-meta"><?php echo $text_open; ?></span>: <?php echo $location['open']; ?>
							<?php } ?>
						</div>

						<div class="uk-margin-small">
							<?php if ($location['comment']) { ?>
								<span class="uk-text-meta"><?php echo $text_comment; ?></span>: <?php echo $location['comment']; ?>
							<?php } ?>
						</div>

					<?php } ?>

				</div>

			<?php } ?>

		</div>

	</div>
</div>

<div class="uk-section uk-margin-remove-top uk-margin-medium-bottom uk-padding-remove">
	<div class="uk-container">

		<div class="uk-margin-medium-top uk-margin-medium-bottom">
			<h3 class="uk-heading-line uk-text-center">
				<span>
					<?php echo $text_contact; ?>
				</span>
			</h3>
		</div>

		<form class="uk-form-horizontal uk-margin-large" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">

			<div class="uk-margin">

				<label class="uk-form-label" for="input-enquiry">
					<?php echo $entry_enquiry; ?>
				</label>
				
				<div class="uk-form-controls">
					
					<textarea class="uk-textarea" name="enquiry" rows="5" id="input-enquiry"><?php echo $enquiry; ?></textarea>

					<?php if ($error_enquiry) { ?>
						<?php echo $error_enquiry; ?>
					<?php } ?>

				</div>

			</div>

			<div class="uk-margin">

				<label class="uk-form-label" for="input-name">
					<?php echo $entry_name; ?>
				</label>
				
				<div class="uk-form-controls">

					<input class="uk-input" type="text" name="name" value="<?php echo $name; ?>" id="input-name">
					
					<?php if ($error_name) { ?>
						<?php echo $error_name; ?>
					<?php } ?>

				</div>

			</div>

			<div class="uk-margin">

				<label class="uk-form-label" for="input-email">
					<?php echo $entry_email; ?>
				</label>
				
				<div class="uk-form-controls">

					<input class="uk-input" type="text" name="email" value="<?php echo $email; ?>" id="input-email">

					<?php if ($error_email) { ?>
						<?php echo $error_email; ?>
					<?php } ?>

				</div>

			</div>

			<input class="uk-button uk-button-primary" type="submit" value="<?php echo $button_submit; ?>">

		</form>

	</div>
</div>

<?php echo $content_bottom; ?>

<?php echo $footer; ?>
<!-- /contact.tpl -->