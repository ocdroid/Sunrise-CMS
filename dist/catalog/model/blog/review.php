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

class ModelBlogReview extends Model
{
    public function addReview($article_id, $data)
    {
        $this->db->query("
            INSERT INTO review_article 
            SET author = '" . $this->db->escape($data['name']) . "', 
                customer_id = '" . (int)$this->customer->getId() . "', 
                article_id = '" . (int)$article_id . "', 
                text = '" . $this->db->escape($data['text']) . "', 
                date_added = NOW()
        ");

        $review_id = $this->db->getLastId();

        if ($this->config->get('configblog_review_mail')) {
            $this->load->language('blog/mail/review');
            $this->load->model('blog/article');
            
            $article_info = $this->model_blog_article->getArticle($article_id);

            $subject = sprintf($this->language->get('text_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));

            $message  = $this->language->get('text_waiting') . "\n";
            $message .= sprintf($this->language->get('text_article'), html_entity_decode($article_info['name'], ENT_QUOTES, 'UTF-8')) . "\n";
            $message .= sprintf($this->language->get('text_reviewer'), html_entity_decode($data['name'], ENT_QUOTES, 'UTF-8')) . "\n";
            $message .= $this->language->get('text_review') . "\n";
            $message .= html_entity_decode($data['text'], ENT_QUOTES, 'UTF-8') . "\n\n";

            $mail = new Mail();
            $mail->protocol = $this->config->get('config_mail_protocol');
            $mail->parameter = $this->config->get('config_mail_parameter');
            $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
            $mail->smtp_username = $this->config->get('config_mail_smtp_username');
            $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
            $mail->smtp_port = $this->config->get('config_mail_smtp_port');
            $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

            $mail->setTo($this->config->get('config_email'));
            $mail->setFrom($this->config->get('config_email'));
            $mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
            $mail->setSubject($subject);
            $mail->setText($message);
            $mail->send();

            // Send to additional alert emails
            $emails = explode(',', $this->config->get('config_alert_email'));

            foreach ($emails as $email) {
                if ($email && preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $email)) {
                    $mail->setTo($email);
                    $mail->send();
                }
            }
        }
    }

    public function getReviewsByArticleId($article_id, $start = 0, $limit = 20)
    {
        if ($start < 0) {
            $start = 0;
        }

        if ($limit < 1) {
            $limit = 20;
        }

        $query = $this->db->query(
            "
            SELECT r.review_article_id, r.author, r.text, p.article_id, pd.name, p.image, r.date_added 
            FROM review_article r LEFT JOIN article p ON (r.article_id = p.article_id) 
            LEFT JOIN article_description pd ON (p.article_id = pd.article_id) 
            WHERE p.article_id = '" . (int)$article_id . "' 
                AND p.status = '1' 
                AND r.status = '1' 
                AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' 
            ORDER BY r.date_added DESC 
            LIMIT " . (int)$start . "," . (int)$limit
        );

        return $query->rows;
    }

    public function getTotalReviewsByArticleId($article_id)
    {
        $query = $this->db->query("
            SELECT COUNT(*) AS total 
            FROM review_article r 
            LEFT JOIN article p ON (r.article_id = p.article_id) 
            LEFT JOIN article_description pd ON (p.article_id = pd.article_id) 
            WHERE p.article_id = '" . (int)$article_id . "' 
                AND p.status = '1' 
                AND r.status = '1' 
                AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'
        ");

        return $query->row['total'];
    }
}
