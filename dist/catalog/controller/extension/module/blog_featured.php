<?php

/* 	Sunrise CMS - Open source CMS for widespread use.
	Copyright (c) 2019 Mykola Burakov (burakov.work@gmail.com)

	See SOURCE.txt for other and additional information.

	This file is part of Sunrise CMS.

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program. If not, see <http://www.gnu.org/licenses/>. */

class ControllerExtensionModuleBlogFeatured extends Controller {
	public function index($setting) {
		$this->load->language('extension/module/blog_featured');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_views'] = $this->language->get('text_views');
		$data['button_more'] = $this->language->get('button_more');

		$this->load->model('blog/article');

		$this->load->model('tool/image');

		$data['articles'] = array();

		if (!$setting['limit']) {
			$setting['limit'] = 4;
		}

		if (!empty($setting['article'])) {
			$articles = array_slice($setting['article'], 0, (int)$setting['limit']);

			foreach ($articles as $article_id) {
				$article_info = $this->model_blog_article->getArticle($article_id);

				if ($article_info) {
					if ($article_info['image']) {
						$image = $this->model_tool_image->resize($article_info['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					}
					
					$data['configblog_review_status'] = $this->config->get('configblog_review_status');

					$data['articles'][] = array(
						'article_id'  => $article_info['article_id'],
						'thumb'       => $image,
						'name'        => $article_info['name'],
						'description' => utf8_substr(strip_tags(html_entity_decode($article_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('configblog_article_description_length')) . '..',
						'date_added'  => date($this->language->get('date_format_short'), strtotime($article_info['date_added'])),
						'viewed'      => $article_info['viewed'],
						'href'        => $this->url->link('blog/article', 'article_id=' . $article_info['article_id'])
					);
				}
			}
		}

		if ($data['articles']) {
			return $this->load->view('extension/module/blog_featured', $data);
		}
	}
}