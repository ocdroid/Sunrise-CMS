<?php


// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerCommonHeader extends Controller
{
    public function index()
    {

        // scripts & styles
        $this->document->addStyle('/css/admin/general/styles.css');
        $this->document->addStyle('https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/css/uikit.min.css');
        $this->document->addScript('https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js');
        $this->document->addScript('https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/js/uikit.min.js');
        $this->document->addScript('https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/js/uikit-icons.min.js');

        $data['title'] = $this->document->getTitle();

        if ($this->request->server['HTTPS']) {
            $data['base'] = HTTPS_SERVER;
        } else {
            $data['base'] = HTTP_SERVER;
        }

        $data['description'] = $this->document->getDescription();
        $data['links'] = $this->document->getLinks();
        $data['styles'] = $this->document->getStyles();
        $data['scripts'] = $this->document->getScripts();
        $data['lang'] = $this->language->get('code');
        $data['direction'] = $this->language->get('direction');

        $this->load->language('common/header');

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_order'] = $this->language->get('text_order');
        $data['text_customer'] = $this->language->get('text_customer');
        $data['text_online'] = $this->language->get('text_online');
        $data['text_approval'] = $this->language->get('text_approval');
        $data['text_product'] = $this->language->get('text_product');
        $data['text_stock'] = $this->language->get('text_stock');
        $data['text_review'] = $this->language->get('text_review');
        $data['text_store'] = $this->language->get('text_store');
        $data['text_front'] = $this->language->get('text_front');
        $data['text_logged'] = sprintf($this->language->get('text_logged'), $this->user->getUserName());
        $data['text_logout'] = $this->language->get('text_logout');
        
        $data['text_new'] = $this->language->get('text_new');
        $data['text_new_category'] = $this->language->get('text_new_category');
        $data['text_new_customer'] = $this->language->get('text_new_customer');
        $data['text_new_download'] = $this->language->get('text_new_download');
        $data['text_new_manufacturer'] = $this->language->get('text_new_manufacturer');
        $data['text_new_product'] = $this->language->get('text_new_product');
        
        $data['button_clearallcache'] = $this->language->get('button_clearallcache');
        $data['button_clearcache'] = $this->language->get('button_clearcache');
        $data['button_clearsystemcache'] = $this->language->get('button_clearsystemcache');

        if (!isset($this->request->get['token']) || !isset($this->session->data['token']) || ($this->request->get['token'] != $this->session->data['token'])) {
            $data['logged'] = '';

            $data['home'] = $this->url->link('common/dashboard', '', true);
        } else {
            $data['logged'] = true;

            $data['home'] = $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true);
            $data['logout'] = $this->url->link('common/logout', 'token=' . $this->session->data['token'], true);
            
            //CacheManager
            $data['clearallcache'] = (HTTPS_SERVER . 'index.php?route=extension/module/cachemanager/clearallcache&token=' . $this->session->data['token']);
            $data['clearcache'] = (HTTPS_SERVER . 'index.php?route=extension/module/cachemanager/clearcache&token=' . $this->session->data['token']);
            $data['clearsystemcache'] = (HTTPS_SERVER . 'index.php?route=extension/module/cachemanager/clearsystemcache&token=' . $this->session->data['token']);

            
            // fast add menu
            $data['new_category'] = $this->url->link('catalog/category/add', 'token=' . $this->session->data['token'], true);
            $data['new_customer'] = $this->url->link('user/user/add', 'token=' . $this->session->data['token'], true);
            $data['new_download'] = $this->url->link('catalog/download/add', 'token=' . $this->session->data['token'], true);
            $data['new_manufacturer'] = $this->url->link('catalog/manufacturer/add', 'token=' . $this->session->data['token'], true);
            $data['new_product'] = $this->url->link('catalog/product/add', 'token=' . $this->session->data['token'], true);

            // Customers
            $this->load->model('customer/customer');

            $customer_total = $this->model_customer_customer->getTotalCustomers(array('filter_approved' => false));

            $data['customer_total'] = $customer_total;
            $data['customer_approval'] = $this->url->link('customer/customer', 'token=' . $this->session->data['token'] . '&filter_approved=0', true);

            // Products
            $this->load->model('catalog/product');

            $product_total = $this->model_catalog_product->getTotalProducts(array('filter_quantity' => 0));

            $data['product_total'] = $product_total;

            $data['product'] = $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . '&filter_quantity=0', true);

            // Reviews
            $this->load->model('catalog/review');

            $review_total = $this->model_catalog_review->getTotalReviews(array('filter_status' => 0));

            $data['review_total'] = $review_total;

            $data['review'] = $this->url->link('catalog/review', 'token=' . $this->session->data['token'] . '&filter_status=0', true);

            $data['alerts'] = $customer_total + $product_total + $review_total;

            // Online Stores
            $data['stores'] = array();

            $data['stores'][] = array(
                'name' => $this->config->get('config_name'),
                'href' => HTTP_CATALOG
            );

            $this->load->model('setting/store');

            $results = $this->model_setting_store->getStores();

            foreach ($results as $result) {
                $data['stores'][] = array(
                    'name' => $result['name'],
                    'href' => $result['url']
                );
            }
        }
        
        return $this->load->view('common/header', $data);
    }
}
