<?php


// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerInformationInformation extends Controller {
	public function index() {

		$this->document->addStyle('/css/catalog/page/information/information.css');

		$this->load->language('information/information');

		$this->load->model('catalog/information');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		if (isset($this->request->get['information_id'])) {
			$information_id = (int)$this->request->get['information_id'];
		} else {
			$information_id = 0;
		}

		$information_info = $this->model_catalog_information->getInformation($information_id);

		if ($information_info) {
			if ($information_info['meta_title']) {
				$this->document->setTitle($information_info['meta_title']);
			} else {
				$this->document->setTitle($information_info['title']);
			}
			
			if ($information_info['noindex'] <= 0) {
				$this->document->setRobots('noindex,follow');
			}
			
			if ($information_info['meta_h1']) {
				$data['heading_title'] = $information_info['meta_h1'];
			} else {
				$data['heading_title'] = $information_info['title'];
			}
			$this->document->setDescription($information_info['meta_description']);

			$data['breadcrumbs'][] = array(
				'text' => $information_info['title'],
				'href' => $this->url->link('information/information', 'information_id=' .  $information_id)
			);

			$data['button_continue'] = $this->language->get('button_continue');
			$data['text_go_back'] = $this->language->get('text_go_back');

			$data['description'] = html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8');

			$data['continue'] = $this->url->link('common/home');

			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			// Custom template module
			// $this->response->setOutput($this->load->view('information/information', $data));

            $template = 'information/information';
            
            $this->load->model('setting/setting');

            $customer_group_id = $this->customer->getGroupId();

            if ($this->config->get('config_theme') == 'theme_default') {
                $directory = $this->config->get('theme_default_directory');
            } else {
                $directory = $this->config->get('config_theme');
            }

            $custom_template_module = $this->model_setting_setting->getSetting('custom_template_module');
            if(!empty($custom_template_module['custom_template_module'])){
                foreach ($custom_template_module['custom_template_module'] as $key => $module) {
                    if (($module['type'] == 2) && !empty($module['informations'])) {
                        if ((isset($module['customer_groups']) && in_array($customer_group_id, $module['customer_groups'])) || !isset($module['customer_groups']) || empty($module['customer_groups'])){

                            if (in_array($information_id, $module['informations'])) {
                                if (file_exists(DIR_TEMPLATE . $directory . DIRECTORY_SEPARATOR . 'template' . DIRECTORY_SEPARATOR . $module['template_name'] . '.tpl')) {
                                    $template = $module['template_name'];
                                }
                            }

                        } // customer groups

                    }
                }
            }

            $template = str_replace('\\', '/', $template);

            $this->response->setOutput($this->load->view($template, $data));
            // Custom template module

		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('information/information', 'information_id=' . $information_id)
			);

			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');
			$data['text_go_back'] = $this->language->get('text_go_back');
			$data['text_get_back'] = $this->language->get('text_get_back');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}

	public function agree() {
		$this->load->model('catalog/information');

		if (isset($this->request->get['information_id'])) {
			$information_id = (int)$this->request->get['information_id'];
		} else {
			$information_id = 0;
		}

		$output = '';

		$information_info = $this->model_catalog_information->getInformation($information_id);

		if ($information_info) {
			$output .= html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8') . "\n";
		}

		$this->response->setOutput($output);
	}
}