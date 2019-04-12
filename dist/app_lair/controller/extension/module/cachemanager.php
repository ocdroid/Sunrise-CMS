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

class ControllerExtensionModuleCachemanager extends Controller
{
    private $error = array();

    public function index()
    {
        $this->load->language('extension/module/cachemanager');

        $this->document->setTitle($this->language->get('heading_title'));

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_edit'] = $this->language->get('text_edit');
        
        $data['column_description'] = $this->language->get('column_description');
        $data['column_action'] = $this->language->get('column_action');
        
        $data['image_description'] = $this->language->get('image_description');
        $data['system_description'] = $this->language->get('system_description');
        
        $data['button_clearallcache'] = $this->language->get('button_clearallcache');
        $data['button_clearcache'] = $this->language->get('button_clearcache');
        $data['button_clearsystemcache'] = $this->language->get('button_clearsystemcache');
        $data['button_cancel'] = $this->language->get('button_cancel');

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
            'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/module/cachemanager', 'token=' . $this->session->data['token'], true)
        );

        $data['clearallcache'] = ('/app_lair/index.php?route=extension/module/cachemanager/clearallcache&token=' . $this->session->data['token']);
        $data['clearcache'] = ('/app_lair/index.php?route=extension/module/cachemanager/clearcache&token=' . $this->session->data['token']);
        $data['clearsystemcache'] = ('/app_lair/index.php?route=extension/module/cachemanager/clearsystemcache&token=' . $this->session->data['token']);

        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

        $data['modules'] = array();
        
        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }
        
        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/module/cachemanager', $data));
    }

    public function clearsystemcache()
    {
        $this->load->language('extension/module/cachemanager');

        $files = glob(SR_CACHE . 'cache.*');
        if (!empty($files)) {
            foreach ($files as $file) {
                $this->deldir($file);
            }
        }

        $this->session->data['success'] = $this->language->get('text_success_system');

        $this->response->redirect($this->url->link('extension/module/cachemanager', 'token=' . $this->session->data['token'], true));
    }

    public function clearcache()
    {
        $this->load->language('extension/module/cachemanager');

        $imgfiles = glob(SR_IMAGE . 'cache/*');
        if (!empty($imgfiles)) {
            foreach ($imgfiles as $imgfile) {
                $this->deldir($imgfile);
            }
        }

        $this->session->data['success'] = $this->language->get('text_success_img');

        $this->response->redirect($this->url->link('extension/module/cachemanager', 'token=' . $this->session->data['token'], true));
    }

    public function clearallcache()
    {
        $this->load->language('extension/module/cachemanager');

        $imgfiles = glob(SR_IMAGE . 'cache/*');
        if (!empty($imgfiles)) {
            foreach ($imgfiles as $imgfile) {
                $this->deldir($imgfile);
            }
        }
        $files = glob(SR_CACHE . 'cache.*');
        if (!empty($files)) {
            foreach ($files as $file) {
                $this->deldir($file);
            }
        }

        $this->session->data['success'] = $this->language->get('text_success');

        $this->response->redirect($this->url->link('extension/module/cachemanager', 'token=' . $this->session->data['token'], true));
    }

    public function deldir($dirname)
    {
        if (file_exists($dirname)) {
            if (is_dir($dirname)) {
                $dir=opendir($dirname);
                while (($filename=readdir($dir)) !== false) {
                    if ($filename!="." && $filename!="..") {
                        $file=$dirname."/".$filename;
                        $this->deldir($file);
                    }
                }
                closedir($dir);
                rmdir($dirname);
            } else {
                @unlink($dirname);
            }
        }
    }
}
