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

class ModelToolImage extends Model
{
    public function resize($filename, $width, $height)
    {
        if (!is_file(SR_IMAGE . $filename) || substr(str_replace('\\', '/', realpath(SR_IMAGE . $filename)), 0, strlen(SR_IMAGE)) != SR_IMAGE) {
            return;
        }

        $extension = pathinfo($filename, PATHINFO_EXTENSION);

        $image_old = $filename;
        $image_new = 'cache/' . utf8_substr($filename, 0, utf8_strrpos($filename, '.')) . '-' . $width . 'x' . $height . '.' . $extension;

        if (!is_file(SR_IMAGE . $image_new) || (filectime(SR_IMAGE . $image_old) > filectime(SR_IMAGE . $image_new))) {
            list($width_orig, $height_orig, $image_type) = getimagesize(SR_IMAGE . $image_old);
                 
            if (!in_array($image_type, array(IMAGETYPE_PNG, IMAGETYPE_JPEG, IMAGETYPE_GIF))) {
                return SR_IMAGE . $image_old;
            }
 
            $path = '';

            $directories = explode('/', dirname($image_new));

            foreach ($directories as $directory) {
                $path = $path . '/' . $directory;

                if (!is_dir(SR_IMAGE . $path)) {
                    @mkdir(SR_IMAGE . $path, 0777);
                }
            }

            if ($width_orig != $width || $height_orig != $height) {
                $image = new Image(SR_IMAGE . $image_old);
                $image->resize($width, $height);
                $image->save(SR_IMAGE . $image_new);
            } else {
                copy(SR_IMAGE . $image_old, SR_IMAGE . $image_new);
            }
        }
        
        $imagepath_parts = explode('/', $image_new);
        $image_new = implode('/', array_map('rawurlencode', $imagepath_parts));

        return '/images/' . $image_new;
    }
}
