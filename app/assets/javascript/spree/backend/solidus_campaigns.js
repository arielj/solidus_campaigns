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

  if ($('#crop_campaign_image').length) {
    cropCampaignModal = document.getElementById('crop_campaign_image_modal');
    $('#crop_campaign_image').on('click', function(e){
      e.preventDefault();
      cropper = document.getElementById('cropper');

      input = document.getElementById('campaign_image');
      if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
          cropper.src = e.target.result;
          initCampaignCrop();
        }
        reader.readAsDataURL(input.files[0]);
      } else if (cropper.src != '') {
        cropper.setAttribute('src', cropper.src);
        initCampaignCrop();
      }
      cropCampaignModal.classList.add('shown');
    })

    cropCampaignModal.querySelector('.accept.button').addEventListener('click', function(e) {
      e.preventDefault();
      closeCampaignCropModal();
    })

    cropCampaignModal.querySelector('.cancel.button').addEventListener('click', function(e) {
      e.preventDefault();
      clearCampaignCrop();
      closeCampaignCropModal();
    })

    document.getElementById('campaign_image').addEventListener('change', function(e) {
      clearCampaignCrop();
    })
  }
})


function setCropprValuesOnCampaign(value) {
  document.getElementById('campaign_image_crop_x').value = value.x;
  document.getElementById('campaign_image_crop_y').value = value.y;
  document.getElementById('campaign_image_crop_w').value = value.width;
  document.getElementById('campaign_image_crop_h').value = value.height;
}

function clearCampaignCrop() {
  setCropprValuesOnCampaign({x: '', y: '', width: '', height: ''});
}

function closeCampaignCropModal() {
  cropCampaignModal.querySelector('.croppr-container').remove();
  img = document.createElement('IMG');
  img.id = 'cropper';
  img.title = 'image to crop';
  if (aux = document.getElementById('current_image_url')) {
    img.src = aux.value;
  }
  cropCampaignModal.querySelector('.content').insertBefore(img, cropCampaignModal.querySelector('.buttons'));
  cropCampaignModal.classList.remove('shown');
}

function initCampaignCrop() {
  var cropperObject = new Croppr('#cropper', {
    onCropEnd: setCropprValuesOnCampaign,
    startSize: [100,100,'%'],
    aspectRatio: 5/16
  });
}
