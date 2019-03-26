<?php


// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerProductProduct extends Controller
{
    private $error = array();

    public function index()
    {
        
        // scripts & styles
        $this->document->addStyle('/css/catalog/page/product/product.css');
        $this->document->addStyle('/css/catalog/page/product/drift-basic.min.css');
        // временно, зависимость для дрифта
        $this->document->addScriptAsync('https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js');
        $this->document->addScript('/js/catalog/page/product/Drift.min.js');
        //

        // language
        $this->load->language('product/product');

        // breadcrumbs
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $this->load->model('catalog/category');

        if (isset($this->request->get['path'])) {
            $path = '';

            $parts = explode('_', (string)$this->request->get['path']);

            $category_id = (int)array_pop($parts);

            foreach ($parts as $path_id) {
                if (!$path) {
                    $path = $path_id;
                } else {
                    $path .= '_' . $path_id;
                }

                $category_info = $this->model_catalog_category->getCategory($path_id);

                if ($category_info) {
                    $data['breadcrumbs'][] = array(
                        'text' => $category_info['name'],
                        'href' => $this->url->link('product/category', 'path=' . $path)
                    );
                }
            }

            // Set the last category breadcrumb
            $category_info = $this->model_catalog_category->getCategory($category_id);

            if ($category_info) {
                $url = '';

                if (isset($this->request->get['sort'])) {
                    $url .= '&sort=' . $this->request->get['sort'];
                }

                if (isset($this->request->get['order'])) {
                    $url .= '&order=' . $this->request->get['order'];
                }

                if (isset($this->request->get['page'])) {
                    $url .= '&page=' . $this->request->get['page'];
                }

                if (isset($this->request->get['limit'])) {
                    $url .= '&limit=' . $this->request->get['limit'];
                }

                $data['breadcrumbs'][] = array(
                    'text' => $category_info['name'],
                    'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url)
                );
            }
        }

        // manufacturer
        $this->load->model('catalog/manufacturer');

        if (isset($this->request->get['manufacturer_id'])) {
            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_brand'),
                'href' => $this->url->link('product/manufacturer')
            );

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->request->get['manufacturer_id']);

            if ($manufacturer_info) {
                $data['breadcrumbs'][] = array(
                    'text' => $manufacturer_info['name'],
                    'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url)
                );
            }
        }

        // search
        if (isset($this->request->get['search']) || isset($this->request->get['tag'])) {
            $url = '';

            if (isset($this->request->get['search'])) {
                $url .= '&search=' . $this->request->get['search'];
            }

            if (isset($this->request->get['tag'])) {
                $url .= '&tag=' . $this->request->get['tag'];
            }

            if (isset($this->request->get['description'])) {
                $url .= '&description=' . $this->request->get['description'];
            }

            if (isset($this->request->get['category_id'])) {
                $url .= '&category_id=' . $this->request->get['category_id'];
            }

            if (isset($this->request->get['sub_category'])) {
                $url .= '&sub_category=' . $this->request->get['sub_category'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_search'),
                'href' => $this->url->link('product/search', $url)
            );
        }

        // product_id
        if (isset($this->request->get['product_id'])) {
            $product_id = (int)$this->request->get['product_id'];
        } else {
            $product_id = 0;
        }

        // product_info
        $this->load->model('catalog/product');

        $product_info = $this->model_catalog_product->getProduct($product_id);

        // +++ category-in-the-product-page | All linked categories
        $querycats    = $this->model_catalog_product->getCategories($product_id);
        $categories = array();
        
        foreach ($querycats as $item) {
            $categ = $this->model_catalog_category->getCategory($item['category_id']);
            if ($categ['parent_id'] > 0) {
                $catinfo['href'] = $this->url->link('product/category', 'path=' . $categ['parent_id'] . '_' . $item['category_id']);
            } else {
                $catinfo['href'] = $this->url->link('product/category', 'path=' . $item['category_id']);
            }
            $catinfo['name'] = $categ['name'];
            $categories[] = $catinfo;
        }
        // +++

        if ($product_info) {
            $url = '';

            if (isset($this->request->get['path'])) {
                $url .= '&path=' . $this->request->get['path'];
            }

            if (isset($this->request->get['filter'])) {
                $url .= '&filter=' . $this->request->get['filter'];
            }

            if (isset($this->request->get['manufacturer_id'])) {
                $url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
            }

            if (isset($this->request->get['search'])) {
                $url .= '&search=' . $this->request->get['search'];
            }

            if (isset($this->request->get['tag'])) {
                $url .= '&tag=' . $this->request->get['tag'];
            }

            if (isset($this->request->get['description'])) {
                $url .= '&description=' . $this->request->get['description'];
            }

            if (isset($this->request->get['category_id'])) {
                $url .= '&category_id=' . $this->request->get['category_id'];
            }

            if (isset($this->request->get['sub_category'])) {
                $url .= '&sub_category=' . $this->request->get['sub_category'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $data['breadcrumbs'][] = array(
                'text' => $product_info['name'],
                'href' => $this->url->link('product/product', $url . '&product_id=' . $this->request->get['product_id'])
            );

            if ($product_info['meta_title']) {
                $this->document->setTitle($product_info['meta_title']);
            } else {
                $this->document->setTitle($product_info['name']);
            }
            
            if ($product_info['noindex'] <= 0) {
                $this->document->setRobots('noindex,follow');
            }
            
            if ($product_info['meta_h1']) {
                $data['heading_title'] = $product_info['meta_h1'];
            } else {
                $data['heading_title'] = $product_info['name'];
            }
            
            $this->document->setDescription($product_info['meta_description']);
            $this->document->addLink($this->url->link('product/product', 'product_id=' . $this->request->get['product_id']), 'canonical');

            $data['text_select'] = $this->language->get('text_select');
            $data['text_manufacturer'] = $this->language->get('text_manufacturer');
            $data['text_model'] = $this->language->get('text_model');
            $data['text_reward'] = $this->language->get('text_reward');
            $data['text_points'] = $this->language->get('text_points');
            $data['text_stock'] = $this->language->get('text_stock');
            $data['text_discount'] = $this->language->get('text_discount');
            $data['text_tax'] = $this->language->get('text_tax');
            $data['text_option'] = $this->language->get('text_option');
            $data['text_minimum'] = sprintf($this->language->get('text_minimum'), $product_info['minimum']);
            $data['text_write'] = $this->language->get('text_write');
            $data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', true), $this->url->link('account/register', '', true));
            $data['text_note'] = $this->language->get('text_note');
            $data['text_tags'] = $this->language->get('text_tags');
            $data['text_related'] = $this->language->get('text_related');
            $data['text_loading'] = $this->language->get('text_loading');
            $data['text_benefits'] = $this->language->get('text_benefits');
            $data['text_help_options'] = $this->language->get('text_help_options');
            $data['text_all_linked_categories'] = $this->language->get('text_all_linked_categories');
            $data['text_you_save'] = $this->language->get('text_you_save');
            $data['text_description'] = $this->language->get('text_description');
            $data['text_go_back'] = $this->language->get('text_go_back');

            $data['entry_qty'] = $this->language->get('entry_qty');
            $data['entry_name'] = $this->language->get('entry_name');
            $data['entry_review'] = $this->language->get('entry_review');
            $data['entry_good'] = $this->language->get('entry_good');
            $data['entry_bad'] = $this->language->get('entry_bad');

            $data['button_buy_it'] = $this->language->get('button_buy_it');
            $data['button_upload'] = $this->language->get('button_upload');
            $data['button_continue'] = $this->language->get('button_continue');

            $this->load->model('catalog/review');

            $data['tab_gen_information'] = $this->language->get('tab_gen_information');
            $data['tab_attribute'] = $this->language->get('tab_attribute');
            $data['tab_review'] = sprintf($this->language->get('tab_review'), $product_info['reviews']);

            $data['product_id'] = (int)$this->request->get['product_id'];
            $data['manufacturer'] = $product_info['manufacturer'];

            // +++ category-in-the-product-page | All linked categories
            $data['categories'] = $categories;
            // +++

            $data['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
            $data['model'] = $product_info['model'];
            $data['reward'] = $product_info['reward'];
            $data['points'] = $product_info['points'];
            $data['description'] = html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');
            $data['sticker'] = $this->getStickers($product_info['product_id']);

            if ($product_info['quantity'] <= 0) {
                $data['stock'] = $product_info['stock_status'];
            } elseif ($this->config->get('config_stock_display')) {
                $data['stock'] = $product_info['quantity'];
            } else {
                $data['stock'] = $this->language->get('text_instock');
            }

            // image
            $this->load->model('tool/image');

            if ($product_info['image']) {
                $data['popup'] = $this->model_tool_image->resize(
                    $product_info['image'],
                    $this->config->get($this->config->get('config_theme') . '_image_popup_width'),
                    $this->config->get($this->config->get('config_theme') . '_image_popup_height')
                );
            } else {
                $data['popup'] = '';
            }

            if ($product_info['image']) {
                $data['thumb'] = $this->model_tool_image->resize(
                    $product_info['image'],
                    $this->config->get($this->config->get('config_theme') . '_image_thumb_width'),
                    $this->config->get($this->config->get('config_theme') . '_image_thumb_height')
                );
            } else {
                $data['thumb'] = '';
            }

            $data['images'] = array();

            static $image_id = 0;

            $results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);

            foreach ($results as $result) {
                $data['images'][] = array(
                    'popup' => $this->model_tool_image->resize(
                        $result['image'],
                        $this->config->get(
                            $this->config->get('config_theme') . '_image_popup_width'
                        ),
                        $this->config->get($this->config->get('config_theme') . '_image_popup_height')
                    ),
                    'thumb' => $this->model_tool_image->resize(
                        $result['image'],
                        $this->config->get(
                            $this->config->get('config_theme') . '_image_additional_width'
                        ),
                        $this->config->get($this->config->get('config_theme') . '_image_additional_height')
                    ),
                    'image_id' => $image_id++
                );
            }

            if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                $data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
            } else {
                $data['price'] = false;
            }

            if ((float)$product_info['special']) {
                $data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
            } else {
                $data['special'] = false;
            }

            if ((float)$product_info['special']) {
                $data['yousave_money'] = $this->currency->format(($product_info['price'] - $product_info['special']), $this->session->data['currency']);
            } else {
                $data['yousave_money'] = false;
            }

            if ((float)$product_info['special']) {
                $data['yousave_percent'] = round(((($product_info['price'] - $product_info['special']) / $product_info['price']) * 100), 0);
            } else {
                $data['yousave_percent'] = false;
            }

            if ($this->config->get('config_tax')) {
                $data['tax'] = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
            } else {
                $data['tax'] = false;
            }

            $discounts = $this->model_catalog_product->getProductDiscounts($this->request->get['product_id']);

            $data['discounts'] = array();

            foreach ($discounts as $discount) {
                $data['discounts'][] = array(
                    'quantity' => $discount['quantity'],
                    'price'    => $this->currency->format($this->tax->calculate($discount['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency'])
                );
            }
            
            // benefits
            $productbenefits = $this->model_catalog_product->getProductBenefitsbyProductId($product_info['product_id']);
            
            $data['benefits'] = array();
                
            foreach ($productbenefits as $benefit) {
                if ($benefit['image'] && file_exists(DIR_IMAGE . $benefit['image'])) {
                    $bimage = $benefit['image'];
                    if ($benefit['type']) {
                        $bimage = $this->model_tool_image->resize($bimage, 25, 25);
                    } else {
                        $bimage = $this->model_tool_image->resize($bimage, 350, 140);
                    }
                } else {
                    $bimage = 'no_image.jpg';
                }
                $data['benefits'][] = array(
                    'benefit_id'      	=> $benefit['benefit_id'],
                    'name'      		=> $benefit['name'],
                    'description'      	=> strip_tags(html_entity_decode($benefit['description'])),
                    'thumb'      		=> $bimage,
                    'link'      		=> $benefit['link'],
                    'type'      		=> $benefit['type']
                    //'sort_order' => $benefit['sort_order']
                );
            }

            // options
            $data['options'] = array();

            foreach ($this->model_catalog_product->getProductOptions($this->request->get['product_id']) as $option) {
                $product_option_value_data = array();

                foreach ($option['product_option_value'] as $option_value) {
                    if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
                        if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
                            $price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
                        } else {
                            $price = false;
                        }

                        $product_option_value_data[] = array(
                            'product_option_value_id' => $option_value['product_option_value_id'],
                            'option_value_id'         => $option_value['option_value_id'],
                            'name'                    => $option_value['name'],
                            'image'                   => $this->model_tool_image->resize($option_value['image'], 50, 50),
                            'price'                   => $price,
                            'price_prefix'            => $option_value['price_prefix']
                        );
                    }
                }

                $data['options'][] = array(
                    'product_option_id'    => $option['product_option_id'],
                    'product_option_value' => $product_option_value_data,
                    'option_id'            => $option['option_id'],
                    'name'                 => $option['name'],
                    'type'                 => $option['type'],
                    'value'                => $option['value'],
                    'required'             => $option['required']
                );
            }

            // minimum
            if ($product_info['minimum']) {
                $data['minimum'] = $product_info['minimum'];
            } else {
                $data['minimum'] = 1;
            }

            // reviews
            $data['review_status'] = $this->config->get('config_review_status');

            if ($this->config->get('config_review_guest') || $this->customer->isLogged()) {
                $data['review_guest'] = true;
            } else {
                $data['review_guest'] = false;
            }

            if ($this->customer->isLogged()) {
                $data['customer_name'] = $this->customer->getFirstName() . '&nbsp;' . $this->customer->getLastName();
            } else {
                $data['customer_name'] = '';
            }

            $data['reviews'] = sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']);

            $data['attribute_groups'] = $this->model_catalog_product->getProductAttributes($this->request->get['product_id']);

            $data['products'] = array();

            $results = $this->model_catalog_product->getProductRelated($this->request->get['product_id']);

            foreach ($results as $result) {
                if ($result['image']) {
                    $image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
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

                // benefits
                $productbenefits = $this->model_catalog_product->getProductBenefitsbyProductId($result['product_id']);
                
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
                
                // stickers
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
                    'benefits'    => $benefits,
                    'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
                    'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
                );
            }

            // tags
            $data['tags'] = array();

            if ($product_info['tag']) {
                $tags = explode(',', $product_info['tag']);

                foreach ($tags as $tag) {
                    $data['tags'][] = array(
                        'tag'  => trim($tag),
                        'href' => $this->url->link('product/search', 'tag=' . trim($tag))
                    );
                }
            }

            // update viewed
            $this->model_catalog_product->updateViewed($this->request->get['product_id']);

            // layout
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');
            
            // tabs
            $data['product_tabs']=array();
            
            $tabresults = $this->model_catalog_product->getproducttab($this->request->get['product_id']);
            
            foreach ($tabresults as $result) {
                $data['product_tabs'][]=array(
                    'product_tab_id' => $result['product_tab_id'],
                    'title'   => $result['heading'],
                    'description' => html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'),
                );
            }

            // Custom template module
            // $this->response->setOutput($this->load->view('product/product', $data));
            $template = 'product/product';

            $this->load->model('setting/setting');

            $custom_template_module = $this->model_setting_setting->getSetting('custom_template_module');

            $customer_group_id = $this->customer->getGroupId();

            if ($this->config->get('config_theme') == 'theme_default') {
                $directory = $this->config->get('theme_default_directory');
            } else {
                $directory = $this->config->get('config_theme');
            }

            if (!empty($custom_template_module['custom_template_module'])) {
                if (isset($this->request->get['path'])) {
                    foreach ($custom_template_module['custom_template_module'] as $key => $module) {
                        if (($module['type'] == 4) && !empty($module['product_categories'])) {
                            if ((isset($module['customer_groups']) && in_array($customer_group_id, $module['customer_groups'])) || !isset($module['customer_groups']) || empty($module['customer_groups'])) {
                                $category_id = explode('_', $this->request->get['path']);
                                $category_id = (int)end($category_id);
                                if (in_array($category_id, $module['product_categories'])) {
                                    if (file_exists(DIR_TEMPLATE . $directory . DIRECTORY_SEPARATOR . 'template' . DIRECTORY_SEPARATOR . $module['template_name'] . '.html')) {
                                        $template = $module['template_name'];
                                    }
                                }
                            } // customer groups
                        }
                    }
                }

                foreach ($custom_template_module['custom_template_module'] as $key => $module) {
                    if (($module['type'] == 5) && !empty($module['product_manufacturers'])) {
                        if ((isset($module['customer_groups']) && in_array($customer_group_id, $module['customer_groups'])) || !isset($module['customer_groups']) || empty($module['customer_groups'])) {
                            $manufacturer_id = $product_info['manufacturer_id'];
                            if (in_array($manufacturer_id, $module['product_manufacturers'])) {
                                if (file_exists(DIR_TEMPLATE . $directory . DIRECTORY_SEPARATOR . 'template' . DIRECTORY_SEPARATOR . $module['template_name'] . '.html')) {
                                    $template = $module['template_name'];
                                }
                            }
                        } // customer groups
                    }
                }

                foreach ($custom_template_module['custom_template_module'] as $key => $module) {
                    if (($module['type'] == 1) && !empty($module['products'])) {
                        if ((isset($module['customer_groups']) && in_array($customer_group_id, $module['customer_groups'])) || !isset($module['customer_groups']) || empty($module['customer_groups'])) {
                            $products = explode(',', $module['products']);
                            if (in_array($product_id, $products)) {
                                if (file_exists(DIR_TEMPLATE . $directory . DIRECTORY_SEPARATOR . 'template' . DIRECTORY_SEPARATOR . $module['template_name'] . '.html')) {
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
            $url = '';

            if (isset($this->request->get['path'])) {
                $url .= '&path=' . $this->request->get['path'];
            }

            if (isset($this->request->get['filter'])) {
                $url .= '&filter=' . $this->request->get['filter'];
            }

            if (isset($this->request->get['manufacturer_id'])) {
                $url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
            }

            if (isset($this->request->get['search'])) {
                $url .= '&search=' . $this->request->get['search'];
            }

            if (isset($this->request->get['tag'])) {
                $url .= '&tag=' . $this->request->get['tag'];
            }

            if (isset($this->request->get['description'])) {
                $url .= '&description=' . $this->request->get['description'];
            }

            if (isset($this->request->get['category_id'])) {
                $url .= '&category_id=' . $this->request->get['category_id'];
            }

            if (isset($this->request->get['sub_category'])) {
                $url .= '&sub_category=' . $this->request->get['sub_category'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_error'),
                'href' => $this->url->link('product/product', $url . '&product_id=' . $product_id)
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

    public function review()
    {
        $this->load->language('product/product');

        $this->load->model('catalog/review');

        $data['text_no_reviews'] = $this->language->get('text_no_reviews');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $data['reviews'] = array();

        $review_total = $this->model_catalog_review->getTotalReviewsByProductId($this->request->get['product_id']);

        $results = $this->model_catalog_review->getReviewsByProductId($this->request->get['product_id'], ($page - 1) * 5, 5);

        foreach ($results as $result) {
            $data['reviews'][] = array(
                'author'     => $result['author'],
                'text'       => nl2br($result['text']),
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
            );
        }

        $pagination = new Pagination();
        $pagination->total = $review_total;
        $pagination->page = $page;
        $pagination->limit = 5;
        $pagination->url = $this->url->link('product/product/review', 'product_id=' . $this->request->get['product_id'] . '&page={page}');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * 5) + 1 : 0, ((($page - 1) * 5) > ($review_total - 5)) ? $review_total : ((($page - 1) * 5) + 5), $review_total, ceil($review_total / 5));

        $this->response->setOutput($this->load->view('product/review', $data));
    }

    public function write()
    {
        $this->load->language('product/product');

        $json = array();

        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
                $json['error'] = $this->language->get('error_name');
            }

            if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 1000)) {
                $json['error'] = $this->language->get('error_text');
            }

            if (!isset($json['error'])) {
                $this->load->model('catalog/review');

                $this->model_catalog_review->addReview($this->request->get['product_id'], $this->request->post);

                $json['success'] = $this->language->get('text_success');
            }
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
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
