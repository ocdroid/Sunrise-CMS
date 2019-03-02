<?php


// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerCommonFooter extends Controller
{
    public function index()
    {
        $this->load->language('common/footer');

        $data['scripts'] = $this->document->getScripts('footer');

        $data['text_information'] = $this->language->get('text_information');
        $data['text_service'] = $this->language->get('text_service');
        $data['text_extra'] = $this->language->get('text_extra');
        $data['text_contact'] = $this->language->get('text_contact');
        $data['text_manufacturer'] = $this->language->get('text_manufacturer');
        $data['text_special'] = $this->language->get('text_special');
        $data['text_bestseller'] = $this->language->get('text_bestseller');
        $data['text_mostviewed'] = $this->language->get('text_mostviewed');
        $data['text_latest'] = $this->language->get('text_latest');
        $data['text_account'] = $this->language->get('text_account');
        $data['text_order'] = $this->language->get('text_order');
        $data['text_newsletter'] = $this->language->get('text_newsletter');

        $this->load->model('catalog/information');

        $data['informations'] = array();

        foreach ($this->model_catalog_information->getInformations() as $result) {
            if ($result['bottom']) {
                $data['informations'][] = array(
                    'title' => $result['title'],
                    'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
                );
            }
        }

        $data['contact'] = $this->url->link('information/contact');
        $data['manufacturer'] = $this->url->link('product/manufacturer');
        $data['special'] = $this->url->link('product/special');
        $data['bestseller'] = $this->url->link('product/bestseller');
        $data['mostviewed'] = $this->url->link('product/mostviewed');
        $data['latest'] = $this->url->link('product/latest');
        $data['account'] = $this->url->link('account/account', '', true);
        $data['order'] = $this->url->link('account/order', '', true);
        $data['newsletter'] = $this->url->link('account/newsletter', '', true);

        $data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

        return $this->load->view('common/footer', $data);
    }
}
