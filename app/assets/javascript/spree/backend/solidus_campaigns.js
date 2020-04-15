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

  document.querySelectorAll('#crop_campaign_image, #crop_campaign_mobile_image').forEach( crp => {
    let parent = crp.parentElement
    let cropCampaignModal = parent.querySelector('.crop_campaign_image_modal');
    let input = parent.querySelector('input[type=file');

    crp.addEventListener('click', function(e) {
      e.preventDefault();
      let cropper = cropCampaignModal.querySelector('img');

      if (input.files && input.files[0]) {
        let reader = new FileReader();
        reader.onload = function(e) {
          cropper.src = e.target.result;
          initCampaignCrop(parent);
        }
        reader.readAsDataURL(input.files[0]);
      } else if (cropper.src != '') {
        cropper.setAttribute('src', cropper.src);
        initCampaignCrop(parent);
      }
      cropCampaignModal.classList.add('shown');
    })

    cropCampaignModal.querySelector('.accept.button').addEventListener('click', function(e) {
      e.preventDefault();
      closeCampaignCropModal(parent);
    })

    cropCampaignModal.querySelector('.cancel.button').addEventListener('click', function(e) {
      e.preventDefault();
      clearCampaignCrop(parent);
      closeCampaignCropModal(parent);
    })

    input.addEventListener('change', function(e) {
      clearCampaignCrop(parent);
    })
  })
})


function setCropprValuesOnCampaign(value, parent) {
  parent.querySelector('.crop_x').value = value.x;
  parent.querySelector('.crop_y').value = value.y;
  parent.querySelector('.crop_w').value = value.width;
  parent.querySelector('.crop_h').value = value.height;
}

function clearCampaignCrop(parent) {
  setCropprValuesOnCampaign({x: '', y: '', width: '', height: ''}, parent);
}

function closeCampaignCropModal(parent) {
  let cropCampaignModal = parent.querySelector('.crop_campaign_image_modal')
  cropCampaignModal.querySelector('.croppr-container').remove();
  img = document.createElement('IMG');
  img.id = 'cropper';
  img.title = 'image to crop';
  if (aux = parent.querySelector('.image_preview input[type=hidden]')) {
    img.src = aux.value;
  }
  cropCampaignModal.querySelector('.content').insertBefore(img, cropCampaignModal.querySelector('.buttons'));
  cropCampaignModal.classList.remove('shown');
}

function initCampaignCrop(parent) {
  let onCropEnd = function(values) {
    setCropprValuesOnCampaign(values, parent)
  }

  let campaignImageAspectRatio = parent.querySelector('input[type=file]').dataset.aspectRatio;
  let aspect = campaignImageAspectRatio == '' ? null : parseFloat(campaignImageAspectRatio);
  new Croppr(parent.querySelector('.crop_campaign_image_modal img'), {
    onCropEnd: onCropEnd,
    startSize: [100,100,'%'],
    aspectRatio: aspect
  });
}
