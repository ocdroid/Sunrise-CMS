<?php


// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt


class ControllerExtensionFeedSitemapPro extends Controller
{
    private $error = array();
    
    public function index()
    {
        $this->load->language('extension/feed/sitemap_pro');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('sitemap_pro', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=feed', true));
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');

        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_data_feed'] = $this->language->get('entry_data_feed');
        $data['entry_data_yandex_feed'] = $this->language->get('entry_data_yandex_feed');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        $data['tab_general'] = $this->language->get('tab_general');
        

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_extension'),
            'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=feed', true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/feed/sitemap_pro', 'token=' . $this->session->data['token'], true)
        );

        $data['action'] = $this->url->link('extension/feed/sitemap_pro', 'token=' . $this->session->data['token'], true);

        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=feed', true);

        if (isset($this->request->post['sitemap_pro_status'])) {
            $data['sitemap_pro_status'] = $this->request->post['sitemap_pro_status'];
        } else {
            $data['sitemap_pro_status'] = $this->config->get('sitemap_pro_status');
        }
        
        $data['data_feed'] = HTTP_CATALOG . 'index.php?route=extension/feed/sitemap_pro';
        
        $data['yandex_feed'] = HTTP_CATALOG . 'index.php?route=extension/feed/yandex_feed';

        $data['header'] = $this->load->controller('common/header');
        $data['column'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/feed/sitemap_pro', $data));
    }
    
    protected function validate()
    {
        if (!$this->user->hasPermission('modify', 'extension/feed/sitemap_pro')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }
}