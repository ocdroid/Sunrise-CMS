<?php


// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerExtensionModuleFeaturedArticle extends Controller {
	public function index($setting) {
		
		static $module_id = 0;

		if (isset($this->request->get['product_id']) || isset($this->request->get['manufacturer_id']) || isset($this->request->get['path'])) {
			$this->load->language('extension/module/featured_article');

			$data['heading_title'] = $this->language->get('heading_title');

			$data['text_views'] = $this->language->get('text_views');
			$data['button_more'] = $this->language->get('button_more');

			$this->load->model('blog/article');

			$this->load->model('tool/image');

			$data['articles'] = array();
			
			$results = array();
			
			if (isset($this->request->get['product_id'])) {
				
					$filter_data = array(
						'product_id'  => $this->request->get['product_id'],
						'limit' => $setting['limit']
					);
					
				$results = $this->model_blog_article->getArticleRelatedByProduct($filter_data);
					
			} elseif (isset($this->request->get['manufacturer_id'])) {
					
					$filter_data = array(
						'manufacturer_id'  => $this->request->get['manufacturer_id'],
						'limit' => $setting['limit']
					);
					
					$results = $this->model_blog_article->getArticleRelatedByManufacturer($filter_data);
				
			} else {
				
					$parts = explode('_', (string)$this->request->get['path']);
					
					if(!empty($parts) && is_array($parts)) {
					
						$filter_data = array(
							'category_id'  => array_pop($parts),
							'limit' => $setting['limit']
						);
						
					$results = $this->model_blog_article->getArticleRelatedByCategory($filter_data);
								
					}
			}

	
			if ($results) {
				foreach ($results as $result) {
					if ($result['image']) {
						$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					}
					
					$data['configblog_review_status'] = $this->config->get('configblog_review_status');

					$data['articles'][] = array(
						'article_id'  => $result['article_id'],
						'thumb'       => $image,
						'name'        => $result['name'],
						'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('configblog_article_description_length')) . '..',
						'date_added'  => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
						'viewed'      => $result['viewed'],
						'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
						'href'        => $this->url->link('blog/article', 'article_id=' . $result['article_id']),
					);
				}
				
				$data['module_id'] = $module_id++;

				return $this->load->view('extension/module/featured_article', $data);
			}
		
		}
		
	}
	
}