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

class ControllerBlogArticle extends Controller
{
    private $error = array();
    
    public function index()
    {
        $this->load->language('blog/article');
    
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home'),
            'separator' => false
        );
        
        $configblog_name = $this->config->get('configblog_name');
        
        if (!empty($configblog_name)) {
            $name = $this->config->get('configblog_name');
        } else {
            $name = $this->language->get('text_blog');
        }
        
        $data['breadcrumbs'][] = array(
            'text' => $name,
            'href' => $this->url->link('blog/latest')
        );
        
        $this->load->model('blog/category');
        
        
        if (isset($this->request->get['blog_category_id'])) {
            $blog_category_id = '';
                
            foreach (explode('_', $this->request->get['blog_category_id']) as $path_id) {
                if (!$blog_category_id) {
                    $blog_category_id = $path_id;
                } else {
                    $blog_category_id .= '_' . $path_id;
                }
                
                $category_info = $this->model_blog_category->getCategory($path_id);
                
                if ($category_info) {
                    $data['breadcrumbs'][] = array(
                        'text'      => $category_info['name'],
                        'href'      => $this->url->link('blog/category', 'blog_category_id=' . $blog_category_id)
                    );
                }
            }
        }
        
    

    

        if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_tag'])) {
            $url = '';
            
            if (isset($this->request->get['filter_name'])) {
                $url .= '&filter_name=' . $this->request->get['filter_name'];
            }
                        
            if (isset($this->request->get['filter_tag'])) {
                $url .= '&filter_tag=' . $this->request->get['filter_tag'];
            }
                        
            if (isset($this->request->get['filter_description'])) {
                $url .= '&filter_description=' . $this->request->get['filter_description'];
            }
            
            if (isset($this->request->get['filter_news_id'])) {
                $url .= '&filter_news_id=' . $this->request->get['filter_news_id'];
            }
        }
        
        if (isset($this->request->get['article_id'])) {
            $article_id = (int)$this->request->get['article_id'];
        } else {
            $article_id = 0;
        }
        
        $this->load->model('blog/article');
        
        $article_info = $this->model_blog_article->getArticle($article_id);
        
        if ($article_info) {
            $url = '';
            
            if (isset($this->request->get['blog_category_id'])) {
                $url .= '&blog_category_id=' . $this->request->get['blog_category_id'];
            }

            if (isset($this->request->get['filter_name'])) {
                $url .= '&filter_name=' . $this->request->get['filter_name'];
            }
                        
            if (isset($this->request->get['filter_tag'])) {
                $url .= '&filter_tag=' . $this->request->get['filter_tag'];
            }
            
            if (isset($this->request->get['filter_description'])) {
                $url .= '&filter_description=' . $this->request->get['filter_description'];
            }
                        
            if (isset($this->request->get['filter_news_id'])) {
                $url .= '&filter_news_id=' . $this->request->get['filter_news_id'];
            }
            
            $data['breadcrumbs'][] = array(
                'text' => $article_info['name'],
                'href' => $this->url->link('blog/article', 'article_id=' . $this->request->get['article_id'])
            );
            
            if ($article_info['meta_title']) {
                $this->document->setTitle($article_info['meta_title']);
            } else {
                $this->document->setTitle($article_info['name']);
            }
            
            if ($article_info['noindex'] <= 0) {
                $this->document->setRobots('noindex,follow');
            }

            $this->document->setDescription($article_info['meta_description']);
            $this->document->addLink($this->url->link('blog/article', 'article_id=' . $this->request->get['article_id']), 'canonical');

            if ($article_info['meta_h1']) {
                $data['heading_title'] = $article_info['meta_h1'];
            } else {
                $data['heading_title'] = $article_info['name'];
            }

            $data['text_select'] = $this->language->get('text_select');
            $data['text_write'] = $this->language->get('text_write');
            $data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', true), $this->url->link('account/register', '', true));
            $data['text_loading'] = $this->language->get('text_loading');
            $data['text_note'] = $this->language->get('text_note');
            $data['text_share'] = $this->language->get('text_share');
            $data['text_wait'] = $this->language->get('text_wait');
            $data['button_buy_it'] = $this->language->get('button_buy_it');
            $data['entry_name'] = $this->language->get('entry_name');
            $data['entry_review'] = $this->language->get('entry_review');
            $data['entry_good'] = $this->language->get('entry_good');
            $data['entry_bad'] = $this->language->get('entry_bad');

            $data['text_go_back'] = $this->language->get('text_go_back');
            
            $data['button_continue'] = $this->language->get('button_continue');
            
            $this->load->model('blog/review');

            $data['text_related'] = $this->language->get('text_related');
            $data['text_related_product'] = $this->language->get('text_related_product');
            
            $data['article_id'] = $this->request->get['article_id'];
            
            $data['review_status'] = $this->config->get('configblog_review_status');
            
            if ($this->config->get('configblog_review_guest') || $this->customer->isLogged()) {
                $data['review_guest'] = true;
            } else {
                $data['review_guest'] = false;
            }

            if ($this->customer->isLogged()) {
                $data['customer_name'] = $this->customer->getFirstName() . '&nbsp;' . $this->customer->getLastName();
            } else {
                $data['customer_name'] = '';
            }
            
            $data['article_review'] = (int)$article_info['article_review'];
            $data['reviews'] = sprintf($this->language->get('text_reviews'), (int)$article_info['reviews']);
            $data['gstatus'] = (int)$article_info['gstatus'];
            $data['description'] = html_entity_decode($article_info['description'], ENT_QUOTES, 'UTF-8');
            
            $data['articles'] = array();
            
            $data['button_more'] = $this->language->get('button_more');
            $data['text_views'] = $this->language->get('text_views');
            
            $this->load->model('tool/image');
            
            $results = $this->model_blog_article->getArticleRelated($this->request->get['article_id']);
            
            foreach ($results as $result) {
                if ($result['image']) {
                    $image = $this->model_tool_image->resize($result['image'], $this->config->get('configblog_image_related_width'), $this->config->get('configblog_image_related_height'));
                } else {
                    $image = false;
                }
                
                $data['articles'][] = array(
                    'article_id' => $result['article_id'],
                    'thumb'   	 => $image,
                    'name'    	 => $result['name'],
                    'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('configblog_article_description_length')) . '..',
                    'date_added'  => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                    'viewed'      => $result['viewed'],
                    'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
                    'href'    	 => $this->url->link('blog/article', 'article_id=' . $result['article_id']),
                );
            }

            $this->load->model('tool/image');
            $data['products'] = array();
            
            $results = $this->model_blog_article->getArticleRelatedProduct($this->request->get['article_id']);
            
            foreach ($results as $result) {
                if ($result['image']) {
                    $image = $this->model_tool_image->resize($result['image'], $this->config->get('configblog_image_related_width'), $this->config->get('configblog_image_related_height'));
                } else {
                    $image = false;
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
                    'product_id' => $result['product_id'],
                    'thumb'   	 => $image,
                    'name'    	 => $result['name'],
                    'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('configblog_article_description_length')) . '..',
                    'price'   	 => $price,
                    'special' 	 => $special,
                    'yousave_percent' => $yousave_percent,
                    'sticker'     => $stickers,
                    'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
                    'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
                    'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
                );
            }
            
            $data['download_status'] = $this->config->get('configblog_article_download');
            
            $data['downloads'] = array();
            
            $results = $this->model_blog_article->getDownloads($this->request->get['article_id']);
 
            foreach ($results as $result) {
                if (file_exists(SR_DOWNLOAD . $result['filename'])) {
                    $size = filesize(SR_DOWNLOAD . $result['filename']);
 
                    $i = 0;
 
                    $suffix = array(
                        'B',
                        'KB',
                        'MB',
                        'GB',
                        'TB',
                        'PB',
                        'EB',
                        'ZB',
                        'YB'
                    );
 
                    while (($size / 10024) > 1) {
                        $size = $size / 10024;
                        $i++;
                    }
 
                    $data['downloads'][] = array(
                        'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                        'name'       => $result['name'],
                        'size'       => round(substr($size, 0, strpos($size, '.') + 4), 2) . $suffix[$i],
                        'href'       => $this->url->link('blog/article/download', '&article_id='. $this->request->get['article_id']. '&download_id=' . $result['download_id'])
                    );
                }
            }
            
            $this->model_blog_article->updateViewed($this->request->get['article_id']);

            $data['column'] = $this->load->controller('common/column');
            
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');
            
            $this->response->setOutput($this->load->view('blog/article', $data));
        } else {
            $url = '';
            
            if (isset($this->request->get['blog_category_id'])) {
                $url .= '&blog_category_id=' . $this->request->get['blog_category_id'];
            }

            if (isset($this->request->get['filter_name'])) {
                $url .= '&filter_name=' . $this->request->get['filter_name'];
            }
                    
            if (isset($this->request->get['filter_tag'])) {
                $url .= '&filter_tag=' . $this->request->get['filter_tag'];
            }
                            
            if (isset($this->request->get['filter_description'])) {
                $url .= '&filter_description=' . $this->request->get['filter_description'];
            }
                    
            if (isset($this->request->get['filter_news_id'])) {
                $url .= '&filter_news_id=' . $this->request->get['filter_news_id'];
            }
                                
            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_error'),
                'href' => $this->url->link('product/product', $url . '&product_id=' . $article_id)
            );

            $this->document->setTitle($this->language->get('text_error'));

            $data['heading_title'] = $this->language->get('text_error');

            $data['text_error'] = $this->language->get('text_error');
            $data['text_go_back'] = $this->language->get('text_go_back');
            $data['text_get_back'] = $this->language->get('text_get_back');

            $data['button_continue'] = $this->language->get('button_continue');

            $data['continue'] = $this->url->link('common/home');

            $this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

            $data['column'] = $this->load->controller('common/column');
            
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('error/not_found', $data));
        }
    }
    
    public function download()
    {
        $this->load->model('blog/article');

        if (isset($this->request->get['download_id'])) {
            $download_id = $this->request->get['download_id'];
        } else {
            $download_id = 0;
        }

        if (isset($this->request->get['article_id'])) {
            $article_id = $this->request->get['article_id'];
        } else {
            $article_id = 0;
        }

        $download_info = $this->model_blog_article->getDownload($article_id, $download_id);

        if ($download_info) {
            $file = SR_DOWNLOAD . $download_info['filename'];
            $mask = basename($download_info['mask']);

            if (!headers_sent()) {
                if (file_exists($file)) {
                    header('Content-Description: File Transfer');
                    header('Content-Type: application/octet-stream');
                    header('Content-Disposition: attachment; filename="' . ($mask ? $mask : basename($file)) . '"');
                    header('Content-Transfer-Encoding: binary');
                    header('Expires: 0');
                    header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
                    header('Pragma: public');
                    header('Content-Length: ' . filesize($file));

                    readfile($file, 'rb');

                    exit;
                } else {
                    exit('Error: Could not find file ' . $file . '!');
                }
            } else {
                exit('Error: Headers already sent out!');
            }
        } else {
            $this->redirect('/index.php?route=account/download');
        }
    }
    
    public function review()
    {
        $this->language->load('blog/article');
        
        $this->load->model('blog/review');

        $data['text_on'] = $this->language->get('text_on');
        $data['text_no_reviews'] = $this->language->get('text_no_reviews');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }
        
        $data['reviews'] = array();
        
        $review_total = $this->model_blog_review->getTotalReviewsByArticleId($this->request->get['article_id']);
            
        $results = $this->model_blog_review->getReviewsByArticleId($this->request->get['article_id'], ($page - 1) * 5, 5);
              
        foreach ($results as $result) {
            $data['reviews'][] = array(
                'author'     => $result['author'],
                'text'       => $result['text'],
                'reviews'    => sprintf($this->language->get('text_reviews'), (int)$review_total),
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
            );
        }
        
        $pagination = new Pagination();
        $pagination->total = $review_total;
        $pagination->page = $page;
        $pagination->limit = 5;
        $pagination->url = $this->url->link('blog/article/review', 'article_id=' . $this->request->get['article_id'] . '&page={page}');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * 5) + 1 : 0, ((($page - 1) * 5) > ($review_total - 5)) ? $review_total : ((($page - 1) * 5) + 5), $review_total, ceil($review_total / 5));

        $this->response->setOutput($this->load->view('blog/review', $data));
    }
    
    public function write()
    {
        $this->load->language('blog/article');

        $json = array();

        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
                $json['error'] = $this->language->get('error_name');
            }

            if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 1000)) {
                $json['error'] = $this->language->get('error_text');
            }

            if (!isset($json['error'])) {
                $this->load->model('blog/review');

                $this->model_blog_review->addReview($this->request->get['article_id'], $this->request->post);

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
        
        foreach ($stickers as $sticker) {
            $data['stickers'][] = array(
                'position' => $sticker['position'],
                'image' => '/images/' . $sticker['image']
            );
        }
                
        return $this->load->view('product/stickers', $data);
    }
}
