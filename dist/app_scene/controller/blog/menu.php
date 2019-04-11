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

class ControllerBlogMenu extends Controller
{
    public function index()
    {
        $this->load->language('blog/menu');
        
        $configblog_name = $this->config->get('configblog_name');
        
        if (!empty($configblog_name)) {
            $data['text_blog'] = $this->config->get('configblog_name');
        } else {
            $data['text_blog'] = $this->language->get('text_blog');
        }

        $data['text_go_to'] = $this->language->get('text_go_to');

        $data['blog'] = $this->url->link('blog/latest');

        // Menu
        $this->load->model('blog/category');

        $this->load->model('blog/article');

        $data['categories'] = array();

        $categories = $this->model_blog_category->getCategories(0);

        foreach ($categories as $category) {
            if ($category['top']) {
                // Level 2
                $children_data = array();

                $children = $this->model_blog_category->getCategories($category['blog_category_id']);

                foreach ($children as $child) {
                    $filter_data = array(
                        'filter_blog_category_id'  => $child['blog_category_id'],
                        'filter_sub_category' => true
                    );

                    $children_data[] = array(
                        'name'  => $child['name'] . ($this->config->get('configblog_article_count') ? ' (' . $this->model_blog_article->getTotalArticles($filter_data) . ')' : ''),
                        'href'  => $this->url->link('blog/category', 'blog_category_id=' . $category['blog_category_id'] . '_' . $child['blog_category_id'])
                    );
                }

                // Level 1
                $filter_data = array(
                        'filter_blog_category_id'  => $category['blog_category_id']
                    );
                
                $data['categories'][] = array(
                    'name'     => $category['name'] . ($this->config->get('configblog_article_count') ? ' (' . $this->model_blog_article->getTotalArticles($filter_data) . ')' : ''),
                    'children' => $children_data,
                    'column'   => $category['column'] ? $category['column'] : 1,
                    'href'     => $this->url->link('blog/category', 'blog_category_id=' . $category['blog_category_id'])
                );
            }
        }
        
        return $this->load->view('blog/menu', $data);
    }
}
