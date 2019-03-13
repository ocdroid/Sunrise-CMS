<!-- onepagecheckuot.tpl -->
<?php echo $header; ?>

<div class="uk-section uk-margin-small uk-padding-remove">
	<div class="uk-container">

		<ul class="uk-breadcrumb">

            <?php if(isset($_SERVER['HTTP_REFERER'])) { ?>
                <?php if(strpos($_SERVER['HTTP_REFERER'], $_SERVER["SERVER_NAME"])) { ?>
                    <li>
                        <span uk-icon="icon: chevron-left; ratio: 0.8;"></span>
                        <a class="uk-text-meta uk-link-text" href="<?php echo $_SERVER['HTTP_REFERER'] ?>" rel="nofollow">
                            <?php echo $text_go_back; ?>
                        </a>
                    </li>
                <?php } ?>
            <?php } ?>
    
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li>
					<a href="<?php echo $breadcrumb['href']; ?>">
						<?php echo $breadcrumb['text']; ?>
					</a>
				</li>
			<?php } ?>
		</ul>

    </div>
</div>

<div class="uk-section uk-padding-remove uk-margin-small">
    <div class="uk-container">

        <article class="uk-article">

            <h1 class="uk-article-title uk-margin-medium-top uk-margin-medium-bottom uk-text-center">
                <a class="uk-link-reset" href="">
                    <?php echo $heading_title; ?>
                </a>
            </h1>

        </article>

    </div>
</div>

<?php if ($error_warning) { ?>
    <div class="uk-alert-warning" uk-alert>
        <a class="uk-alert-close" uk-close></a>
        <p>
            <?php echo $error_warning; ?>
        </p>
    </div>
<?php } ?>

<div class="uk-section uk-padding-remove uk-margin-small">
    <div class="uk-container">

        <?php echo $content_top; ?>

        <div class="uk-section uk-padding-remove uk-margin-small">
            <div class="uk-container">

                <div class="uk-flex" uk-grid>

                    <div class="uk-width-1-1 uk-width-1-1@s uk-width-1-2@m uk-width-1-3@l uk-width-1-3@xl uk-flex-last@m">
                        
                        <div class="uk-margin" uk-sticky="offset: 15; bottom: true">

                            <table class="uk-table">
                            
                                <thead>
                                    <tr>
                                        <td>
                                            <?php echo $text_product; ?>
                                        </td>
                                        <td>
                                            <?php echo $text_price; ?>
                                        </td>
                                        <td>
                                            <?php echo $text_quantity; ?>
                                        </td>
                                    </tr>
                                </thead>
                            
                                <tbody>
                            
                                    <?php foreach ($products as $product) { ?>
                            
                                        <tr>
                                            <td>
                                                <a href="/index.php?route=product/product&product_id=<?php echo $product['product_id'] ?>" title="<?php echo $product['name'] ?>">
                                                    <img style="height: 35px;" src="<?php echo  $product['thumb'] ?>" alt="<?php echo $product['name'] ?>">
                                                </a>
                                            </td>
                                            <td>
                            
                                                <a href="/index.php?route=product/product&product_id=<?php echo $product['product_id'] ?>">
                                                    <?php echo $product['name'] ?>
                                                </a>
                            
                                                <?php echo $product['model'] ?>                                
                            
                                                <?php foreach ($product['option'] as $option) { ?>
                            
                                                    -
                                                    <small>
                                                        <?php echo $option['name']; ?>
                                                        : 
                                                        <?php echo $option['value']; ?>
                                                    </small>
                            
                                                <?php } ?>
                            
                                            </td>
                                            <td>
                                                <?php echo $product['price'] ?>
                                            </td>
                                            <td>
                                                <?php echo $product['quantity'] ?>
                                            </td>
                                        </tr>
                            
                                    <?php } ?>
                            
                                </tbody>
                            
                            </table>
                            
                            <table class="uk-table" id="totals">
                                    
                                <tbody>
                            
                                    <?php foreach ($totals as $total) { ?>
                            
                                        <tr>
                                            <td>
                                                <?php echo $total['title']; ?>
                                                :
                                            </td>
                                            <td>
                                                <?php echo $total['text']; ?>
                                            </td>
                                        </tr>
                            
                                    <?php } ?>
                            
                                </tbody>
                            
                            </table>

                            <div class="uk-margin uk-button-group">
                                    
                                <a class="uk-button uk-button-default" href='index.php?route=checkout/cart'>
                                    <?php echo $text_cart; ?>
                                </a>
                                <a class="uk-button uk-button-primary" href="#">
                                    <?php echo $text_confirm; ?>
                                </a>

                            </div>

                        </div>

                    </div>

                    <div class="uk-width-1-1 uk-width-1-1@s uk-width-1-2@m uk-width-2-3@l uk-width-2-3@xl">

                        <form class="uk-form-horizontal uk-margin-large">

                            <div class="uk-margin">
                                <h3>
                                    <?php echo $text_customer; ?>
                                </h3>
                            </div>
    
                            <?php if(!$c_logged) {?>
                                <div class="uk-margin">
                                    <div class="uk-alert-primary" uk-alert>
                                        <a class="uk-alert-close" uk-close></a>
                                        <p>
                                            <?php echo $text_notlogged; ?>
                                        </p>
                                    </div>
                                </div>
                            <?php } ?>

                            <div class="uk-margin">
                                <a class="uk-link" type="button" uk-toggle="target: #cc_checkout_returning_customer">
                                    <?php echo $text_i_am_returning_customer; ?>
                                </a>
                            </div>

                            <div class="uk-margin">
                                <label class="uk-form-label" for="firstname-ch">
                                    *
                                    <?php echo $text_full_name; ?>
                                    :
                                </label>
                                <div class="uk-form-controls">
                                    <?php if($c_logged) {?>
                                        <input class="uk-input" type="text" id="firstname-ch" name="firstname" value="<?php echo $c_name; ?>" placeholder="Some text..." readonly="true">
                                    <?php } else { ?>
                                        <input class="uk-input" type="text" id="firstname-ch" name="firstname" value="" placeholder="Some text...">
                                    <?php }?>
                                </div>
                            </div>

                            <div class="uk-margin">
                                <label class="uk-form-label" for="telephone-ch">
                                    *
                                    <?php echo $text_telephone; ?>
                                    :
                                </label>
                                <div class="uk-form-controls">
                                    <input class="uk-input" type="tel" id="telephone-ch" name="telephone" value="<?php echo $telephone; ?>" placeholder="Some text...">
                                </div>
                            </div>

                            <div class="uk-margin">
                                <label class="uk-form-label" for="email-ch">
                                    <?php echo $text_email; ?>
                                    :
                                </label>
                                <div class="uk-form-controls">
                                    <input class="uk-input" type="text" id="email-ch" name="email" value="<?php echo $email; ?>" placeholder="Some text...">
                                </div>
                            </div>                        
                            <div class="uk-margin">
                                <label class="uk-form-label" for="city-ch">
                                    *
                                    <?php echo $text_town; ?>
                                    :
                                </label>
                                <div class="uk-form-controls">
                                    <input class="uk-input" type="text" id="city-ch" name="city" value="<?php echo $city; ?>" placeholder="Some text...">
                                </div>
                            </div>

                            <div class="uk-margin">
                                <label class="uk-form-label" for="comment_field">
                                    <?php echo $text_comment; ?>
                                    :
                                </label>
                                <div class="uk-form-controls">
                                    <input class="uk-input" type="text" id="comment_field" name="comment" value="<?php echo $comment; ?>" placeholder="Some text...">
                                </div>
                            </div>

                            <div class="uk-margin">
                                <label class="uk-form-label" for="delivery">
                                    <?php echo $text_delivery_method; ?>
                                    :
                                </label>
                                <div class="uk-form-controls">
                                    <select class="uk-select" onChange="updateShipping(this)" name="shipping_method" id="shipping-method" class="form-control large-field">
                                    
                                        <?php foreach ($shippig_methods as $shipping_method) { ?>
                                    
                                            <option value='{"title": "<?php echo $shipping_method['title'] ?>", "code": "<?php echo $shipping_method['value'] ?>", "comment":"", "shipping_method":"<?php echo $shipping_method['value'] ?>", "cost":"<?php echo $shipping_method['cost'] ?>","tax_class_id":""}' class="form-control large-field <?php substr($shipping_method['value'], strpos($shipping_method['value'], '.')+1 ); ?>">
                                                <?php echo $shipping_method['title'] ?>
                                            </option>
                                    
                                        <?php } ?>
                                    
                                    </select>
                                </div>
                            </div>

                            <div class="uk-margin">
                                <label class="uk-form-label" for="payment_select">
                                    <?php echo $text_payment_method; ?>
                                    :
                                </label>
                                <div class="uk-form-controls">
                                    <select class="uk-select" id="payment_select" name="payment_method">
                                    
                                        <?php foreach ($payment_methods as $payment_method) { ?>
                                    
                                            <option value='{"title": "<?php echo $payment_method['title'] ?>", "code": "<?php echo $payment_method['code'] ?>"}' class="payment_method_value <?php echo $payment_method['code']?>" style="">
                                                <?php echo $payment_method['title'] ?>
                                            </option>
                                    
                                        <?php } ?>
                                    
                                    </select>
                                </div>
                            </div>
                            
                            <div class="uk-margin">
                                <label>
                                    <input id="to-office" class="delivery-type" type="radio" name="delivery-type" checked="checked" value="<?php echo $text_delivery_type_1; ?>">
                                    <?php echo $text_delivery_type_1; ?>
                                </label>
                                
                                &nbsp;&nbsp;
                                
                                <label>
                                    <input id="to-address" class="delivery-type" type="radio" name="delivery-type" value="<?php echo $text_delivery_type_2; ?>">
                                    <?php echo $text_delivery_type_2; ?>
                                </label>
                            </div>
                            
                            <div class="uk-margin">
                                <input type='hidden' name='delivery-type' value='delivery'>
                                <label class="uk-form-label" for='address_1'>
                                    <?php echo $text_delivery_type_2; ?>
                                    :
                                </label>
                                <div class="uk-form-controls">
                                    <input class="uk-input" type="text" name="address_1" id="address_1" value="<?php echo $address_1 ?>" placeholder="<?php echo $text_delivery_placeholder; ?>">
                                </div>
                            </div>

                        </form>

                        <div id="cc_checkout_returning_customer" uk-modal>
                            
                            <div class="uk-modal-dialog uk-modal-body">

                                <button class="uk-modal-close-default" type="button" uk-close></button>

                                <h2 class="uk-modal-title">
                                    <?php echo $text_returning_customer; ?>
                                </h2>

                                <p>
                                    <form method="post" enctype="multipart/form-data">
                        
                                        <div class="uk-margin">
                                            <label class="uk-form-label" for="input-email">
                                                <?php echo $entry_email; ?>
                                            </label>
                                            <div class="uk-form-controls">
                                                <input class="uk-input" type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email">
                                            </div>
                                        </div>
                                    
                                        <div class="uk-margin">
                                            <label class="uk-form-label" class="control-label" for="input-password">
                                                <?php echo $entry_password; ?>
                                            </label>
                                            <div class="uk-form-controls">
                                                <input class="uk-input" type="password" name="password" value="" placeholder="<?php echo $entry_password; ?>" id="input-password">
                                            </div>
                                        </div>
                                    
                                        <div class="uk-margin">
                                            <a class="uk-button uk-button-primary" href="#">
                                                <?php echo $button_login; ?>
                                            </a>
                                        </div>

                                        <div class="uk-margin">
                                            <a class="uk-link" href="<?php echo $forgotten; ?>">
                                                <?php echo $text_forgotten; ?>
                                            </a>
                                            <a class="uk-link" href="<?php echo $register ?>">
                                                <?php echo $text_register;; ?>
                                            </a>
                                        </div>

                                    </form>
                                </p>

                            </div>
                            
                        </div>



















                            
1
                            
                            <div class="uk-margin">
                                <?php if ($modules) { ?>
                                
                                    <?php foreach ($modules as $module) { ?>
                                        <?php echo $module; ?>
                                    <?php } ?>
                                
                                <?php } ?>
                            </div>


                            
2




                            
                            

                            
                            
                            





























                    </div>

                </div>

            </div>
        </div>

    </div>
</div>

<?php echo $content_bottom; ?>

<script type="text/javascript">

function updateShipping(s) {
    shp = JSON.parse(s.value)
    $.ajax({
        url: 'index.php?route=checkout/shipping_method/save',
        type: 'post',
        data: shp,
        dataType: 'json',
        beforeSend: function() {
            $('#shipping-method').addClass('loading');
		},
        success: function(json) {
            $('.alert, .text-danger').remove();

            //if (json['redirect']) {
            //    location = json['redirect'];
            //}
            if (json['error']) {
                if (json['error']['warning']) {
                 // Error ylanyrkkaan....
                 alert(json['error']['warning']);
                }
            } else {
                $.ajax({
                    url: 'index.php?route=checkout/onepagecheckout/totals',
                    type: 'get',
                    success: function(json) {
                        $('#totals tbody').remove();
                        $('#totals').append('<tbody></tbody');
                        for (t in json['totals']) {
                            $('#totals tbody').append('<tr class="name subtotal"><td class="name subtotal"><strong>'+json['totals'][t]['title']+'</strong></td><td class="price">'+json['totals'][t]["text"]+'</td></tr>');
                            }
                    }
                    });
                // Update Totalsi!
            }
            $('#shipping-method').removeClass('loading');
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
        }
        ); //ajax
}

$(document).ready(function () {

    $(' #LoginModal .submit-login-form ').on('click', function(){
        $.ajax({
                url: 'index.php?route=checkout/onepagecheckout/AjaxLogin',
                type: 'post',
                data: $('#LoginModal #input-email, #LoginModal #input-password '),
                dataType: 'json',
                beforeSend: function() {

                },
                success: function(json) {
                    console.log(json);
                   if(json.errors!=0){
                       if(typeof json.errors.warning!='undefined' && json.errors.warning!='')
                       $('#LoginModal .errors-block').html(json.errors.warning) ;
                       if(typeof json.errors.errors!='undefined'&& json.errors.errors!='')
                       $('#LoginModal .errors-block').append( '<br>' + json.errors.error ) ;
                   }
                   else if(json.errors==0){
                       $('#firstname-ch').prop('value',json.c_name);
                       $('#city-ch').prop('value',json.city);
                       $('#address_1').prop('value',json.address_1);
                       $('#email-ch').prop('value',json.email);
                       $('#telephone-ch').prop('value',json.telephone);
                       $('#LoginModal').modal('hide');
                       $('#login_warning').html('');
                   }
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            }
        ); //ajax
        return false;
    });

            $('#ajax-button-confirm').on('click', function () {

$.ajax({
url: 'index.php?route=checkout/onepagecheckout',
type: 'post',
data: $('.checkout-checkout .payment-data input[type=\'text\'], .checkout-checkout .payment-data input[type=\'tel\'], .checkout-checkout .payment-data input[type=\'radio\']:checked, .checkout-checkout .payment-datainput input[type=\'checkbox\']:checked, .checkout-checkout .payment-data  select '),
dataType: 'json',
beforeSend: function () {
$('#ajax-button-confirm').addClass('preloader');

},
complete: function () {
$('#ajax-button-confirm').removeClass('preloader');

},
success: function (json) {
console.log(json);

if (json.error) {
if (json['error']['firstname']) {
$('#firstname-ch+.error').html(json['error']['firstname']);
}


if (json['error']['email']) {
    $('#email-ch+.error').html(json['error']['email']);
}

if (json['error']['telephone']) {
    $('#telephone-ch+.error').html(json['error']['telephone']);
}

if (json['error']['address_1']) {
    $('#address_1+.error').html(json['error']['address_1']);
}

if (json['error']['city']) {
    $('#city-ch+.error').html(json['error']['city']);
}
}

else if(json['cod']) {
    $.ajax({
        type: 'get',
        url: 'index.php?route=extension/payment/cod/confirm',
        cache: false,
        beforeSend: function() {
            $('#ajax-button-confirm').button('loading');
        },
        complete: function() {
            $('#ajax-button-confirm').button('reset');
        },
        success: function() {
            location = 'index.php?route=checkout/success';
        }
    });
}

else if(json['payment']) {
    $('.hiden_payment_info').html(json['payment']);
    console.log($('.hiden_payment_info a').attr('href'));
    location = $('.hiden_payment_info a').attr('href');
}
else {
    if (json.credit)
        credit_confirm('/index.php?route=checkout/part_payment_cart/getResult&from_privat24=true');
   /* else
        location = 'index.php?route=checkout/success'*/

}
},
error: function (xhr, ajaxOptions, thrownError) {
           alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
       }
});


});


});



</script>




<?php echo $footer; ?>
<!-- /onepagecheckuot.tpl -->