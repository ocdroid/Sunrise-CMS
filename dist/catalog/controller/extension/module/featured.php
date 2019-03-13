<?php


// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerExtensionModuleFeatured extends Controller
{
    public function index($setting)
    {
        static $module_id = 0;

        $this->load->language('extension/module/featured');

        $data['heading_title'] = $this->language->get('heading_title');

        $data['button_buy_it'] = $this->language->get('button_buy_it');
        $data['text_benefits'] = $this->language->get('text_benefits');

        $this->load->model('catalog/product');

        $this->load->model('tool/image');

        $data['products'] = array();

        if (!$setting['limit']) {
            $setting['limit'] = 4;
        }

        if (!empty($setting['product'])) {
            $products = array_slice($setting['product'], 0, (int)$setting['limit']);

            foreach ($products as $product_id) {
                $product_info = $this->model_catalog_product->getProduct($product_id);

                if ($product_info) {
                    if ($product_info['image']) {
                        $image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
                    } else {
                        $image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
                    }

                    if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                        $price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                    } else {
                        $price = false;
                    }

                    if ((float)$product_info['special']) {
                        $special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                    } else {
                        $special = false;
                    }

                    if ((float)$product_info['special']) {
                        $yousave_percent = round(((($product_info['price'] - $product_info['special']) / $product_info['price']) * 100), 0);
                    } else {
                        $yousave_percent = false;
                    }

                    $productbenefits = $this->model_catalog_product->getProductBenefitsbyProductId($product_info['product_id']);
                
                    $benefits = array();
                    
                    foreach ($productbenefits as $benefit) {
                        if ($benefit['image'] && file_exists(DIR_IMAGE . $benefit['image'])) {
                            $bimage = $benefit['image'];
                            if ($benefit['type']) {
                                $bimage = $this->model_tool_image->resize($bimage, 25, 25);
                            } else {
                                $bimage = $this->model_tool_image->resize($bimage, 120, 60);
                            }
                        } else {
                            $bimage = 'no_image.jpg';
                        }
                        $benefits[] = array(
                            'benefit_id'      	=> $benefit['benefit_id'],
                            'name'      		=> $benefit['name'],
                            'description'      	=> strip_tags(html_entity_decode($benefit['description'])),
                            'thumb'      		=> $bimage,
                            'link'      		=> $benefit['link'],
                            'type'      		=> $benefit['type']
                        );
                    }

                    $stickers = $this->getStickers($product_info['product_id']);

                    $data['products'][] = array(
                        'product_id'  => $product_info['product_id'],
                        'thumb'       => $image,
                        'name'        => $product_info['name'],
                        'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
                        'price'       => $price,
                        'special'     => $special,
                        'yousave_percent' => $yousave_percent,
                        'sticker'     => $stickers,
                        'benefits'    => $benefits,
                        'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
                    );
                }
            }
        }

        if ($data['products']) {
            $data['module_id'] = $module_id++;

            return $this->load->view('extension/module/featured', $data);
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
                'image'    => $prot_server . 'image/' . $sticker['image']
            );
        }
                
        return $this->load->view('product/stickers', $data);
    }
}
