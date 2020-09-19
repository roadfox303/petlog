$(document).on('turbolinks:load', function() {
  let dataController = $('body').attr('data-controller');
  let dataAction = $('body').attr('data-action');
  if (dataController == 'users' && (dataAction == 'edit' || dataAction == 'update')) {
    avatar_crop();
  }
  if (dataController == 'pets' && (dataAction == 'new' || dataAction == 'create' || dataAction == 'edit' || dataAction == 'update')) {
    avatar_crop();
  }
  function avatar_crop(){
    $('#img_field').modaal({
      overlay_opacity: 0.3,
      overlay_close: 'false',
      hide_close: 'true',
      close_text: '決定',
      animation: 'none',
      width:'60%',
      content_source: '#cropper',
      inject_position: 'h1'
    });
    $(document).on("click", "#crop_enter", function(){
        $('#img_field').modaal('close');
    });
    $fileField = $('.image_form')
    $($fileField).on('change', $fileField, function(e) {
      file = e.target.files[0]
      reader = new FileReader(),
      $preview = $("#img_field");
      reader.onload = (function(file) {
        return function(e) {
          $preview.empty();
          $preview.append($('<img>').attr({
            src: e.target.result,
            width: "100%",
            class: "preview",
            title: file.name
          }));
          $('#cropper #img_box').empty();
          $('#cropper #img_box').append($('<img>').attr({
            src: e.target.result,
            width: "100%",
            class: "preview",
            id:"cropper-img",
            title: file.name
          }));
          $('#img_field').modaal('open');
          let image = document.getElementById('cropper-img');
          let button = document.getElementById('crop_enter');
          let result = document.getElementById('img_field');
          let crop_x = document.getElementById('img_x');
          let crop_y = document.getElementById('img_y');
          let crop_w = document.getElementById('img_w');
          let crop_h = document.getElementById('img_h');
          let croppable = false;
          let cropper = new Cropper(image, {
            aspectRatio: 1,
            viewMode: 1,
            zoomOnWheel: false,
            ready: function () {
              croppable = true;
            },
            crop: function (event) {
              crop_x.value = Math.floor(event.detail.x);
              crop_y.value = Math.floor(event.detail.y);
              crop_w.value = Math.floor(event.detail.width);
              crop_h.value = Math.floor(event.detail.height);
            },
          });
          button.onclick = function () {
            let croppedCanvas;
            let roundedCanvas;
            let roundedImage;
            if (!croppable) {
              return;
            }
            croppedCanvas = cropper.getCroppedCanvas();
            roundedCanvas = getRoundedCanvas(croppedCanvas);
            roundedImage = document.createElement('img');
            roundedImage.src = roundedCanvas.toDataURL()
            result.innerHTML = '';
            result.appendChild(roundedImage);
          };
        };
      })(file);
      reader.readAsDataURL(file);
    });
    function getRoundedCanvas(sourceCanvas) {
      var canvas = document.createElement('canvas');
      var context = canvas.getContext('2d');
      var width = sourceCanvas.width;
      var height = sourceCanvas.height;
      canvas.width = width;
      canvas.height = height;
      context.imageSmoothingEnabled = true;
      context.drawImage(sourceCanvas, 0, 0, width, height);
      context.globalCompositeOperation = 'destination-in';
      context.beginPath();
      context.arc(width / 2, height / 2, Math.min(width, height) / 2, 0, 2 * Math.PI, true);
      context.fill();
      return canvas;
    }
  }
});
