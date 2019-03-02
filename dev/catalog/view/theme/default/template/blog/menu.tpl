<!-- menu.tpl -->
<li class="uk-parent">

	<a href="<?php echo $blog; ?>">
		<?php echo $text_blog; ?>
	</a>

	<ul class="uk-nav-sub">

		<li class="cc_main_menu_show_all">
			<a href="<?php echo $blog; ?>">
				<?php echo $text_go_to; ?> <span class="uk-text-lowercase"><?php echo $text_blog; ?></span>
			</a>
		</li>

		<?php foreach ($categories as $category) { ?>

			<?php if ($category['children']) { ?>
				
				<li>
					<a href="<?php echo $category['href']; ?>">
						<?php echo $category['name']; ?>
					</a>
				</li>
			
				<?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
				
					<?php foreach ($children as $child) { ?>
						
						<li>
							<a href="<?php echo $child['href']; ?>">
								<?php echo $child['name']; ?>
							</a>
						</li>

					<?php } ?>

				<?php } ?>
			
			<?php } else { ?>
				
				<li>
					<a href="<?php echo $category['href']; ?>">
						<?php echo $category['name']; ?>
					</a>
				</li>

			<?php } ?>

		<?php } ?>

	</ul>

</li>

<li class="uk-nav-divider"></li>
<!-- /menu.tpl -->