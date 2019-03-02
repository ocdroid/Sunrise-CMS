<?php


// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerEventTheme extends Controller
{
    public function index(&$view, &$data, &$output)
    {
        if (!$this->config->get($this->config->get('config_theme') . '_status')) {
            exit('Error: A theme has not been assigned to this store!');
        }
        
        if ($this->config->get('config_theme') == 'theme_default') {
            $theme = $this->config->get('theme_default_directory');
        } else {
            $theme = $this->config->get('config_theme');
        }
        
        if (is_file(DIR_TEMPLATE . $theme . '/template/' . $view . '.tpl')) {
            $view = $theme . '/template/' . $view;
        } else {
            $view = 'default/template/' . $view;
        }
    }
}
