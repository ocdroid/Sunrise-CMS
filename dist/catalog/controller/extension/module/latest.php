<?php


// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerExtensionModuleLatest extends Controller
{
    public function index($setting)
    {
        static $module_id = 0;

        $this->load->language('extension/module/latest');

        $data['heading_title'] = $this->language->get('heading_title');

        $data['button_buy_it'] = $this->language->get('button_buy_it');

        $this->load->model('catalog/product');

        $this->load->model('tool/image');

        $data['products'] = array();

        $filter_data = array(
            'sort'  => 'p.date_added',
            'order' => 'DESC',
            'start' => 0,
            'limit' => $setting['limit']
        );

        $results = $this->model_catalog_product->getProducts($filter_data);

        if ($results) {
            foreach ($results as $result) {
                if ($result['image']) {
                    $image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
                }

                if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                    $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                } else {
                    $price = false;
                }

                if ((float)$result['special']) {
                    $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                } else {
                    $special = false;
                }

                if ((float)$result['special']) {
                    $yousave_percent = round(((($result['price'] - $result['special']) / $result['price']) * 100), 0);
                } else {
                    $yousave_percent = false;
                }

                $stickers = $this->getStickers($result['product_id']) ;

                $data['products'][] = array(
                    'product_id'  => $result['product_id'],
                    'thumb'       => $image,
                    'name'        => $result['name'],
                    'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
                    'price'       => $price,
                    'special'     => $special,
                    'yousave_percent' => $yousave_percent,
                    'sticker'     => $stickers,
                    'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
                );
            }

            $data['module_id'] = $module_id++;

            return $this->load->view('extension/module/latest', $data);
        }
    }
    
    private function getStickers($product_id)
    {
        $stickers = $this->model_catalog_product->getProductStickerbyProductId($product_id) ;
        
        if (!$stickers) {
            return;
        }
        
        $data['stickers'] = array();
        
        if ($this->request->server['HTTPS']) {
            $prot_server = HTTPS_SERVER;
        } else {
            $prot_server = HTTP_SERVER;
        }
        
        foreach ($stickers as $sticker) {
            $data['stickers'][] = array(
                'position' => $sticker['position'],
                'image' => $prot_server . 'images/' . $sticker['image']
            );
        }
                
        return $this->load->view('product/stickers', $data);
    }
}
