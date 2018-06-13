$(document).on('ready', function(){
  var ajx = false
  var token = $('input[name=authenticity_token]').val();
  $('.campaign_products .autocomplete').on('keyup', function (e) {
    q = $(this).val();
    action = $('form.edit_campaign').attr('action');
    if (ajx) {
      ajx.abort()
      ajx = false
    }
    if (q.length > 2) {
      ajx = $.getJSON(action+"/search_products?q="+q, '', function (products) {
        ajx = false
        $res = $('.autocomplete_results');
        if (products.length) {
          $res.html('');
          for (idx in products) {
            product = products[idx];
            $product = $('<div />').addClass('product col-3');
            $p_title = $('<h3 />').text(product.name);
            $p_image = $('<img />').attr('src', product.image_url);
            $p_add = $('<form />').attr('action', action+"/add_product");
            $p_add.attr('method', 'POST');
            $p_add.append('<input type="hidden" name="authenticity_token" value="'+token+'" />')
            $p_add.append('<input type="hidden" name="product_slug" value="'+product.slug+'" />');
            $p_add.append('<button type="submit">Agregar</button>');
            $product.append($p_title);
            $product.append($p_image);
            $product.append($p_add);
            $res.append($product);
          }
        } else {
          $res.html('<h2>No se encontraron productos</h2>');
        }
      })
    }
  })
})
