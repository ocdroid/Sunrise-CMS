<?php


// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

namespace Cache;

class Redis {
    private $expire;
    private $cache;

    public function __construct($expire) {
        $this->expire = $expire;

        $this->cache = new \Redis();
        $this->cache->pconnect('localhost', '6379');
    }

    public function get($key) {
        $data = $this->cache->get('snrs_' . $key);
        return json_decode($data, true);
    }

    public function set($key,$value) {
        $status = $this->cache->set('snrs_' . $key, json_encode($value));
        if($status){
            $this->cache->setTimeout('snrs_' . $key, $this->expire);
        }
        return $status;
    }

    public function delete($key) {
        $this->cache->delete('snrs_' . $key);
    }
}