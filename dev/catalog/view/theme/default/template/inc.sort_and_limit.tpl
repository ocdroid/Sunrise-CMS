<div class="uk-section uk-margin-remove-top uk-margin-medium-bottom uk-padding-remove uk-background-muted">
	<div class="uk-container uk-padding-small uk-text-right">
			
		<div class="uk-inline">
			
			<label for="input-sort">
				<?php echo $text_sort; ?>
			</label>

			<select class="uk-select" id="input-sort" onchange="location = this.value;">
				
				<?php foreach ($sorts as $sorts) { ?>

					<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
						
						<option value="<?php echo $sorts['href']; ?>" selected="selected">
							<?php echo $sorts['text']; ?>
						</option>

					<?php } else { ?>

						<option value="<?php echo $sorts['href']; ?>">
							<?php echo $sorts['text']; ?>
						</option>
						
					<?php } ?>

				<?php } ?>

			</select>

		</div>

		<div class="uk-inline">

			<label for="input-limit">
				<?php echo $text_limit; ?>
			</label>
			
			<select class="uk-select" id="input-limit" onchange="location = this.value;">
				
				<?php foreach ($limits as $limits) { ?>
					
					<?php if ($limits['value'] == $limit) { ?>
						
						<option value="<?php echo $limits['href']; ?>" selected="selected">
							<?php echo $limits['text']; ?>
						</option>

					<?php } else { ?>
						
						<option value="<?php echo $limits['href']; ?>">
							<?php echo $limits['text']; ?>
						</option>

					<?php } ?>

				<?php } ?>

			</select>

		</div>

	</div>
</div>